package com.miui.gallery.card;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card.Builder;
import com.miui.gallery.card.Card.CardExtraInfo;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.Record.UniqueKey;
import com.miui.gallery.card.scenario.ScenarioTrigger;
import com.miui.gallery.cloud.base.SyncRequest;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.card.model.CardInfo;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy.ScenarioRule;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.movie.utils.MovieBackgroundDownloadManager;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.preference.GalleryPreferences.Assistant;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.SyncUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

public class CardManager {
    public static final String[] CONVERT_PROJECTION = {"serverId", "sha1"};
    private static CardManager sInstance;
    /* access modifiers changed from: private */
    public CardCache mCardCache;
    /* access modifiers changed from: private */
    public final CardObserverHolder mObserverHolder = new CardObserverHolder();

    private class CardCache extends CopyOnWriteArrayList<Card> {
        private CardCache() {
        }

        private int findIndexToInsert(Card card) {
            if (card == null) {
                return -1;
            }
            int i = 0;
            if (isEmpty()) {
                return 0;
            }
            int size = size() - 1;
            while (i <= size) {
                int i2 = (i + size) >>> 1;
                int compareTo = ((Card) get(i2)).compareTo(card);
                if (i == size) {
                    return compareTo < 0 ? i + 1 : compareTo > 0 ? size : i2;
                }
                if (compareTo < 0) {
                    i = i2 + 1;
                } else if (compareTo <= 0) {
                    return i2;
                } else {
                    size = i2 - 1;
                }
            }
            if (((Card) get(i)).compareTo(card) <= 0 && i < size()) {
                i++;
            }
            return i;
        }

        public int addCard(Card card) {
            if (contains(card)) {
                return -1;
            }
            int findIndexToInsert = findIndexToInsert(card);
            if (findIndexToInsert >= 0 && findIndexToInsert <= size()) {
                add(findIndexToInsert, card);
            }
            return findIndexToInsert;
        }

        public void addCards(Collection<? extends Card> collection) {
            if (MiscUtil.isValid(collection)) {
                for (Card card : collection) {
                    if (!card.isIgnored()) {
                        addCard(card);
                    }
                }
            }
        }

        public int findIndexOfCard(long j) {
            for (int i = 0; i < size(); i++) {
                if (((Card) get(i)).getId() == j) {
                    return i;
                }
            }
            return -1;
        }

        public synchronized Card getCard(long j) {
            Iterator it = iterator();
            while (it.hasNext()) {
                Card card = (Card) it.next();
                if (card.getId() == j) {
                    return card;
                }
            }
            return null;
        }

        public synchronized void removeCard(long j) {
            Iterator it = iterator();
            while (it.hasNext()) {
                Card card = (Card) it.next();
                if (card.getId() == j) {
                    remove(card);
                }
            }
        }

        public synchronized void updateCard(Card card) {
            int size = size();
            for (int i = 0; i < size; i++) {
                Card card2 = (Card) get(i);
                if (card2 != card && card2.getId() == card.getId()) {
                    card2.copyFrom(card);
                }
            }
        }
    }

    public interface CardObserver {
        void onCardAdded(int i, Card card);

        void onCardDeleted(int i, Card card);

        void onCardUpdated(int i, Card card);
    }

    private static class CardObserverHolder implements CardObserver {
        final CopyOnWriteArraySet<CardObserver> observers;

        private CardObserverHolder() {
            this.observers = new CopyOnWriteArraySet<>();
        }

        public void onCardAdded(int i, Card card) {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((CardObserver) it.next()).onCardAdded(i, card);
            }
        }

        public void onCardDeleted(int i, Card card) {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((CardObserver) it.next()).onCardDeleted(i, card);
            }
        }

        public void onCardUpdated(int i, Card card) {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((CardObserver) it.next()).onCardUpdated(i, card);
            }
        }
    }

    public static class ServerIdSha1Pair {
        final long serverId;
        final String sha1;

        public ServerIdSha1Pair(long j, String str) {
            this.serverId = j;
            this.sha1 = str;
        }

        public static List<Long> getServerIds(List<ServerIdSha1Pair> list) {
            if (!MiscUtil.isValid(list)) {
                return null;
            }
            ArrayList arrayList = new ArrayList(list.size());
            for (ServerIdSha1Pair serverIdSha1Pair : list) {
                arrayList.add(Long.valueOf(serverIdSha1Pair.serverId));
            }
            return arrayList;
        }

        public static List<Long> getServerIdsOfCover(List<ServerIdSha1Pair> list, List<MediaFeatureItem> list2) {
            if (!MiscUtil.isValid(list) || !MiscUtil.isValid(list2)) {
                return null;
            }
            ArrayList arrayList = new ArrayList(list2.size());
            for (MediaFeatureItem mediaFeatureItem : list2) {
                for (ServerIdSha1Pair serverIdSha1Pair : list) {
                    if (TextUtils.equals(mediaFeatureItem.getSha1(), serverIdSha1Pair.sha1)) {
                        arrayList.add(Long.valueOf(serverIdSha1Pair.serverId));
                    }
                }
            }
            return arrayList;
        }
    }

    private CardManager() {
    }

    private synchronized void addInternal(final Card card) {
        if (card != null) {
            if (getCardByServerId(card.getServerId(), true) != null) {
                Log.e("CardManager", "Card %s exist in db, do not insert again!", (Object) card.getServerId());
                return;
            }
            boolean insert = GalleryEntityManager.getInstance().insert((Entity) card);
            if (insert) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (CardManager.this.mCardCache != null && !card.isIgnored() && card.isValid() && !card.isOutofDate()) {
                            int addCard = CardManager.this.mCardCache.addCard(card);
                            if (addCard >= 0) {
                                CardManager.this.mObserverHolder.onCardAdded(addCard, card);
                            }
                        }
                    }
                });
            }
            Log.d("CardManager", "add result %s", (Object) Boolean.valueOf(insert));
        }
    }

    private Card createNewCardFromServer(CardInfo cardInfo) {
        UniqueKey uniqueKey;
        boolean z;
        if (cardInfo == null) {
            return null;
        }
        boolean z2 = cardInfo.getScenarioId() == 11000;
        Builder top = new Builder(StaticContext.sGetAndroidContext()).setTitle(cardInfo.getTitle()).setDescription(cardInfo.getDescription()).setDeletable(true).setScenarioId(cardInfo.getScenarioId()).setServerId(cardInfo.getServerId()).setServerTag(cardInfo.getTag()).setCreateBy(cardInfo.isAppCreate() ^ true ? 1 : 0).setCreateTime(cardInfo.getSortTime()).setUpdateTime(cardInfo.getUpdateTime()).setValidStartTime(cardInfo.getValidStartDate()).setValidEndTime(cardInfo.getValidEndDate()).setTop(cardInfo.isTop());
        if (!z2) {
            CardExtraInfo cardExtraInfo = (CardExtraInfo) GsonUtils.fromJson(cardInfo.getExtraInfo(), CardExtraInfo.class);
            if (cardExtraInfo != null) {
                uniqueKey = cardExtraInfo.uniqueKey;
                z = cardExtraInfo.isIgnored;
            } else {
                uniqueKey = null;
                z = false;
            }
            if (!z && !cardInfo.isAppCreate()) {
                AssistantScenarioStrategy assistantScenarioStrategy = CloudControlStrategyHelper.getAssistantScenarioStrategy();
                if (assistantScenarioStrategy != null) {
                    List<ScenarioRule> localScenarioRules = assistantScenarioStrategy.getLocalScenarioRules();
                    if (MiscUtil.isValid(localScenarioRules)) {
                        for (ScenarioRule scenarioId : localScenarioRules) {
                            if (scenarioId.getScenarioId() == cardInfo.getScenarioId()) {
                                z = true;
                            }
                        }
                    }
                }
            }
            if (cardInfo.getMediaInfo() == null) {
                return null;
            }
            List mediaList = cardInfo.getMediaInfo().getMediaList();
            List allMediaList = cardInfo.getMediaInfo().getAllMediaList();
            if (allMediaList == null) {
                allMediaList = mediaList;
            }
            List sha1sByServerIds = CardUtil.getSha1sByServerIds(mediaList);
            if (!MiscUtil.isValid(sha1sByServerIds)) {
                return null;
            }
            top.setType(0).setImageUri(null).setDetailUrl(CardUtil.getAlbumUri("album").toString()).setUniqueKey(uniqueKey).setAllMediaSha1s(CardUtil.getSha1sByServerIds(allMediaList)).setSelectedMediaSha1s(sha1sByServerIds).setCoverMediaFeatureItems(CardUtil.getCoverMediaItemsByServerIds(cardInfo.getMediaInfo().getCoverMediaList())).setSyncable(true).setIsIgnored(z);
        } else {
            top.setOperationInfo(cardInfo.getOperationInfo()).setDetailUrl(CardUtil.getAlbumUri("operation").toString()).setSyncable(false).setType(2);
        }
        Card build = top.build();
        updateCardCoversIfNecessary(build);
        if (cardInfo.isStatusDelete()) {
            build.setLocalFlag(4);
        }
        add(build, false);
        MovieBackgroundDownloadManager.getInstance().downloadTemplate(StaticContext.sGetAndroidContext(), CardUtil.getMovieTemplateFromCard(build));
        HashMap hashMap = new HashMap();
        if (build.getType() == 2) {
            hashMap.put("server_id", String.valueOf(build.getServerId()));
        }
        hashMap.put("scenario_id", String.valueOf(build.getScenarioId()));
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_server_card_created", hashMap);
        return build;
    }

    private synchronized void deleteInternal(final Card card, boolean z) {
        boolean z2;
        if (card != null) {
            if (z) {
                try {
                    z2 = GalleryEntityManager.getInstance().delete(card);
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                card.setLocalFlag(4);
                z2 = GalleryEntityManager.getInstance().update(card);
            }
            if (z2) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (CardManager.this.mCardCache != null) {
                            int findIndexOfCard = CardManager.this.mCardCache.findIndexOfCard(card.getId());
                            if (findIndexOfCard >= 0) {
                                CardManager.this.mCardCache.removeCard(card.getId());
                                CardManager.this.mObserverHolder.onCardDeleted(findIndexOfCard, card);
                            }
                        }
                    }
                });
            }
            Log.d("CardManager", "delete result %s", (Object) Boolean.valueOf(z2));
        }
    }

    private Card getDuplicatedCard(CardInfo cardInfo) {
        if (cardInfo.isAppCreate()) {
            GalleryEntityManager instance = GalleryEntityManager.getInstance();
            StringBuilder sb = new StringBuilder();
            sb.append("ignored = 0 AND scenarioId = ");
            sb.append(cardInfo.getScenarioId());
            sb.append(" AND ");
            sb.append("createTime");
            sb.append(" > ");
            sb.append(System.currentTimeMillis() - 86400000);
            sb.append(" AND ");
            sb.append("localFlag");
            sb.append(" = ");
            sb.append(0);
            List query = instance.query(Card.class, sb.toString(), null, "createTime desc", String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(0), Integer.valueOf(1)}));
            if (MiscUtil.isValid(query)) {
                Card card = (Card) query.get(0);
                if (CardUtil.isDuplicated(card, cardInfo)) {
                    return card;
                }
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public Map<String, ImageFeature> getImageFeatureMap(List<String> list) {
        HashMap hashMap = new HashMap();
        if (list != null) {
            List<ImageFeature> query = GalleryEntityManager.getInstance().query(ImageFeature.class, String.format("sha1 IN ('%s') ", new Object[]{TextUtils.join("','", list)}), null, "score desc", null);
            if (MiscUtil.isValid(query)) {
                for (ImageFeature imageFeature : query) {
                    hashMap.put(imageFeature.getSha1(), imageFeature);
                }
            }
        }
        return hashMap;
    }

    public static synchronized CardManager getInstance() {
        CardManager cardManager;
        synchronized (CardManager.class) {
            if (sInstance == null) {
                sInstance = new CardManager();
            }
            cardManager = sInstance;
        }
        return cardManager;
    }

    private void mergeCardFromServer(Card card, CardInfo cardInfo) {
        if (card != null && cardInfo != null) {
            List list = null;
            List mediaList = cardInfo.getMediaInfo() == null ? null : cardInfo.getMediaInfo().getMediaList();
            if (cardInfo.getMediaInfo() != null) {
                list = cardInfo.getMediaInfo().getAllMediaList();
            }
            if (list == null) {
                list = mediaList;
            }
            CardExtraInfo cardExtraInfo = (CardExtraInfo) GsonUtils.fromJson(cardInfo.getExtraInfo(), CardExtraInfo.class);
            card.setCreateTime(cardInfo.getSortTime());
            card.setUpdateTime(cardInfo.getUpdateTime());
            card.setCardExtraInfo(cardExtraInfo);
            card.setAllMediaSha1s(mergeSha1s(card.getAllMediaSha1s(), CardUtil.getSha1sByServerIds(list)));
            card.setSelectedMediaSha1s(mergeSha1s(card.getSelectedMediaSha1s(), CardUtil.getSha1sByServerIds(mediaList)), "mergeFromServerDupCard");
            card.setScenarioId(cardInfo.getScenarioId());
            card.setServerId(cardInfo.getServerId());
            card.setServerTag(cardInfo.getTag());
            card.setCreateBy(cardInfo.isAppCreate() ^ true ? 1 : 0);
            update(card, false);
        }
    }

    private List<String> mergeSha1s(List<String> list, List<String> list2) {
        if (MiscUtil.isValid(list) && MiscUtil.isValid(list2)) {
            for (String str : list2) {
                if (!list.contains(str)) {
                    list.add(str);
                }
            }
        }
        return list;
    }

    /* access modifiers changed from: private */
    public synchronized void triggerGuaranteeScenariosInternal(boolean z) {
        if (MiscUtil.isValid(GalleryEntityManager.getInstance().query(Card.class, "ignored = 0", null, null, String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(0), Integer.valueOf(1)})))) {
            Log.d("CardManager", "Card exists,no need trigger guarantee card!");
            return;
        }
        try {
            new ScenarioTrigger().triggerGuaranteeScenario();
            if (z) {
                Assistant.setLastGuaranteeTriggerTime(System.currentTimeMillis());
            }
        } catch (Exception e) {
            Log.e("CardManager", "trigger scenario occur error.\n", (Object) e);
        }
        return;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0061, code lost:
        return true;
     */
    private synchronized boolean updateCardCoversIfNecessary(final Card card) {
        if (card.isCoversNeedRefresh()) {
            final List selectedMediaSha1s = card.getSelectedMediaSha1s();
            if (selectedMediaSha1s != null && selectedMediaSha1s.size() > 0) {
                Uri build = Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
                StringBuilder sb = new StringBuilder();
                sb.append("(localGroupId!=-1000) AND ");
                sb.append(String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", selectedMediaSha1s)}));
                SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), build, MediaFeatureItem.MEDIA_PROJECTION, sb.toString(), (String[]) null, "alias_create_time DESC", (QueryHandler<T>) new QueryHandler<List<MediaFeatureItem>>() {
                    /* JADX INFO: finally extract failed */
                    public List<MediaFeatureItem> handle(Cursor cursor) {
                        Map access$400 = CardManager.this.getImageFeatureMap(selectedMediaSha1s);
                        if (cursor != null) {
                            ArrayList arrayList = new ArrayList(cursor.getCount());
                            ArrayList arrayList2 = new ArrayList();
                            while (cursor.moveToNext()) {
                                try {
                                    MediaFeatureItem mediaFeatureItem = new MediaFeatureItem(cursor);
                                    arrayList.add(mediaFeatureItem.getSha1());
                                    mediaFeatureItem.setImageFeature((ImageFeature) access$400.get(mediaFeatureItem.getSha1()));
                                    arrayList2.add(mediaFeatureItem);
                                } catch (Throwable th) {
                                    MiscUtil.closeSilently(cursor);
                                    throw th;
                                }
                            }
                            MiscUtil.closeSilently(cursor);
                            Collections.sort(arrayList2);
                            ArrayList arrayList3 = new ArrayList();
                            for (int i = 0; i < Math.min(5, arrayList2.size()); i++) {
                                arrayList3.add(arrayList2.get(i));
                            }
                            card.setSelectedMediaSha1s(arrayList, "updateCover");
                            if (CardUtil.isCoverMediaPathEmpty(arrayList3)) {
                                CardUtil.downloadCoverThumb(arrayList3);
                            }
                            card.setCoverMediaFeatureItems(arrayList3);
                        }
                        return null;
                    }
                });
            }
        } else if (!CardUtil.isCoverMediaPathEmpty(card.getCoverMediaFeatureItems())) {
            return false;
        } else {
            List coverMediaFeatureItems = card.getCoverMediaFeatureItems();
            CardUtil.downloadCoverThumb(coverMediaFeatureItems);
            card.setCoverMediaFeatureItems(coverMediaFeatureItems);
            return true;
        }
    }

    private void updateCardFromServerInternal(Card card, CardInfo cardInfo) {
        if (cardInfo != null && card.getServerTag() < cardInfo.getTag()) {
            List list = null;
            List mediaList = cardInfo.getMediaInfo() == null ? null : cardInfo.getMediaInfo().getMediaList();
            List allMediaList = cardInfo.getMediaInfo() == null ? null : cardInfo.getMediaInfo().getAllMediaList();
            if (allMediaList == null) {
                allMediaList = mediaList;
            }
            if (cardInfo.getMediaInfo() != null) {
                list = cardInfo.getMediaInfo().getCoverMediaList();
            }
            card.setTitle(cardInfo.getTitle());
            card.setDescription(cardInfo.getDescription());
            card.setScenarioId(cardInfo.getScenarioId());
            card.setServerId(cardInfo.getServerId());
            card.setUpdateTime(cardInfo.getUpdateTime());
            card.setAllMediaSha1s(CardUtil.getSha1sByServerIds(allMediaList));
            card.setSelectedMediaSha1s(CardUtil.getSha1sByServerIds(mediaList), "updateCardFromServer");
            card.setCoverMediaFeatureItems(CardUtil.getCoverMediaItemsByServerIds(list));
            card.setServerTag(cardInfo.getTag());
            update(card, false);
        }
    }

    private synchronized void updateInternal(final Card card) {
        if (card != null) {
            boolean update = GalleryEntityManager.getInstance().update(card);
            if (update) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (CardManager.this.mCardCache != null) {
                            int findIndexOfCard = CardManager.this.mCardCache.findIndexOfCard(card.getId());
                            if (findIndexOfCard < 0) {
                                return;
                            }
                            if (card.isLocalDeleted()) {
                                CardManager.this.mCardCache.removeCard(card.getId());
                                CardManager.this.mObserverHolder.onCardDeleted(findIndexOfCard, card);
                                return;
                            }
                            CardManager.this.mCardCache.updateCard(card);
                            CardManager.this.mObserverHolder.onCardUpdated(CardManager.this.mCardCache.findIndexOfCard(card.getId()), card);
                        }
                    }
                });
            }
            Log.d("CardManager", "update result %s", (Object) Boolean.valueOf(update));
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x005c, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0061, code lost:
        return;
     */
    public synchronized void add(Card card, boolean z) {
        if (card != null) {
            if (!card.isEmpty()) {
                if (z) {
                    card.setLocalFlag(0);
                    long currentTimeMillis = DateUtils.getCurrentTimeMillis();
                    card.setCreateTime(currentTimeMillis);
                    card.setUpdateTime(currentTimeMillis);
                } else if (card.isIgnored()) {
                    card.setLocalFlag(2);
                } else if (card.getLocalFlag() != 4) {
                    card.setLocalFlag(3);
                }
                addInternal(card);
                Assistant.setHasCardEver();
                if (z || card.getLocalFlag() != 3) {
                    SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new SyncRequest.Builder().setSyncType(SyncType.NORMAL).setSyncReason(68).build());
                }
            }
        }
    }

    public Card createOperationCardFromServer(CardInfo cardInfo) {
        Card cardByServerId = getCardByServerId(cardInfo.getServerId(), true);
        return cardByServerId == null ? createNewCardFromServer(cardInfo) : cardByServerId;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0057, code lost:
        return;
     */
    public synchronized void delete(Card card, boolean z) {
        if (card != null) {
            Log.d("CardManager", "delete card %s", (Object) Long.valueOf(card.getId()));
            if (z) {
                if (card.getLocalFlag() != 0) {
                    if (card.isSyncable()) {
                        card.setUpdateTime(System.currentTimeMillis());
                        card.setLocalFlag(1);
                        updateInternal(card);
                        SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new SyncRequest.Builder().setSyncType(SyncType.NORMAL).setSyncReason(68).build());
                    }
                }
                deleteInternal(card, false);
            } else {
                deleteInternal(card, false);
            }
        }
    }

    public Card getCardByCardId(long j) {
        if (this.mCardCache != null) {
            return this.mCardCache.getCard(j);
        }
        return null;
    }

    public Card getCardByServerId(String str, boolean z) {
        if (!TextUtils.isEmpty(str)) {
            GalleryEntityManager instance = GalleryEntityManager.getInstance();
            String format = String.format("serverId = %s", new Object[]{str});
            if (!z) {
                StringBuilder sb = new StringBuilder();
                sb.append(format);
                sb.append(" AND ignored = 0");
                format = sb.toString();
            }
            List query = instance.query(Card.class, format, null, null, null);
            if (MiscUtil.isValid(query)) {
                return (Card) query.get(0);
            }
        }
        return null;
    }

    public CardSyncInfo getCardInfoFromCard(Card card) {
        List serverIdSha1PairBySha1s = getServerIdSha1PairBySha1s(card.getSelectedMediaSha1s());
        return CardSyncInfo.newBuilder().setName(card.getTitle()).setScenarioId(card.getScenarioId()).setStatus("normal").setDuplicateKey(card.generateDuplicateKey()).setDescription(card.getDescription()).setMediaList(ServerIdSha1Pair.getServerIds(serverIdSha1PairBySha1s)).setAllMediaList(ServerIdSha1Pair.getServerIds(getServerIdSha1PairBySha1s(card.getAllMediaSha1s()))).setCoverMediaList(ServerIdSha1Pair.getServerIdsOfCover(serverIdSha1PairBySha1s, card.getCoverMediaFeatureItems())).setExtraInfo(GsonUtils.toString(card.getCardExtraInfo())).setSortTime(card.getCreateTime()).build();
    }

    public List<Card> getLoadedCard() {
        return this.mCardCache;
    }

    public List<ServerIdSha1Pair> getServerIdSha1PairBySha1s(List<String> list) {
        return (List) SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build(), CONVERT_PROJECTION, String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", list)}), (String[]) null, String.format("%s DESC", new Object[]{"alias_create_time"}), (QueryHandler<T>) new QueryHandler<List<ServerIdSha1Pair>>() {
            public List<ServerIdSha1Pair> handle(Cursor cursor) {
                ArrayList arrayList = new ArrayList(cursor != null ? cursor.getCount() : 0);
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        arrayList.add(new ServerIdSha1Pair(Long.valueOf(cursor.getLong(0)).longValue(), cursor.getString(1)));
                    }
                }
                return arrayList;
            }
        });
    }

    public List<Card> getUnsynchronizedCards(int i) {
        if (i <= 0) {
            i = 10;
        }
        return GalleryEntityManager.getInstance().query(Card.class, Card.BASE_UNSYNC_CARD_SELECTION, null, "createTime desc", String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(0), Integer.valueOf(i)}));
    }

    public synchronized List<Card> loadMoreCard() {
        List<Card> query;
        query = GalleryEntityManager.getInstance().query(Card.class, Card.BASE_UI_CARD_SELECTION, null, "createTime desc", String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(this.mCardCache != null ? this.mCardCache.size() : 0), Integer.valueOf(20)}));
        if (this.mCardCache == null) {
            this.mCardCache = new CardCache();
        }
        if (query != null && !query.isEmpty()) {
            this.mCardCache.addCards(query);
        }
        return query;
    }

    public synchronized void onAccountDelete() {
        Log.d("CardManager", "onAccountDelete");
        try {
            if (this.mCardCache != null) {
                this.mCardCache.clear();
            }
            GalleryEntityManager.getInstance().deleteAll(Card.class);
            GalleryEntityManager.getInstance().deleteAll(Record.class);
            GalleryEntityManager.getInstance().deleteAll(ImageFeature.class);
            GalleryEntityManager.getInstance().deleteAll(SyncTag.class);
            this.mObserverHolder.onCardDeleted(-1, null);
            ArrayList<Integer> arrayList = new ArrayList<>();
            arrayList.add(Integer.valueOf(2));
            arrayList.add(Integer.valueOf(6));
            for (Integer intValue : arrayList) {
                PendingTaskManager.getInstance().cancelAll(intValue.intValue());
            }
        } catch (Exception e) {
            Log.e("CardManager", "onAccountDelete occur error.\n", (Object) e);
        }
        return;
    }

    public void onDeleteImages(List<String> list) {
        if (MiscUtil.isValid(list)) {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.mCardCache != null) {
                Iterator it = this.mCardCache.iterator();
                while (it.hasNext()) {
                    Card card = (Card) it.next();
                    if (card.removeImages(list)) {
                        if (card.isEmpty()) {
                            recordCardImageEmptyReason("ImageDeleteOutside");
                        }
                        update(card, true);
                    }
                    currentTimeMillis = card.getCreateTime();
                }
            }
            GalleryEntityManager instance = GalleryEntityManager.getInstance();
            StringBuilder sb = new StringBuilder();
            sb.append("ignored = 0 AND localFlag NOT IN (1,-2,-1,4) AND createTime<");
            sb.append(currentTimeMillis);
            List<Card> query = instance.query(Card.class, sb.toString(), null, "createTime desc", null);
            if (MiscUtil.isValid(query)) {
                for (Card card2 : query) {
                    if (card2.removeImages(list)) {
                        if (card2.isEmpty()) {
                            recordCardImageEmptyReason("ImageDeleteOutside");
                        }
                        update(card2, true);
                    }
                }
            }
        }
    }

    public void recordCardDeleteReason(String str) {
        HashMap hashMap = new HashMap(1);
        hashMap.put("reason", str);
        GalleryStatHelper.recordCountEvent("assistant", "assistant_card_delete_card_reason", hashMap);
        Log.d("CardManager", new Throwable());
    }

    public void recordCardImageEmptyReason(String str) {
        HashMap hashMap = new HashMap(1);
        hashMap.put("from", str);
        GalleryStatHelper.recordCountEvent("assistant", "assistant_card_remove_all_image", hashMap);
        Log.d("CardManager", android.util.Log.getStackTraceString(new Throwable()));
    }

    public void registerObserver(CardObserver cardObserver) {
        this.mObserverHolder.observers.add(cardObserver);
    }

    public void triggerGuaranteeScenarios(final boolean z) {
        Log.d("CardManager", "Try trigger Guarantee Scenario");
        if (!ImageFeatureManager.isStoryGenerateEnable()) {
            Log.d("CardManager", "Card funtion disable");
        } else if (DateUtils.getDateTime(Assistant.getLastGuaranteeTriggerTime()) == DateUtils.getDateTime(System.currentTimeMillis())) {
            Log.d("CardManager", "triggerScenarios too often");
        } else {
            ThreadManager.getMiscPool().submit(new Job() {
                public Object run(JobContext jobContext) {
                    CardManager.this.triggerGuaranteeScenariosInternal(z);
                    return null;
                }
            });
        }
    }

    public synchronized void triggerScenarios() {
        if (!ImageFeatureManager.isStoryGenerateEnable()) {
            Log.d("CardManager", "Card funtion disable");
            return;
        }
        long lastTriggerTime = Assistant.getLastTriggerTime();
        if (Math.abs(System.currentTimeMillis() - lastTriggerTime) < 1800000 || DateUtils.getDateTime(lastTriggerTime) == DateUtils.getDateTime(System.currentTimeMillis())) {
            Log.d("CardManager", "triggerScenarios too often");
            return;
        }
        try {
            new ScenarioTrigger().trigger();
            Assistant.setLastTriggerTime(System.currentTimeMillis());
        } catch (Exception e) {
            Log.e("CardManager", "trigger scenario occur error.\n", (Object) e);
        }
    }

    public void unregisterObserver(CardObserver cardObserver) {
        this.mObserverHolder.observers.remove(cardObserver);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:38:0x009f, code lost:
        return;
     */
    public synchronized void update(Card card, boolean z) {
        if (card != null) {
            Log.d("CardManager", "Update card id: %s,By local: %b", Long.valueOf(card.getId()), Boolean.valueOf(z));
            if (card.isEmpty()) {
                delete(card, true);
                recordCardDeleteReason("updateCardEmpty");
            } else if (card.getId() < 0) {
                Log.e("CardManager", "Update a card with no card Id!");
            } else {
                if (z) {
                    card.setUpdateTime(System.currentTimeMillis());
                    if (card.getLocalFlag() != 0) {
                        card.setLocalFlag(2);
                    }
                } else {
                    Card cardByServerId = getCardByServerId(card.getServerId(), true);
                    if (cardByServerId == null || cardByServerId.getId() == card.getId() || !cardByServerId.isValid()) {
                        card.setLocalFlag(3);
                    } else {
                        deleteInternal(card, true);
                        recordCardDeleteReason("localExistSameCard");
                        return;
                    }
                }
                updateCardCoversIfNecessary(card);
                updateInternal(card);
                if (z) {
                    SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new SyncRequest.Builder().setSyncType(SyncType.NORMAL).setSyncReason(68).build());
                }
            }
        }
    }

    public void updateCard(final Card card) {
        if (card != null) {
            ThreadManager.getMiscPool().submit(new Job<Object>() {
                public Object run(JobContext jobContext) {
                    CardManager.this.update(card, true);
                    return null;
                }
            });
        }
    }

    public synchronized void updateCardCovers() {
        List<Card> query = GalleryEntityManager.getInstance().query(Card.class, Card.BASE_UI_CARD_SELECTION, null, "createTime desc", null);
        if (MiscUtil.isValid(query)) {
            for (Card card : query) {
                if (updateCardCoversIfNecessary(card)) {
                    updateInternal(card);
                }
            }
        }
    }

    public void updateCardFromServer(CardInfo cardInfo) {
        if (cardInfo != null) {
            Card cardByServerId = getCardByServerId(cardInfo.getServerId(), true);
            if (cardByServerId == null) {
                Card duplicatedCard = getDuplicatedCard(cardInfo);
                if (duplicatedCard != null) {
                    if (cardInfo.isStatusDelete()) {
                        delete(duplicatedCard, false);
                        recordCardDeleteReason("serverDeleteDupCard");
                    } else {
                        mergeCardFromServer(duplicatedCard, cardInfo);
                    }
                } else if (ImageFeatureManager.isStoryGenerateEnable()) {
                    createNewCardFromServer(cardInfo);
                }
            } else if (cardInfo.isStatusDelete()) {
                delete(cardByServerId, false);
                recordCardDeleteReason("serverDeleteExistCard");
            } else if (!cardByServerId.isLocalDeleted()) {
                updateCardFromServerInternal(cardByServerId, cardInfo);
            }
        }
    }
}

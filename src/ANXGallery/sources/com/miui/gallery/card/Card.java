package com.miui.gallery.card;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.scenario.Record.UniqueKey;
import com.miui.gallery.cloud.card.model.CardInfo.OperationInfo;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import org.json.JSONException;

public class Card extends Entity implements Comparable<Card> {
    public static final String BASE_UI_CARD_SELECTION;
    public static final String BASE_UNSYNC_CARD_SELECTION;
    /* access modifiers changed from: private */
    public String mActionUrl;
    /* access modifiers changed from: private */
    public List<String> mAllMediaSha1s;
    /* access modifiers changed from: private */
    public int mBaseColor;
    /* access modifiers changed from: private */
    public List<MediaFeatureItem> mCoverMediaFeatureItems;
    /* access modifiers changed from: private */
    public int mCreateBy;
    /* access modifiers changed from: private */
    public long mCreateTime;
    /* access modifiers changed from: private */
    public String mDescription;
    /* access modifiers changed from: private */
    public String mDetailUrl;
    private HashMap<String, String> mExtras;
    private int mImageResId;
    /* access modifiers changed from: private */
    public Uri mImageUri;
    /* access modifiers changed from: private */
    public boolean mIsDeletable;
    /* access modifiers changed from: private */
    public boolean mIsIgnored;
    /* access modifiers changed from: private */
    public boolean mIsSyncable;
    /* access modifiers changed from: private */
    public boolean mIsTop;
    private int mLocalFlag;
    /* access modifiers changed from: private */
    public OperationInfo mOperationInfo;
    /* access modifiers changed from: private */
    public int mScenarioId;
    /* access modifiers changed from: private */
    public List<String> mSelectedMediaSha1s;
    /* access modifiers changed from: private */
    public String mServerId;
    /* access modifiers changed from: private */
    public long mServerTag;
    /* access modifiers changed from: private */
    public String mTitle;
    /* access modifiers changed from: private */
    public int mType;
    /* access modifiers changed from: private */
    public UniqueKey mUniqueKey;
    /* access modifiers changed from: private */
    public long mUpdateTime;
    /* access modifiers changed from: private */
    public long mValidEndTime;
    /* access modifiers changed from: private */
    public long mValidStartTime;

    public static class Builder {
        private List<String> mAllMediaSha1s;
        private int mBaseColor;
        private final Context mContext;
        private List<MediaFeatureItem> mCoverMediaFeatureItems;
        private int mCreateBy;
        private long mCreateTime;
        private boolean mDeletable = true;
        private String mDescription;
        private String mDetailUrl;
        private int mImageResId;
        private Uri mImageUri;
        private boolean mIsIgnored = false;
        private boolean mIsSyncable = true;
        private boolean mIsTop = false;
        private OperationInfo mOperationInfo;
        private int mScenarioId;
        private List<String> mSelectedMediaSha1s;
        private String mServerId;
        private long mServerTag;
        private String mTitle;
        private int mType = 0;
        private UniqueKey mUniqueKey;
        private long mUpdateTime;
        private long mValidEndTime = Long.MAX_VALUE;
        private long mValidStartTime = 0;

        public Builder(Context context) {
            this.mContext = context;
        }

        public Card build() {
            if (TextUtils.isEmpty(this.mTitle)) {
                Log.e("Card", "the title must not be empty.");
            }
            Uri uri = null;
            Card card = new Card();
            card.mTitle = this.mTitle;
            card.mDescription = this.mDescription;
            card.mDetailUrl = this.mDetailUrl;
            card.mIsDeletable = this.mDeletable;
            card.mBaseColor = this.mBaseColor;
            card.mUniqueKey = this.mUniqueKey;
            card.mOperationInfo = this.mOperationInfo;
            card.mActionUrl = this.mOperationInfo != null ? this.mOperationInfo.getUrl() : "";
            if (this.mImageUri != null) {
                uri = Card.decodeUri(this.mImageUri);
            } else if (this.mOperationInfo != null) {
                uri = Uri.parse(this.mOperationInfo.getBackgroundUrl());
            }
            card.mImageUri = uri;
            card.mAllMediaSha1s = this.mAllMediaSha1s;
            card.mSelectedMediaSha1s = this.mSelectedMediaSha1s;
            card.mCoverMediaFeatureItems = this.mCoverMediaFeatureItems;
            card.mScenarioId = this.mScenarioId;
            card.mServerId = this.mServerId;
            card.mServerTag = this.mServerTag;
            card.mCreateBy = this.mCreateBy;
            card.mCreateTime = this.mCreateTime;
            card.mUpdateTime = this.mUpdateTime;
            card.mIsIgnored = this.mIsIgnored;
            card.mIsSyncable = this.mIsSyncable;
            card.mValidStartTime = this.mValidStartTime;
            card.mValidEndTime = this.mValidEndTime;
            card.mIsTop = this.mIsTop;
            if (this.mImageResId > 0) {
                card.mImageUri = Card.convertResIdToUri(this.mContext, this.mImageResId);
            }
            card.mType = this.mType;
            return card;
        }

        public Builder setAllMediaSha1s(List<String> list) {
            this.mAllMediaSha1s = list;
            return this;
        }

        public Builder setCoverMediaFeatureItems(List<MediaFeatureItem> list) {
            this.mCoverMediaFeatureItems = list;
            return this;
        }

        public Builder setCreateBy(int i) {
            this.mCreateBy = i;
            return this;
        }

        public Builder setCreateTime(long j) {
            this.mCreateTime = j;
            return this;
        }

        public Builder setDeletable(boolean z) {
            this.mDeletable = z;
            return this;
        }

        public Builder setDescription(String str) {
            this.mDescription = str;
            return this;
        }

        public Builder setDetailUrl(String str) {
            this.mDetailUrl = str;
            return this;
        }

        public Builder setImageUri(Uri uri) {
            this.mImageUri = uri;
            return this;
        }

        public Builder setIsIgnored(boolean z) {
            this.mIsIgnored = z;
            return this;
        }

        public Builder setOperationInfo(OperationInfo operationInfo) {
            this.mOperationInfo = operationInfo;
            return this;
        }

        public Builder setScenarioId(int i) {
            this.mScenarioId = i;
            return this;
        }

        public Builder setSelectedMediaSha1s(List<String> list) {
            this.mSelectedMediaSha1s = list;
            return this;
        }

        public Builder setServerId(String str) {
            this.mServerId = str;
            return this;
        }

        public Builder setServerTag(long j) {
            this.mServerTag = j;
            return this;
        }

        public Builder setSyncable(boolean z) {
            this.mIsSyncable = z;
            return this;
        }

        public Builder setTitle(String str) {
            this.mTitle = str;
            return this;
        }

        public Builder setTop(boolean z) {
            this.mIsTop = z;
            return this;
        }

        public Builder setType(int i) {
            this.mType = i;
            return this;
        }

        public Builder setUniqueKey(UniqueKey uniqueKey) {
            this.mUniqueKey = uniqueKey;
            return this;
        }

        public Builder setUpdateTime(long j) {
            this.mUpdateTime = j;
            return this;
        }

        public Builder setValidEndTime(long j) {
            if (j <= 0) {
                j = Long.MAX_VALUE;
            }
            this.mValidEndTime = j;
            return this;
        }

        public Builder setValidStartTime(long j) {
            this.mValidStartTime = j;
            return this;
        }
    }

    public static class CardExtraInfo {
        public final boolean isIgnored;
        public final UniqueKey uniqueKey;

        public CardExtraInfo(UniqueKey uniqueKey2, boolean z) {
            this.uniqueKey = uniqueKey2;
            this.isIgnored = z;
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("ignored = 0 AND localFlag NOT IN (1,-2,-1,4) AND (");
        sb.append(String.format("%s > %s AND %s < %s", new Object[]{Long.valueOf(System.currentTimeMillis()), "validStart", Long.valueOf(System.currentTimeMillis()), "validEnd"}));
        sb.append(" OR ");
        sb.append(nexExportFormat.TAG_FORMAT_TYPE);
        sb.append("<>");
        sb.append(2);
        sb.append(")");
        BASE_UI_CARD_SELECTION = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("ignored = 0 AND syncable = 1 AND ");
        sb2.append(String.format("%s = %s OR %s = %s OR %s = %s", new Object[]{"localFlag", Integer.valueOf(1), "localFlag", Integer.valueOf(0), "localFlag", Integer.valueOf(2)}));
        BASE_UNSYNC_CARD_SELECTION = sb2.toString();
    }

    private Card() {
        this.mImageResId = -1;
    }

    public static Uri convertResIdToUri(Context context, int i) {
        return Uri.parse(String.format("%s://%s", new Object[]{context.getResources().getResourceTypeName(i), context.getResources().getResourceEntryName(i)}));
    }

    public static int convertUriToResId(Context context, Uri uri) {
        String scheme = uri.getScheme();
        String authority = uri.getAuthority();
        String packageName = context.getPackageName();
        return context.getResources().getIdentifier(String.format("%s/%s", new Object[]{scheme, authority}), null, packageName);
    }

    /* access modifiers changed from: private */
    public static Uri decodeUri(Uri uri) {
        return uri == null ? uri : Uri.parse(Uri.decode(uri.toString()));
    }

    private String getExtra(String str) {
        if (this.mExtras != null) {
            return (String) this.mExtras.get(str);
        }
        return null;
    }

    private static String mapToString(HashMap<String, String> hashMap) {
        if (hashMap == null) {
            return null;
        }
        try {
            return new Gson().toJson((Object) hashMap);
        } catch (Exception e) {
            Log.e("Card", "mapToString occur error.\n", (Object) e);
            return null;
        }
    }

    private void parseStyles(String str) {
        HashMap stringToMap = stringToMap(str);
        if (stringToMap != null) {
            this.mBaseColor = stringToInt((String) stringToMap.get("baseColor"));
        }
    }

    private void putExtra(String str, String str2) {
        if (this.mExtras == null) {
            this.mExtras = new HashMap<>();
        }
        this.mExtras.put(str, str2);
    }

    private void setType(int i) {
        this.mType = i;
    }

    private static int stringToInt(String str) {
        if (str == null) {
            return 0;
        }
        try {
            return Integer.valueOf(str).intValue();
        } catch (Exception e) {
            Log.e("Card", "stringToInt occur error.\n", (Object) e);
            return 0;
        }
    }

    private static HashMap<String, String> stringToMap(String str) {
        if (str == null) {
            return null;
        }
        try {
            return (HashMap) new Gson().fromJson(str, new TypeToken<HashMap<String, String>>() {
            }.getType());
        } catch (Exception e) {
            Log.e("Card", "stringToMap occur error.\n", (Object) e);
            return null;
        }
    }

    private String wrapStyles() {
        HashMap hashMap = new HashMap();
        hashMap.put("baseColor", String.valueOf(this.mBaseColor));
        return mapToString(hashMap);
    }

    public int compareTo(Card card) {
        int i = -Boolean.compare(this.mIsTop, card.mIsTop);
        return i == 0 ? -Long.compare(this.mCreateTime, card.mCreateTime) : i;
    }

    /* access modifiers changed from: 0000 */
    public synchronized void copyFrom(Card card) {
        if (card != null) {
            this.mTitle = card.getTitle();
            this.mDescription = card.getDescription();
            this.mActionUrl = card.getActionUrl();
            this.mDetailUrl = card.getDetailUrl();
            this.mImageUri = card.getImageUri();
            this.mCreateTime = card.getCreateTime();
            this.mIsDeletable = card.isDeletable();
            this.mType = card.getType();
            this.mUniqueKey = card.getUniqueKey();
            this.mOperationInfo = card.getOperationInfo();
            this.mAllMediaSha1s = card.getAllMediaSha1s();
            this.mSelectedMediaSha1s = card.getSelectedMediaSha1s();
            this.mCoverMediaFeatureItems = card.getCoverMediaFeatureItems();
            this.mImageResId = card.getImageResId(GalleryApp.sGetAndroidContext());
            this.mBaseColor = card.getBaseColor();
            this.mScenarioId = card.getScenarioId();
            this.mServerId = card.getServerId();
            this.mServerTag = card.getServerTag();
            this.mLocalFlag = card.getLocalFlag();
            this.mUpdateTime = card.getUpdateTime();
            this.mCreateBy = card.getCreateBy();
            this.mIsIgnored = card.isIgnored();
            this.mIsSyncable = card.isSyncable();
            this.mValidStartTime = card.getValidStartTime();
            this.mValidEndTime = card.getValidEndTime();
            this.mIsTop = card.isTop();
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Card)) {
            return false;
        }
        if (this.mId != ((Card) obj).mId) {
            z = false;
        }
        return z;
    }

    public String generateDuplicateKey() {
        if (getUniqueKey() == null || getUniqueKey().getStartTime() <= 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(this.mScenarioId);
            sb.append("_");
            sb.append(this.mCreateTime);
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.mScenarioId);
        sb2.append("_");
        sb2.append(getUniqueKey().getStartTime());
        sb2.append("_");
        sb2.append(getUniqueKey().getTargetTime());
        sb2.append("_");
        sb2.append(getUniqueKey().getLocation());
        return sb2.toString();
    }

    public String getActionUrl() {
        return this.mActionUrl;
    }

    public synchronized List<String> getAllMediaSha1s() {
        return this.mAllMediaSha1s == null ? null : new ArrayList(this.mAllMediaSha1s);
    }

    public int getBaseColor() {
        return this.mBaseColor;
    }

    public CardExtraInfo getCardExtraInfo() {
        return new CardExtraInfo(this.mUniqueKey, this.mIsIgnored);
    }

    public List<MediaFeatureItem> getCoverMediaFeatureItems() {
        if (this.mCoverMediaFeatureItems == null) {
            return null;
        }
        return new ArrayList(this.mCoverMediaFeatureItems);
    }

    public int getCreateBy() {
        return this.mCreateBy;
    }

    public long getCreateTime() {
        return this.mCreateTime;
    }

    public String getDescription() {
        return this.mDescription;
    }

    public String getDetailUrl() {
        return this.mDetailUrl;
    }

    public int getImageResId(Context context) {
        if (this.mImageUri == null) {
            return 0;
        }
        if (this.mImageResId == -1) {
            this.mImageResId = convertUriToResId(context, this.mImageUri);
        }
        return this.mImageResId;
    }

    public Uri getImageUri() {
        return this.mImageUri;
    }

    public int getLocalFlag() {
        return this.mLocalFlag;
    }

    public OperationInfo getOperationInfo() {
        return this.mOperationInfo;
    }

    public long getRecordStartTime() {
        if (getUniqueKey() != null) {
            return getUniqueKey().getStartTime();
        }
        return -1;
    }

    public long getRecordTargetTime() {
        if (getUniqueKey() != null) {
            return getUniqueKey().getTargetTime();
        }
        return -1;
    }

    public int getScenarioId() {
        return this.mScenarioId;
    }

    public synchronized List<String> getSelectedMediaSha1s() {
        return this.mSelectedMediaSha1s == null ? null : new ArrayList(this.mSelectedMediaSha1s);
    }

    public String getServerId() {
        return this.mServerId;
    }

    public long getServerTag() {
        return this.mServerTag;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "cardId", "INTEGER");
        addColumn(arrayList, "title", "TEXT");
        addColumn(arrayList, "description", "TEXT");
        addColumn(arrayList, "actionText", "TEXT");
        addColumn(arrayList, "actionUrl", "TEXT");
        addColumn(arrayList, "detailUrl", "TEXT");
        addColumn(arrayList, "imageUri", "TEXT");
        addColumn(arrayList, "createTime", "INTEGER");
        addColumn(arrayList, "deletable", "INTEGER");
        addColumn(arrayList, nexExportFormat.TAG_FORMAT_TYPE, "INTEGER");
        addColumn(arrayList, "styles", "TEXT");
        addColumn(arrayList, "extras", "TEXT");
        addColumn(arrayList, "scenarioId", "INTEGER");
        addColumn(arrayList, "serverId", "TEXT");
        addColumn(arrayList, "serverTag", "INTEGER");
        addColumn(arrayList, "localFlag", "INTEGER");
        addColumn(arrayList, "updateTime", "INTEGER");
        addColumn(arrayList, "createdBy", "INTEGER");
        addColumn(arrayList, "ignored", "INTEGER");
        addColumn((List<TableColumn>) arrayList, "syncable", "INTEGER", String.valueOf(1));
        addColumn((List<TableColumn>) arrayList, "validStart", "INTEGER", String.valueOf(0));
        addColumn((List<TableColumn>) arrayList, "validEnd", "INTEGER", String.valueOf(Long.MAX_VALUE));
        addColumn((List<TableColumn>) arrayList, "isTop", "INTEGER", String.valueOf(0));
        return arrayList;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public int getType() {
        return this.mType;
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"_id"};
    }

    public UniqueKey getUniqueKey() {
        return this.mUniqueKey;
    }

    public long getUpdateTime() {
        return this.mUpdateTime;
    }

    public long getValidEndTime() {
        return this.mValidEndTime;
    }

    public long getValidStartTime() {
        return this.mValidStartTime;
    }

    public int hashCode() {
        return (int) this.mId;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0067, code lost:
        return r1;
     */
    public synchronized boolean isCoversNeedRefresh() {
        boolean z = false;
        if (this.mSelectedMediaSha1s == null) {
            return false;
        }
        if (this.mCoverMediaFeatureItems == null) {
            return true;
        }
        HashSet hashSet = new HashSet();
        for (MediaFeatureItem mediaFeatureItem : this.mCoverMediaFeatureItems) {
            if (mediaFeatureItem != null) {
                hashSet.add(mediaFeatureItem.getSha1());
            }
        }
        for (String str : this.mSelectedMediaSha1s) {
            if (hashSet.contains(str)) {
                hashSet.remove(str);
            }
        }
        if (!hashSet.isEmpty() || (this.mCoverMediaFeatureItems.size() < 5 && this.mSelectedMediaSha1s.size() > this.mCoverMediaFeatureItems.size())) {
            z = true;
        }
    }

    public boolean isDeletable() {
        return this.mIsDeletable;
    }

    public synchronized boolean isEmpty() {
        return this.mType != 2 && !MiscUtil.isValid(this.mSelectedMediaSha1s);
    }

    public boolean isIgnored() {
        return this.mIsIgnored;
    }

    public boolean isLocalDeleted() {
        return this.mLocalFlag == 1;
    }

    public boolean isOutofDate() {
        long currentTimeMillis = System.currentTimeMillis();
        return this.mValidStartTime > currentTimeMillis || this.mValidEndTime < currentTimeMillis;
    }

    public boolean isSyncable() {
        return this.mIsSyncable;
    }

    public boolean isTop() {
        return this.mIsTop;
    }

    public boolean isValid() {
        return this.mLocalFlag == 0 || this.mLocalFlag == 2 || this.mLocalFlag == 3;
    }

    /* access modifiers changed from: protected */
    public synchronized void onConvertToContents(ContentValues contentValues) {
        contentValues.put("title", this.mTitle);
        contentValues.put("description", this.mDescription);
        contentValues.putNull("actionText");
        contentValues.put("actionUrl", this.mActionUrl);
        contentValues.put("detailUrl", this.mDetailUrl);
        if (this.mImageUri == null) {
            contentValues.putNull("imageUri");
        } else {
            contentValues.put("imageUri", this.mImageUri.toString());
        }
        contentValues.put("createTime", Long.valueOf(this.mCreateTime));
        contentValues.put("deletable", Integer.valueOf(this.mIsDeletable ? 1 : 0));
        contentValues.put(nexExportFormat.TAG_FORMAT_TYPE, Integer.valueOf(getType()));
        contentValues.put("styles", wrapStyles());
        putExtra("unique_key", GsonUtils.toString(this.mUniqueKey));
        putExtra("operation_info", GsonUtils.toString(this.mOperationInfo));
        putExtra("all_images", GsonUtils.toString(this.mAllMediaSha1s));
        putExtra("selected_images", GsonUtils.toString(this.mSelectedMediaSha1s));
        putExtra("covers", GsonUtils.toString(this.mCoverMediaFeatureItems));
        contentValues.put("extras", mapToString(this.mExtras));
        contentValues.put("scenarioId", Integer.valueOf(this.mScenarioId));
        contentValues.put("serverId", this.mServerId);
        contentValues.put("serverTag", Long.valueOf(this.mServerTag));
        contentValues.put("localFlag", Integer.valueOf(this.mLocalFlag));
        contentValues.put("updateTime", Long.valueOf(this.mUpdateTime));
        contentValues.put("createdBy", Integer.valueOf(this.mCreateBy));
        contentValues.put("ignored", Integer.valueOf(this.mIsIgnored ? 1 : 0));
        contentValues.put("syncable", Integer.valueOf(this.mIsSyncable ? 1 : 0));
        contentValues.put("validStart", Long.valueOf(this.mValidStartTime));
        contentValues.put("validEnd", Long.valueOf(this.mValidEndTime));
        contentValues.put("isTop", Integer.valueOf(this.mIsTop ? 1 : 0));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mTitle = getString(cursor, "title");
        this.mDescription = getString(cursor, "description");
        this.mDetailUrl = getString(cursor, "detailUrl");
        this.mActionUrl = getString(cursor, "actionUrl");
        String string = getString(cursor, "imageUri");
        if (string != null) {
            this.mImageUri = Uri.parse(string);
        }
        this.mCreateTime = getLong(cursor, "createTime");
        boolean z = false;
        this.mIsDeletable = getInt(cursor, "deletable") == 1;
        setType(getInt(cursor, nexExportFormat.TAG_FORMAT_TYPE));
        parseStyles(getString(cursor, "styles"));
        this.mExtras = stringToMap(getString(cursor, "extras"));
        this.mUniqueKey = (UniqueKey) GsonUtils.fromJson(getExtra("unique_key"), UniqueKey.class);
        this.mOperationInfo = (OperationInfo) GsonUtils.fromJson(getExtra("operation_info"), OperationInfo.class);
        try {
            this.mAllMediaSha1s = GsonUtils.getArray(getExtra("all_images"), (Type) String.class);
            this.mSelectedMediaSha1s = GsonUtils.getArray(getExtra("selected_images"), (Type) String.class);
            this.mCoverMediaFeatureItems = GsonUtils.getArray(getExtra("covers"), (Type) MediaFeatureItem.class);
        } catch (JSONException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Create card from cursor error:");
            sb.append(e);
            Log.e("Card", sb.toString());
        }
        this.mScenarioId = getInt(cursor, "scenarioId");
        if (this.mScenarioId <= 0) {
            this.mScenarioId = this.mUniqueKey != null ? this.mUniqueKey.getScenarioId() : 0;
        }
        this.mServerId = getString(cursor, "serverId");
        this.mServerTag = getLong(cursor, "serverTag");
        this.mLocalFlag = getInt(cursor, "localFlag");
        this.mUpdateTime = getLong(cursor, "updateTime");
        this.mCreateBy = getInt(cursor, "createdBy");
        this.mIsIgnored = getInt(cursor, "ignored") == 1;
        this.mIsSyncable = getInt(cursor, "syncable") == 1;
        this.mValidStartTime = getLong(cursor, "validStart");
        this.mValidEndTime = getLong(cursor, "validEnd");
        if (getInt(cursor, "isTop") == 1) {
            z = true;
        }
        this.mIsTop = z;
    }

    public synchronized boolean removeImages(List<String> list) {
        boolean z;
        int i;
        z = false;
        if (!MiscUtil.isValid(this.mSelectedMediaSha1s) || !MiscUtil.isValid(this.mAllMediaSha1s) || !MiscUtil.isValid(list)) {
            i = 0;
        } else {
            i = 0;
            for (String str : list) {
                if (this.mSelectedMediaSha1s.contains(str) && this.mSelectedMediaSha1s.remove(str)) {
                    i++;
                }
                if (this.mAllMediaSha1s.contains(str)) {
                    this.mAllMediaSha1s.remove(str);
                }
            }
        }
        if (i > 0) {
            Log.d("Card", "Delete %d images from Card %d", Integer.valueOf(i), Long.valueOf(this.mId));
        }
        if (i > 0) {
            z = true;
        }
        return z;
    }

    public synchronized void setAllMediaSha1s(List<String> list) {
        if (this.mAllMediaSha1s == null) {
            this.mAllMediaSha1s = new ArrayList();
        }
        this.mAllMediaSha1s.clear();
        if (MiscUtil.isValid(list)) {
            this.mAllMediaSha1s.addAll(list);
        }
    }

    public void setCardExtraInfo(CardExtraInfo cardExtraInfo) {
        if (cardExtraInfo != null) {
            this.mUniqueKey = cardExtraInfo.uniqueKey;
            this.mIsIgnored = cardExtraInfo.isIgnored;
        }
    }

    public synchronized void setCoverMediaFeatureItems(List<MediaFeatureItem> list) {
        if (this.mCoverMediaFeatureItems == null) {
            this.mCoverMediaFeatureItems = new ArrayList();
        }
        this.mCoverMediaFeatureItems.clear();
        if (MiscUtil.isValid(list)) {
            this.mCoverMediaFeatureItems.addAll(list);
        }
    }

    public void setCreateBy(int i) {
        this.mCreateBy = i;
    }

    public void setCreateTime(long j) {
        this.mCreateTime = j;
    }

    public void setDescription(String str) {
        this.mDescription = str;
    }

    public void setLocalFlag(int i) {
        this.mLocalFlag = i;
    }

    public void setScenarioId(int i) {
        this.mScenarioId = i;
    }

    public synchronized void setSelectedMediaSha1s(List<String> list, String str) {
        if (this.mSelectedMediaSha1s == null) {
            this.mSelectedMediaSha1s = new ArrayList();
        }
        this.mSelectedMediaSha1s.clear();
        if (MiscUtil.isValid(list)) {
            this.mSelectedMediaSha1s.addAll(list);
        } else {
            HashMap hashMap = new HashMap(1);
            hashMap.put("from", str);
            GalleryStatHelper.recordCountEvent("assistant", "assistant_card_remove_all_image", hashMap);
            Log.d("Card", android.util.Log.getStackTraceString(new Throwable()));
        }
    }

    public void setServerId(String str) {
        this.mServerId = str;
    }

    public void setServerTag(long j) {
        this.mServerTag = j;
    }

    public void setTitle(String str) {
        this.mTitle = str;
    }

    public void setUpdateTime(long j) {
        this.mUpdateTime = j;
    }
}

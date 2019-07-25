package com.miui.gallery.card.scenario.time.recent;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.LocationScenario;
import com.miui.gallery.card.scenario.time.LocationScenario.MediaItem;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class RecentTravelScenario extends LocationScenario {
    public RecentTravelScenario() {
        super(BaiduSceneResult.BRIDGE, 2, 6);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getDatePeriodFromRecord(record);
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_title_somewhere, new Object[]{record.getLocation()});
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, true);
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        long dateTime = DateUtils.getDateTime(currentTimeMillis);
        long j = dateTime - 2592000000L;
        List<MediaItem> list3 = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, PROJECTION, String.format(Locale.US, TIME_SELECTION, new Object[]{Long.valueOf(j), Long.valueOf(dateTime)}), (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) new QueryHandler<List<MediaItem>>() {
            public List<MediaItem> handle(Cursor cursor) {
                return LocationScenario.getMediaItemsFromCursor(cursor, true);
            }
        });
        if (!MiscUtil.isValid(list3)) {
            return false;
        }
        String str = null;
        List list4 = null;
        MediaItem mediaItem = null;
        for (MediaItem mediaItem2 : list3) {
            if (str == null) {
                str = mediaItem2.mCity;
            } else if (list4 != null) {
                if (!TextUtils.equals(mediaItem.mCity, mediaItem2.mCity)) {
                    break;
                }
                list4.add(mediaItem2);
            } else if (!TextUtils.isEmpty(mediaItem2.mCity) && !TextUtils.equals(mediaItem2.mCity, str)) {
                if (currentTimeMillis - mediaItem2.mDateTime >= 259200000) {
                    return false;
                }
                list4 = new LinkedList();
                list4.add(mediaItem2);
                mediaItem = mediaItem2;
            }
        }
        if (MiscUtil.isValid(list4)) {
            MediaItem mediaItem3 = (MediaItem) list4.get(list4.size() - 1);
            MediaItem mediaItem4 = (MediaItem) list4.get(0);
            if (mediaItem4.mDateTime - mediaItem3.mDateTime <= 864000000 && !recordStartTimesFromRecordAndCards.contains(Long.valueOf(DateUtils.getDateTime(mediaItem3.mDateTime)))) {
                this.mTargetCity = mediaItem.mCity;
                setStartTime(mediaItem3.mDateTime);
                setEndTime(mediaItem4.mDateTime);
                return true;
            }
        }
        return false;
    }
}

package com.miui.gallery.card.scenario.time.free;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
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
import java.util.List;

public class PastTravelScenario extends LocationScenario {
    public PastTravelScenario() {
        super(201, 4, 4);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getDatePeriodFromRecord(record);
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_title_somewhere, new Object[]{record.getLocation()});
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, true);
        List list3 = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, PROJECTION, ALL_IMAGE_SELECTION, (String[]) null, "mixedDateTime ASC", (QueryHandler<T>) new QueryHandler<List<MediaItem>>() {
            public List<MediaItem> handle(Cursor cursor) {
                return LocationScenario.getMediaItemsFromCursor(cursor, true);
            }
        });
        if (MiscUtil.isValid(list3)) {
            MediaItem mediaItem = null;
            for (int i = 0; i < list3.size(); i++) {
                MediaItem mediaItem2 = (MediaItem) list3.get(i);
                if (mediaItem != null) {
                    if (!TextUtils.equals(mediaItem.mCity, mediaItem2.mCity)) {
                        MediaItem mediaItem3 = (MediaItem) list3.get(i - 1);
                        List mediaIdsByStartEndTime = getMediaIdsByStartEndTime(mediaItem.mDateTime, mediaItem3.mDateTime);
                        if (mediaItem3.mDateTime - mediaItem.mDateTime <= 864000000 && mediaIdsByStartEndTime != null && mediaIdsByStartEndTime.size() > getMinImageCount() && !recordStartTimesFromRecordAndCards.contains(Long.valueOf(DateUtils.getDateTime(mediaItem.mDateTime)))) {
                            this.mTargetCity = mediaItem.mCity;
                            setStartTime(mediaItem.mDateTime);
                            setEndTime(mediaItem3.mDateTime);
                            return true;
                        }
                    } else {
                        continue;
                    }
                }
                mediaItem = mediaItem2;
            }
        }
        return false;
    }
}

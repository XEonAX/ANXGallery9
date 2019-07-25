package com.miui.gallery.card.scenario.time.annual;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.card.scenario.time.LocationScenario;
import com.miui.gallery.card.scenario.time.LocationScenario.MediaItem;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class AnnualTravelsScenario extends AnnualScenario {
    protected static final String IMAGE_SELECTION;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ScenarioConstants.CAMERA_BASE_SELECTION);
        sb.append(" AND ");
        sb.append("location");
        sb.append(" is not null");
        sb.append(" AND ");
        sb.append("mixedDateTime");
        sb.append(" > %s");
        sb.append(" AND ");
        sb.append("mixedDateTime");
        sb.append(" < %s");
        IMAGE_SELECTION = sb.toString();
    }

    public AnnualTravelsScenario() {
        super(BaiduSceneResult.SUBWAY);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_description_annual_travel);
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        long recordStartTime = getRecordStartTime(record);
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_title_annual_travel, new Object[]{DateUtils.getYearLocale(recordStartTime)});
    }

    public List<Long> loadMediaItem() {
        ArrayList arrayList = new ArrayList();
        List list = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, LocationScenario.PROJECTION, String.format(Locale.US, IMAGE_SELECTION, new Object[]{Long.valueOf(getStartTime()), Long.valueOf(getEndTime())}), (String[]) null, "mixedDateTime ASC", (QueryHandler<T>) new QueryHandler<List<MediaItem>>() {
            public List<MediaItem> handle(Cursor cursor) {
                return LocationScenario.getMediaItemsFromCursor(cursor, true);
            }
        });
        if (MiscUtil.isValid(list)) {
            MediaItem mediaItem = null;
            for (int i = 0; i < list.size(); i++) {
                MediaItem mediaItem2 = (MediaItem) list.get(i);
                if (mediaItem != null) {
                    if (!TextUtils.equals(mediaItem.mCity, mediaItem2.mCity)) {
                        MediaItem mediaItem3 = (MediaItem) list.get(i - 1);
                        List mediaIdsByStartEndTime = getMediaIdsByStartEndTime(mediaItem.mDateTime, mediaItem3.mDateTime);
                        if (mediaItem3.mDateTime - mediaItem.mDateTime <= 864000000 && mediaIdsByStartEndTime != null && mediaIdsByStartEndTime.size() > getMinImageCount()) {
                            arrayList.addAll(getMediaIdsByStartEndTime(mediaItem.mDateTime, mediaItem3.mDateTime));
                        }
                    }
                }
                mediaItem = mediaItem2;
            }
        }
        return arrayList;
    }
}

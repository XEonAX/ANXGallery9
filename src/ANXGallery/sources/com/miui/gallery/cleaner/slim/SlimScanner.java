package com.miui.gallery.cleaner.slim;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.CleanerPhotoPickActivity;
import com.miui.gallery.cleaner.BaseScanner;
import com.miui.gallery.cleaner.ScanResult;
import com.miui.gallery.cleaner.ScanResult.Builder;
import com.miui.gallery.cleaner.ScanResult.OnScanResultClickListener;
import com.miui.gallery.cleaner.ScanResult.ResultImage;
import com.miui.gallery.cleaner.slim.SlimController.SpaceSlimObserver;
import com.miui.gallery.cloud.CloudTableUtils;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.ScreenUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SlimScanner extends BaseScanner implements SpaceSlimObserver {
    public static final String SLIM_SCAN_ORDER = String.format("%s DESC", new Object[]{"alias_sort_time"});
    public static final String[] SLIM_SCAN_PROJECTION = {"_id", "localFile", "size", "exifImageWidth", "exifImageLength"};
    private static final String SLIM_SCAN_SELECTION;
    public static final String SYNCED_SLIM_SCAN_SELECTION;
    private ArrayList<MediaItem> mMediaItems = new ArrayList<>();
    private OnScanResultClickListener mOnScanResultClickListener = new OnScanResultClickListener() {
        public void onClick(Context context) {
            Intent intent = new Intent(context, CleanerPhotoPickActivity.class);
            intent.putExtra("extra_cleaner_photo_pick_type", SlimScanner.this.mType);
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_result_slim_click");
        }
    };

    private static class MediaItem {
        public String mFilePath;
        public int mHeight;
        public long mId;
        public long mSize;
        public long mSlimSize;
        public int mWidth;

        private MediaItem() {
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("serverType = 1 AND mimeType != 'image/gif' AND localFile NOT NULL AND localFile != '' AND localGroupId != ");
        sb.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1000));
        sb.append(" AND ");
        sb.append("localGroupId");
        sb.append(" != ");
        sb.append(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001));
        SLIM_SCAN_SELECTION = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("alias_sync_state = 0 AND ");
        sb2.append(SLIM_SCAN_SELECTION);
        SYNCED_SLIM_SCAN_SELECTION = sb2.toString();
    }

    public SlimScanner() {
        super(0);
    }

    private ScanResult buildScanResult() {
        int i;
        long j;
        ResultImage[] resultImageArr = new ResultImage[4];
        synchronized (this.mMediaItems) {
            Iterator it = this.mMediaItems.iterator();
            i = 0;
            j = 0;
            while (it.hasNext()) {
                MediaItem mediaItem = (MediaItem) it.next();
                j += mediaItem.mSlimSize;
                if (i < resultImageArr.length) {
                    resultImageArr[i] = new ResultImage(mediaItem.mId, mediaItem.mFilePath);
                }
                i++;
            }
        }
        return new Builder(GalleryApp.sGetAndroidContext()).setType(this.mType).setTitle(R.string.cleaner_slim_title).setSize(j).setDescription(R.string.cleaner_slim_description).setImages(resultImageArr).setAction(R.string.cleaner_slim_action).setCount(i).setCountText(R.plurals.photo_count_format).setOnScanResultClickListener(this.mOnScanResultClickListener).build();
    }

    private void removeMediaItem(long j) {
        boolean z;
        synchronized (this.mMediaItems) {
            Iterator it = this.mMediaItems.iterator();
            while (true) {
                if (it.hasNext()) {
                    if (((MediaItem) it.next()).mId == j) {
                        it.remove();
                        z = true;
                        break;
                    }
                } else {
                    z = false;
                    break;
                }
            }
        }
        if (z) {
            updateScanResult(buildScanResult());
        }
    }

    public long[] getScanResultIds() {
        long[] jArr;
        synchronized (this.mMediaItems) {
            int size = this.mMediaItems.size();
            jArr = new long[size];
            for (int i = 0; i < size; i++) {
                jArr[i] = ((MediaItem) this.mMediaItems.get(i)).mId;
            }
        }
        return jArr;
    }

    public void onMediaItemDeleted(long j) {
        removeMediaItem(j);
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        this.mMediaItems.clear();
        SlimController.getInstance().unregisterObserver(this);
    }

    public void onSlimPaused() {
    }

    public void onSlimProgress(long j, long j2, int i) {
        removeMediaItem(j);
    }

    public void onSlimResumed() {
    }

    public ScanResult scan() {
        List<MediaItem> list = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Media.URI_OWNER_ALBUM_MEDIA, SLIM_SCAN_PROJECTION, SYNCED_SLIM_SCAN_SELECTION, (String[]) null, SLIM_SCAN_ORDER, (QueryHandler<T>) new QueryHandler<List<MediaItem>>() {
            public List<MediaItem> handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                ArrayList arrayList = null;
                do {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    MediaItem mediaItem = new MediaItem();
                    mediaItem.mId = cursor.getLong(0);
                    mediaItem.mFilePath = cursor.getString(1);
                    mediaItem.mSize = cursor.getLong(2);
                    mediaItem.mWidth = cursor.getInt(3);
                    mediaItem.mHeight = cursor.getInt(4);
                    arrayList.add(mediaItem);
                } while (cursor.moveToNext());
                return arrayList;
            }
        });
        if (!MiscUtil.isValid(list)) {
            return null;
        }
        int screenWidth = ScreenUtils.getScreenWidth();
        int screenHeight = ScreenUtils.getScreenHeight();
        for (MediaItem mediaItem : list) {
            if (Math.max(mediaItem.mWidth, mediaItem.mHeight) > screenWidth && FileUtils.isFileExist(mediaItem.mFilePath)) {
                float computeThumbNailScaleSize = BitmapUtils.computeThumbNailScaleSize(mediaItem.mWidth, mediaItem.mHeight, screenWidth, screenHeight);
                long j = mediaItem.mSize;
                double d = (double) mediaItem.mSize;
                double pow = Math.pow((double) computeThumbNailScaleSize, 2.0d);
                Double.isNaN(d);
                long j2 = j - ((long) ((d * pow) * 0.4000000059604645d));
                if (j2 > 0) {
                    mediaItem.mSlimSize = j2;
                    this.mMediaItems.add(mediaItem);
                }
            }
        }
        if (this.mMediaItems.isEmpty()) {
            return null;
        }
        SlimController.getInstance().registerObserver(this);
        return buildScanResult();
    }
}

package com.miui.gallery.cleaner;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.CleanerPhotoPickActivity;
import com.miui.gallery.cleaner.ScanResult.Builder;
import com.miui.gallery.cleaner.ScanResult.OnScanResultClickListener;
import com.miui.gallery.cleaner.ScanResult.ResultImage;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;

public class ScreenshotScanner extends BaseScanner {
    public static final String SCREEN_SHOT_SCAN_ORDER = String.format("%s DESC", new Object[]{"alias_create_time"});
    public static final String[] SCREEN_SHOT_SCAN_PROJECTION = {"_id", "size", "localFile", "thumbnailFile", "microthumbfile", "sha1"};
    private ArrayList<MediaItem> mMediaItems = new ArrayList<>();
    private OnScanResultClickListener mOnScanResultClickListener = new OnScanResultClickListener() {
        public void onClick(Context context) {
            Intent intent = new Intent(context, CleanerPhotoPickActivity.class);
            intent.putExtra("extra_cleaner_photo_pick_type", ScreenshotScanner.this.mType);
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_result_screenshot_click");
        }
    };
    private int mScreenshotLocalId = -1;

    private static class MediaItem {
        public long mId;
        public String mPath;
        public String mSha1;
        public long mSize;

        private MediaItem() {
        }
    }

    public ScreenshotScanner() {
        super(1);
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
                j += mediaItem.mSize;
                if (i < resultImageArr.length) {
                    resultImageArr[i] = new ResultImage(mediaItem.mId, mediaItem.mPath);
                }
                i++;
            }
        }
        return new Builder(GalleryApp.sGetAndroidContext()).setType(this.mType).setTitle(R.string.cleaner_screen_shot_title).setDescription(R.string.cleaner_screen_shot_description).setSize(j).setImages(resultImageArr).setAction(R.string.cleaner_screen_shot_action).setCount(i).setCountText(R.plurals.photo_count_format).setOnScanResultClickListener(this.mOnScanResultClickListener).build();
    }

    private int queryScreenshotAlbumId(Context context) {
        return ((Integer) SafeDBUtil.safeQuery(context, Cloud.CLOUD_URI, new String[]{"_id"}, "serverId = 2 AND (serverType=0)", (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Integer>() {
            public Integer handle(Cursor cursor) {
                int i = (cursor == null || !cursor.moveToFirst()) ? -1 : cursor.getInt(0);
                if (i <= 0) {
                    i = -1;
                }
                return Integer.valueOf(i);
            }
        })).intValue();
    }

    private boolean removeItem(long j) {
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
        return z;
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
        if (removeItem(j)) {
            updateScanResult(buildScanResult());
        }
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        this.mMediaItems.clear();
    }

    public void removeItems(long[] jArr) {
        if (jArr != null) {
            synchronized (this.mMediaItems) {
                for (long j : jArr) {
                    if (removeItem(j)) {
                        updateScanResult((long) ((int) j), buildScanResult());
                    }
                }
            }
        }
    }

    public ScanResult scan() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (this.mScreenshotLocalId == -1) {
            this.mScreenshotLocalId = queryScreenshotAlbumId(sGetAndroidContext);
            if (this.mScreenshotLocalId == -1) {
                return null;
            }
        }
        ArrayList<MediaItem> arrayList = (ArrayList) SafeDBUtil.safeQuery(sGetAndroidContext, Media.URI_OWNER_ALBUM_MEDIA, SCREEN_SHOT_SCAN_PROJECTION, String.format(Locale.US, "localGroupId = %d", new Object[]{Integer.valueOf(this.mScreenshotLocalId)}), (String[]) null, SCREEN_SHOT_SCAN_ORDER, (QueryHandler<T>) new QueryHandler<ArrayList<MediaItem>>() {
            public ArrayList<MediaItem> handle(Cursor cursor) {
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
                    mediaItem.mSize = cursor.getLong(1);
                    mediaItem.mSha1 = cursor.getString(5);
                    mediaItem.mPath = cursor.getString(2);
                    if (TextUtils.isEmpty(mediaItem.mPath)) {
                        mediaItem.mPath = cursor.getString(3);
                    }
                    if (TextUtils.isEmpty(mediaItem.mPath)) {
                        mediaItem.mPath = cursor.getString(4);
                    }
                    arrayList.add(mediaItem);
                } while (cursor.moveToNext());
                return arrayList;
            }
        });
        if (!MiscUtil.isValid(arrayList)) {
            return null;
        }
        this.mMediaItems = arrayList;
        return buildScanResult();
    }
}

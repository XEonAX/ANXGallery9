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
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.Iterator;

public class VideoScanner extends BaseScanner {
    private static final String SELECTION;
    public static final String VALID_FILE;
    private static final String[] VIDEO_SCAN_PROJECTION = {"_id", "size", "localFile", "thumbnailFile", "microthumbfile", "sha1"};
    private ArrayList<VideoMediaItem> mMediaItems = new ArrayList<>();
    private OnScanResultClickListener mOnScanResultClickListener = new OnScanResultClickListener() {
        public void onClick(Context context) {
            Intent intent = new Intent(context, CleanerPhotoPickActivity.class);
            intent.putExtra("extra_cleaner_photo_pick_type", VideoScanner.this.mType);
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_result_video_click");
        }
    };

    private static class VideoMediaItem {
        public long mId;
        public String mPath;
        public String mSha1;
        public long mSize;

        private VideoMediaItem() {
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("(size > ");
        sb.append(String.valueOf(0));
        sb.append(")");
        VALID_FILE = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("serverType = ");
        sb2.append(String.valueOf(2));
        sb2.append(" AND ");
        sb2.append("alias_hidden");
        sb2.append(" = ");
        sb2.append(String.valueOf(0));
        sb2.append(" AND ");
        sb2.append(VALID_FILE);
        SELECTION = sb2.toString();
    }

    protected VideoScanner() {
        super(2);
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
                VideoMediaItem videoMediaItem = (VideoMediaItem) it.next();
                j += videoMediaItem.mSize;
                if (i < resultImageArr.length) {
                    resultImageArr[i] = new ResultImage(videoMediaItem.mId, videoMediaItem.mPath);
                }
                i++;
            }
        }
        return new Builder(GalleryApp.sGetAndroidContext()).setType(this.mType).setTitle(R.string.cleaner_video_title).setDescription(R.string.cleaner_video_description).setSize(j).setImages(resultImageArr).setAction(R.string.cleaner_video_action).setCount(i).setCountText(R.plurals.video_count_format).setOnScanResultClickListener(this.mOnScanResultClickListener).build();
    }

    private boolean removeItem(long j) {
        boolean z;
        synchronized (this.mMediaItems) {
            Iterator it = this.mMediaItems.iterator();
            while (true) {
                if (it.hasNext()) {
                    if (((VideoMediaItem) it.next()).mId == j) {
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
                jArr[i] = ((VideoMediaItem) this.mMediaItems.get(i)).mId;
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
        ArrayList<VideoMediaItem> arrayList = (ArrayList) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Media.URI_OWNER_ALBUM_MEDIA, VIDEO_SCAN_PROJECTION, SELECTION, (String[]) null, "alias_create_time DESC", (QueryHandler<T>) new QueryHandler<ArrayList<VideoMediaItem>>() {
            public ArrayList<VideoMediaItem> handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                ArrayList arrayList = null;
                do {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    VideoMediaItem videoMediaItem = new VideoMediaItem();
                    videoMediaItem.mId = cursor.getLong(0);
                    videoMediaItem.mSize = cursor.getLong(1);
                    videoMediaItem.mSha1 = cursor.getString(5);
                    videoMediaItem.mPath = cursor.getString(2);
                    if (TextUtils.isEmpty(videoMediaItem.mPath)) {
                        videoMediaItem.mPath = cursor.getString(3);
                    }
                    if (TextUtils.isEmpty(videoMediaItem.mPath)) {
                        videoMediaItem.mPath = cursor.getString(4);
                    }
                    arrayList.add(videoMediaItem);
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

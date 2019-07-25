package com.miui.gallery.cleaner.slim;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.ThumbnailMetaWriter;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.deleterecorder.DeleteRecord;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;
import com.nexstreaming.nexeditorsdk.nexClip;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.CopyOnWriteArraySet;

public class SlimController {
    public static final int[] TIME_COST_STAGE = {5, 10, 15, 25, 40, 60, nexClip.kClip_Rotate_180, 300};
    private static SlimController instance;
    /* access modifiers changed from: private */
    public long[] mIds;
    /* access modifiers changed from: private */
    public volatile boolean mIsRemainItemsToInit;
    /* access modifiers changed from: private */
    public SpaceSlimObserverHolder mObserverHolder = new SpaceSlimObserverHolder();
    /* access modifiers changed from: private */
    public long mReleaseSize;
    /* access modifiers changed from: private */
    public int mRemainCount;
    /* access modifiers changed from: private */
    public LinkedList<MediaItem> mRemainItems;
    /* access modifiers changed from: private */
    public Object mRemainItemsLock = new Object();
    /* access modifiers changed from: private */
    public SlimWorkerPool mSlimWorkerPool;
    private long mStartTime;

    private static class MediaItem {
        public static final String[] PROJECTION = {"_id", "fileName", "sha1", "exifOrientation", "exifDateTime", "exifGPSDateStamp", "exifGPSTimeStamp", "mixedDateTime", "localFile", "thumbnailFile", "serverType"};
        public String dateTime;
        public String fileName;
        public String gpsDateStamp;
        public String gpsTimeStamp;
        public int id;
        public String localFilePath;
        public long mixDateTime;
        public int orientation;
        public int serverType;
        public String sha1;
        public String thumbnailFilePath;

        private MediaItem() {
        }

        public static MediaItem cursorToEntity(Cursor cursor) {
            MediaItem mediaItem = new MediaItem();
            int i = 0;
            mediaItem.id = cursor.getInt(0);
            mediaItem.fileName = cursor.getString(1);
            mediaItem.sha1 = cursor.getString(2);
            if (!cursor.isNull(3)) {
                i = cursor.getInt(3);
            }
            mediaItem.orientation = i;
            mediaItem.dateTime = cursor.getString(4);
            mediaItem.gpsDateStamp = cursor.getString(5);
            mediaItem.gpsTimeStamp = cursor.getString(6);
            mediaItem.mixDateTime = cursor.getLong(7);
            mediaItem.localFilePath = cursor.getString(8);
            mediaItem.thumbnailFilePath = cursor.getString(9);
            mediaItem.serverType = cursor.getInt(10);
            return mediaItem;
        }
    }

    private interface OnSlimDoneListener {
        void onSlimDone(long j);
    }

    private class SlimWorker extends Thread {
        private volatile boolean mIsCanceled;
        private volatile boolean mIsPaused;
        private OnSlimDoneListener mOnSlimDoneListener;
        private Object mSlimLock;

        private SlimWorker() {
            this.mIsCanceled = false;
            this.mIsPaused = false;
            this.mSlimLock = new Object();
        }

        private MediaItem getNextRemainItem() {
            synchronized (SlimController.this.mRemainItemsLock) {
                if (!MiscUtil.isValid(SlimController.this.mRemainItems)) {
                    return null;
                }
                MediaItem mediaItem = (MediaItem) SlimController.this.mRemainItems.remove(0);
                SlimController.this.mRemainItems.remove(mediaItem);
                return mediaItem;
            }
        }

        private boolean isRemainItemsValid() {
            boolean isValid;
            synchronized (SlimController.this.mRemainItemsLock) {
                isValid = MiscUtil.isValid(SlimController.this.mRemainItems);
            }
            return isValid;
        }

        private void onDone(long j) {
            if (!this.mIsCanceled && this.mOnSlimDoneListener != null) {
                this.mOnSlimDoneListener.onSlimDone(j);
            }
        }

        public void cancel() {
            this.mIsCanceled = true;
        }

        public void doPause() {
            synchronized (this.mSlimLock) {
                if (this.mIsPaused) {
                    try {
                        this.mSlimLock.wait();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        public boolean isCanceled() {
            return this.mIsCanceled;
        }

        public boolean isPaused() {
            return this.mIsPaused;
        }

        public void pauseSlim() {
            this.mIsPaused = true;
            SlimController.this.onSlimPaused();
        }

        public void resumeSlim() {
            this.mIsPaused = false;
            synchronized (this.mSlimLock) {
                this.mSlimLock.notifyAll();
            }
            SlimController.this.onSlimResumed();
        }

        public void run() {
            Process.setThreadPriority(10);
            if (!this.mIsCanceled) {
                if (this.mIsPaused) {
                    doPause();
                }
                if (SlimController.this.mIsRemainItemsToInit) {
                    synchronized (SlimController.this.mRemainItemsLock) {
                        if (SlimController.this.mIsRemainItemsToInit) {
                            SlimController.this.mRemainItems = SlimController.this.queryMediaItem(SlimController.this.mIds);
                            SlimController.this.mIsRemainItemsToInit = false;
                        }
                    }
                }
                long j = 0;
                if (!isRemainItemsValid()) {
                    SlimController.this.onSlimProgress(0);
                    onDone(0);
                    return;
                }
                ArrayList arrayList = new ArrayList();
                while (true) {
                    MediaItem nextRemainItem = getNextRemainItem();
                    if (nextRemainItem == null) {
                        onDone(j);
                        if (MiscUtil.isValid(arrayList)) {
                            DeleteRecorder.record((Collection<DeleteRecord>) arrayList);
                        }
                        return;
                    } else if (!this.mIsCanceled) {
                        if (this.mIsPaused) {
                            doPause();
                        }
                        long currentTimeMillis = System.currentTimeMillis();
                        long access$900 = SlimController.this.handleSlim(nextRemainItem, arrayList);
                        j += System.currentTimeMillis() - currentTimeMillis;
                        synchronized (SlimController.this) {
                            if (!this.mIsCanceled) {
                                SlimController.this.mReleaseSize = SlimController.this.mReleaseSize + access$900;
                                SlimController.this.mRemainCount = SlimController.this.mRemainCount - 1;
                            }
                            SlimController.this.onSlimProgress(nextRemainItem.id);
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        public void setOnSlimDoneListener(OnSlimDoneListener onSlimDoneListener) {
            this.mOnSlimDoneListener = onSlimDoneListener;
        }
    }

    private class SlimWorkerPool {
        private OnSlimDoneListener mOnSlimDoneListener;
        /* access modifiers changed from: private */
        public SlimWorker[] mSlimWorkers;

        private SlimWorkerPool() {
            this.mOnSlimDoneListener = new OnSlimDoneListener() {
                private int mDoneCount = 0;
                private long mTimeCost = 0;

                /* JADX WARNING: Code restructure failed: missing block: B:14:0x0043, code lost:
                    return;
                 */
                public void onSlimDone(long j) {
                    synchronized (SlimWorkerPool.this) {
                        if (SlimWorkerPool.this.mSlimWorkers != null) {
                            if (this.mTimeCost < j) {
                                this.mTimeCost = j;
                            }
                            this.mDoneCount++;
                            if (this.mDoneCount == 4) {
                                SlimWorkerPool.this.stop();
                                HashMap hashMap = new HashMap();
                                hashMap.put("timeCost", GallerySamplingStatHelper.formatValueStage((float) (this.mTimeCost / 1000), SlimController.TIME_COST_STAGE));
                                GallerySamplingStatHelper.recordCountEvent("cleaner", "slim_finish", hashMap);
                            }
                        }
                    }
                }
            };
        }

        public synchronized boolean isPaused() {
            boolean z;
            z = false;
            if (this.mSlimWorkers != null && !this.mSlimWorkers[0].isCanceled() && this.mSlimWorkers[0].isPaused()) {
                z = true;
            }
            return z;
        }

        public synchronized void pause() {
            if (this.mSlimWorkers != null) {
                for (int i = 0; i < 4; i++) {
                    this.mSlimWorkers[i].pauseSlim();
                }
            }
        }

        public synchronized void resume() {
            if (this.mSlimWorkers != null) {
                for (int i = 0; i < 4; i++) {
                    this.mSlimWorkers[i].resumeSlim();
                }
            }
        }

        public synchronized void start() {
            this.mSlimWorkers = new SlimWorker[4];
            for (int i = 0; i < 4; i++) {
                this.mSlimWorkers[i] = new SlimWorker();
                this.mSlimWorkers[i].setOnSlimDoneListener(this.mOnSlimDoneListener);
                this.mSlimWorkers[i].start();
            }
        }

        public synchronized void stop() {
            if (this.mSlimWorkers != null) {
                for (int i = 0; i < 4; i++) {
                    this.mSlimWorkers[i].cancel();
                    this.mSlimWorkers[i] = null;
                }
                this.mSlimWorkers = null;
                SlimController.this.mSlimWorkerPool = null;
            }
        }
    }

    public interface SpaceSlimObserver {
        void onSlimPaused();

        void onSlimProgress(long j, long j2, int i);

        void onSlimResumed();
    }

    private static class SpaceSlimObserverHolder implements SpaceSlimObserver {
        CopyOnWriteArraySet<SpaceSlimObserver> observers;

        private SpaceSlimObserverHolder() {
            this.observers = new CopyOnWriteArraySet<>();
        }

        public void onSlimPaused() {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((SpaceSlimObserver) it.next()).onSlimPaused();
            }
        }

        public void onSlimProgress(long j, long j2, int i) {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((SpaceSlimObserver) it.next()).onSlimProgress(j, j2, i);
            }
        }

        public void onSlimResumed() {
            Iterator it = this.observers.iterator();
            while (it.hasNext()) {
                ((SpaceSlimObserver) it.next()).onSlimResumed();
            }
        }
    }

    private SlimController() {
    }

    private static File buildThumbnail(String str, String str2, String str3, int i, ThumbnailMetaWriter thumbnailMetaWriter) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            Log.w("SlimController", "illegal args: fileName=%s, sha1=%s, localFilePath=%s", str, str2, str3);
            return null;
        }
        File file = new File(str3);
        if (!file.isFile()) {
            Log.w("SlimController", "file not exists: %s", str3);
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(FileUtils.getFileTitle(str));
        sb.append(".");
        sb.append("jpg");
        File file2 = new File(file.getParent(), sb.toString());
        if (file2.isFile()) {
            try {
                UserCommentData userCommentData = ExifUtil.getUserCommentData(file2.getAbsolutePath());
                if (TextUtils.equals(str2, userCommentData != null ? userCommentData.getSha1() : null)) {
                    return file2;
                }
                if (!file2.getName().equalsIgnoreCase(file.getName())) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(FileUtils.getFileTitle(str));
                    sb2.append("_");
                    sb2.append(System.currentTimeMillis());
                    sb2.append(".");
                    sb2.append("jpg");
                    file2 = new File(file.getParent(), sb2.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(".");
        sb3.append(str2);
        String buildBigThumbnailForImage = i == 1 ? CloudUtils.buildBigThumbnailForImage(str3, str2, file.getParent(), sb3.toString(), thumbnailMetaWriter) : null;
        if (TextUtils.isEmpty(buildBigThumbnailForImage)) {
            Log.e("SlimController", "fail to build thumbnail. args: fileName=%s, sha1=%s, localFilePath=%s", str, str2, str3);
            return null;
        }
        File file3 = new File(buildBigThumbnailForImage);
        if (FileUtils.move(file3, file2)) {
            return file2;
        }
        Log.e("SlimController", "fail to rename %s to %s!", file3.getAbsoluteFile(), file2.getAbsoluteFile());
        boolean z = false;
        MediaFileUtils.deleteFileType(FileType.TEMP, file3);
        HashMap hashMap = new HashMap();
        if (!file2.getName().equalsIgnoreCase(file.getName())) {
            z = FileUtils.isFileExist(file2.getAbsolutePath());
        } else if (FileUtils.getSha1(str3) != str2) {
            z = true;
        }
        hashMap.put("move_part", String.valueOf(z));
        GallerySamplingStatHelper.recordErrorEvent("slim", "slim_error", hashMap);
        return null;
    }

    public static synchronized SlimController getInstance() {
        SlimController slimController;
        synchronized (SlimController.class) {
            if (instance == null) {
                instance = new SlimController();
            }
            slimController = instance;
        }
        return slimController;
    }

    /* access modifiers changed from: private */
    public long handleSlim(MediaItem mediaItem, ArrayList<DeleteRecord> arrayList) {
        MediaItem mediaItem2 = mediaItem;
        ArrayList<DeleteRecord> arrayList2 = arrayList;
        if (TextUtils.isEmpty(mediaItem2.localFilePath)) {
            return 0;
        }
        File file = new File(mediaItem2.localFilePath);
        if (!file.exists()) {
            return 0;
        }
        long length = file.length();
        if (TextUtils.equals(ExifUtil.getUserCommentSha1(mediaItem2.thumbnailFilePath), mediaItem2.sha1)) {
            File file2 = new File(mediaItem2.thumbnailFilePath);
            long length2 = file2.length();
            Log.d("SlimController", "thumbnail file already exits %s", (Object) mediaItem2.thumbnailFilePath);
            if (!file2.getName().equalsIgnoreCase(file.getName())) {
                MediaFileUtils.deleteFileType(FileType.ORIGINAL, new File(mediaItem2.localFilePath));
                Log.i("SlimController", "delete localFile: %s", (Object) mediaItem2.localFilePath);
                arrayList2.add(new DeleteRecord(45, mediaItem2.localFilePath, "SlimController"));
            }
            saveToDB(mediaItem2.id, mediaItem2.thumbnailFilePath, null);
            return length - length2;
        } else if (!TextUtils.equals(FileUtils.getSha1(mediaItem2.localFilePath), mediaItem2.sha1)) {
            saveToDB(mediaItem2.id, mediaItem2.thumbnailFilePath, null);
            return 0;
        } else {
            String str = mediaItem2.fileName;
            String str2 = mediaItem2.sha1;
            String str3 = mediaItem2.localFilePath;
            int i = mediaItem2.serverType;
            long j = length;
            File file3 = file;
            ThumbnailMetaWriter thumbnailMetaWriter = r14;
            ThumbnailMetaWriter thumbnailMetaWriter2 = new ThumbnailMetaWriter(mediaItem2.sha1, mediaItem2.fileName, mediaItem2.mixDateTime, mediaItem2.dateTime, mediaItem2.gpsDateStamp, mediaItem2.gpsTimeStamp);
            File buildThumbnail = buildThumbnail(str, str2, str3, i, thumbnailMetaWriter);
            if (buildThumbnail == null) {
                return 0;
            }
            arrayList2.add(new DeleteRecord(45, mediaItem2.localFilePath, "SlimController"));
            if (!buildThumbnail.getName().equalsIgnoreCase(file3.getName())) {
                MediaFileUtils.deleteFileType(FileType.ORIGINAL, file3);
                Log.i("SlimController", "delete localFile: %s", (Object) mediaItem2.localFilePath);
            }
            mediaItem2.thumbnailFilePath = buildThumbnail.getAbsolutePath();
            Log.i("SlimController", "successfully slim %s to %s", mediaItem2.localFilePath, mediaItem2.thumbnailFilePath);
            saveToDB(mediaItem2.id, mediaItem2.thumbnailFilePath, "");
            MediaFileUtils.triggerMediaScan(true, buildThumbnail);
            long length3 = j - buildThumbnail.length();
            long j2 = 0;
            if (length3 <= 0) {
                Log.w("SlimController", "slim size < 0: %s", mediaItem2.localFilePath);
            } else {
                j2 = length3;
            }
            return j2;
        }
    }

    /* access modifiers changed from: private */
    public void onSlimPaused() {
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                SlimController.this.mObserverHolder.onSlimPaused();
            }
        });
    }

    /* access modifiers changed from: private */
    public void onSlimProgress(final int i) {
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                SlimController.this.mObserverHolder.onSlimProgress((long) i, SlimController.this.getReleaseSize(), SlimController.this.getRemainCount());
            }
        });
    }

    /* access modifiers changed from: private */
    public void onSlimResumed() {
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                SlimController.this.mObserverHolder.onSlimResumed();
            }
        });
    }

    /* access modifiers changed from: private */
    public LinkedList<MediaItem> queryMediaItem(long[] jArr) {
        return (LinkedList) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, MediaItem.PROJECTION, String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", MiscUtil.arrayToList(jArr))}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<LinkedList<MediaItem>>() {
            public LinkedList<MediaItem> handle(Cursor cursor) {
                LinkedList<MediaItem> linkedList = new LinkedList<>();
                if (cursor == null || !cursor.moveToFirst()) {
                    return linkedList;
                }
                do {
                    linkedList.add(MediaItem.cursorToEntity(cursor));
                } while (cursor.moveToNext());
                return linkedList;
            }
        });
    }

    private static void saveToDB(int i, String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("thumbnailFile", str);
        contentValues.put("localFile", str2);
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Uri uri = Cloud.CLOUD_URI;
        StringBuilder sb = new StringBuilder();
        sb.append("_id = ");
        sb.append(i);
        SafeDBUtil.safeUpdate(sGetAndroidContext, uri, contentValues, sb.toString(), (String[]) null);
    }

    public synchronized long getReleaseSize() {
        return this.mReleaseSize;
    }

    public synchronized int getRemainCount() {
        return this.mRemainCount;
    }

    public synchronized int getSlimCount() {
        return getTotalCount() - getRemainCount();
    }

    public synchronized long getStartTime() {
        return this.mStartTime;
    }

    public synchronized int getTotalCount() {
        return this.mIds == null ? 0 : this.mIds.length;
    }

    public synchronized boolean isSlimPaused() {
        return this.mSlimWorkerPool != null && this.mSlimWorkerPool.isPaused();
    }

    public synchronized boolean isSlimStarted() {
        return isSlimming() || getReleaseSize() > 0;
    }

    public synchronized boolean isSlimming() {
        return this.mSlimWorkerPool != null;
    }

    public synchronized void pause() {
        if (this.mSlimWorkerPool != null) {
            this.mSlimWorkerPool.pause();
            Log.d("SlimController", "pause slim");
        }
    }

    public void registerObserver(SpaceSlimObserver spaceSlimObserver) {
        this.mObserverHolder.observers.add(spaceSlimObserver);
    }

    public synchronized void resume() {
        if (this.mSlimWorkerPool != null) {
            this.mSlimWorkerPool.resume();
            Log.d("SlimController", "resume slim");
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0038, code lost:
        return;
     */
    public synchronized void start(long[] jArr) {
        stop();
        if (jArr != null) {
            if (jArr.length != 0) {
                Log.d("SlimController", "start slim");
                this.mIds = jArr;
                this.mRemainCount = this.mIds.length;
                synchronized (this.mRemainItemsLock) {
                    this.mIsRemainItemsToInit = true;
                }
                this.mSlimWorkerPool = new SlimWorkerPool();
                this.mSlimWorkerPool.start();
                this.mStartTime = System.currentTimeMillis();
            }
        }
    }

    public synchronized void stop() {
        if (this.mSlimWorkerPool != null) {
            Log.d("SlimController", "stop slim");
            this.mSlimWorkerPool.stop();
        }
        this.mIds = null;
        this.mRemainCount = 0;
        this.mReleaseSize = 0;
        this.mStartTime = 0;
        synchronized (this.mRemainItemsLock) {
            if (this.mRemainItems != null) {
                this.mRemainItems.clear();
            }
            this.mRemainItems = null;
            this.mIsRemainItemsToInit = false;
        }
    }

    public void unregisterObserver(SpaceSlimObserver spaceSlimObserver) {
        this.mObserverHolder.observers.remove(spaceSlimObserver);
    }
}

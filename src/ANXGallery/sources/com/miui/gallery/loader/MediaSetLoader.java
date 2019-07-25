package com.miui.gallery.loader;

import android.app.Activity;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore.Files;
import android.text.TextUtils;
import android.util.StringBuilderPrinter;
import com.miui.gallery.R;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.CursorDataSet;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.model.MediaItem;
import com.miui.gallery.provider.ProcessingMediaManager;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.BurstFilterCursor;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.logger.TimingTracing;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class MediaSetLoader extends CursorSetLoader {
    private static final String[] BUCKET_PROJECTION = {"_data", "bucket_id"};
    private static final String[] PROJECTION = {"_id", "_data", "_size", "mime_type", "latitude", "longitude", "datetaken", "duration", nexExportFormat.TAG_FORMAT_WIDTH, nexExportFormat.TAG_FORMAT_HEIGHT, "orientation"};
    /* access modifiers changed from: private */
    public static final List<Long> sMarkDeletedIds = new LinkedList();
    private String[] mBucketIds;
    /* access modifiers changed from: private */
    public boolean mFromCamera;
    private long mInitId;
    private int mInitPos = -1;
    /* access modifiers changed from: private */
    public boolean mIsFromScreenshot;
    private boolean mIsInternal;
    private ArrayList<Uri> mLimitUris;
    private List<Long> mProcessingIds;
    private Uri mUri;

    private class MediaDataSet extends CursorDataSet {
        public MediaDataSet(Cursor cursor) {
            super(cursor);
        }

        private boolean isFromCamera() {
            return MediaSetLoader.this.mFromCamera;
        }

        private boolean isFromScreenshot() {
            return MediaSetLoader.this.mIsFromScreenshot;
        }

        public static /* synthetic */ void lambda$markDelete$38(MediaDataSet mediaDataSet, String[] strArr, Long[] lArr, boolean z) {
            TimingTracing.beginTracing("MediaSetLoader_delete", "delete");
            int deleteFileType = MediaFileUtils.deleteFileType(FileType.NONE, strArr);
            StringBuilder sb = new StringBuilder();
            sb.append("file delete ");
            sb.append(deleteFileType);
            TimingTracing.addSplit("MediaSetLoader_delete", sb.toString());
            int safeDelete = SafeDBUtil.safeDelete(MediaSetLoader.this.getContext(), MediaSetLoader.this.getUri(), String.format("_id in (%s)", new Object[]{TextUtils.join(",", lArr)}), null);
            StringBuilder sb2 = new StringBuilder();
            sb2.append("provider delete ");
            sb2.append(safeDelete);
            TimingTracing.addSplit("MediaSetLoader_delete", sb2.toString());
            MediaAndAlbumOperations.deleteInService(MediaSetLoader.this.getContext(), z ^ true ? 1 : 0, 30, strArr);
            synchronized (MediaSetLoader.sMarkDeletedIds) {
                MediaSetLoader.sMarkDeletedIds.removeAll(Arrays.asList(lArr));
            }
            StringBuilder sb3 = new StringBuilder();
            long stopTracing = TimingTracing.stopTracing("MediaSetLoader_delete", new StringBuilderPrinter(sb3));
            Log.w("MediaSetLoader", "delete : %s", sb3.toString());
            if (stopTracing > 500) {
                HashMap hashMap = new HashMap();
                hashMap.put("cost", String.valueOf(stopTracing));
                hashMap.put("detail", sb3.toString());
                GallerySamplingStatHelper.recordErrorEvent("delete_performance", "MediaSetLoader", hashMap);
            }
        }

        private void markDelete(List<BaseDataItem> list, boolean z) {
            Long[] lArr = new Long[list.size()];
            String[] strArr = new String[list.size()];
            for (int i = 0; i < list.size(); i++) {
                BaseDataItem baseDataItem = (BaseDataItem) list.get(i);
                lArr[i] = Long.valueOf(baseDataItem.getKey());
                strArr[i] = baseDataItem.getOriginalPath();
            }
            synchronized (MediaSetLoader.sMarkDeletedIds) {
                MediaSetLoader.sMarkDeletedIds.addAll(Arrays.asList(lArr));
            }
            ThreadManager.getWorkHandler().post(new Runnable(strArr, lArr, z) {
                private final /* synthetic */ String[] f$1;
                private final /* synthetic */ Long[] f$2;
                private final /* synthetic */ boolean f$3;

                {
                    this.f$1 = r2;
                    this.f$2 = r3;
                    this.f$3 = r4;
                }

                public final void run() {
                    MediaDataSet.lambda$markDelete$38(MediaDataSet.this, this.f$1, this.f$2, this.f$3);
                }
            });
        }

        private void wrapItemByCursor(BaseDataItem baseDataItem, Cursor cursor) {
            String string = cursor.getString(1);
            baseDataItem.setKey(cursor.getLong(0)).setFilePath(string).setThumbPath(string).setTitle(FileUtils.getFileTitle(FileUtils.getFileName(string))).setSize(cursor.getLong(2)).setMimeType(cursor.getString(3)).setLatitude((double) cursor.getFloat(4)).setLongitude((double) cursor.getFloat(5)).setCreateTime(cursor.getLong(6)).setDuration(cursor.getInt(7) / 1000).setWidth(cursor.getInt(8)).setHeight(cursor.getInt(9)).setOrientation(cursor.getInt(10));
        }

        public boolean addToAlbum(Activity activity, int i, boolean z, boolean z2, OnAddAlbumListener onAddAlbumListener) {
            BaseDataItem item = getItem(null, i);
            if (item != null && !TextUtils.isEmpty(item.getOriginalPath())) {
                ArrayList arrayList = new ArrayList(1);
                if (!item.isBurstItem() || item.getBurstGroup() == null) {
                    arrayList.add(Uri.fromFile(new File(item.getOriginalPath())));
                } else {
                    List burstGroup = item.getBurstGroup();
                    for (int i2 = 0; i2 < burstGroup.size(); i2++) {
                        arrayList.add(Uri.fromFile(new File(((BaseDataItem) burstGroup.get(i2)).getOriginalPath())));
                    }
                }
                MediaAndAlbumOperations.addToAlbum(activity, onAddAlbumListener, arrayList, isFromCamera(), z2, item.isVideo());
            }
            return true;
        }

        public boolean addToFavorites(Activity activity, int i, OnCompleteListener onCompleteListener) {
            BaseDataItem item = getItem(null, i);
            if (item != null && !TextUtils.isEmpty(item.getOriginalPath())) {
                if (!item.isBurstItem() || item.getBurstGroup() == null) {
                    MediaAndAlbumOperations.addToFavoritesByPath(activity, onCompleteListener, item.getOriginalPath());
                } else {
                    List burstGroup = item.getBurstGroup();
                    String[] strArr = new String[burstGroup.size()];
                    for (int i2 = 0; i2 < strArr.length; i2++) {
                        strArr[i2] = ((BaseDataItem) burstGroup.get(i2)).getOriginalPath();
                    }
                    MediaAndAlbumOperations.addToFavoritesByPath(activity, onCompleteListener, strArr);
                }
            }
            return true;
        }

        /* access modifiers changed from: protected */
        public void bindItem(BaseDataItem baseDataItem, int i) {
            if (isValidate(i)) {
                this.mCursor.moveToPosition(i);
                wrapItemByCursor(baseDataItem, this.mCursor);
                if (foldBurst()) {
                    BurstFilterCursor burstFilterCursor = (BurstFilterCursor) this.mCursor;
                    if (burstFilterCursor.isBurstPosition(i)) {
                        ArrayList arrayList = new ArrayList();
                        int contentCursorPosition = burstFilterCursor.getContentCursorPosition(i);
                        int burstCount = (burstFilterCursor.getBurstCount(i) + contentCursorPosition) - 1;
                        while (contentCursorPosition <= burstCount) {
                            Cursor contentCursorAtPosition = burstFilterCursor.getContentCursorAtPosition(contentCursorPosition);
                            BaseDataItem baseDataItem2 = new BaseDataItem();
                            wrapItemByCursor(baseDataItem2, contentCursorAtPosition);
                            arrayList.add(baseDataItem2);
                            contentCursorPosition++;
                        }
                        baseDataItem.setBurstItem(true);
                        baseDataItem.setBurstGroup(arrayList);
                        baseDataItem.setSpecialTypeFlags(64);
                    }
                }
            }
        }

        /* access modifiers changed from: protected */
        public int burstKeyIndex() {
            return 1;
        }

        /* access modifiers changed from: protected */
        public BaseDataItem createItem(int i) {
            MediaItem mediaItem = new MediaItem();
            bindItem(mediaItem, i);
            return mediaItem;
        }

        /* access modifiers changed from: protected */
        public int doDelete(BaseDataItem baseDataItem) {
            int i;
            boolean z = false;
            if (baseDataItem == null) {
                i = 0;
            } else if (DocumentProviderUtils.needRequestExternalSDCardPermission(MediaSetLoader.this.getContext())) {
                return -112;
            } else {
                LinkedList linkedList = new LinkedList();
                if (!baseDataItem.isBurstItem() || baseDataItem.getBurstGroup().size() <= 0) {
                    linkedList.add(baseDataItem);
                } else {
                    linkedList.addAll(baseDataItem.getBurstGroup());
                }
                i = linkedList.size();
                if (isFromCamera() || isFromScreenshot()) {
                    z = true;
                }
                markDelete(linkedList, z);
            }
            return i;
        }

        /* access modifiers changed from: protected */
        public boolean foldBurst() {
            return true;
        }

        /* access modifiers changed from: protected */
        public String getDeleteDialogMessage(BaseDataItem baseDataItem, Context context) {
            if ((!isFromCamera() && !isFromScreenshot()) || !SyncUtil.existXiaomiAccount(MediaSetLoader.this.getContext())) {
                return super.getDeleteDialogMessage(baseDataItem, context);
            }
            if (baseDataItem.isBurstItem()) {
                int size = baseDataItem.getBurstGroup() == null ? 0 : baseDataItem.getBurstGroup().size();
                return context.getResources().getQuantityString(R.plurals.delete_burst_photo_from_all_devices_and_cloud_msg, size, new Object[]{Integer.valueOf(size)});
            }
            return context.getResources().getQuantityString(FileMimeUtil.isVideoFromMimeType(baseDataItem.getMimeType()) ? R.plurals.delete_video_from_all_devices_and_cloud_msg : R.plurals.delete_photo_from_all_devices_and_cloud_msg, 1, new Object[]{Integer.valueOf(1)});
        }

        public long getItemKey(int i) {
            if (!isValidate(i)) {
                return -1;
            }
            this.mCursor.moveToPosition(i);
            return this.mCursor.getLong(0);
        }

        /* access modifiers changed from: protected */
        public String getItemPath(int i) {
            if (!isValidate(i)) {
                return null;
            }
            this.mCursor.moveToPosition(i);
            return this.mCursor.getString(1);
        }

        public boolean removeFromFavorites(Activity activity, int i, OnCompleteListener onCompleteListener) {
            BaseDataItem item = getItem(null, i);
            if (item != null && !TextUtils.isEmpty(item.getOriginalPath())) {
                if (!item.isBurstItem() || item.getBurstGroup() == null) {
                    MediaAndAlbumOperations.removeFromFavoritesByPath(activity, onCompleteListener, item.getOriginalPath());
                } else {
                    List burstGroup = item.getBurstGroup();
                    String[] strArr = new String[burstGroup.size()];
                    for (int i2 = 0; i2 < strArr.length; i2++) {
                        strArr[i2] = ((BaseDataItem) burstGroup.get(i2)).getOriginalPath();
                    }
                    MediaAndAlbumOperations.removeFromFavoritesByPath(activity, onCompleteListener, strArr);
                }
            }
            return true;
        }
    }

    public MediaSetLoader(Context context, Uri uri, Bundle bundle, boolean z) {
        super(context);
        this.mIsInternal = z;
        this.mUri = uri;
        this.mFromCamera = bundle.getBoolean("from_MiuiCamera", false);
        this.mIsFromScreenshot = bundle.getBoolean("from_MiuiScreenShot", false);
        this.mLimitUris = bundle.getParcelableArrayList("SecureUri");
        if (bundle.getBoolean("com.miui.gallery.extra.preview_single_item", false)) {
            this.mLimitUris = new ArrayList<>(1);
            this.mLimitUris.add(uri);
        }
        ImageLoadParams imageLoadParams = (ImageLoadParams) bundle.getParcelable("photo_transition_data");
        if (imageLoadParams != null) {
            this.mInitId = imageLoadParams.getKey();
        }
    }

    /* access modifiers changed from: private */
    public String[] genAllBucketIds(String str, String str2) {
        if (!TextUtils.isEmpty(str)) {
            String parentFolderPath = FileUtils.getParentFolderPath(str);
            if (needLoadAllBucket(parentFolderPath)) {
                String[] pathsInExternalStorage = StorageUtils.getPathsInExternalStorage(getContext(), StorageUtils.getRelativePath(getContext(), parentFolderPath));
                if (parentFolderPath == null) {
                    return null;
                }
                String[] strArr = new String[pathsInExternalStorage.length];
                for (int i = 0; i < pathsInExternalStorage.length; i++) {
                    strArr[i] = String.valueOf(FileUtils.getBucketID(pathsInExternalStorage[i]));
                }
                return strArr;
            }
        }
        if (TextUtils.isEmpty(str2)) {
            return null;
        }
        return new String[]{str2};
    }

    private boolean isLimitedUris() {
        return MiscUtil.isValid(this.mLimitUris);
    }

    private boolean needLoadAllBucket(String str) {
        return "DCIM/Camera".equalsIgnoreCase(StorageUtils.getRelativePath(getContext(), str));
    }

    /* access modifiers changed from: protected */
    public String getOrder() {
        return "datetaken DESC, _id DESC";
    }

    /* access modifiers changed from: protected */
    public String[] getProjection() {
        return PROJECTION;
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        String str;
        if (isLimitedUris()) {
            ArrayList arrayList = new ArrayList(this.mLimitUris.size());
            Iterator it = this.mLimitUris.iterator();
            while (it.hasNext()) {
                Uri uri = (Uri) it.next();
                if (uri != null) {
                    long parseId = ContentUris.parseId(uri);
                    synchronized (sMarkDeletedIds) {
                        if (!sMarkDeletedIds.contains(Long.valueOf(parseId))) {
                            arrayList.add(Long.valueOf(parseId));
                        } else {
                            Log.d("MediaSetLoader", "filter mark deleted id %d", (Object) Long.valueOf(parseId));
                        }
                    }
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("_id in (");
            sb.append(TextUtils.join(",", arrayList));
            sb.append(")");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("bucket_id in (");
        sb2.append(TextUtils.join(",", this.mBucketIds));
        sb2.append(")");
        sb2.append(" AND (");
        sb2.append("media_type");
        sb2.append(" in (");
        sb2.append(1);
        sb2.append(",");
        sb2.append(3);
        sb2.append(")");
        if (MiscUtil.isValid(this.mProcessingIds)) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(" OR _id in (");
            sb3.append(TextUtils.join(",", this.mProcessingIds));
            sb3.append(")");
            str = sb3.toString();
        } else {
            str = "";
        }
        sb2.append(str);
        sb2.append(")");
        String sb4 = sb2.toString();
        String str2 = null;
        synchronized (sMarkDeletedIds) {
            if (sMarkDeletedIds.size() > 0) {
                str2 = TextUtils.join(",", sMarkDeletedIds);
            }
        }
        if (TextUtils.isEmpty(str2)) {
            return sb4;
        }
        Log.d("MediaSetLoader", "filter mark deleted ids %s", (Object) str2);
        StringBuilder sb5 = new StringBuilder();
        sb5.append("_id not in (");
        sb5.append(str2);
        sb5.append(")");
        return String.format(Locale.US, "(%s) AND (%s)", new Object[]{sb4, sb5.toString()});
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    public String getTAG() {
        return "MediaSetLoader";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Files.getContentUri(this.mIsInternal ? "internal" : "external");
    }

    public CursorDataSet loadInBackground() {
        String str = isLimitedUris() ? "MediaSetLoader_limited_load" : "MediaSetLoader_load";
        TimingTracing.beginTracing(str, "loadInBackground");
        try {
            long parseId = this.mInitId > 0 ? this.mInitId : ContentUris.parseId(this.mUri);
            if (isLimitedUris()) {
                CursorDataSet loadInBackground = super.loadInBackground();
                if (loadInBackground != null) {
                    if (this.mInitPos == -1) {
                        BaseDataItem baseDataItem = new BaseDataItem();
                        baseDataItem.setKey(parseId);
                        this.mInitPos = loadInBackground.getIndexOfItem(baseDataItem, -1);
                    }
                    loadInBackground.setInitPosition(this.mInitPos);
                    long stopTracing = TimingTracing.stopTracing(str, null);
                    if (stopTracing > 500) {
                        HashMap hashMap = new HashMap();
                        StringBuilder sb = new StringBuilder();
                        sb.append(isLimitedUris());
                        sb.append("_");
                        sb.append(stopTracing);
                        hashMap.put("cost", sb.toString());
                        GallerySamplingStatHelper.recordErrorEvent("load_performance", "MediaSetLoader", hashMap);
                    }
                    return loadInBackground;
                }
            } else {
                if (this.mBucketIds == null) {
                    this.mBucketIds = (String[]) SafeDBUtil.safeQuery(getContext(), Files.getContentUri(this.mIsInternal ? "internal" : "external"), BUCKET_PROJECTION, "_id=?", new String[]{String.valueOf(parseId)}, (String) null, (QueryHandler<T>) new QueryHandler<String[]>() {
                        public String[] handle(Cursor cursor) {
                            if (cursor == null || !cursor.moveToFirst()) {
                                return null;
                            }
                            return MediaSetLoader.this.genAllBucketIds(cursor.getString(0), cursor.getString(1));
                        }
                    });
                }
                if (this.mBucketIds != null) {
                    this.mProcessingIds = ProcessingMediaManager.queryProcessingMediaIds();
                    CursorDataSet loadInBackground2 = super.loadInBackground();
                    if (loadInBackground2 != null) {
                        if (this.mInitPos == -1) {
                            BaseDataItem baseDataItem2 = new BaseDataItem();
                            baseDataItem2.setKey(parseId);
                            this.mInitPos = loadInBackground2.getIndexOfItem(baseDataItem2, -1);
                        }
                        loadInBackground2.setInitPosition(this.mInitPos);
                        long stopTracing2 = TimingTracing.stopTracing(str, null);
                        if (stopTracing2 > 500) {
                            HashMap hashMap2 = new HashMap();
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(isLimitedUris());
                            sb2.append("_");
                            sb2.append(stopTracing2);
                            hashMap2.put("cost", sb2.toString());
                            GallerySamplingStatHelper.recordErrorEvent("load_performance", "MediaSetLoader", hashMap2);
                        }
                        return loadInBackground2;
                    }
                }
            }
            long stopTracing3 = TimingTracing.stopTracing(str, null);
            if (stopTracing3 > 500) {
                HashMap hashMap3 = new HashMap();
                StringBuilder sb3 = new StringBuilder();
                sb3.append(isLimitedUris());
                sb3.append("_");
                sb3.append(stopTracing3);
                hashMap3.put("cost", sb3.toString());
                GallerySamplingStatHelper.recordErrorEvent("load_performance", "MediaSetLoader", hashMap3);
            }
            return null;
        } catch (Throwable th) {
            long stopTracing4 = TimingTracing.stopTracing(str, null);
            if (stopTracing4 > 500) {
                HashMap hashMap4 = new HashMap();
                StringBuilder sb4 = new StringBuilder();
                sb4.append(isLimitedUris());
                sb4.append("_");
                sb4.append(stopTracing4);
                hashMap4.put("cost", sb4.toString());
                GallerySamplingStatHelper.recordErrorEvent("load_performance", "MediaSetLoader", hashMap4);
            }
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public CursorDataSet wrapDataSet(Cursor cursor) {
        return new MediaDataSet(cursor);
    }
}

package com.miui.gallery.scanner;

import android.content.Context;
import android.net.Uri;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;

public class CloudMediaBulkDeleter extends MediaBulkDeleter {
    private boolean mIsNormal = true;

    public CloudMediaBulkDeleter(Uri uri, String str) {
        super(uri, str);
    }

    private void recordMainSDCardUnwritable() {
        Log.e("CloudMediaBulkDeleter", "Main SDCard is unwritable, skip cleanup");
        GallerySamplingStatHelper.recordErrorEvent("media_scanner", "main_sdcard_unwritable", GallerySamplingStatHelper.generatorCommonParams());
    }

    private void recordStorageUnmounted() {
        Log.e("CloudMediaBulkDeleter", "No external storage mounted, skip cleanup");
        GallerySamplingStatHelper.recordErrorEvent("media_scanner", "no_external_storage_mounted", GallerySamplingStatHelper.generatorCommonParams());
    }

    public boolean deleteForResult(Context context, long j) {
        super.delete(context, j);
        return this.mIsNormal;
    }

    public void flush(Context context) {
        boolean isValid = MiscUtil.isValid(StorageUtils.getMountedVolumePaths(context));
        boolean isPrimaryStorageWritable = StorageUtils.isPrimaryStorageWritable(context);
        if (!isValid || !isPrimaryStorageWritable) {
            this.mIsNormal = false;
            if (!isValid) {
                recordStorageUnmounted();
            }
            if (!isPrimaryStorageWritable) {
                recordMainSDCardUnwritable();
                return;
            }
            return;
        }
        super.flush(context);
    }

    public boolean flushForResult(Context context) {
        flush(context);
        return this.mIsNormal;
    }
}

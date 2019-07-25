package com.miui.gallery.adapter;

import android.content.Context;
import android.net.Uri;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;

public abstract class BaseGalleryAdapter<M, VH extends BaseViewHolder> extends BaseRecyclerAdapter<M, VH> {
    private static String sMainMicroFolder = StorageUtils.getPriorMicroThumbnailDirectory();
    protected Context mContext;
    protected DisplayImageOptions mDefaultDisplayImageOptions;
    protected Builder mDisplayImageOptionBuilder;

    public BaseGalleryAdapter(Context context) {
        this.mContext = context;
        initDisplayImageOptions();
    }

    protected static Uri getDownloadUri(int i, long j) {
        if (i == 0) {
            return getDownloadUri(j);
        }
        return null;
    }

    protected static Uri getDownloadUri(long j) {
        return CloudUriAdapter.getDownloadUri(j);
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptions(int i) {
        long fileLength = getFileLength(i);
        return fileLength > 0 ? this.mDisplayImageOptionBuilder.considerFileLength(true).fileLength(fileLength).build() : this.mDefaultDisplayImageOptions;
    }

    public Uri getDownloadUri(int i) {
        return null;
    }

    public long getFileLength(int i) {
        return 0;
    }

    public String getLocalPath(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        this.mDisplayImageOptionBuilder = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }
}

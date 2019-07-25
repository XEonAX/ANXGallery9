package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import android.widget.CursorAdapter;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;

public abstract class BaseAdapter extends CursorAdapter {
    private static String sMainMicroFolder = StorageUtils.getPriorMicroThumbnailDirectory();
    protected Context mContext;
    protected DisplayImageOptions mDefaultDisplayImageOptions;
    protected Builder mDisplayImageOptionBuilder;

    public BaseAdapter(Context context) {
        super(context, null, false);
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

    protected static Uri getDownloadUri(Cursor cursor, int i) {
        return getDownloadUri(cursor.getLong(i));
    }

    public static Uri getDownloadUri(Cursor cursor, int i, int i2) {
        return getDownloadUri(cursor.getInt(i), cursor.getLong(i2));
    }

    public static String getMicroPath(Cursor cursor, int i, int i2) {
        String string = cursor.getString(i);
        return (!TextUtils.isEmpty(string) || i2 < 0) ? string : FileUtils.concat(sMainMicroFolder, CloudUtils.getThumbnailNameBySha1(cursor.getString(i2)));
    }

    private boolean isValidPosition(int i) {
        return i >= 0 && i < getCount();
    }

    public String getClearThumbFilePath(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Cursor getCursorByPosition(int i) {
        if (isValidPosition(i)) {
            return (Cursor) getItem(i);
        }
        throw new IllegalArgumentException(String.format("Wrong cursor position %d, total count %d", new Object[]{Integer.valueOf(i), Integer.valueOf(getCount())}));
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptions(int i) {
        long fileLength = getFileLength(i);
        return fileLength > 0 ? this.mDisplayImageOptionBuilder.considerFileLength(true).fileLength(fileLength).build() : this.mDefaultDisplayImageOptions;
    }

    /* access modifiers changed from: protected */
    public ImageSize getDisplayImageSize(int i) {
        return ThumbConfig.get().sMicroTargetSize;
    }

    /* access modifiers changed from: protected */
    public ViewScaleType getDisplayScaleType(int i) {
        return ViewScaleType.CROP;
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

    public String getMicroThumbFilePath(int i) {
        return null;
    }

    public String getOriginFilePath(int i) {
        return null;
    }

    public String getThumbFilePath(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        this.mDisplayImageOptionBuilder = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }

    public boolean isFavorite(int i) {
        return false;
    }
}

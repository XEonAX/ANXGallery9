package com.miui.gallery.util;

import com.miui.gallery3d.exif.ExifInterface;

/* compiled from: ExifUtil */
class ExifInterfaceWrapper {
    private ExifInterface mExifI;
    private android.media.ExifInterface mMediaExif;
    private android.support.media.ExifInterface mSupportExifI;

    public ExifInterfaceWrapper(android.media.ExifInterface exifInterface) {
        this.mMediaExif = exifInterface;
    }

    public ExifInterfaceWrapper(android.support.media.ExifInterface exifInterface) {
        this.mSupportExifI = exifInterface;
    }

    public ExifInterfaceWrapper(ExifInterface exifInterface) {
        this.mExifI = exifInterface;
    }

    public String getUserComment() {
        if (this.mExifI != null) {
            return this.mExifI.getUserCommentAsASCII();
        }
        if (this.mSupportExifI != null) {
            return this.mSupportExifI.getAttribute("UserComment");
        }
        if (this.mMediaExif != null) {
            return this.mMediaExif.getAttribute("UserComment");
        }
        return null;
    }

    public void setUserComment(String str) {
        if (this.mExifI != null) {
            this.mExifI.addUserComment(str);
        }
        if (this.mSupportExifI != null) {
            this.mSupportExifI.setAttribute("UserComment", str);
        }
        if (this.mMediaExif != null) {
            this.mMediaExif.setAttribute("UserComment", str);
        }
    }
}

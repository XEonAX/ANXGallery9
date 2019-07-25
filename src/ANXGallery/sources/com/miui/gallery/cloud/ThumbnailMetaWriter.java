package com.miui.gallery.cloud;

import android.media.ExifInterface;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryTimeUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.Date;
import java.util.HashMap;

public class ThumbnailMetaWriter {
    private final String mDateTime;
    private final String mGPSDateStamp;
    private final String mGPSTimeStamp;
    private final long mMixDateTime;
    private final String mOriginalFileName;
    private final String mSha1;

    public ThumbnailMetaWriter(DBImage dBImage) {
        this(dBImage, dBImage.getSha1(), dBImage.getFileName());
    }

    public ThumbnailMetaWriter(DBImage dBImage, String str, String str2) {
        this.mSha1 = str;
        this.mOriginalFileName = str2;
        this.mMixDateTime = dBImage.getMixedDateTime();
        this.mDateTime = dBImage.getJsonExifString("dateTime");
        this.mGPSDateStamp = dBImage.getJsonExifString("GPSDateStamp");
        this.mGPSTimeStamp = dBImage.getJsonExifString("GPSTimeStamp");
    }

    public ThumbnailMetaWriter(String str, String str2, long j, String str3, String str4, String str5) {
        this.mSha1 = str;
        this.mOriginalFileName = str2;
        this.mMixDateTime = j;
        this.mDateTime = str3;
        this.mGPSDateStamp = str4;
        this.mGPSTimeStamp = str5;
    }

    /* JADX WARNING: Removed duplicated region for block: B:60:0x0116  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x012f  */
    public boolean write(String str) {
        ParcelFileDescriptor parcelFileDescriptor;
        String str2;
        ExifInterface exifInterface;
        long j;
        Exception e = null;
        try {
            if (DocumentProviderUtils.needUseDocumentProvider(str)) {
                parcelFileDescriptor = DocumentProviderUtils.openFileDescriptor(GalleryApp.sGetAndroidContext(), str);
                if (parcelFileDescriptor == null) {
                    try {
                        Log.w("ThumbnailMetaWriter", "Failed to open file descriptor  of %s", str);
                        MiscUtil.closeSilently(parcelFileDescriptor);
                        return false;
                    } catch (Exception e2) {
                        e = e2;
                    }
                } else {
                    exifInterface = (ExifInterface) ExifUtil.sMediaExifCreator.create(parcelFileDescriptor.getFileDescriptor());
                }
            } else {
                exifInterface = (ExifInterface) ExifUtil.sMediaExifCreator.create(str);
                parcelFileDescriptor = null;
            }
            ExifUtil.setUserCommentData(exifInterface, new UserCommentData(this.mSha1, FileUtils.getExtension(this.mOriginalFileName)));
            if (TextUtils.isEmpty(this.mGPSDateStamp) || TextUtils.isEmpty(this.mGPSTimeStamp)) {
                j = -1;
            } else {
                exifInterface.setAttribute("GPSDateStamp", this.mGPSDateStamp);
                exifInterface.setAttribute("GPSTimeStamp", this.mGPSTimeStamp);
                j = GalleryTimeUtils.getGpsDateTime(this.mGPSDateStamp, this.mGPSTimeStamp);
            }
            if (!TextUtils.isEmpty(this.mDateTime)) {
                ExifUtil.setDateTime(exifInterface, this.mDateTime);
                if (j < 0) {
                    j = GalleryTimeUtils.getDateTime(this.mDateTime);
                }
            }
            if (TextUtils.isEmpty(this.mDateTime) || (ExifUtil.getDateTime(exifInterface) == -1 && this.mMixDateTime >= 0)) {
                ExifUtil.setDateTime(exifInterface, GalleryTimeUtils.getDefaultDateFormat().format(new Date(this.mMixDateTime)));
                if (j < 0) {
                    j = this.mMixDateTime;
                }
            }
            exifInterface.saveAttributes();
            String userCommentSha1 = ExifUtil.getUserCommentSha1(str);
            if ((TextUtils.isEmpty(userCommentSha1) && TextUtils.isEmpty(this.mSha1)) || TextUtils.equals(userCommentSha1, this.mSha1)) {
                if (j >= 0 && !FileUtils.setLastModified(str, j)) {
                    Log.w("ThumbnailMetaWriter", "failed to set last modified for thumbnail");
                }
                MiscUtil.closeSilently(parcelFileDescriptor);
                return true;
            }
        } catch (Exception e3) {
            Exception exc = e3;
            parcelFileDescriptor = null;
            e = exc;
            try {
                Log.e("ThumbnailMetaWriter", (Throwable) e);
                MiscUtil.closeSilently(parcelFileDescriptor);
                HashMap hashMap = new HashMap();
                hashMap.put("model", Build.MODEL);
                hashMap.put("version", VERSION.INCREMENTAL);
                hashMap.put(nexExportFormat.TAG_FORMAT_PATH, str);
                String str3 = "exception";
                if (e == null) {
                }
                hashMap.put(str3, str2);
                GallerySamplingStatHelper.recordCountEvent("exif_parser", "exif_write_error", hashMap);
                return false;
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(parcelFileDescriptor);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            parcelFileDescriptor = null;
            MiscUtil.closeSilently(parcelFileDescriptor);
            throw th;
        }
        MiscUtil.closeSilently(parcelFileDescriptor);
        HashMap hashMap2 = new HashMap();
        hashMap2.put("model", Build.MODEL);
        hashMap2.put("version", VERSION.INCREMENTAL);
        hashMap2.put(nexExportFormat.TAG_FORMAT_PATH, str);
        String str32 = "exception";
        if (e == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(e.toString());
            sb.append(" ");
            sb.append(str);
            str2 = sb.toString();
        } else {
            str2 = "";
        }
        hashMap2.put(str32, str2);
        GallerySamplingStatHelper.recordCountEvent("exif_parser", "exif_write_error", hashMap2);
        return false;
    }
}

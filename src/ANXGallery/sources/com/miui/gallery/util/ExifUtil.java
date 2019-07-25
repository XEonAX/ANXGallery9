package com.miui.gallery.util;

import android.annotation.TargetApi;
import android.graphics.RectF;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.text.TextUtils;
import com.miui.gallery.stat.BaseSamplingStatHelper;
import com.miui.gallery3d.exif.ExifInterface;
import com.miui.gallery3d.exif.ExifInvalidFormatException;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class ExifUtil {
    public static final ExifCreator<ExifInterface> sGallery3DExifCreator = new ExifCreator<ExifInterface>() {
        public ExifInterface create(FileDescriptor fileDescriptor) {
            Log.d("ExifUtil", "Not support create com.miui.gallery3d.exif.ExifInterface from fileDescriptor");
            return null;
        }

        public ExifInterface create(InputStream inputStream) {
            if (inputStream == null) {
                return null;
            }
            try {
                ExifInterface exifInterface = new ExifInterface();
                exifInterface.readExif(inputStream);
                return exifInterface;
            } catch (ExifInvalidFormatException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", inputStream, e);
                return null;
            } catch (IOException e2) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", inputStream, e2);
                return null;
            }
        }

        public ExifInterface create(String str) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            try {
                ExifInterface exifInterface = new ExifInterface();
                exifInterface.readExif(str);
                return exifInterface;
            } catch (ExifInvalidFormatException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", str, e);
                return null;
            } catch (IOException e2) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", str, e2);
                return null;
            }
        }
    };
    public static final ExifCreator<android.media.ExifInterface> sMediaExifCreator = new ExifCreator<android.media.ExifInterface>() {
        @TargetApi(24)
        public android.media.ExifInterface create(FileDescriptor fileDescriptor) {
            if (fileDescriptor == null) {
                return null;
            }
            try {
                return new android.media.ExifInterface(fileDescriptor);
            } catch (IOException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", fileDescriptor, e);
                return null;
            }
        }

        @TargetApi(24)
        public android.media.ExifInterface create(InputStream inputStream) {
            if (inputStream == null) {
                return null;
            }
            try {
                return new android.media.ExifInterface(inputStream);
            } catch (IOException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", inputStream, e);
                return null;
            }
        }

        public android.media.ExifInterface create(String str) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            try {
                return new android.media.ExifInterface(str);
            } catch (IOException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", str, e);
                return null;
            }
        }
    };
    public static final ExifCreator<android.support.media.ExifInterface> sSupportExifCreator = new ExifCreator<android.support.media.ExifInterface>() {
        public android.support.media.ExifInterface create(FileDescriptor fileDescriptor) {
            Log.d("ExifUtil", "Not support create android.support.media.ExifInterface from fileDescriptor");
            return null;
        }

        public android.support.media.ExifInterface create(InputStream inputStream) {
            if (inputStream == null) {
                return null;
            }
            try {
                return new android.support.media.ExifInterface(inputStream);
            } catch (IOException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", inputStream, e);
                return null;
            }
        }

        public android.support.media.ExifInterface create(String str) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            try {
                return new android.support.media.ExifInterface(str);
            } catch (IOException e) {
                Log.e("ExifUtil", "failed to create exif interface from %s, %s", str, e);
                return null;
            }
        }
    };

    public interface ExifCreator<T> {
        T create(FileDescriptor fileDescriptor);

        T create(InputStream inputStream);

        T create(String str);
    }

    public static class ExifInfo {
        public final int exifOrientation;
        public final boolean flip;
        public final int rotation;

        public ExifInfo(int i, int i2, boolean z) {
            this.exifOrientation = i;
            this.rotation = i2;
            this.flip = z;
        }
    }

    public static final class UserCommentData {
        private String mExt;
        private String mSha1;

        public UserCommentData(String str, String str2) {
            this.mSha1 = str;
            this.mExt = str2;
        }

        public String getExt() {
            return this.mExt;
        }

        public String getFileName(String str) {
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(getExt())) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(".");
            sb.append(getExt());
            return sb.toString();
        }

        public String getSha1() {
            return this.mSha1;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0021, code lost:
        r0 = (((float) r6) - r7.top) - r7.height();
        r1 = r7.left;
        r2 = r7.height();
        r3 = r7.width();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0035, code lost:
        r5 = r6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0038, code lost:
        r0 = r7.top;
        r1 = (((float) r5) - r7.left) - r7.width();
        r2 = r7.height();
        r3 = r7.width();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x004e, code lost:
        r0 = (((float) r5) - r7.left) - r7.width();
        r1 = (((float) r6) - r7.top) - r7.height();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0064, code lost:
        if (r9 == false) goto L_0x006a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0066, code lost:
        r0 = (((float) r5) - r0) - r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0071, code lost:
        return new android.graphics.RectF(r0, r1, r2 + r0, r3 + r1);
     */
    public static RectF adjustRectOrientation(int i, int i2, RectF rectF, int i3, boolean z) {
        float f = rectF.left;
        float f2 = rectF.top;
        float width = rectF.width();
        float height = rectF.height();
        if (!z) {
            switch (i3) {
                case 5:
                    i3 = 7;
                    break;
                case 6:
                    i3 = 8;
                    break;
                case 7:
                    i3 = 5;
                    break;
                case 8:
                    i3 = 6;
                    break;
            }
        }
        boolean z2 = false;
        switch (i3) {
            case 2:
                z2 = true;
                break;
            case 3:
                break;
            case 4:
                z2 = true;
                break;
            case 5:
                z2 = true;
                break;
            case 6:
                break;
            case 7:
                z2 = true;
                break;
            case 8:
                break;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0073, code lost:
        if (r2 != null) goto L_0x007f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x007d, code lost:
        if (r2 != null) goto L_0x007f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x007f, code lost:
        com.miui.gallery.util.BaseFileUtils.deleteFile(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x0082, code lost:
        com.miui.gallery.util.BaseMiscUtil.closeSilently(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x0085, code lost:
        return null;
     */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0037 A[Catch:{ Exception -> 0x001c, all -> 0x0019 }] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x008a  */
    public static <T> T createExifInterface(String str, byte[] bArr, ExifCreator<T> exifCreator) {
        InputStream inputStream;
        File file;
        File file2 = null;
        if (exifCreator == null || !BaseFileUtils.isFileExist(str)) {
            return null;
        }
        try {
            inputStream = BaseBitmapUtils.createInputStream(str, bArr);
            try {
                T create = exifCreator.create(inputStream);
                if (create != null) {
                    BaseMiscUtil.closeSilently(inputStream);
                    return create;
                }
            } catch (IOException e) {
                e = e;
                try {
                    Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
                    BaseMiscUtil.closeSilently(inputStream);
                    if (bArr != null) {
                    }
                } catch (Exception e2) {
                    e = e2;
                    file = null;
                    try {
                        Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
                    } catch (Throwable th) {
                        th = th;
                        file2 = file;
                        if (file2 != null) {
                        }
                        BaseMiscUtil.closeSilently(inputStream);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (file2 != null) {
                    }
                    BaseMiscUtil.closeSilently(inputStream);
                    throw th;
                }
            }
        } catch (IOException e3) {
            e = e3;
            inputStream = null;
            Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
            BaseMiscUtil.closeSilently(inputStream);
            if (bArr != null) {
            }
        } catch (Exception e4) {
            e = e4;
            inputStream = null;
            file = null;
            Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            if (file2 != null) {
                BaseFileUtils.deleteFile(file2);
            }
            BaseMiscUtil.closeSilently(inputStream);
            throw th;
        }
        BaseMiscUtil.closeSilently(inputStream);
        if (bArr != null) {
            file = new File(StaticContext.sGetAndroidContext().getFilesDir(), String.valueOf(SystemClock.elapsedRealtimeNanos()));
            try {
                if (CryptoUtil.decryptFile(str, file.getAbsolutePath(), bArr)) {
                    InputStream createInputStream = BaseBitmapUtils.createInputStream(file.getAbsolutePath(), null);
                    try {
                        T create2 = exifCreator.create(createInputStream);
                        BaseFileUtils.deleteFile(file);
                        BaseMiscUtil.closeSilently(createInputStream);
                        return create2;
                    } catch (Exception e5) {
                        inputStream = createInputStream;
                        e = e5;
                        Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
                    } catch (Throwable th4) {
                        th = th4;
                        inputStream = createInputStream;
                        file2 = file;
                        if (file2 != null) {
                        }
                        BaseMiscUtil.closeSilently(inputStream);
                        throw th;
                    }
                }
            } catch (Exception e6) {
                e = e6;
                Log.w("ExifUtil", "Can't read EXIF tags from file [%s] %s", str, e);
            }
        } else {
            file = null;
        }
    }

    public static int exifOrientationToDegrees(int i) {
        if (i == 3) {
            return nexClip.kClip_Rotate_180;
        }
        if (i == 6) {
            return 90;
        }
        if (i != 8) {
            return 0;
        }
        return nexClip.kClip_Rotate_270;
    }

    public static long getDateTime(android.media.ExifInterface exifInterface) {
        if (exifInterface == null) {
            return -1;
        }
        return GalleryTimeUtils.getDateTime(exifInterface.getAttribute("DateTime"), exifInterface.getAttribute("SubSecTime"));
    }

    public static long getDateTime(android.support.media.ExifInterface exifInterface) {
        if (exifInterface == null) {
            return -1;
        }
        return GalleryTimeUtils.getDateTime(exifInterface.getAttribute("DateTime"), exifInterface.getAttribute("SubSecTime"));
    }

    public static long getGpsDateTime(android.support.media.ExifInterface exifInterface) {
        if (exifInterface == null) {
            return -1;
        }
        return GalleryTimeUtils.getGpsDateTime(exifInterface.getAttribute("GPSDateStamp"), exifInterface.getAttribute("GPSTimeStamp"));
    }

    public static int getMTSpecialAITypeValue(ExifInterface exifInterface) {
        Integer tagIntValue = exifInterface != null ? exifInterface.getTagIntValue(42243, 2) : null;
        if (tagIntValue == null) {
            return -1;
        }
        return tagIntValue.intValue();
    }

    public static int getOrientation(ExifInterface exifInterface) {
        Integer tagIntValue = exifInterface == null ? null : exifInterface.getTagIntValue(ExifInterface.TAG_ORIENTATION);
        if (tagIntValue == null) {
            return 1;
        }
        return tagIntValue.intValue();
    }

    public static int getRotationDegrees(android.support.media.ExifInterface exifInterface) {
        int i = 1;
        if (exifInterface != null) {
            i = exifInterface.getAttributeInt("Orientation", 1);
        }
        return exifOrientationToDegrees(i);
    }

    public static int getRotationDegrees(ExifInterface exifInterface) {
        return exifOrientationToDegrees(getOrientation(exifInterface));
    }

    public static UserCommentData getUserCommentData(String str) throws Exception {
        if (!TextUtils.isEmpty(str)) {
            try {
                UserComment userComment = new UserComment(new ExifInterfaceWrapper((android.support.media.ExifInterface) sSupportExifCreator.create(str)));
                if (userComment.isOriginalUserCommentUsable()) {
                    return new UserCommentData(userComment.getSha1(), userComment.getFileExt());
                }
                e = null;
                File file = new File(str);
                if (file.exists() && file.isFile() && file.length() <= 1048576) {
                    try {
                        ExifInterface exifInterface = (ExifInterface) sGallery3DExifCreator.create(str);
                        if (exifInterface != null) {
                            UserComment userComment2 = new UserComment(new ExifInterfaceWrapper(exifInterface));
                            if (userComment2.isOriginalUserCommentUsable() && !TextUtils.isEmpty(userComment2.getSha1())) {
                                UserCommentData userCommentData = new UserCommentData(userComment2.getSha1(), userComment2.getFileExt());
                                Map generatorCommonParams = BaseSamplingStatHelper.generatorCommonParams();
                                generatorCommonParams.put("exception", e != null ? e.toString() : "unrecognizable UserComment");
                                generatorCommonParams.put(nexExportFormat.TAG_FORMAT_PATH, str);
                                BaseSamplingStatHelper.recordErrorEvent("exif_parser", "exif_read_by_gallery_3d_exif_interface", generatorCommonParams);
                                rewriteUserComment(str, userCommentData);
                                return userCommentData;
                            }
                        }
                    } catch (Exception e) {
                        e = e;
                        Log.d("ExifUtil", "Failed to read user comment using gallery 3d exif interface, %s", (Object) e);
                    }
                    try {
                        UserComment userComment3 = new UserComment(new ExifInterfaceWrapper((android.media.ExifInterface) sMediaExifCreator.create(str)));
                        if (userComment3.isOriginalUserCommentUsable()) {
                            return new UserCommentData(userComment3.getSha1(), userComment3.getFileExt());
                        }
                    } catch (Exception e2) {
                        e = e2;
                        Log.d("ExifUtil", "Failed to read user comment using media exif interface, %s", (Object) e);
                    }
                }
                if (e != null) {
                    HashMap hashMap = new HashMap();
                    hashMap.put("model", Build.MODEL);
                    hashMap.put("version", VERSION.INCREMENTAL);
                    hashMap.put(nexExportFormat.TAG_FORMAT_PATH, str);
                    hashMap.put("exception", e.toString());
                    BaseSamplingStatHelper.recordCountEvent("exif_parser", "exif_read_error", hashMap);
                    throw e;
                }
            } catch (Exception e3) {
                e = e3;
                Log.d("ExifUtil", "Failed to read user comment using support exif interface, %s", (Object) e);
            }
        }
        return null;
    }

    public static String getUserCommentSha1(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                UserCommentData userCommentData = getUserCommentData(str);
                if (userCommentData != null) {
                    return userCommentData.getSha1();
                }
            } catch (Exception e) {
                Log.e("ExifUtil", "Failed to read exif!!", (Object) e);
            }
        }
        return null;
    }

    public static String getXiaomiComment(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                ExifInterface exifInterface = (ExifInterface) sGallery3DExifCreator.create(str);
                if (exifInterface != null) {
                    return exifInterface.getXiaomiComment();
                }
            } catch (Exception e) {
                Log.w("ExifUtil", (Throwable) e);
            }
        }
        return null;
    }

    public static String getXiaomiCommentSensorType(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                String xiaomiComment = getXiaomiComment(str);
                if (!TextUtils.isEmpty(xiaomiComment)) {
                    return new JSONObject(xiaomiComment).optString("sensor_type");
                }
            } catch (Exception e) {
                Log.w("ExifUtil", (Throwable) e);
            }
        }
        return null;
    }

    public static boolean isFromFrontCamera(String str) {
        return "front".equalsIgnoreCase(getXiaomiCommentSensorType(str));
    }

    public static boolean isMotionPhoto(ExifInterface exifInterface) {
        Byte tagByteValue = exifInterface.getTagByteValue(34967, 2);
        return tagByteValue != null && tagByteValue.byteValue() == 1;
    }

    public static boolean isWidthHeightRotated(int i) {
        switch (i) {
            case 5:
            case 6:
            case 7:
            case 8:
                return true;
            default:
                return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0014, code lost:
        r0 = r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        return new com.miui.gallery.util.ExifUtil.ExifInfo(r3, r1, r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:2:0x0005, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:4:0x0008, code lost:
        r1 = 90;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x000c, code lost:
        r1 = com.nexstreaming.nexeditorsdk.nexClip.kClip_Rotate_270;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0010, code lost:
        r1 = com.nexstreaming.nexeditorsdk.nexClip.kClip_Rotate_180;
     */
    public static ExifInfo parseRotationInfo(int i) {
        boolean z = false;
        boolean z2 = true;
        switch (i) {
            case 1:
                z2 = false;
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                z = true;
                break;
            case 5:
                z = true;
                break;
            case 6:
                break;
            case 7:
                z = true;
                break;
            case 8:
                break;
        }
    }

    public static ExifInfo parseRotationInfo(String str, byte[] bArr) {
        return parseRotationInfo(str, bArr, sGallery3DExifCreator);
    }

    public static <T> ExifInfo parseRotationInfo(String str, byte[] bArr, ExifCreator<T> exifCreator) {
        int i;
        Object createExifInterface = createExifInterface(str, bArr, exifCreator);
        if (createExifInterface == null) {
            return null;
        }
        if (createExifInterface instanceof android.support.media.ExifInterface) {
            i = ((android.support.media.ExifInterface) createExifInterface).getAttributeInt("Orientation", 1);
        } else if (createExifInterface instanceof ExifInterface) {
            i = getOrientation((ExifInterface) createExifInterface);
        } else if (createExifInterface instanceof android.media.ExifInterface) {
            i = ((android.media.ExifInterface) createExifInterface).getAttributeInt("Orientation", 1);
        } else {
            Log.w("ExifUtil", "Not supported exif interface %s", createExifInterface);
            return null;
        }
        return parseRotationInfo(i);
    }

    private static void rewriteUserComment(String str, UserCommentData userCommentData) {
        try {
            Log.d("ExifUtil", "Try to rewrite UserComment using android.media.ExifInterface");
            android.media.ExifInterface exifInterface = (android.media.ExifInterface) sMediaExifCreator.create(str);
            setUserCommentData(exifInterface, userCommentData);
            exifInterface.saveAttributes();
        } catch (Exception e) {
            Log.w("ExifUtil", "Failed to rewrite UserComment using android.media.ExifInterface, %s", e);
        }
    }

    public static void setDateTime(android.media.ExifInterface exifInterface, String str) {
        if (exifInterface != null && !TextUtils.isEmpty(str)) {
            exifInterface.setAttribute("DateTimeOriginal", str);
            exifInterface.setAttribute("DateTime", str);
        }
    }

    public static void setUserCommentData(android.media.ExifInterface exifInterface, UserCommentData userCommentData) throws Exception {
        if (exifInterface != null && userCommentData != null) {
            new UserComment(new ExifInterfaceWrapper(exifInterface)).setData(userCommentData);
        }
    }

    public static boolean supportRefocus(ExifInterface exifInterface) {
        return exifInterface != null && (!TextUtils.isEmpty(exifInterface.getTagStringValue(34960, 2)) || exifInterface.getTag(34968, 2) != null);
    }
}

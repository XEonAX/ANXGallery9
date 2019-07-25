package com.cdv.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.Size;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

public class NvAndroidBitmap {
    private static final int ASPECT_RATIO_MODE_IGNORE = 0;
    private static final int ASPECT_RATIO_MODE_KEEP = 1;
    private static final int ASPECT_RATIO_MODE_KEEP_EXPANDING = 2;
    private static final String TAG = "";

    public static class ImageInfo {
        int height;
        String mimeType;
        int orientation;
        int width;
    }

    public static Bitmap convertBitmapToRGBA(Bitmap bitmap) {
        if (bitmap == null) {
            return null;
        }
        if (bitmap.getConfig() == Config.ARGB_8888) {
            return bitmap;
        }
        try {
            return bitmap.copy(Config.ARGB_8888, false);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createBitmap(Context context, String str, Size size, int i, boolean z) {
        ImageInfo imageInfo = getImageInfo(context, str);
        if (imageInfo == null) {
            return null;
        }
        try {
            Size size2 = new Size(imageInfo.width, imageInfo.height);
            if (!str.startsWith("assets:/")) {
                return createBitmap(str, null, size2, size, i, z);
            }
            if (context == null) {
                return null;
            }
            InputStream open = context.getAssets().open(str.substring(8));
            Bitmap createBitmap = createBitmap(null, open, size2, size, i, z);
            open.close();
            return createBitmap;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static Bitmap createBitmap(String str, InputStream inputStream, Size size, Size size2, int i, boolean z) {
        Size size3;
        try {
            Options options = new Options();
            if (size2 != null) {
                if (!size2.equals(size)) {
                    if (i != 0) {
                        double width = (double) size.getWidth();
                        double height = (double) size.getHeight();
                        Double.isNaN(width);
                        Double.isNaN(height);
                        double d = width / height;
                        double width2 = (double) size2.getWidth();
                        double height2 = (double) size2.getHeight();
                        Double.isNaN(width2);
                        Double.isNaN(height2);
                        double d2 = width2 / height2;
                        if (i == 1) {
                            if (d >= d2) {
                                int width3 = size2.getWidth();
                                double width4 = (double) size2.getWidth();
                                Double.isNaN(width4);
                                size3 = new Size(width3, (int) ((width4 / d) + 0.5d));
                            } else {
                                double height3 = (double) size2.getHeight();
                                Double.isNaN(height3);
                                size3 = new Size((int) ((height3 * d) + 0.5d), size2.getHeight());
                            }
                        } else if (d >= d2) {
                            double height4 = (double) size2.getHeight();
                            Double.isNaN(height4);
                            size3 = new Size((int) ((height4 * d) + 0.5d), size2.getHeight());
                        } else {
                            int width5 = size2.getWidth();
                            double width6 = (double) size2.getWidth();
                            Double.isNaN(width6);
                            size3 = new Size(width5, (int) ((width6 / d) + 0.5d));
                        }
                    } else {
                        size3 = size2;
                    }
                    options.inSampleSize = (int) (1.0f / Math.min(Math.max(((float) size3.getWidth()) / ((float) size.getWidth()), ((float) size3.getHeight()) / ((float) size.getHeight())), 1.0f));
                    Bitmap decodeFile = str != null ? BitmapFactory.decodeFile(str, options) : BitmapFactory.decodeStream(inputStream, null, options);
                    if (decodeFile == null) {
                        return null;
                    }
                    return (decodeFile.getWidth() > size3.getWidth() || decodeFile.getHeight() > size3.getHeight()) ? Bitmap.createScaledBitmap(decodeFile, size3.getWidth(), size3.getHeight(), z) : decodeFile;
                }
            }
            return str != null ? BitmapFactory.decodeFile(str, options) : BitmapFactory.decodeStream(inputStream, null, options);
        } catch (Exception unused) {
            return null;
        }
    }

    public static Bitmap createBitmap(byte[] bArr, Size size, int i, boolean z) {
        ImageInfo imageInfo = getImageInfo(bArr);
        if (imageInfo == null) {
            return null;
        }
        try {
            return createBitmap(null, new ByteArrayInputStream(bArr), new Size(imageInfo.width, imageInfo.height), size, i, z);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createBitmapRegion(Context context, String str, Rect rect) {
        try {
            Options options = new Options();
            if (!str.startsWith("assets:/")) {
                return BitmapRegionDecoder.newInstance(str, false).decodeRegion(rect, options);
            }
            if (context == null) {
                return null;
            }
            InputStream open = context.getAssets().open(str.substring(8));
            Bitmap decodeRegion = BitmapRegionDecoder.newInstance(open, false).decodeRegion(rect, options);
            open.close();
            return decodeRegion;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createBitmapRegion(byte[] bArr, Rect rect) {
        try {
            return BitmapRegionDecoder.newInstance(bArr, 0, bArr.length, false).decodeRegion(rect, new Options());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createRgbaBitmap(int i, int i2) {
        try {
            return Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createRotatedBitmap(Context context, String str, Size size, int i, boolean z) {
        Bitmap bitmap;
        ImageInfo imageInfo = getImageInfo(context, str);
        if (imageInfo == null) {
            return null;
        }
        try {
            Size size2 = new Size(imageInfo.width, imageInfo.height);
            if (!str.startsWith("assets:/")) {
                bitmap = createBitmap(str, null, size2, size, i, z);
            } else if (context == null) {
                return null;
            } else {
                InputStream open = context.getAssets().open(str.substring(8));
                Bitmap createBitmap = createBitmap(null, open, size2, size, i, z);
                open.close();
                bitmap = createBitmap;
            }
            if (bitmap == null) {
                return null;
            }
            return imageInfo.orientation == 1 ? bitmap : transformBitmap(bitmap, imageInfo.orientation);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap createRotatedBitmap(byte[] bArr, Size size, int i, boolean z) {
        ImageInfo imageInfo = getImageInfo(bArr);
        if (imageInfo == null) {
            return null;
        }
        try {
            Bitmap createBitmap = createBitmap(null, new ByteArrayInputStream(bArr), new Size(imageInfo.width, imageInfo.height), size, i, z);
            if (createBitmap == null) {
                return null;
            }
            return imageInfo.orientation == 1 ? createBitmap : transformBitmap(createBitmap, imageInfo.orientation);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ImageInfo getImageInfo(Context context, String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        try {
            if (!str.startsWith("assets:/")) {
                Options options = new Options();
                options.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(str, options);
                if (options.outMimeType != null && options.outWidth >= 0) {
                    if (options.outHeight >= 0) {
                        ImageInfo imageInfo = new ImageInfo();
                        imageInfo.mimeType = options.outMimeType;
                        imageInfo.width = options.outWidth;
                        imageInfo.height = options.outHeight;
                        if (options.outMimeType.equals("image/jpeg")) {
                            try {
                                imageInfo.orientation = new ExifInterface(str).getAttributeInt("Orientation", 1);
                            } catch (Error e) {
                                imageInfo.orientation = 1;
                                e.printStackTrace();
                            }
                        } else {
                            imageInfo.orientation = 1;
                        }
                        return imageInfo;
                    }
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to get image information for ");
                sb.append(str);
                Log.e("", sb.toString());
                return null;
            } else if (context == null) {
                return null;
            } else {
                InputStream open = context.getAssets().open(str.substring(8));
                ImageInfo imageInfo2 = getImageInfo(open);
                open.close();
                return imageInfo2;
            }
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        }
    }

    private static ImageInfo getImageInfo(InputStream inputStream) {
        if (inputStream == null) {
            return null;
        }
        try {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeStream(inputStream, null, options);
            if (options.outMimeType != null && options.outWidth >= 0) {
                if (options.outHeight >= 0) {
                    ImageInfo imageInfo = new ImageInfo();
                    imageInfo.mimeType = options.outMimeType;
                    imageInfo.width = options.outWidth;
                    imageInfo.height = options.outHeight;
                    imageInfo.orientation = 1;
                    if (options.outMimeType.equals("image/jpeg") && VERSION.SDK_INT >= 24) {
                        imageInfo.orientation = new ExifInterface(inputStream).getAttributeInt("Orientation", 1);
                    }
                    return imageInfo;
                }
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ImageInfo getImageInfo(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return getImageInfo((InputStream) new ByteArrayInputStream(bArr));
    }

    public static Bitmap rotateBitmap(Bitmap bitmap, int i) {
        try {
            Matrix matrix = new Matrix();
            matrix.postRotate((float) i);
            return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, false);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean saveBitmapToFile(Bitmap bitmap, int i, String str) {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            CompressFormat compressFormat = CompressFormat.JPEG;
            if (str.endsWith(".png")) {
                compressFormat = CompressFormat.PNG;
            }
            return bitmap.compress(compressFormat, i, fileOutputStream);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private static Bitmap transformBitmap(Bitmap bitmap, int i) throws Exception {
        Matrix matrix = new Matrix();
        switch (i) {
            case 2:
                matrix.postScale(-1.0f, 1.0f);
                break;
            case 3:
                matrix.postRotate(180.0f);
                break;
            case 4:
                matrix.postScale(1.0f, -1.0f);
                break;
            case 5:
                matrix.postScale(-1.0f, 1.0f);
                matrix.postRotate(270.0f);
                break;
            case 6:
                matrix.postRotate(90.0f);
                break;
            case 7:
                matrix.postScale(-1.0f, 1.0f);
                matrix.postRotate(90.0f);
                break;
            case 8:
                matrix.postRotate(270.0f);
                break;
            default:
                return bitmap;
        }
        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, false);
    }
}

package com.miui.gallery.model;

import android.graphics.BitmapFactory.Options;
import android.support.media.ExifInterface;
import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.VideoAttrsReader;
import java.io.File;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.TreeMap;
import miui.graphics.BitmapFactory;

public class PhotoDetailInfo implements Iterable<Entry<Integer, Object>> {
    private TreeMap<Integer, Object> mDetails = new TreeMap<>();

    public static void extractExifInfo(PhotoDetailInfo photoDetailInfo, String str, boolean z) {
        if (photoDetailInfo != null && !TextUtils.isEmpty(str)) {
            try {
                ExifInterface exifInterface = new ExifInterface(str);
                if (z) {
                    int attributeInt = exifInterface.getAttributeInt("ImageWidth", 0);
                    int attributeInt2 = exifInterface.getAttributeInt("ImageLength", 0);
                    if (attributeInt <= 0 || attributeInt2 <= 0) {
                        Options bitmapSize = BitmapFactory.getBitmapSize(str);
                        int i = bitmapSize.outWidth;
                        attributeInt2 = bitmapSize.outHeight;
                        attributeInt = i;
                    }
                    photoDetailInfo.addDetail(4, Integer.valueOf(attributeInt));
                    photoDetailInfo.addDetail(5, Integer.valueOf(attributeInt2));
                    long gpsDateTime = ExifUtil.getGpsDateTime(exifInterface);
                    if (gpsDateTime <= 0) {
                        gpsDateTime = new File(str).lastModified();
                    }
                    photoDetailInfo.addDetail(1, Long.valueOf(gpsDateTime));
                    double[] latLong = exifInterface.getLatLong();
                    if (latLong != null) {
                        photoDetailInfo.addDetail(6, latLong);
                    }
                }
                photoDetailInfo.addDetail(BaiduSceneResult.SHOOTING, exifInterface.getAttribute("Model"));
                photoDetailInfo.addDetail(100, exifInterface.getAttribute("Make"));
                photoDetailInfo.addDetail(BaiduSceneResult.TEMPLE, exifInterface.getAttribute("FNumber"));
                photoDetailInfo.addDetail(BaiduSceneResult.MOUNTAINEERING, wrapFocalLength(exifInterface.getAttribute("FocalLength")));
                photoDetailInfo.addDetail(BaiduSceneResult.GARDEN, exifInterface.getAttribute("ExposureTime"));
                photoDetailInfo.addDetail(BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE, exifInterface.getAttribute("ISOSpeedRatings"));
                photoDetailInfo.addDetail(BaiduSceneResult.TAEKWONDO, exifInterface.getAttribute("Flash"));
                photoDetailInfo.addDetail(10, exifInterface.getAttribute("Orientation"));
            } catch (Exception e) {
                Log.w("PhotoDetailInfo", (Throwable) e);
            }
        }
    }

    public static void extractVideoAttr(PhotoDetailInfo photoDetailInfo, String str) {
        if (photoDetailInfo != null && !TextUtils.isEmpty(str)) {
            try {
                VideoAttrsReader read = VideoAttrsReader.read(str);
                long dateTaken = read.getDateTaken();
                if (dateTaken > 0) {
                    photoDetailInfo.addDetail(1, Long.valueOf(dateTaken));
                }
                long duration = read.getDuration();
                if (duration > 0) {
                    photoDetailInfo.addDetail(7, Integer.valueOf((int) (duration / 1000)));
                }
            } catch (Exception e) {
                Log.w("PhotoDetailInfo", (Throwable) e);
            }
        }
    }

    public static Double wrapFocalLength(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            int indexOf = str.indexOf("/");
            if (indexOf == -1) {
                return null;
            }
            double parseDouble = Double.parseDouble(str.substring(indexOf + 1));
            if (parseDouble == 0.0d) {
                return null;
            }
            return Double.valueOf(Double.parseDouble(str.substring(0, indexOf)) / parseDouble);
        } catch (NumberFormatException unused) {
            return null;
        }
    }

    public void addDetail(int i, Object obj) {
        this.mDetails.put(Integer.valueOf(i), obj);
    }

    public Object getDetail(int i) {
        return this.mDetails.get(Integer.valueOf(i));
    }

    public Iterator<Entry<Integer, Object>> iterator() {
        return this.mDetails.entrySet().iterator();
    }

    public void removeDetail(int i) {
        this.mDetails.remove(Integer.valueOf(i));
    }
}

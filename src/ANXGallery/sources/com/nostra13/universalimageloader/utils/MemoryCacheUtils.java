package com.nostra13.universalimageloader.utils;

import android.graphics.RectF;
import android.text.TextUtils;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.io.File;
import java.util.Comparator;

public final class MemoryCacheUtils {
    private static StringBuilder appendFileSize(StringBuilder sb, String str) {
        if (!TextUtils.isEmpty(str) && str.startsWith("file://")) {
            long length = new File(str.substring(7)).length();
            if (length > 0) {
                sb.append("L");
                sb.append(length);
            }
        }
        return sb;
    }

    public static Comparator<String> createFuzzyKeyComparator() {
        return new Comparator<String>() {
            public int compare(String str, String str2) {
                return str.substring(0, str.lastIndexOf("_")).compareTo(str2.substring(0, str2.lastIndexOf("_")));
            }
        };
    }

    public static String generateBigPhotoKey(String str) {
        return appendFileSize(new StringBuilder(str), str).toString();
    }

    public static String generateBigPhotoKey(String str, long j) {
        if (j <= 0) {
            return generateBigPhotoKey(str);
        }
        StringBuilder sb = new StringBuilder(str);
        sb.append("L");
        sb.append(j);
        return sb.toString();
    }

    public static String generateKey(String str, ImageSize imageSize, RectF rectF, DisplayImageOptions displayImageOptions) {
        StringBuilder sb = new StringBuilder(str);
        sb.append("_");
        sb.append(imageSize.getWidth());
        sb.append("x");
        sb.append(imageSize.getHeight());
        if (rectF != null) {
            sb.append("R");
            sb.append(rectF.toShortString());
        }
        if (displayImageOptions != null) {
            if (displayImageOptions.isConsiderFileLength() && displayImageOptions.getFileLength() > 0) {
                sb.append("L");
                sb.append(displayImageOptions.getFileLength());
            }
            if (displayImageOptions.getBlurRadius() > 0) {
                sb.append("B");
                sb.append(displayImageOptions.getBlurRadius());
            }
            if (displayImageOptions.usingRegionDecoderFace()) {
                sb.append("F");
            }
            if (displayImageOptions.isLoadOriginScaleThumbnail()) {
                sb.append("_thumbnail");
            }
        }
        return sb.toString();
    }

    public static String generatePreviewPhotoKey(String str) {
        StringBuilder sb = new StringBuilder(str);
        sb.append("_preview");
        return sb.toString();
    }

    public static String generateThumbnailKey(String str) {
        if (TextUtils.isEmpty(str) || str.endsWith("_thumbnail")) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("_thumbnail");
        return sb.toString();
    }
}

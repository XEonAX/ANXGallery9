package com.miui.gallery.movie.utils;

import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MovieStorage {
    private static final String IMAGE_SAVED_SUFFIX = "_PHOTOMOVIE";
    private static final String SAVE_FILE_FORMAT = "%sMP4_%s.mp4";
    private static final String TEMP_FILE_NAME = "TEMP_PHOTOMOVIE.mp4";

    public static String getOutPutDirectory() {
        return StorageUtils.getCreativeDirectory();
    }

    public static String getOutputMediaFilePath() {
        File file = new File(getOutPutDirectory());
        if (!FileUtils.createFolder(file, false)) {
            Log.e("MovieStorage", "getOutputMediaFile failed");
            return null;
        }
        String format = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String str = SAVE_FILE_FORMAT;
        StringBuilder sb = new StringBuilder();
        sb.append(file.getPath());
        sb.append(File.separator);
        StringBuilder sb2 = new StringBuilder();
        sb2.append(format);
        sb2.append(IMAGE_SAVED_SUFFIX);
        return String.format(str, new Object[]{sb.toString(), sb2.toString()});
    }

    public static String getTempFilePath() {
        File file = new File(getOutPutDirectory(), "temp");
        if (!FileUtils.createFolder(file, true)) {
            Log.e("MovieStorage", "getTempFilePath failed");
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(file.getPath());
        sb.append(File.separator);
        sb.append(TEMP_FILE_NAME);
        return sb.toString();
    }
}

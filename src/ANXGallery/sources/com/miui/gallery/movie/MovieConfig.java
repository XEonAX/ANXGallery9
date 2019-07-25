package com.miui.gallery.movie;

import android.content.Context;
import com.miui.gallery.util.FileUtils;
import java.io.File;

public class MovieConfig {
    public static String sAssetInstallRootPath;
    public static String sAssetStorePath;
    public static String sAudioDir;
    private static boolean sInited;
    private static float sMovieRatio;
    public static String sTemplateDir;

    public static float getMovieRatio() {
        return sMovieRatio;
    }

    public static void init(Context context) {
        if (!sInited) {
            String absolutePath = context.getExternalFilesDir("movie").getAbsolutePath();
            StringBuilder sb = new StringBuilder();
            sb.append(absolutePath);
            sb.append(File.separator);
            sb.append("template");
            sTemplateDir = sb.toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(absolutePath);
            sb2.append(File.separator);
            sb2.append("audio");
            sAudioDir = sb2.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sTemplateDir);
            sb3.append(File.separator);
            sb3.append("movie_asset_store");
            sb3.append(File.separator);
            sb3.append("asset_store");
            sAssetStorePath = sb3.toString();
            StringBuilder sb4 = new StringBuilder();
            sb4.append(sTemplateDir);
            sb4.append(File.separator);
            sb4.append("movie_asset_store");
            sb4.append(File.separator);
            sb4.append("assets");
            sAssetInstallRootPath = sb4.toString();
            FileUtils.addNoMedia(absolutePath);
            sInited = true;
        }
    }

    public static void setMovieRatio(float f) {
        sMovieRatio = f;
    }
}

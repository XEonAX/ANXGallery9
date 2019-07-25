package com.miui.gallery.video.editor.config;

import android.content.Context;
import java.io.File;

public class VideoEditorConfig {
    public static String ASSET_INSTALL_ROOT_PATH;
    public static String ASSET_STORE_PATH;
    public static String AUDIO_PATH;
    public static String SMART_EFFECT_PATH;
    public static String WATER_MARK_PATH;

    public static void init(Context context) {
        File externalFilesDir = context.getExternalFilesDir(null);
        if (externalFilesDir == null) {
            externalFilesDir = context.getFilesDir();
        }
        StringBuilder sb = new StringBuilder();
        sb.append(externalFilesDir);
        sb.append(File.separator);
        sb.append("video_editor");
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(File.separator);
        sb3.append("video_editor_audio_dir");
        AUDIO_PATH = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(context.getFilesDir());
        sb4.append(File.separator);
        sb4.append("video_editor_template");
        String sb5 = sb4.toString();
        StringBuilder sb6 = new StringBuilder();
        sb6.append(sb5);
        sb6.append(File.separator);
        sb6.append("video_editor_asset_store");
        sb6.append(File.separator);
        sb6.append("asset_store");
        ASSET_STORE_PATH = sb6.toString();
        StringBuilder sb7 = new StringBuilder();
        sb7.append(sb5);
        sb7.append(File.separator);
        sb7.append("video_editor_asset_store");
        sb7.append(File.separator);
        sb7.append("assets");
        ASSET_INSTALL_ROOT_PATH = sb7.toString();
        SMART_EFFECT_PATH = ASSET_STORE_PATH;
        WATER_MARK_PATH = ASSET_STORE_PATH;
    }
}

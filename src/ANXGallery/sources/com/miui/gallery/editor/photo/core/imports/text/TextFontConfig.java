package com.miui.gallery.editor.photo.core.imports.text;

import android.content.Context;
import java.io.File;

public class TextFontConfig {
    public static String FONT_PATH;

    public static void init(Context context) {
        File externalFilesDir = context.getExternalFilesDir(null);
        if (externalFilesDir == null) {
            externalFilesDir = context.getFilesDir();
        }
        StringBuilder sb = new StringBuilder();
        sb.append(externalFilesDir);
        sb.append(File.separator);
        sb.append("text_font");
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(File.separator);
        sb3.append("font");
        FONT_PATH = sb3.toString();
    }
}

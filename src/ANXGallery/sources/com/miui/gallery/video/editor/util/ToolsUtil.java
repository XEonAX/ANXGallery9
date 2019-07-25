package com.miui.gallery.video.editor.util;

import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.text.TextUtils;
import android.view.View;
import com.miui.gallery.util.Log;
import java.io.IOException;
import java.util.Locale;

public class ToolsUtil {
    public static String getTrimedString(String str) {
        return TextUtils.isEmpty(str) ? "" : str.trim();
    }

    public static int getVideoFrameRate(String str) {
        int i = 0;
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        MediaExtractor mediaExtractor = new MediaExtractor();
        try {
            mediaExtractor.setDataSource(str);
            int trackCount = mediaExtractor.getTrackCount();
            int i2 = 0;
            while (true) {
                if (i2 >= trackCount) {
                    break;
                }
                MediaFormat trackFormat = mediaExtractor.getTrackFormat(i2);
                String string = trackFormat.getString("mime");
                if (!TextUtils.isEmpty(string) && string.startsWith("video/") && trackFormat.containsKey("frame-rate")) {
                    i = trackFormat.getInteger("frame-rate");
                    break;
                }
                i2++;
            }
        } catch (IOException e) {
            Log.d("ToolsUtil", "getVideoFrameRate: %s", (Object) e.getMessage());
        } catch (Throwable th) {
            mediaExtractor.release();
            throw th;
        }
        mediaExtractor.release();
        return i;
    }

    public static void hideView(View view) {
        if (view != null) {
            view.setVisibility(8);
        }
    }

    public static boolean isRTLDirection() {
        return TextUtils.getLayoutDirectionFromLocale(Locale.getDefault()) == 1;
    }

    public static int parseIntFromStr(String str) {
        try {
            if (!TextUtils.isEmpty(str)) {
                return Integer.parseInt(str.trim());
            }
        } catch (Exception e) {
            Log.d("ToolsUtil", "parseIntFromStr exception: %s ", (Object) e.getMessage());
        }
        return 0;
    }

    public static void showView(View view) {
        if (view != null) {
            view.setVisibility(0);
        }
    }
}

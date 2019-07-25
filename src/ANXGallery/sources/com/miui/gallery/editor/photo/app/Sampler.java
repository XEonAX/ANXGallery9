package com.miui.gallery.editor.photo.app;

import android.app.Activity;
import android.os.Bundle;
import com.miui.gallery.sdk.editor.Constants;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Locale;
import java.util.Map;

public class Sampler {
    private String mFormat;
    private String mPage;

    private Sampler(String str, String str2, String str3) {
        this.mFormat = String.format(Locale.US, "%s%%s%s", new Object[]{str, str2});
        this.mPage = str3;
    }

    public static Sampler from(Bundle bundle) {
        if (bundle == null || !bundle.getBoolean(Constants.EXTRA_IS_SCREENSHOT)) {
            Log.d("Sampler", "create sampler");
            return new Sampler("photo_editor", "", "photo_editor_main");
        } else if (bundle.getBoolean(Constants.EXTRA_IS_LONG_SCREENSHOT)) {
            Log.d("Sampler", "create long screenshot's sampler");
            return new Sampler("photo_editor", "(long_screenshot)", "photo_editor_long_screenshot");
        } else {
            Log.d("Sampler", "create screenshot's sampler");
            return new Sampler("photo_editor", "(screenshot)", "photo_editor_screenshot");
        }
    }

    public void recordEvent(String str, String str2) {
        Log.d("Sampler", "record cat: %s, event: %s", str, str2);
        GallerySamplingStatHelper.recordCountEvent(String.format(Locale.US, this.mFormat, new Object[]{str}), str2);
    }

    public void recordEvent(String str, String str2, Map<String, String> map) {
        Log.d("Sampler", "record cat: %s, event: %s, params: %s", str, str2, map);
        GallerySamplingStatHelper.recordCountEvent(String.format(Locale.US, this.mFormat, new Object[]{str}), str2, map);
    }

    public void recordNumericEvent(String str, String str2, long j) {
        Log.d("Sampler", "record cat: %s, event: %s, params: %d", str, str2, Long.valueOf(j));
        GallerySamplingStatHelper.recordNumericPropertyEvent(String.format(Locale.US, this.mFormat, new Object[]{str}), str2, j);
    }

    public void recordPageEnd(Activity activity) {
        Log.d("Sampler", "record page end");
        GallerySamplingStatHelper.recordPageEnd(activity, this.mPage);
    }

    public void recordPageStart(Activity activity) {
        Log.d("Sampler", "record page start: %s", (Object) this.mPage);
        GallerySamplingStatHelper.recordPageStart(activity, this.mPage);
    }
}

package com.miui.gallery.video.editor.manager;

import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Locale;
import java.util.Map;

public class SamplerManager {
    private String mFormat;

    private SamplerManager(String str, String str2) {
        this.mFormat = String.format(Locale.US, "%s%%s%s", new Object[]{str, str2});
    }

    public static SamplerManager create() {
        if (SmartVideoJudgeManager.isAvailable()) {
            Log.d("SamplerManager", "create smart effect's sampler");
            return new SamplerManager("", "(smart_effect)");
        }
        Log.d("SamplerManager", "create sampler");
        return new SamplerManager("", "");
    }

    public void recordEvent(String str, String str2, Map<String, String> map) {
        Log.d("SamplerManager", "record cat: %s, event: %s, params: %s", str, str2, map);
        GallerySamplingStatHelper.recordCountEvent(String.format(Locale.US, this.mFormat, new Object[]{str}), str2, map);
    }
}

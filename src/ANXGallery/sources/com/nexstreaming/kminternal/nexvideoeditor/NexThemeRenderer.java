package com.nexstreaming.kminternal.nexvideoeditor;

import android.util.Log;

public class NexThemeRenderer {
    private long a = 0;

    static {
        try {
            System.loadLibrary("stlport_shared");
            System.loadLibrary("nexeditorsdk");
        } catch (UnsatisfiedLinkError e) {
            StringBuilder sb = new StringBuilder();
            sb.append("[NexThemeRenderer.java] nexeditor load failed : ");
            sb.append(e);
            Log.e("NexThemeRenderer", sb.toString());
        }
    }

    public void a(String str) {
        loadThemes(str);
    }

    public native void clearClipEffect();

    public native int clearRenderItems();

    public native void clearTransitionEffect();

    public native void deinit(boolean z);

    /* access modifiers changed from: 0000 */
    public long getThemeInstanceHandle() {
        return this.a;
    }

    public native void init(NexImageLoader nexImageLoader);

    public native int loadRenderItem(String str, String str2);

    public native void loadThemes(String str);

    public native void render();

    public native void setCTS(int i);

    public native void setClipEffect(String str, String str2, int i, int i2, int i3, int i4, int i5, int i6);

    public native void setPlaceholders(String str, String str2);

    /* access modifiers changed from: 0000 */
    public void setThemeInstanceHandle(long j) {
        this.a = j;
    }

    public native void setTransitionEffect(String str, String str2, int i, int i2, int i3, int i4);

    public native void surfaceChange(int i, int i2);
}

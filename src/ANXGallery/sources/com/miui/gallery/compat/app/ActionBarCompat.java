package com.miui.gallery.compat.app;

import android.app.ActionBar;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.view.ActionBarWrapper;

public class ActionBarCompat {
    public static void setShowHideAnimationEnabled(ActionBar actionBar, boolean z) {
        if (actionBar == null) {
            return;
        }
        if (actionBar instanceof ActionBarWrapper) {
            ((ActionBarWrapper) actionBar).setShowHideAnimationEnabled(z);
            return;
        }
        MiscUtil.invokeSafely(actionBar, "setShowHideAnimationEnabled", new Class[]{Boolean.TYPE}, Boolean.valueOf(z));
    }
}

package com.miui.gallery.util;

import android.content.Context;
import miui.util.AppConstants;

public final class ModuleLevel extends LazyValue<Context, Integer> {
    private String mModuleName;

    public ModuleLevel(String str) {
        this.mModuleName = str;
    }

    /* access modifiers changed from: protected */
    public Integer onInit(Context context) {
        return Integer.valueOf(AppConstants.getSdkLevel(context, this.mModuleName));
    }
}

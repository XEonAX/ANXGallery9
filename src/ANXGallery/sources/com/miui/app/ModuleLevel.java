package com.miui.app;

import android.content.Context;
import com.miui.utils.LazyConst;
import miui.util.AppConstants;

public final class ModuleLevel extends LazyConst<Context, Integer> {
    private String mModuleName;

    public ModuleLevel(String str) {
        this.mModuleName = str;
    }

    /* access modifiers changed from: protected */
    public Integer onInit(Context context) {
        return Integer.valueOf(AppConstants.getSdkLevel(context, this.mModuleName));
    }
}

package com.miui.gallery.editor.photo.screen.core;

import android.content.Context;

public abstract class ScreenProvider {
    protected boolean mIsInitialized;

    public boolean isInitialized() {
        return this.mIsInitialized;
    }

    public abstract void onActivityCreate(Context context);

    public abstract void onActivityDestroy();
}

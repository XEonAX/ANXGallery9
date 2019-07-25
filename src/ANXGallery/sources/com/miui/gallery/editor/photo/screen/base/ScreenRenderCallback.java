package com.miui.gallery.editor.photo.screen.base;

import android.graphics.Bitmap;

public interface ScreenRenderCallback {
    void onComplete(boolean z);

    void setShareBitmap(Bitmap bitmap, boolean z);
}

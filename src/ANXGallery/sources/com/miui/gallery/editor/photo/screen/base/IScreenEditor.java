package com.miui.gallery.editor.photo.screen.base;

import android.graphics.Canvas;

public interface IScreenEditor {
    void canvasMatrixChange();

    void drawOverlay(Canvas canvas);
}

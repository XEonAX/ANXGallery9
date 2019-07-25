package com.miui.gallery.editor.photo.screen.base;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;
import com.miui.gallery.editor.photo.screen.home.ScreenEditorView;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder;

public abstract class ScreenVirtualEditorView {
    protected Context mContext = this.mEditorView.getContext();
    protected ScreenEditorView mEditorView;

    public ScreenVirtualEditorView(ScreenEditorView screenEditorView) {
        this.mEditorView = screenEditorView;
    }

    /* access modifiers changed from: protected */
    public void addDrawNode(BaseDrawNode baseDrawNode) {
        this.mEditorView.addDrawNode(baseDrawNode);
    }

    /* access modifiers changed from: protected */
    public final RectF getBitmapDisplayInitRect() {
        return getBitmapGestureParamsHolder().mBitmapDisplayInitRect;
    }

    public BitmapGestureParamsHolder getBitmapGestureParamsHolder() {
        return this.mEditorView.getBitmapGestureParamsHolder();
    }

    /* access modifiers changed from: protected */
    public final RectF getBounds() {
        return getBitmapGestureParamsHolder().mDisplayInitRect;
    }

    /* access modifiers changed from: protected */
    public final RectF getImageBounds() {
        return getBitmapGestureParamsHolder().mBitmapRect;
    }

    /* access modifiers changed from: protected */
    public final RectF getImageDisplayRect() {
        return getBitmapGestureParamsHolder().mBitmapDisplayRect;
    }

    /* access modifiers changed from: protected */
    public final Matrix getImageMatrix() {
        return getBitmapGestureParamsHolder().mCanvasMatrix;
    }

    /* access modifiers changed from: protected */
    public final void invalidate() {
        this.mEditorView.invalidate();
    }

    /* access modifiers changed from: protected */
    public final void performCanvasMatrixChange() {
        getBitmapGestureParamsHolder().performCanvasMatrixChange();
    }

    public void removeDrawNode(BaseDrawNode baseDrawNode) {
        this.mEditorView.removeDrawNode(baseDrawNode);
    }

    public void setImageMatrix(Matrix matrix) {
        getBitmapGestureParamsHolder().mCanvasMatrix.set(matrix);
        performCanvasMatrixChange();
    }
}

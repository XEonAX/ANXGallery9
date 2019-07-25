package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView;

public class StrokeImageView extends ImageView {
    private boolean mIsStrokeVisible = true;
    private StrokeImageHelper mStrokeImageHelper;

    public StrokeImageView(Context context) {
        super(context);
        init();
    }

    public StrokeImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public StrokeImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mStrokeImageHelper = new StrokeImageHelper(getContext());
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Drawable drawable = getDrawable();
        if (drawable != null && this.mIsStrokeVisible) {
            this.mStrokeImageHelper.draw(canvas, drawable.getBounds(), getImageMatrix());
        }
    }

    public void setStrokeVisible(boolean z) {
        this.mIsStrokeVisible = z;
        invalidate();
    }
}

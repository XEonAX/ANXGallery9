package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.animation.TypeEvaluator;
import android.graphics.RectF;

public class RectFEvaluator implements TypeEvaluator<RectF> {
    private RectF mRect = new RectF();

    public RectF evaluate(float f, RectF rectF, RectF rectF2) {
        this.mRect.set(rectF.left + ((rectF2.left - rectF.left) * f), rectF.top + ((rectF2.top - rectF.top) * f), rectF.right + ((rectF2.right - rectF.right) * f), rectF.bottom + ((rectF2.bottom - rectF.bottom) * f));
        return this.mRect;
    }
}

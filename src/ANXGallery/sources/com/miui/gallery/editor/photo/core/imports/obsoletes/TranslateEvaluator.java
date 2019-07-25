package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.animation.TypeEvaluator;
import android.graphics.Matrix;

public class TranslateEvaluator implements TypeEvaluator<Matrix> {
    private float[] mEnd = new float[9];
    private Matrix mMatrix = new Matrix();
    private float[] mRaw = new float[9];
    private float[] mStart = new float[9];

    public Matrix evaluate(float f, Matrix matrix, Matrix matrix2) {
        matrix.getValues(this.mStart);
        matrix2.getValues(this.mEnd);
        this.mRaw[0] = this.mStart[0] + ((this.mEnd[0] - this.mStart[0]) * f);
        this.mRaw[1] = this.mStart[1] + ((this.mEnd[1] - this.mStart[1]) * f);
        this.mRaw[2] = this.mStart[2] + ((this.mEnd[2] - this.mStart[2]) * f);
        this.mRaw[3] = this.mStart[3] + ((this.mEnd[3] - this.mStart[3]) * f);
        this.mRaw[4] = this.mStart[4] + ((this.mEnd[4] - this.mStart[4]) * f);
        this.mRaw[5] = this.mStart[5] + ((this.mEnd[5] - this.mStart[5]) * f);
        this.mRaw[6] = this.mStart[6];
        this.mRaw[7] = this.mStart[7];
        this.mRaw[8] = this.mStart[8];
        this.mMatrix.setValues(this.mRaw);
        return this.mMatrix;
    }
}

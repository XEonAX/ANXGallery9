package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.Bitmap;
import android.graphics.Matrix;

public abstract class MosaicEntity extends MosaicData {
    private MosaicShaderHolder mMosaicShaderHolder;
    public final TYPE type;

    public enum TYPE {
        ORIGIN,
        NORMAL,
        TRIANGLE,
        TRIANGLE_RECT,
        BLUR,
        BITMAP
    }

    public MosaicEntity(String str, String str2, TYPE type2) {
        super(str, str2);
        this.type = type2;
    }

    public void clearShader() {
        this.mMosaicShaderHolder = null;
    }

    public abstract MosaicShaderHolder generateShader(Bitmap bitmap, float f, Matrix matrix);

    public MosaicShaderHolder generateShader(Bitmap bitmap, Matrix matrix) {
        this.mMosaicShaderHolder = generateShader(bitmap, 1.0f, matrix);
        return this.mMosaicShaderHolder;
    }

    public MosaicShaderHolder getMosaicShaderHolder() {
        return this.mMosaicShaderHolder;
    }
}

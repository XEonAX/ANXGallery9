package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.BitmapShader;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity.TYPE;

public class MosaicShaderHolder {
    private BitmapShader bitmapShader;
    public final TYPE type;

    public MosaicShaderHolder(BitmapShader bitmapShader2, TYPE type2) {
        this.bitmapShader = bitmapShader2;
        this.type = type2;
    }

    public BitmapShader getBitmapShader() {
        return this.bitmapShader;
    }
}

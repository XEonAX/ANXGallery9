package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Shader.TileMode;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity.TYPE;

public class MosaicEntityOrigin extends MosaicEntity {
    public MosaicEntityOrigin(String str, String str2) {
        super(str, str2, TYPE.ORIGIN);
    }

    public MosaicShaderHolder generateShader(Bitmap bitmap, float f, Matrix matrix) {
        BitmapShader bitmapShader = new BitmapShader(null, TileMode.CLAMP, TileMode.CLAMP);
        bitmapShader.setLocalMatrix(matrix);
        return new MosaicShaderHolder(bitmapShader, TYPE.ORIGIN);
    }
}

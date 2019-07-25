package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Shader.TileMode;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity.TYPE;
import com.miui.gallery.util.Log;

public class MosaicEntityNormal extends MosaicEntityRely {
    public MosaicEntityNormal(String str, String str2) {
        super(str, str2, TYPE.NORMAL);
    }

    public MosaicShaderHolder generateShader(Bitmap bitmap, float f, Matrix matrix) {
        Log.d("MosaicEntityRely", "MosaicEntityNormal  generateShader.");
        float f2 = f * 36.0f;
        if (((float) bitmap.getWidth()) < f2 || ((float) bitmap.getHeight()) < f2) {
            return new MosaicShaderHolder(new BitmapShader(bitmap, TileMode.CLAMP, TileMode.CLAMP), TYPE.NORMAL);
        }
        Bitmap createScaledBitmap = Bitmap.createScaledBitmap(bitmap, Math.round(((float) bitmap.getWidth()) / f2), Math.round(((float) bitmap.getHeight()) / f2), false);
        BitmapShader bitmapShader = new BitmapShader(Bitmap.createScaledBitmap(createScaledBitmap, Math.round(((float) createScaledBitmap.getWidth()) * f2), Math.round(((float) createScaledBitmap.getHeight()) * f2), false), TileMode.CLAMP, TileMode.CLAMP);
        bitmapShader.setLocalMatrix(matrix);
        return new MosaicShaderHolder(bitmapShader, TYPE.NORMAL);
    }
}

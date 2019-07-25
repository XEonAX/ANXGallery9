package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Shader.TileMode;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity.TYPE;
import com.nostra13.universalimageloader.core.ImageLoader;

public class MosaicEntityBitmap extends MosaicEntity {
    private String mResourcePath;
    private TileMode mTileMode;

    public MosaicEntityBitmap(String str, String str2, String str3, TileMode tileMode) {
        super(str, str2, TYPE.BITMAP);
        this.mResourcePath = str3;
        this.mTileMode = tileMode;
    }

    public MosaicShaderHolder generateShader(Bitmap bitmap, float f, Matrix matrix) {
        float[] fArr = new float[9];
        matrix.getValues(fArr);
        float f2 = fArr[0];
        BitmapShader bitmapShader = new BitmapShader(ImageLoader.getInstance().loadImageSync(this.mResourcePath), this.mTileMode, this.mTileMode);
        Matrix matrix2 = new Matrix();
        float f3 = 0.8f / f2;
        matrix2.postScale(f3, f3);
        bitmapShader.setLocalMatrix(matrix2);
        return new MosaicShaderHolder(bitmapShader, TYPE.BITMAP);
    }
}

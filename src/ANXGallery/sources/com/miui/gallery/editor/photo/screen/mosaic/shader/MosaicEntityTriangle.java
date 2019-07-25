package com.miui.gallery.editor.photo.screen.mosaic.shader;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Shader.TileMode;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity.TYPE;
import com.miui.gallery.util.Log;
import java.lang.reflect.Array;

public class MosaicEntityTriangle extends MosaicEntityRely {
    public MosaicEntityTriangle(String str, String str2) {
        super(str, str2, TYPE.TRIANGLE);
    }

    public MosaicShaderHolder generateShader(Bitmap bitmap, float f, Matrix matrix) {
        int round = Math.round(f * 36.0f);
        if (bitmap.getWidth() < round || bitmap.getHeight() < round) {
            return new MosaicShaderHolder(new BitmapShader(bitmap, TileMode.CLAMP, TileMode.CLAMP), TYPE.TRIANGLE);
        }
        long currentTimeMillis = System.currentTimeMillis();
        int[][] iArr = (int[][]) Array.newInstance(int.class, new int[]{(bitmap.getHeight() / round) + 1, (bitmap.getWidth() / round) + 1});
        int[][] iArr2 = (int[][]) Array.newInstance(int.class, new int[]{(bitmap.getHeight() / round) + 1, (bitmap.getWidth() / round) + 1});
        Log.d("MosaicEntityTriangle", "allocate cache costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        int i = 0;
        for (int i2 = 0; i2 < bitmap.getHeight(); i2 += round) {
            int i3 = 0;
            for (int i4 = 0; i4 < bitmap.getWidth(); i4 += round) {
                int i5 = round / 4;
                int i6 = i4 + i5;
                if (i6 >= bitmap.getWidth()) {
                    i6 = (bitmap.getWidth() + i4) / 2;
                }
                int i7 = i5 + i2;
                if (i7 >= bitmap.getHeight()) {
                    i7 = (bitmap.getHeight() + i2) / 2;
                }
                iArr[i][i3] = bitmap.getPixel(i6, i7);
                int i8 = (round * 3) / 4;
                int i9 = i4 + i8;
                if (i9 >= bitmap.getWidth()) {
                    i9 = (bitmap.getWidth() + i4) / 2;
                }
                int i10 = i8 + i2;
                if (i10 >= bitmap.getHeight()) {
                    i10 = (bitmap.getHeight() + i2) / 2;
                }
                iArr2[i][i3] = bitmap.getPixel(i9, i10);
                i3++;
            }
            i++;
        }
        Log.d("MosaicEntityTriangle", "init cache costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        int[] iArr3 = new int[(bitmap.getWidth() * bitmap.getHeight())];
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i11 < iArr3.length) {
            int i14 = i11;
            int i15 = 0;
            int i16 = 0;
            int i17 = 0;
            while (i15 < bitmap.getWidth()) {
                if (i12 < round - i16) {
                    iArr3[i14] = iArr[i13][i17];
                } else {
                    iArr3[i14] = iArr2[i13][i17];
                }
                i16++;
                if (i16 == round) {
                    i17++;
                    i16 = 0;
                }
                i15++;
                i14++;
            }
            i12++;
            if (i12 == round) {
                i13++;
                i11 = i14;
                i12 = 0;
            } else {
                i11 = i14;
            }
        }
        Log.d("MosaicEntityTriangle", "generate pixels costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        Bitmap createBitmap = Bitmap.createBitmap(iArr3, bitmap.getWidth(), bitmap.getHeight(), Config.ARGB_8888);
        Log.d("MosaicEntityTriangle", "finish costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return new MosaicShaderHolder(new BitmapShader(createBitmap, TileMode.CLAMP, TileMode.CLAMP), TYPE.TRIANGLE);
    }
}

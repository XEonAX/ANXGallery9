package com.nexstreaming.app.common.nexasset.overlay.impl;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.RectF;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.overlay.AwakeAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayMotion;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

public class BitmapOverlayAsset extends AbstractOverlayAsset {
    private static final String LOG_TAG = "BitmapOverlayAsset";
    private static final int MAX_TEX_SIZE = 2000;
    private int height;
    private int width;

    /* JADX INFO: finally extract failed */
    public BitmapOverlayAsset(f fVar) throws IOException {
        super(fVar);
        Options options = new Options();
        options.inJustDecodeBounds = true;
        InputStream a = getAssetPackageReader().a(fVar.getFilePath());
        try {
            BitmapFactory.decodeStream(a, null, options);
            b.a(a);
            this.width = options.outWidth;
            this.height = options.outHeight;
        } catch (Throwable th) {
            b.a(a);
            throw th;
        }
    }

    private Bitmap loadBitmap(Options options) {
        InputStream inputStream;
        InputStream inputStream2 = null;
        try {
            inputStream = getAssetPackageReader().a(getItemInfo().getFilePath());
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                b.a(inputStream);
                return decodeStream;
            } catch (IOException unused) {
                try {
                    Log.e(LOG_TAG, "");
                    b.a(inputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    inputStream2 = inputStream;
                    b.a(inputStream2);
                    throw th;
                }
            }
        } catch (IOException unused2) {
            inputStream = null;
            Log.e(LOG_TAG, "");
            b.a(inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            b.a(inputStream2);
            throw th;
        }
    }

    public Bitmap getBitmap(float f, int i) {
        Options options = new Options();
        options.inSampleSize = 1;
        while (options.inSampleSize < 16 && (this.width / options.inSampleSize > 2000 || this.height / options.inSampleSize > 2000)) {
            options.inSampleSize *= 2;
        }
        return loadBitmap(options);
    }

    public int getDefaultDuration() {
        return 0;
    }

    public int getIntrinsicHeight() {
        return this.height;
    }

    public int getIntrinsicWidth() {
        return this.width;
    }

    public AwakeAsset onAwake(LayerRenderer layerRenderer, final RectF rectF, String str, Map<String, String> map) {
        Options options = new Options();
        options.inSampleSize = 1;
        while (options.inSampleSize < 16 && (this.width / options.inSampleSize > 2000 || this.height / options.inSampleSize > 2000)) {
            options.inSampleSize *= 2;
        }
        final Bitmap loadBitmap = loadBitmap(options);
        return new AwakeAsset() {
            public boolean needRendererReawakeOnEditResize() {
                return false;
            }

            public void onAsleep(LayerRenderer layerRenderer) {
            }

            public boolean onRefresh(LayerRenderer layerRenderer, RectF rectF, String str) {
                return false;
            }

            public void onRender(LayerRenderer layerRenderer, OverlayMotion overlayMotion, int i, int i2) {
                if (rectF.left == 0.0f && rectF.top == 0.0f && rectF.right == 0.0f && rectF.bottom == 0.0f) {
                    layerRenderer.a(loadBitmap, 0.0f, 0.0f);
                    return;
                }
                layerRenderer.a(loadBitmap, rectF.left, rectF.top, rectF.right, rectF.bottom);
            }
        };
    }
}

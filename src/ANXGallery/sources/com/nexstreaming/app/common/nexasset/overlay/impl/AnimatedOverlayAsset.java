package com.nexstreaming.app.common.nexasset.overlay.impl;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Picture;
import android.graphics.RectF;
import android.graphics.drawable.PictureDrawable;
import android.util.Log;
import android.util.LruCache;
import com.larvalabs.svgandroid.SVGParser;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.overlay.AwakeAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayMotion;
import com.nexstreaming.app.common.nexasset.overlay.OverlaySpec;
import com.nexstreaming.app.common.nexasset.overlay.OverlaySpec.Frame;
import com.nexstreaming.app.common.nexasset.overlay.OverlaySpec.Layer;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.app.common.util.i;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import org.xmlpull.v1.XmlPullParserException;

public class AnimatedOverlayAsset extends AbstractOverlayAsset {
    private static final String LOG_TAG = "AnimOverlayAsset";
    private static final int MAX_TEX_SIZE = 2000;
    private String baseFile;
    private OverlaySpec overlaySpec;
    private AssetPackageReader reader;
    private float vectorScale;

    private static class AwakeAssetImpl implements AwakeAsset {
        private final String baseFile;
        private LruCache<String, Bitmap> bitmapCache = new LruCache<String, Bitmap>(41943040) {
            /* access modifiers changed from: protected */
            public int sizeOf(String str, Bitmap bitmap) {
                return bitmap.getByteCount();
            }
        };
        private final RectF bounds;
        private final OverlaySpec overlaySpec;
        private final AssetPackageReader reader;
        private final float vectorScale;

        AwakeAssetImpl(RectF rectF, OverlaySpec overlaySpec2, AssetPackageReader assetPackageReader, String str, float f) {
            this.bounds = new RectF(rectF);
            this.overlaySpec = overlaySpec2;
            this.reader = assetPackageReader;
            this.baseFile = str;
            this.vectorScale = f;
        }

        private Bitmap getImage(String str) {
            if (this.reader == null) {
                return null;
            }
            Bitmap bitmap = (Bitmap) this.bitmapCache.get(str);
            if (bitmap != null) {
                return bitmap;
            }
            Bitmap loadImage = loadImage(str);
            if (loadImage != null) {
                this.bitmapCache.put(str, loadImage);
            }
            return loadImage;
        }

        private Bitmap loadBitmap(InputStream inputStream) {
            return BitmapFactory.decodeStream(inputStream);
        }

        private Bitmap loadImage(String str) {
            InputStream inputStream;
            String b = i.b(this.baseFile, str);
            String a = i.a(str);
            try {
                inputStream = this.reader.a(b);
                try {
                    Bitmap loadSVG = a.equalsIgnoreCase("svg") ? loadSVG(inputStream) : loadBitmap(inputStream);
                    b.a(inputStream);
                    return loadSVG;
                } catch (IOException e) {
                    e = e;
                    try {
                        Log.e(AnimatedOverlayAsset.LOG_TAG, "Error reading frame image", e);
                        b.a(inputStream);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        b.a(inputStream);
                        throw th;
                    }
                }
            } catch (IOException e2) {
                e = e2;
                inputStream = null;
                Log.e(AnimatedOverlayAsset.LOG_TAG, "Error reading frame image", e);
                b.a(inputStream);
                return null;
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
                b.a(inputStream);
                throw th;
            }
        }

        private Bitmap loadSVG(InputStream inputStream) {
            PictureDrawable a = SVGParser.a(inputStream).a();
            Bitmap createBitmap = Bitmap.createBitmap((int) Math.floor((double) (((float) this.overlaySpec.width) * this.vectorScale)), (int) Math.floor((double) (((float) this.overlaySpec.height) * this.vectorScale)), Config.ARGB_8888);
            Canvas canvas = new Canvas(createBitmap);
            a.setBounds(0, 0, createBitmap.getWidth(), createBitmap.getHeight());
            a.draw(canvas);
            return createBitmap;
        }

        public boolean needRendererReawakeOnEditResize() {
            return true;
        }

        public void onAsleep(LayerRenderer layerRenderer) {
            this.bitmapCache.evictAll();
            b.a(this.reader);
        }

        public boolean onRefresh(LayerRenderer layerRenderer, RectF rectF, String str) {
            return false;
        }

        /* JADX WARNING: Removed duplicated region for block: B:32:0x009c  */
        /* JADX WARNING: Removed duplicated region for block: B:39:0x00b0 A[SYNTHETIC] */
        public void onRender(LayerRenderer layerRenderer, OverlayMotion overlayMotion, int i, int i2) {
            Bitmap image;
            if (this.overlaySpec != null) {
                int g = ((layerRenderer.g() - i) * this.overlaySpec.fps) / 1000;
                int size = this.overlaySpec.layers.size();
                for (int i3 = 0; i3 < size; i3++) {
                    Layer layer = (Layer) this.overlaySpec.layers.get(i3);
                    int i4 = (layer.iterationCount < 0 || g <= (layer.iterationCount * layer.duration) - 1) ? g : (layer.iterationCount * layer.duration) - 1;
                    boolean z = (i4 / layer.duration) % 2 == 0;
                    int i5 = i4 % layer.duration;
                    switch (layer.direction) {
                        case REVERSE:
                            i5 = layer.duration - i5;
                            break;
                        case ALTERNATE:
                            if (!z) {
                                i5 = layer.duration - i5;
                                break;
                            }
                            break;
                        case ALTERNATE_REVERSE:
                            if (z) {
                                i5 = layer.duration - i5;
                                break;
                            }
                            break;
                    }
                    int size2 = layer.frames.size();
                    Frame frame = null;
                    int i6 = 0;
                    int i7 = 0;
                    while (i6 < size2) {
                        frame = (Frame) layer.frames.get(i6);
                        if (i5 <= i7) {
                            if (frame != null && !frame.blank) {
                                image = getImage(frame.src);
                                if (image == null) {
                                    layerRenderer.a(image, this.bounds.left, this.bounds.top, this.bounds.right, this.bounds.bottom);
                                }
                            }
                        } else {
                            i7 += Math.max(1, frame.hold);
                            i6++;
                        }
                    }
                    image = getImage(frame.src);
                    if (image == null) {
                    }
                }
            }
        }
    }

    public AnimatedOverlayAsset(f fVar) throws IOException, XmlPullParserException {
        InputStream inputStream;
        AssetPackageReader assetPackageReader;
        super(fVar);
        InputStream inputStream2 = null;
        try {
            assetPackageReader = getAssetPackageReader();
            try {
                inputStream = assetPackageReader.a(fVar.getFilePath());
            } catch (Throwable th) {
                th = th;
                inputStream = null;
                b.a(inputStream2);
                b.a(inputStream);
                b.a(assetPackageReader);
                throw th;
            }
            try {
                this.overlaySpec = OverlaySpec.fromInputStream(inputStream);
                if ((this.overlaySpec.width <= 0 || this.overlaySpec.height <= 0) && this.overlaySpec.layers != null && this.overlaySpec.layers.size() > 0) {
                    Layer layer = (Layer) this.overlaySpec.layers.get(0);
                    if (layer.frames != null && layer.frames.size() > 0) {
                        Frame frame = (Frame) layer.frames.get(0);
                        if (!frame.blank) {
                            InputStream a = assetPackageReader.a(frame.src);
                            try {
                                Picture b = SVGParser.a(a).b();
                                this.overlaySpec.width = b.getWidth();
                                this.overlaySpec.height = b.getHeight();
                                inputStream2 = a;
                            } catch (Throwable th2) {
                                InputStream inputStream3 = a;
                                th = th2;
                                inputStream2 = inputStream3;
                                b.a(inputStream2);
                                b.a(inputStream);
                                b.a(assetPackageReader);
                                throw th;
                            }
                        }
                    }
                }
                if (this.overlaySpec.width <= 0 || this.overlaySpec.height <= 0) {
                    this.overlaySpec.width = 100;
                    this.overlaySpec.height = 100;
                }
                b.a(inputStream2);
                b.a(inputStream);
                b.a(assetPackageReader);
            } catch (Throwable th3) {
                th = th3;
                b.a(inputStream2);
                b.a(inputStream);
                b.a(assetPackageReader);
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            inputStream = null;
            assetPackageReader = null;
            b.a(inputStream2);
            b.a(inputStream);
            b.a(assetPackageReader);
            throw th;
        }
    }

    public int getDefaultDuration() {
        if (this.overlaySpec.duration > 0) {
            return (this.overlaySpec.duration * 1000) / this.overlaySpec.fps;
        }
        int i = 0;
        for (Layer layer : this.overlaySpec.layers) {
            if (layer.iterationCount < 0) {
                return 0;
            }
            i = Math.max(i, ((layer.duration * layer.iterationCount) * 1000) / this.overlaySpec.fps);
        }
        if (i > 30000) {
            return 0;
        }
        if (i < 1000) {
            return 1000;
        }
        return i;
    }

    public int getIntrinsicHeight() {
        return this.overlaySpec.height;
    }

    public int getIntrinsicWidth() {
        return this.overlaySpec.width;
    }

    public AwakeAsset onAwake(LayerRenderer layerRenderer, RectF rectF, String str, Map<String, String> map) {
        AssetPackageReader assetPackageReader;
        try {
            assetPackageReader = getAssetPackageReader();
        } catch (IOException e) {
            Log.e(LOG_TAG, "Error getting package reader", e);
            assetPackageReader = null;
        }
        AssetPackageReader assetPackageReader2 = assetPackageReader;
        int max = 2000 / Math.max(this.overlaySpec.width, this.overlaySpec.height);
        AwakeAssetImpl awakeAssetImpl = new AwakeAssetImpl(rectF, this.overlaySpec, assetPackageReader2, getItemInfo().getFilePath(), 1.0f);
        return awakeAssetImpl;
    }
}

package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView.Renderer;
import com.miui.filtersdk.filter.base.GPUImageFilter;
import com.miui.filtersdk.utils.Rotation;
import com.miui.filtersdk.utils.TextureRotationUtil;
import com.miui.gallery.editor.photo.core.imports.filter.render.GPUImage.ScaleType;
import com.miui.gallery.util.Log;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.LinkedList;
import java.util.Queue;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

@TargetApi(11)
public class GPUImageRenderer implements Renderer {
    static final float[] CUBE = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    private float mBackgroundBlue = 0.0f;
    private float mBackgroundGreen = 0.0f;
    private float mBackgroundRed = 0.0f;
    /* access modifiers changed from: private */
    public BoundLinesFilter mBoundLinesFilter;
    private boolean mDrawBoundLines;
    private GPUImageFilter mDrawFilter;
    private boolean mDrawForSmallPic;
    /* access modifiers changed from: private */
    public GPUImageFilter mFilter;
    private boolean mFlipHorizontal;
    private boolean mFlipVertical;
    private final FloatBuffer mGLCubeBuffer;
    private final FloatBuffer mGLTextureBuffer;
    /* access modifiers changed from: private */
    public int mGLTextureId = -1;
    /* access modifiers changed from: private */
    public int mImageHeight;
    /* access modifiers changed from: private */
    public int mImageWidth;
    private int mOutputHeight;
    private int mOutputWidth;
    private Rotation mRotation;
    private final Queue<Runnable> mRunOnDraw;
    private final Queue<Runnable> mRunOnDrawEnd;
    private ScaleType mScaleType = ScaleType.CENTER_INSIDE;
    public final Object mSurfaceChangedWaiter = new Object();
    private SurfaceTexture mSurfaceTexture = null;

    public GPUImageRenderer(GPUImageFilter gPUImageFilter) {
        this.mFilter = gPUImageFilter;
        this.mRunOnDraw = new LinkedList();
        this.mRunOnDrawEnd = new LinkedList();
        this.mGLCubeBuffer = ByteBuffer.allocateDirect(CUBE.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.mGLCubeBuffer.put(CUBE).position(0);
        this.mGLTextureBuffer = ByteBuffer.allocateDirect(TextureRotationUtil.TEXTURE_NO_ROTATION.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        setRotation(Rotation.NORMAL, false, false);
        this.mBoundLinesFilter = new BoundLinesFilter();
        this.mDrawFilter = new GPUImageFilter();
    }

    private float addDistance(float f, float f2) {
        return f == 0.0f ? f2 : 1.0f - f2;
    }

    private void adjustImageScaling() {
        float[] fArr;
        if (this.mImageWidth != 0 && this.mImageHeight != 0) {
            float f = (float) this.mOutputWidth;
            float f2 = (float) this.mOutputHeight;
            if (this.mRotation == Rotation.ROTATION_270 || this.mRotation == Rotation.ROTATION_90) {
                f = (float) this.mOutputHeight;
                f2 = (float) this.mOutputWidth;
            }
            float max = Math.max(f / ((float) this.mImageWidth), f2 / ((float) this.mImageHeight));
            float round = ((float) Math.round(((float) this.mImageWidth) * max)) / f;
            float round2 = ((float) Math.round(((float) this.mImageHeight) * max)) / f2;
            float[] fArr2 = CUBE;
            float[] rotation = TextureRotationUtil.getRotation(this.mRotation, this.mFlipHorizontal, this.mFlipVertical);
            if (this.mScaleType == ScaleType.CENTER_CROP) {
                float f3 = (1.0f - (1.0f / round)) / 2.0f;
                float f4 = (1.0f - (1.0f / round2)) / 2.0f;
                fArr = new float[]{addDistance(rotation[0], f3), addDistance(rotation[1], f4), addDistance(rotation[2], f3), addDistance(rotation[3], f4), addDistance(rotation[4], f3), addDistance(rotation[5], f4), addDistance(rotation[6], f3), addDistance(rotation[7], f4)};
            } else {
                fArr2 = new float[]{CUBE[0] / round2, CUBE[1] / round, CUBE[2] / round2, CUBE[3] / round, CUBE[4] / round2, CUBE[5] / round, CUBE[6] / round2, CUBE[7] / round};
                fArr = rotation;
            }
            this.mGLCubeBuffer.clear();
            this.mGLCubeBuffer.put(fArr2).position(0);
            this.mGLTextureBuffer.clear();
            this.mGLTextureBuffer.put(fArr).position(0);
        }
    }

    /* access modifiers changed from: private */
    public void initForFilter() {
        this.mFilter.onInputSizeChanged(this.mOutputWidth, this.mOutputHeight);
        this.mFilter.onDisplaySizeChanged(this.mOutputWidth, this.mOutputHeight);
        if (this.mImageWidth >= this.mOutputWidth || this.mImageHeight >= this.mOutputHeight) {
            this.mDrawForSmallPic = false;
        } else {
            this.mDrawForSmallPic = true;
            this.mFilter.initFrameBuffers(this.mImageWidth, this.mImageHeight);
        }
        Log.d("GPUImageRenderer", "initForFilter draw for small:%b", (Object) Boolean.valueOf(this.mDrawForSmallPic));
    }

    private void runAll(Queue<Runnable> queue) {
        if (queue != null) {
            synchronized (queue) {
                while (!queue.isEmpty()) {
                    ((Runnable) queue.poll()).run();
                }
            }
        }
    }

    public void deleteImage() {
        runOnDraw(new Runnable() {
            public void run() {
                GLES20.glDeleteTextures(1, new int[]{GPUImageRenderer.this.mGLTextureId}, 0);
                GPUImageRenderer.this.mGLTextureId = -1;
            }
        });
    }

    public boolean isFlippedHorizontally() {
        return this.mFlipHorizontal;
    }

    public boolean isFlippedVertically() {
        return this.mFlipVertical;
    }

    public void onDrawFrame(GL10 gl10) {
        GLES20.glClear(16640);
        runAll(this.mRunOnDraw);
        if (this.mDrawForSmallPic) {
            this.mDrawFilter.onDrawFrame(this.mFilter.onDrawToTexture(this.mGLTextureId), this.mGLCubeBuffer, this.mGLTextureBuffer);
        } else {
            this.mFilter.onDrawFrame(this.mGLTextureId, this.mGLCubeBuffer, this.mGLTextureBuffer);
        }
        if (this.mDrawBoundLines) {
            GLES20.glEnable(3042);
            GLES20.glBlendFunc(1, 771);
            this.mBoundLinesFilter.onDrawFrame(this.mGLTextureId, this.mGLCubeBuffer, this.mGLTextureBuffer);
            GLES20.glDisable(3042);
        }
        runAll(this.mRunOnDrawEnd);
        if (this.mSurfaceTexture != null) {
            this.mSurfaceTexture.updateTexImage();
        }
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        if (!(this.mOutputWidth == i && this.mOutputHeight == i2)) {
            this.mOutputWidth = i;
            this.mOutputHeight = i2;
            adjustImageScaling();
        }
        GLES20.glViewport(0, 0, i, i2);
        initForFilter();
        this.mDrawFilter.onInputSizeChanged(i, i2);
        this.mBoundLinesFilter.onInputSizeChanged(i, i2);
        this.mBoundLinesFilter.onDisplaySizeChanged(i, i2);
        synchronized (this.mSurfaceChangedWaiter) {
            this.mSurfaceChangedWaiter.notifyAll();
        }
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        GLES20.glClearColor(this.mBackgroundRed, this.mBackgroundGreen, this.mBackgroundBlue, 1.0f);
        GLES20.glDisable(2929);
        this.mFilter.init();
        this.mBoundLinesFilter.init();
        this.mDrawFilter.init();
    }

    /* access modifiers changed from: protected */
    public void runOnDraw(Runnable runnable) {
        synchronized (this.mRunOnDraw) {
            this.mRunOnDraw.add(runnable);
        }
    }

    public void setBackgroundColor(float f, float f2, float f3) {
        this.mBackgroundRed = f;
        this.mBackgroundGreen = f2;
        this.mBackgroundBlue = f3;
    }

    public void setDrawBoundLines(boolean z) {
        this.mDrawBoundLines = z;
    }

    public void setFilter(final GPUImageFilter gPUImageFilter) {
        runOnDraw(new Runnable() {
            public void run() {
                GPUImageFilter access$000 = GPUImageRenderer.this.mFilter;
                GPUImageRenderer.this.mFilter = gPUImageFilter;
                if (access$000 != null) {
                    access$000.destroy();
                }
                GPUImageRenderer.this.mFilter.init();
                GPUImageRenderer.this.initForFilter();
            }
        });
    }

    public void setGLTextureId(int i, int i2, int i3) {
        this.mGLTextureId = i;
        if (this.mImageWidth != i2 || this.mImageHeight != i3) {
            this.mImageWidth = i2;
            this.mImageHeight = i3;
            adjustImageScaling();
        }
    }

    public void setImageBitmap(final Bitmap bitmap, final boolean z) {
        if (bitmap != null && !bitmap.isRecycled()) {
            this.mImageWidth = bitmap.getWidth();
            this.mImageHeight = bitmap.getHeight();
            runOnDraw(new Runnable() {
                public void run() {
                    GPUImageRenderer.this.mGLTextureId = OpenGlUtils.loadTexture(bitmap, GPUImageRenderer.this.mGLTextureId, z);
                    GPUImageRenderer.this.mBoundLinesFilter.setImageSize(GPUImageRenderer.this.mImageWidth, GPUImageRenderer.this.mImageHeight);
                }
            });
        }
    }

    public void setRotation(Rotation rotation) {
        this.mRotation = rotation;
    }

    public void setRotation(Rotation rotation, boolean z, boolean z2) {
        this.mFlipHorizontal = z;
        this.mFlipVertical = z2;
        setRotation(rotation);
    }

    public void setScaleType(ScaleType scaleType) {
        this.mScaleType = scaleType;
    }
}

package com.miui.gallery.editor.photo.widgets.base;

import android.content.Context;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.GLSurfaceView.Renderer;
import android.util.AttributeSet;
import com.miui.filtersdk.utils.Rotation;
import com.miui.filtersdk.utils.TextureRotationUtil;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public abstract class MagicBaseView extends GLSurfaceView implements Renderer {
    protected FloatBuffer gLCubeBuffer;
    protected FloatBuffer gLTextureBuffer;
    protected int imageHeight;
    protected int imageWidth;
    protected ScaleType scaleType;
    protected int surfaceHeight;
    protected int surfaceWidth;
    protected int textureId;

    public enum ScaleType {
        CENTER_INSIDE,
        CENTER_CROP,
        FIT_XY
    }

    public MagicBaseView(Context context) {
        this(context, null);
    }

    public MagicBaseView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.textureId = -1;
        this.scaleType = ScaleType.FIT_XY;
        this.gLCubeBuffer = ByteBuffer.allocateDirect(TextureRotationUtil.CUBE.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.gLCubeBuffer.put(TextureRotationUtil.CUBE).position(0);
        this.gLTextureBuffer = ByteBuffer.allocateDirect(TextureRotationUtil.TEXTURE_NO_ROTATION.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.gLTextureBuffer.put(TextureRotationUtil.TEXTURE_NO_ROTATION).position(0);
        setEGLContextClientVersion(2);
        setRenderer(this);
        setRenderMode(0);
    }

    private float addDistance(float f, float f2) {
        return f == 0.0f ? f2 : 1.0f - f2;
    }

    /* access modifiers changed from: protected */
    public void adjustSize(int i, int i2, int i3, int i4, int i5, boolean z, boolean z2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        float f;
        float f2;
        float[] rotation = TextureRotationUtil.getRotation(Rotation.fromInt(i5), z, z2);
        float[] fArr = TextureRotationUtil.CUBE;
        float f3 = (float) i3;
        float f4 = (float) i;
        float f5 = (float) i4;
        float f6 = (float) i2;
        float max = Math.max(f3 / f4, f5 / f6);
        float round = ((float) Math.round(f4 * max)) / f3;
        float round2 = ((float) Math.round(f6 * max)) / f5;
        if (this.scaleType == ScaleType.CENTER_INSIDE) {
            fArr = new float[]{TextureRotationUtil.CUBE[0] / round2, TextureRotationUtil.CUBE[1] / round, TextureRotationUtil.CUBE[2] / round2, TextureRotationUtil.CUBE[3] / round, TextureRotationUtil.CUBE[4] / round2, TextureRotationUtil.CUBE[5] / round, TextureRotationUtil.CUBE[6] / round2, TextureRotationUtil.CUBE[7] / round};
        } else if (this.scaleType != ScaleType.FIT_XY && this.scaleType == ScaleType.CENTER_CROP) {
            if (Rotation.fromInt(i5) == Rotation.ROTATION_90 || Rotation.fromInt(i5) == Rotation.ROTATION_270) {
                f = (1.0f - (1.0f / round)) / 2.0f;
                f2 = (1.0f - (1.0f / round2)) / 2.0f;
            } else {
                f2 = (1.0f - (1.0f / round)) / 2.0f;
                f = (1.0f - (1.0f / round2)) / 2.0f;
            }
            rotation = new float[]{addDistance(rotation[0], f2), addDistance(rotation[1], f), addDistance(rotation[2], f2), addDistance(rotation[3], f), addDistance(rotation[4], f2), addDistance(rotation[5], f), addDistance(rotation[6], f2), addDistance(rotation[7], f)};
        }
        floatBuffer.clear();
        floatBuffer.put(fArr).position(0);
        floatBuffer2.clear();
        floatBuffer2.put(rotation).position(0);
    }

    /* access modifiers changed from: protected */
    public void adjustSize(int i, boolean z, boolean z2) {
        adjustSize(this.imageWidth, this.imageHeight, this.surfaceWidth, this.surfaceHeight, i, z, z2, this.gLCubeBuffer, this.gLTextureBuffer);
    }

    public void onDrawFrame(GL10 gl10) {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glClear(16640);
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        GLES20.glViewport(0, 0, i, i2);
        this.surfaceWidth = i;
        this.surfaceHeight = i2;
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        GLES20.glDisable(3024);
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glEnable(2884);
        GLES20.glEnable(2929);
    }
}

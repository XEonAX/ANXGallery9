package com.miui.gallery.editor.photo.widgets.glview.shader;

import android.opengl.GLES20;
import com.miui.filtersdk.utils.OpenGlUtils;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.LinkedList;

public class GLTextureShader {
    public static final float[] CUBE = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    public static final float[] CUBE_REVERSE = {-1.0f, 1.0f, 1.0f, 1.0f, -1.0f, -1.0f, 1.0f, -1.0f};
    public static final float[] TEXTURE_NO_ROTATION = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    private int mGLAttribPosition;
    private int mGLAttribTextureCoordinate;
    private FloatBuffer mGLCubeBuffer;
    private int mGLProgId;
    private FloatBuffer mGLTextureBuffer;
    private int mGLUniformTexture;
    private final LinkedList<Runnable> mRunOnDraw;

    public GLTextureShader() {
        this("attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}", "varying highp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}");
    }

    public GLTextureShader(String str, String str2) {
        init(str, str2);
        this.mRunOnDraw = new LinkedList<>();
    }

    public void destroy() {
        GLES20.glDeleteProgram(this.mGLProgId);
    }

    public void draw(int i) {
        draw(i, CUBE);
    }

    public void draw(int i, float[] fArr) {
        draw(i, fArr, TEXTURE_NO_ROTATION);
    }

    public void draw(int i, float[] fArr, float[] fArr2) {
        GLES20.glUseProgram(this.mGLProgId);
        onPreDraw();
        runPendingOnDrawTasks();
        this.mGLCubeBuffer.put(fArr);
        this.mGLCubeBuffer.position(0);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, this.mGLCubeBuffer);
        this.mGLTextureBuffer.put(fArr2);
        this.mGLTextureBuffer.position(0);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, this.mGLTextureBuffer);
        if (i != -1) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, i);
            GLES20.glUniform1i(this.mGLUniformTexture, 0);
        }
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        GLES20.glBindTexture(3553, 0);
    }

    public void drawFBO(int i) {
        draw(i, CUBE_REVERSE);
    }

    public int getProgram() {
        return this.mGLProgId;
    }

    /* access modifiers changed from: protected */
    public void init(String str, String str2) {
        this.mGLProgId = OpenGlUtils.loadProgram(str, str2);
        this.mGLAttribPosition = GLES20.glGetAttribLocation(this.mGLProgId, "position");
        this.mGLUniformTexture = GLES20.glGetUniformLocation(this.mGLProgId, "inputImageTexture");
        this.mGLAttribTextureCoordinate = GLES20.glGetAttribLocation(this.mGLProgId, "inputTextureCoordinate");
        this.mGLTextureBuffer = ByteBuffer.allocateDirect(TEXTURE_NO_ROTATION.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.mGLTextureBuffer.put(TEXTURE_NO_ROTATION).position(0);
        this.mGLCubeBuffer = ByteBuffer.allocateDirect(CUBE.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.mGLCubeBuffer.put(CUBE).position(0);
    }

    /* access modifiers changed from: protected */
    public void onPreDraw() {
    }

    /* access modifiers changed from: protected */
    public void runOnDraw(Runnable runnable) {
        synchronized (this.mRunOnDraw) {
            this.mRunOnDraw.addLast(runnable);
        }
    }

    /* access modifiers changed from: protected */
    public void runPendingOnDrawTasks() {
        while (!this.mRunOnDraw.isEmpty()) {
            ((Runnable) this.mRunOnDraw.removeFirst()).run();
        }
    }

    public void setFloat(final int i, final float f) {
        runOnDraw(new Runnable() {
            public void run() {
                GLES20.glUniform1f(i, f);
            }
        });
    }
}

package com.miui.gallery.editor.photo.core.imports.mosaic.shader;

import android.opengl.GLES20;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;

public abstract class GLTextureSizeShader extends GLTextureShader {
    protected int mGLAttrScale;
    protected int mGLAttrTextureHeight;
    protected int mGLAttrTextureWidth;
    protected float mScale;
    protected int mTextureHeight;
    protected int mTextureWidth;

    public GLTextureSizeShader(String str, int i, int i2) {
        this("attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}", str, i, i2);
    }

    public GLTextureSizeShader(String str, String str2, int i, int i2) {
        super(str, str2);
        this.mScale = 1.0f;
        this.mTextureWidth = i;
        this.mTextureHeight = i2;
    }

    /* access modifiers changed from: protected */
    public void init(String str, String str2) {
        super.init(str, str2);
        this.mGLAttrTextureWidth = GLES20.glGetUniformLocation(getProgram(), "textureWidth");
        this.mGLAttrTextureHeight = GLES20.glGetUniformLocation(getProgram(), "textureHeight");
        this.mGLAttrScale = GLES20.glGetUniformLocation(getProgram(), "scale");
    }

    /* access modifiers changed from: protected */
    public void onPreDraw() {
        super.onPreDraw();
        GLES20.glUniform1i(this.mGLAttrTextureWidth, this.mTextureWidth);
        GLES20.glUniform1i(this.mGLAttrTextureHeight, this.mTextureHeight);
        GLES20.glUniform1f(this.mGLAttrScale, this.mScale);
    }

    public void setScale(float f) {
        this.mScale = f;
    }
}

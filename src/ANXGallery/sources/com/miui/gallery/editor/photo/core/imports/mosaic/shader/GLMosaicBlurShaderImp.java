package com.miui.gallery.editor.photo.core.imports.mosaic.shader;

import android.opengl.GLES20;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLShaderGroup;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;

public class GLMosaicBlurShaderImp extends GLShaderGroup {
    private float mRatio = 1.7f;

    public GLMosaicBlurShaderImp(int i, int i2, int i3, int i4) {
        super(i, i2, i3, i4);
        addShader(new GLMosaicBlurShader(i, i2));
        addShader(new GLMosaicBlurShader(i, i2));
        notifyShaderAdded();
    }

    /* access modifiers changed from: protected */
    public void onPreDraw() {
        GLTextureShader gLTextureShader = (GLTextureShader) this.mShaders.get(0);
        float min = Math.min((this.mRatio * this.mScale) / ((float) this.mTextureWidth), (this.mRatio * this.mScale) / ((float) this.mTextureHeight));
        int glGetUniformLocation = GLES20.glGetUniformLocation(gLTextureShader.getProgram(), "texelWidthOffset");
        int glGetUniformLocation2 = GLES20.glGetUniformLocation(gLTextureShader.getProgram(), "texelHeightOffset");
        gLTextureShader.setFloat(glGetUniformLocation, min);
        gLTextureShader.setFloat(glGetUniformLocation2, 0.0f);
        GLTextureShader gLTextureShader2 = (GLTextureShader) this.mShaders.get(1);
        int glGetUniformLocation3 = GLES20.glGetUniformLocation(gLTextureShader2.getProgram(), "texelWidthOffset");
        int glGetUniformLocation4 = GLES20.glGetUniformLocation(gLTextureShader2.getProgram(), "texelHeightOffset");
        gLTextureShader2.setFloat(glGetUniformLocation3, 0.0f);
        gLTextureShader2.setFloat(glGetUniformLocation4, min);
    }
}

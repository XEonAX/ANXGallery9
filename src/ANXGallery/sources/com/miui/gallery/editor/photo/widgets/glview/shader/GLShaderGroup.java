package com.miui.gallery.editor.photo.widgets.glview.shader;

import android.opengl.GLES20;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLTextureSizeShader;
import com.miui.gallery.editor.photo.widgets.glview.GLFBOManager;
import java.util.ArrayList;
import java.util.List;

public class GLShaderGroup extends GLTextureSizeShader {
    private GLFBOManager[] mGLFBOManagers;
    protected List<GLTextureShader> mShaders = new ArrayList();
    protected int mTextureHeight;
    protected int mTextureWidth;
    private int mViewHeight;
    private int mViewWidth;

    public GLShaderGroup(int i, int i2, int i3, int i4) {
        super(null, null, i, i2);
        this.mTextureWidth = i;
        this.mTextureHeight = i2;
        this.mViewWidth = i3;
        this.mViewHeight = i4;
    }

    /* access modifiers changed from: protected */
    public void addShader(GLTextureShader gLTextureShader) {
        this.mShaders.add(gLTextureShader);
    }

    public void destroy() {
        GLFBOManager[] gLFBOManagerArr;
        for (GLTextureShader destroy : this.mShaders) {
            destroy.destroy();
        }
        if (this.mGLFBOManagers != null) {
            for (GLFBOManager gLFBOManager : this.mGLFBOManagers) {
                if (gLFBOManager != null) {
                    gLFBOManager.clear();
                }
            }
        }
    }

    public void draw(int i, float[] fArr, float[] fArr2) {
    }

    public int getEffectedTexture(int i) {
        onPreDraw();
        for (int i2 = 0; i2 < this.mShaders.size(); i2++) {
            GLTextureShader gLTextureShader = (GLTextureShader) this.mShaders.get(i2);
            this.mGLFBOManagers[i2].bind();
            GLES20.glClear(16640);
            int i3 = i2 - 1;
            if (i3 >= 0) {
                gLTextureShader.drawFBO(this.mGLFBOManagers[i3].getTextureId());
            } else {
                gLTextureShader.draw(i);
            }
            this.mGLFBOManagers[i2].unBind();
        }
        return this.mGLFBOManagers[this.mGLFBOManagers.length - 1].getTextureId();
    }

    /* access modifiers changed from: protected */
    public void init(String str, String str2) {
    }

    /* access modifiers changed from: protected */
    public void notifyShaderAdded() {
        this.mGLFBOManagers = new GLFBOManager[this.mShaders.size()];
        for (int i = 0; i < this.mGLFBOManagers.length; i++) {
            this.mGLFBOManagers[i] = new GLFBOManager(this.mTextureWidth, this.mTextureHeight, this.mViewWidth, this.mViewHeight);
        }
    }

    /* access modifiers changed from: protected */
    public void onPreDraw() {
    }
}

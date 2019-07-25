package com.miui.gallery.editor.photo.widgets.glview;

import android.opengl.GLES20;
import android.util.Log;

public class GLFBOManager {
    private int mFramebufferId;
    private int mHeight;
    private int mTextureId;
    private int mViewHeight;
    private int mViewWidth;
    private int mWidth;

    public GLFBOManager(int i, int i2, int i3, int i4) {
        this(i, i2, i3, i4, true);
    }

    public GLFBOManager(int i, int i2, int i3, int i4, boolean z) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mViewWidth = i3;
        this.mViewHeight = i4;
        init(z);
    }

    private void init(boolean z) {
        int[] iArr = new int[1];
        GLES20.glGenFramebuffers(1, iArr, 0);
        this.mFramebufferId = iArr[0];
        int[] iArr2 = new int[1];
        GLES20.glGenTextures(1, iArr2, 0);
        this.mTextureId = iArr2[0];
        GLES20.glBindTexture(3553, this.mTextureId);
        GLES20.glTexParameterf(3553, 10241, 9729.0f);
        GLES20.glTexParameterf(3553, 10240, 9729.0f);
        GLES20.glTexParameterf(3553, 10242, 33071.0f);
        GLES20.glTexParameterf(3553, 10243, 33071.0f);
        if (z) {
            GLES20.glTexImage2D(3553, 0, 6408, this.mWidth, this.mHeight, 0, 6408, 5121, null);
        } else {
            GLES20.glTexImage2D(3553, 0, 6407, this.mWidth, this.mHeight, 0, 6407, 5121, null);
        }
    }

    public void bind() {
        GLES20.glBindFramebuffer(36160, this.mFramebufferId);
        GLES20.glBindTexture(3553, this.mTextureId);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mTextureId, 0);
        if (GLES20.glCheckFramebufferStatus(36160) != 36053) {
            Log.i("FBOManager", "Framebuffer error");
        }
        GLES20.glViewport(0, 0, this.mWidth, this.mHeight);
    }

    public void clear() {
        GLES20.glDeleteFramebuffers(1, new int[]{this.mFramebufferId}, 0);
        GLES20.glDeleteTextures(1, new int[]{this.mTextureId}, 0);
    }

    public int getTextureId() {
        return this.mTextureId;
    }

    public void unBind() {
        GLES20.glBindFramebuffer(36160, 0);
        GLES20.glBindTexture(3553, 0);
        GLES20.glViewport(0, 0, this.mViewWidth, this.mViewHeight);
    }
}

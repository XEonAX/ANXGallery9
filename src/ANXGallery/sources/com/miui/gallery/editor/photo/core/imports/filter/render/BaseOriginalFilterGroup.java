package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.opengl.GLES20;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.gallery.editor.blocksdk.Block;
import java.nio.FloatBuffer;
import java.util.List;

public class BaseOriginalFilterGroup extends BaseOriginalFilter implements IFilterEmptyValidate, ISpecialProcessFilter {
    private List<BaseOriginalFilter> mFilters;
    private int[] mGroupFrameBufferTextures = null;
    private int[] mGroupFrameBuffers = null;
    private int mGroupFrameHeight = -1;
    private int mGroupFrameWidth = -1;

    public BaseOriginalFilterGroup() {
        super("", "");
    }

    public BaseOriginalFilterGroup(List<BaseOriginalFilter> list) {
        super("", "");
        this.mFilters = list;
    }

    private void destroyGroupFrameBuffers() {
        if (this.mGroupFrameBufferTextures != null) {
            GLES20.glDeleteTextures(this.mGroupFrameBufferTextures.length, this.mGroupFrameBufferTextures, 0);
            this.mGroupFrameBufferTextures = null;
        }
        if (this.mGroupFrameBuffers != null) {
            GLES20.glDeleteFramebuffers(this.mGroupFrameBuffers.length, this.mGroupFrameBuffers, 0);
            this.mGroupFrameBuffers = null;
        }
    }

    public int getSpecialBoard() {
        int i = 0;
        for (BaseOriginalFilter baseOriginalFilter : this.mFilters) {
            if (baseOriginalFilter instanceof ISpecialProcessFilter) {
                i = Math.max(i, ((ISpecialProcessFilter) baseOriginalFilter).getSpecialBoard());
            }
        }
        return i;
    }

    public void init() {
        for (BaseOriginalFilter init : this.mFilters) {
            init.init();
        }
    }

    public void initFrameBuffers(int i, int i2) {
        for (int i3 = 0; i3 < this.mFilters.size(); i3++) {
            ((BaseOriginalFilter) this.mFilters.get(i3)).initFrameBuffers(i, i2);
        }
    }

    public boolean isEmpty() {
        for (BaseOriginalFilter baseOriginalFilter : this.mFilters) {
            if (baseOriginalFilter instanceof IFilterEmptyValidate) {
                if (!((IFilterEmptyValidate) baseOriginalFilter).isEmpty()) {
                }
            }
            return false;
        }
        return true;
    }

    public void onDestroy() {
        super.onDestroy();
        for (BaseOriginalFilter destroy : this.mFilters) {
            destroy.destroy();
        }
        destroyGroupFrameBuffers();
    }

    public void onDisplaySizeChanged(int i, int i2) {
        super.onDisplaySizeChanged(i, i2);
        for (int i3 = 0; i3 < this.mFilters.size(); i3++) {
            ((BaseOriginalFilter) this.mFilters.get(i3)).onDisplaySizeChanged(i, i2);
        }
    }

    public int onDrawFrame(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        if (this.mGroupFrameBuffers == null || this.mGroupFrameBufferTextures == null) {
            return -1;
        }
        int size = this.mFilters.size();
        int i2 = i;
        int i3 = 0;
        while (true) {
            boolean z = true;
            if (i3 >= size) {
                return 1;
            }
            BaseOriginalFilter baseOriginalFilter = (BaseOriginalFilter) this.mFilters.get(i3);
            if (i3 >= size - 1) {
                z = false;
            }
            if (z) {
                GLES20.glViewport(0, 0, this.mInputWidth, this.mInputHeight);
                GLES20.glBindFramebuffer(36160, this.mGroupFrameBuffers[i3]);
                baseOriginalFilter.onDrawFrame(i2, this.mGLCubeBuffer, this.mGLTextureBuffer);
                GLES20.glBindFramebuffer(36160, 0);
                i2 = this.mGroupFrameBufferTextures[i3];
            } else {
                baseOriginalFilter.onDrawFrame(i2, floatBuffer, floatBuffer2);
            }
            i3++;
        }
    }

    public int onDrawToTexture(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        int size = this.mFilters.size();
        int i2 = i;
        int i3 = 0;
        while (i3 < size) {
            BaseOriginalFilter baseOriginalFilter = (BaseOriginalFilter) this.mFilters.get(i3);
            i2 = i3 < size + -1 ? baseOriginalFilter.onDrawToTexture(i2, this.mGLCubeBuffer, this.mGLTextureBuffer) : baseOriginalFilter.onDrawToTexture(i2, floatBuffer, floatBuffer2);
            i3++;
        }
        return i2;
    }

    public void onInputSizeChanged(int i, int i2) {
        int i3 = i;
        int i4 = i2;
        super.onInputSizeChanged(i, i2);
        int size = this.mFilters.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((BaseOriginalFilter) this.mFilters.get(i5)).onInputSizeChanged(i3, i4);
        }
        if (!(this.mGroupFrameBuffers == null || (this.mGroupFrameWidth == i3 && this.mGroupFrameHeight == i4 && this.mGroupFrameBuffers.length == size - 1))) {
            destroyGroupFrameBuffers();
            this.mGroupFrameWidth = i3;
            this.mGroupFrameHeight = i4;
        }
        if (this.mGroupFrameBuffers == null) {
            int i6 = 1;
            int i7 = size - 1;
            this.mGroupFrameBuffers = new int[i7];
            this.mGroupFrameBufferTextures = new int[i7];
            int i8 = 0;
            while (i8 < i7) {
                GLES20.glGenFramebuffers(i6, this.mGroupFrameBuffers, i8);
                GLES20.glGenTextures(i6, this.mGroupFrameBufferTextures, i8);
                GLES20.glBindTexture(3553, this.mGroupFrameBufferTextures[i8]);
                GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, 5121, null);
                GLES20.glTexParameterf(3553, 10240, 9729.0f);
                GLES20.glTexParameterf(3553, 10241, 9729.0f);
                GLES20.glTexParameterf(3553, 10242, 33071.0f);
                GLES20.glTexParameterf(3553, 10243, 33071.0f);
                GLES20.glBindFramebuffer(36160, this.mGroupFrameBuffers[i8]);
                GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mGroupFrameBufferTextures[i8], 0);
                GLES20.glBindTexture(3553, 0);
                GLES20.glBindFramebuffer(36160, 0);
                i8++;
                i6 = 1;
            }
        }
    }

    public void setBlock(Block block, int i) {
        for (BaseOriginalFilter baseOriginalFilter : this.mFilters) {
            if (baseOriginalFilter instanceof ISpecialProcessFilter) {
                ((ISpecialProcessFilter) baseOriginalFilter).setBlock(block, i);
            }
        }
    }
}

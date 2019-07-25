package com.miui.gallery.editor.photo.core.imports.filter.adjust;

import android.graphics.PointF;
import android.opengl.GLES20;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.gallery.R;
import com.miui.gallery.editor.blocksdk.Block;
import com.miui.gallery.editor.photo.core.imports.filter.render.IFilterEmptyValidate;
import com.miui.gallery.editor.photo.core.imports.filter.render.ISpecialProcessFilter;
import com.miui.gallery.editor.photo.core.imports.filter.render.OpenGlUtils;
import com.miui.gallery.util.StaticContext;

public class GPUImageVignetteFilter extends BaseOriginalFilter implements IFilterEmptyValidate, ISpecialProcessFilter {
    private float mBlockOffset;
    private int mBlockOffsetLocation;
    private PointF mVignetteCenter;
    private int mVignetteCenterLocation;
    private float[] mVignetteColor;
    private int mVignetteColorLocation;
    private float mVignetteEnd;
    private int mVignetteEndLocation;
    private float mVignetteStart;
    private int mVignetteStartLocation;

    public GPUImageVignetteFilter() {
        this(new PointF(0.5f, 0.5f), new float[]{0.0f, 0.0f, 0.0f});
    }

    public GPUImageVignetteFilter(int i) {
        this(new PointF(0.5f, 0.5f), new float[]{0.0f, 0.0f, 0.0f});
        setDegree(i);
    }

    public GPUImageVignetteFilter(PointF pointF, float[] fArr) {
        super("attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}", OpenGlUtils.readShaderFromRawResource(StaticContext.sGetAndroidContext(), R.raw.filter_vigneete));
        this.mVignetteCenter = pointF;
        this.mVignetteColor = fArr;
    }

    public int getSpecialBoard() {
        return 0;
    }

    public boolean isDegreeAdjustSupported() {
        return true;
    }

    public boolean isEmpty() {
        return this.mDegree == 0;
    }

    public void onInit() {
        super.onInit();
        this.mVignetteCenterLocation = GLES20.glGetUniformLocation(getProgram(), "vignetteCenter");
        this.mVignetteColorLocation = GLES20.glGetUniformLocation(getProgram(), "vignetteColor");
        this.mVignetteStartLocation = GLES20.glGetUniformLocation(getProgram(), "vignetteStart");
        this.mVignetteEndLocation = GLES20.glGetUniformLocation(getProgram(), "vignetteEnd");
        this.mBlockOffsetLocation = GLES20.glGetUniformLocation(getProgram(), "blockOffset");
        setVignetteCenter(this.mVignetteCenter);
        setVignetteColor(this.mVignetteColor);
        setBlockOffset(this.mBlockOffset);
    }

    public void onInitialized() {
        super.onInitialized();
        setVignetteStart(((((float) this.mDegree) * -0.51f) / 100.0f) + 0.71f);
        setVignetteEnd(((((float) this.mDegree) * -0.19999993f) / 100.0f) + 1.3f);
    }

    public void setBlock(Block block, int i) {
        float f = ((float) ((block.mOffset / block.mWidth) - i)) / ((float) block.mHeight);
        setVignetteCenter(new PointF(0.5f, (((float) block.totalHeight) / ((float) block.mHeight)) / 2.0f));
        setBlockOffset(f);
    }

    public void setBlockOffset(float f) {
        this.mBlockOffset = f;
        setFloat(this.mBlockOffsetLocation, this.mBlockOffset);
    }

    public void setVignetteCenter(PointF pointF) {
        this.mVignetteCenter = pointF;
        setPoint(this.mVignetteCenterLocation, this.mVignetteCenter);
    }

    public void setVignetteColor(float[] fArr) {
        this.mVignetteColor = fArr;
        setFloatVec3(this.mVignetteColorLocation, this.mVignetteColor);
    }

    public void setVignetteEnd(float f) {
        this.mVignetteEnd = f;
        setFloat(this.mVignetteEndLocation, this.mVignetteEnd);
    }

    public void setVignetteStart(float f) {
        this.mVignetteStart = f;
        setFloat(this.mVignetteStartLocation, this.mVignetteStart);
    }
}

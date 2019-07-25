package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLSurfaceView;
import com.miui.filtersdk.filter.base.GPUImageFilter;
import com.miui.filtersdk.utils.Rotation;
import com.miui.gallery.editor.blocksdk.Block;
import com.miui.gallery.editor.blocksdk.BlockSdkUtils;
import com.miui.gallery.editor.blocksdk.SplitUtils;
import com.miui.gallery.util.CounterUtil;
import java.util.List;

public class GPUImage {
    private Bitmap mCurrentBitmap;
    private GPUImageFilter mFilter;
    private GLSurfaceView mGlSurfaceView;
    private final GPUImageRenderer mRenderer;
    private ScaleType mScaleType = ScaleType.CENTER_INSIDE;

    public enum ScaleType {
        CENTER_INSIDE,
        CENTER_CROP
    }

    public GPUImage(Context context) {
        if (supportsOpenGLES2(context)) {
            this.mFilter = new GPUImageFilter();
            this.mRenderer = new GPUImageRenderer(this.mFilter);
            this.mRenderer.setDrawBoundLines(false);
            return;
        }
        throw new IllegalStateException("OpenGL ES 2.0 is not supported on this phone.");
    }

    private Bitmap getBitmapWithBlock(Bitmap bitmap, GPUImageRenderer gPUImageRenderer, List<Block> list) {
        int i;
        ISpecialProcessFilter iSpecialProcessFilter;
        int i2;
        GPUImageRenderer gPUImageRenderer2 = gPUImageRenderer;
        List<Block> list2 = list;
        CounterUtil counterUtil = new CounterUtil("GPUImage");
        if (this.mFilter instanceof ISpecialProcessFilter) {
            iSpecialProcessFilter = (ISpecialProcessFilter) this.mFilter;
            i = iSpecialProcessFilter.getSpecialBoard();
        } else {
            iSpecialProcessFilter = null;
            i = 0;
        }
        int i3 = ((Block) list2.get(0)).mWidth;
        int i4 = i * 2;
        int i5 = ((Block) list2.get(0)).mHeight + i4;
        PixelBuffer pixelBuffer = new PixelBuffer(i3, i5);
        int genTexture = OpenGlUtils.genTexture();
        gPUImageRenderer2.setGLTextureId(genTexture, i3, i5);
        pixelBuffer.setRenderer(gPUImageRenderer2);
        gPUImageRenderer2.setDrawBoundLines(false);
        BlockSdkUtils.bindBitmap(bitmap);
        int i6 = i5;
        int i7 = 0;
        while (i7 < list.size()) {
            Block block = (Block) list2.get(i7);
            if (block.mHeight + i4 != i6) {
                i6 = block.mHeight + i4;
                gPUImageRenderer2.setGLTextureId(genTexture, i3, i6);
                pixelBuffer.resetSize(i3, i6);
            }
            if (i7 == 0) {
                BlockSdkUtils.updateTextureWidthStride(genTexture, i3, i6, i3, block.mOffset * 4);
                i2 = 0;
            } else if (i7 == list.size() - 1) {
                BlockSdkUtils.updateTextureWidthStride(genTexture, i3, i6, i3, (block.mOffset * 4) - (((i * i3) * 4) * 2));
                i2 = i4;
            } else {
                BlockSdkUtils.updateTextureWidthStride(genTexture, i3, i6, i3, (block.mOffset * 4) - ((i * i3) * 4));
                i2 = i;
            }
            if (iSpecialProcessFilter != null) {
                iSpecialProcessFilter.setBlock(block, i2);
            }
            pixelBuffer.draw();
            BlockSdkUtils.readPixelsAndMerge(0, i2, block.mWidth, block.mHeight, block.mOffset * 4);
            i7++;
            gPUImageRenderer2 = gPUImageRenderer;
        }
        BlockSdkUtils.unbindBitmap(bitmap);
        counterUtil.tick(String.format("getBitmapDoneForBlock:%d", new Object[]{Integer.valueOf(list.size())}));
        this.mFilter.destroy();
        gPUImageRenderer.deleteImage();
        pixelBuffer.destroy();
        return bitmap;
    }

    private boolean supportsOpenGLES2(Context context) {
        return ((ActivityManager) context.getSystemService("activity")).getDeviceConfigurationInfo().reqGlEsVersion >= 131072;
    }

    public void deleteImage() {
        this.mRenderer.deleteImage();
        this.mCurrentBitmap = null;
        requestRender();
    }

    public Bitmap getBitmapWithFilterApplied(Bitmap bitmap, boolean z) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        GPUImageRenderer gPUImageRenderer = new GPUImageRenderer(this.mFilter);
        gPUImageRenderer.setRotation(Rotation.NORMAL, this.mRenderer.isFlippedHorizontally(), !this.mRenderer.isFlippedVertically());
        gPUImageRenderer.setScaleType(this.mScaleType);
        CounterUtil counterUtil = new CounterUtil("GPUImage");
        List split = SplitUtils.split(bitmap.getWidth(), bitmap.getHeight());
        if (split.size() > 1) {
            return getBitmapWithBlock(bitmap, gPUImageRenderer, split);
        }
        PixelBuffer pixelBuffer = new PixelBuffer(bitmap.getWidth(), bitmap.getHeight());
        gPUImageRenderer.setImageBitmap(bitmap, false);
        pixelBuffer.setRenderer(gPUImageRenderer);
        gPUImageRenderer.setDrawBoundLines(false);
        if (!z) {
            bitmap = null;
        }
        Bitmap bitmap2 = pixelBuffer.getBitmap(bitmap);
        counterUtil.tick("getBitmapDone");
        this.mFilter.destroy();
        gPUImageRenderer.deleteImage();
        pixelBuffer.destroy();
        this.mRenderer.setFilter(this.mFilter);
        return bitmap2;
    }

    public Bitmap getBitmapWithFilterApplied(boolean z) {
        return getBitmapWithFilterApplied(this.mCurrentBitmap, z);
    }

    public void requestRender() {
        if (this.mGlSurfaceView != null) {
            this.mGlSurfaceView.requestRender();
        }
    }

    public void setBackgroundColor(float f, float f2, float f3) {
        this.mRenderer.setBackgroundColor(f, f2, f3);
    }

    public void setFilter(GPUImageFilter gPUImageFilter) {
        this.mFilter = gPUImageFilter;
        this.mRenderer.setFilter(this.mFilter);
    }

    public void setGLSurfaceView(GLSurfaceView gLSurfaceView) {
        this.mGlSurfaceView = gLSurfaceView;
        this.mGlSurfaceView.setEGLContextClientVersion(2);
        this.mGlSurfaceView.setEGLConfigChooser(8, 8, 8, 8, 16, 0);
        this.mGlSurfaceView.setZOrderOnTop(true);
        this.mGlSurfaceView.getHolder().setFormat(-2);
        this.mGlSurfaceView.setRenderer(this.mRenderer);
        this.mGlSurfaceView.setRenderMode(0);
        this.mGlSurfaceView.requestRender();
    }

    public void setImage(Bitmap bitmap) {
        if (this.mCurrentBitmap != bitmap) {
            this.mCurrentBitmap = bitmap;
            this.mRenderer.setImageBitmap(bitmap, false);
        }
    }
}

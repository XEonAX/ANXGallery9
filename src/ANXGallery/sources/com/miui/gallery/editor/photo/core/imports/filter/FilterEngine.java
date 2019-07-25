package com.miui.gallery.editor.photo.core.imports.filter;

import android.content.Context;
import android.graphics.Bitmap;
import com.miui.arcsoftbeauty.ArcsoftBeautyJni;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyCheckHelper;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyTransferTempData;
import com.miui.gallery.editor.photo.core.Metadata;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.imports.filter.render.GPUImage;
import com.miui.gallery.editor.photo.core.imports.filter.render.OpenGlUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.util.Log;
import com.xiaomi.skytransfer.SkyTranFilter;

public class FilterEngine extends RenderEngine {
    private Context mContext;

    public FilterEngine(Context context) {
        this.mContext = context;
    }

    private void smartBeauty(Bitmap bitmap) {
        if (ArcsoftBeautyJni.idBeautyAvailable()) {
            ArcsoftBeautyJni.smartBeauty(bitmap);
        }
    }

    public void release() {
        super.release();
        if (SkyCheckHelper.isSkyEnable()) {
            SkyTranFilter.getInstance().release();
        }
    }

    public Bitmap render(Bitmap bitmap, Metadata metadata, Object obj) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        GPUImage gPUImage = new GPUImage(this.mContext);
        if (metadata instanceof Renderable) {
            gPUImage.setFilter(((Renderable) metadata).instantiate());
            gPUImage.setImage(OpenGlUtils.ensureBitmapSize(bitmap));
            return gPUImage.getBitmapWithFilterApplied(true);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("expect to be Renderable,your type: ");
        sb.append(metadata.getClass().getSimpleName());
        throw new IllegalArgumentException(sb.toString());
    }

    public Bitmap render(Bitmap bitmap, RenderData renderData) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        if (renderData instanceof FilterRenderData) {
            FilterRenderData filterRenderData = (FilterRenderData) renderData;
            if (filterRenderData.isEmpty()) {
                return bitmap;
            }
            if (filterRenderData.isSkyTransfer()) {
                SkyTransferTempData transferTempData = filterRenderData.getTransferTempData();
                if (transferTempData == null) {
                    transferTempData = SkyTranFilter.getInstance().getTransferTempData();
                    filterRenderData.setTransferTempData(transferTempData);
                    Log.d("FilterEngine", MovieStatUtils.PAGER_PREVIEW);
                } else {
                    Log.d("FilterEngine", "origin");
                }
                SkyTranFilter.getInstance().transferSkyForSave(bitmap, filterRenderData.instantiateSky(), transferTempData);
                return bitmap;
            }
            GPUImage gPUImage = new GPUImage(this.mContext);
            Bitmap ensureBitmapSize = OpenGlUtils.ensureBitmapSize(bitmap);
            if (filterRenderData.isPortraitBeauty()) {
                smartBeauty(ensureBitmapSize);
            }
            gPUImage.setFilter(filterRenderData.instantiate());
            gPUImage.setImage(ensureBitmapSize);
            return gPUImage.getBitmapWithFilterApplied(true);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("expect to be FilterRenderData,your type: ");
        sb.append(renderData.getClass().getSimpleName());
        throw new IllegalArgumentException(sb.toString());
    }
}

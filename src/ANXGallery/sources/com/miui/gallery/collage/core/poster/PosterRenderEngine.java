package com.miui.gallery.collage.core.poster;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.core.RenderData;
import com.miui.gallery.collage.core.RenderEngine;
import com.miui.gallery.collage.render.CollageRender;

class PosterRenderEngine extends RenderEngine {
    PosterRenderEngine(Context context, BitmapManager bitmapManager) {
        super(context, bitmapManager);
    }

    public Bitmap render(RenderData renderData) {
        if (!(renderData instanceof PosterRenderData)) {
            return null;
        }
        CollageRender.RenderData renderData2 = ((PosterRenderData) renderData).mRenderData;
        renderData2.posterElementRender.initialize(renderData2.posterModel, renderData2.imageWidth, renderData2.imageHeight, renderData2.scaleOffset, this.mContext);
        Bitmap createBitmap = Bitmap.createBitmap(renderData2.imageWidth, renderData2.imageHeight, Config.ARGB_8888);
        CollageRender.doRender(new Canvas(createBitmap), renderData2, this.mBitmapManager);
        return createBitmap;
    }
}

package com.miui.gallery.collage.core.stitching;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.RectF;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.core.RenderData;
import com.miui.gallery.collage.core.RenderEngine;
import com.miui.gallery.collage.render.BitmapItemRender;
import com.miui.gallery.collage.render.CollageRender.BitmapRenderData;
import com.miui.gallery.collage.widget.CollageStitchingLayout.BitmapPositionHolder;

class StitchingEngine extends RenderEngine {
    StitchingEngine(Context context, BitmapManager bitmapManager) {
        super(context, bitmapManager);
    }

    public Bitmap render(RenderData renderData) {
        Bitmap bitmap;
        StitchingEngine stitchingEngine = this;
        RenderData renderData2 = renderData;
        if (!(renderData2 instanceof StitchingRenderData)) {
            return null;
        }
        StitchingRenderData stitchingRenderData = (StitchingRenderData) renderData2;
        BitmapRenderData[] bitmapRenderDataArr = stitchingRenderData.mRenderData.bitmapRenderDatas;
        StitchingModel stitchingModel = stitchingRenderData.mRenderData.stitchingModel;
        int i = stitchingRenderData.mWidth;
        float f = ((float) i) / ((float) stitchingRenderData.mRenderData.viewWidth);
        BitmapPositionHolder bitmapPositionHolder = new BitmapPositionHolder(bitmapRenderDataArr.length);
        stitchingModel.countHeight(i, bitmapPositionHolder, bitmapRenderDataArr);
        int i2 = bitmapPositionHolder.height;
        int i3 = bitmapPositionHolder.verticalOffset;
        int i4 = bitmapPositionHolder.horizontalOffset;
        BitmapItemRender bitmapItemRender = new BitmapItemRender();
        RectF rectF = new RectF();
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        canvas.drawColor(-1);
        int i5 = 0;
        int i6 = i4 > 0 ? i3 + 0 : 0;
        while (i5 < bitmapRenderDataArr.length) {
            BitmapRenderData bitmapRenderData = bitmapRenderDataArr[i5];
            Bitmap bitmap2 = bitmapRenderData.bitmap;
            BitmapRenderData[] bitmapRenderDataArr2 = bitmapRenderDataArr;
            if (stitchingEngine.mBitmapManager != null) {
                bitmap = createBitmap;
                bitmapRenderData.bitmap = stitchingEngine.mBitmapManager.loadSuitableBitmapBySize(i, i2, stitchingEngine.mBitmapManager.getOriginUriByBitmap(bitmapRenderData.bitmap));
            } else {
                bitmap = createBitmap;
            }
            int i7 = bitmapPositionHolder.bitmapHeights[i5] + i6;
            BitmapPositionHolder bitmapPositionHolder2 = bitmapPositionHolder;
            rectF.set((float) i4, (float) i6, (float) (bitmapPositionHolder.bitmapWidth + i4), (float) i7);
            canvas.save();
            canvas.clipRect(rectF);
            bitmapItemRender.drawBitmapItem(bitmapRenderData, rectF, canvas, f);
            canvas.restore();
            i6 = i7 + i3;
            bitmapRenderData.bitmap = bitmap2;
            i5++;
            bitmapRenderDataArr = bitmapRenderDataArr2;
            createBitmap = bitmap;
            bitmapPositionHolder = bitmapPositionHolder2;
            stitchingEngine = this;
        }
        return createBitmap;
    }
}

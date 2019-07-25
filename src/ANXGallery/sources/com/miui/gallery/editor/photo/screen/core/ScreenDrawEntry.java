package com.miui.gallery.editor.photo.screen.core;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.screen.mosaic.MosaicNode;
import com.miui.gallery.editor.photo.screen.text.ScreenTextDrawNode;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ScreenDrawEntry {
    private boolean mIsLongCrop;
    private List<BaseDrawNode> mNodeList;
    private RectF mSrcRect;

    public ScreenDrawEntry(boolean z, RectF rectF, List<BaseDrawNode> list) {
        this.mIsLongCrop = z;
        this.mSrcRect = rectF;
        this.mNodeList = new ArrayList(list);
    }

    public Bitmap apply(Bitmap bitmap) {
        Bitmap copyBitmapInCaseOfRecycle = Bitmaps.copyBitmapInCaseOfRecycle(bitmap);
        if (copyBitmapInCaseOfRecycle == null) {
            return null;
        }
        Canvas canvas = new Canvas(copyBitmapInCaseOfRecycle);
        RectF rectF = new RectF(canvas.getClipBounds());
        if (this.mIsLongCrop) {
            draw(canvas, rectF);
        } else {
            Matrix matrix = new Matrix();
            matrix.setRectToRect(this.mSrcRect, rectF, ScaleToFit.FILL);
            canvas.concat(matrix);
            draw(canvas, null);
        }
        return copyBitmapInCaseOfRecycle;
    }

    public void draw(Canvas canvas, RectF rectF) {
        for (BaseDrawNode draw : this.mNodeList) {
            draw.draw(canvas, rectF);
        }
    }

    public void putStat(HashMap<String, String> hashMap) {
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        for (BaseDrawNode baseDrawNode : this.mNodeList) {
            if (baseDrawNode instanceof DoodleNode) {
                i++;
            } else if (baseDrawNode instanceof ScreenTextDrawNode) {
                i2++;
            } else if (baseDrawNode instanceof MosaicNode) {
                i3++;
            }
        }
        hashMap.put("doodleCount", String.valueOf(i));
        hashMap.put("textCount", String.valueOf(i2));
        hashMap.put("mosaicCount", String.valueOf(i3));
        hashMap.put("nodeCount", String.valueOf(this.mNodeList.size()));
    }
}

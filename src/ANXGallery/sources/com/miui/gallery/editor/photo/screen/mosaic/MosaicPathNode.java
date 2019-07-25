package com.miui.gallery.editor.photo.screen.mosaic;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Shader;
import java.util.ArrayList;
import java.util.List;

public class MosaicPathNode extends MosaicNode {
    private static float sDefaultSize = 98.0f;
    private Paint mPaint;
    private Path mPath = new Path();
    private List<PointF> mPointFList = new ArrayList();

    private void initPaint() {
        this.mPaint = new Paint(1);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeJoin(Join.ROUND);
        this.mPaint.setStrokeCap(Cap.ROUND);
        this.mPaint.setStrokeWidth(sDefaultSize);
    }

    public void draw(Canvas canvas) {
        canvas.drawPath(this.mPath, this.mPaint);
    }

    public void init() {
        initPaint();
    }

    /* access modifiers changed from: protected */
    public void onReceivePosition(float f, float f2, boolean z) {
        if (this.mPath.isEmpty()) {
            this.mPath.moveTo(f, f2);
        } else {
            PointF pointF = (PointF) this.mPointFList.get(this.mPointFList.size() - 1);
            this.mPath.quadTo(pointF.x, pointF.y, (pointF.x + f) / 2.0f, (pointF.y + f2) / 2.0f);
        }
        this.mPointFList.add(new PointF(f, f2));
    }

    public void setPaintSize(float f) {
        this.mPaint.setStrokeWidth(f);
    }

    public void setShader(Shader shader) {
        this.mPaint.setShader(shader);
    }
}

package com.edmodo.cropper;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.ImageView;
import com.edmodo.cropper.cropwindow.edge.Edge;
import com.edmodo.cropper.cropwindow.handle.Handle;
import com.edmodo.cropper.util.AspectRatioUtil;
import com.edmodo.cropper.util.HandleUtil;
import com.edmodo.cropper.util.PaintUtil;
import com.miui.gallery.R;

public class CropImageView extends ImageView {
    private static final String TAG = "com.edmodo.cropper.CropImageView";
    private int mAspectRatioX = 1;
    private int mAspectRatioY = 1;
    private RectF mBitmapRect = new RectF();
    private Paint mBorderPaint;
    private float mBorderThickness;
    private float mCornerLength;
    private Paint mCornerPaint;
    private float mCornerThickness;
    private boolean mFixAspectRatio;
    private Paint mGuidelinePaint;
    private int mGuidelinesMode = 1;
    private float mHandleRadius;
    private Handle mPressedHandle;
    private float mSnapRadius;
    private Paint mSurroundingAreaOverlayPaint;
    private PointF mTouchOffset = new PointF();

    public CropImageView(Context context) {
        super(context);
        init(context, null);
    }

    public CropImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context, attributeSet);
    }

    public CropImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context, attributeSet);
    }

    private void drawBorder(Canvas canvas) {
        canvas.drawRect(Edge.LEFT.getCoordinate(), Edge.TOP.getCoordinate(), Edge.RIGHT.getCoordinate(), Edge.BOTTOM.getCoordinate(), this.mBorderPaint);
    }

    private void drawCorners(Canvas canvas) {
        float coordinate = Edge.LEFT.getCoordinate();
        float coordinate2 = Edge.TOP.getCoordinate();
        float coordinate3 = Edge.RIGHT.getCoordinate();
        float coordinate4 = Edge.BOTTOM.getCoordinate();
        float f = (this.mCornerThickness - this.mBorderThickness) / 2.0f;
        float f2 = this.mCornerThickness - (this.mBorderThickness / 2.0f);
        float f3 = coordinate - f;
        float f4 = coordinate2 - f2;
        canvas.drawLine(f3, f4, f3, coordinate2 + this.mCornerLength, this.mCornerPaint);
        float f5 = coordinate2 - f;
        Canvas canvas2 = canvas;
        float f6 = coordinate - f2;
        canvas2.drawLine(f6, f5, coordinate + this.mCornerLength, f5, this.mCornerPaint);
        float f7 = coordinate3 + f;
        canvas.drawLine(f7, f4, f7, coordinate2 + this.mCornerLength, this.mCornerPaint);
        float f8 = coordinate3 + f2;
        Canvas canvas3 = canvas;
        canvas3.drawLine(f8, f5, coordinate3 - this.mCornerLength, f5, this.mCornerPaint);
        float f9 = coordinate4 + f2;
        canvas3.drawLine(f3, f9, f3, coordinate4 - this.mCornerLength, this.mCornerPaint);
        float f10 = f + coordinate4;
        float f11 = f10;
        float f12 = f10;
        canvas2.drawLine(f6, f11, coordinate + this.mCornerLength, f12, this.mCornerPaint);
        canvas.drawLine(f7, f9, f7, coordinate4 - this.mCornerLength, this.mCornerPaint);
        canvas2.drawLine(f8, f11, coordinate3 - this.mCornerLength, f12, this.mCornerPaint);
    }

    private void drawDarkenedSurroundingArea(Canvas canvas) {
        RectF rectF = this.mBitmapRect;
        float coordinate = Edge.LEFT.getCoordinate();
        float coordinate2 = Edge.TOP.getCoordinate();
        float coordinate3 = Edge.RIGHT.getCoordinate();
        float coordinate4 = Edge.BOTTOM.getCoordinate();
        Canvas canvas2 = canvas;
        canvas2.drawRect(rectF.left, rectF.top, rectF.right, coordinate2, this.mSurroundingAreaOverlayPaint);
        canvas2.drawRect(rectF.left, coordinate4, rectF.right, rectF.bottom, this.mSurroundingAreaOverlayPaint);
        canvas.drawRect(rectF.left, coordinate2, coordinate, coordinate4, this.mSurroundingAreaOverlayPaint);
        canvas.drawRect(coordinate3, coordinate2, rectF.right, coordinate4, this.mSurroundingAreaOverlayPaint);
    }

    private void drawGuidelines(Canvas canvas) {
        if (shouldGuidelinesBeShown()) {
            float coordinate = Edge.LEFT.getCoordinate();
            float coordinate2 = Edge.TOP.getCoordinate();
            float coordinate3 = Edge.RIGHT.getCoordinate();
            float coordinate4 = Edge.BOTTOM.getCoordinate();
            float width = Edge.getWidth() / 3.0f;
            float f = coordinate + width;
            Canvas canvas2 = canvas;
            float f2 = coordinate2;
            float f3 = coordinate4;
            canvas2.drawLine(f, f2, f, f3, this.mGuidelinePaint);
            float f4 = coordinate3 - width;
            canvas2.drawLine(f4, f2, f4, f3, this.mGuidelinePaint);
            float height = Edge.getHeight() / 3.0f;
            float f5 = coordinate2 + height;
            Canvas canvas3 = canvas;
            float f6 = coordinate;
            float f7 = coordinate3;
            canvas3.drawLine(f6, f5, f7, f5, this.mGuidelinePaint);
            float f8 = coordinate4 - height;
            canvas3.drawLine(f6, f8, f7, f8, this.mGuidelinePaint);
        }
    }

    private RectF getBitmapRect() {
        Drawable drawable = getDrawable();
        if (drawable == null) {
            return new RectF();
        }
        float[] fArr = new float[9];
        getImageMatrix().getValues(fArr);
        float f = fArr[0];
        float f2 = fArr[4];
        float f3 = fArr[2];
        float f4 = fArr[5];
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int intrinsicHeight = drawable.getIntrinsicHeight();
        int round = Math.round(((float) intrinsicWidth) * f);
        int round2 = Math.round(((float) intrinsicHeight) * f2);
        float max = Math.max(f3, 0.0f);
        float max2 = Math.max(f4, 0.0f);
        return new RectF(max, max2, Math.min(((float) round) + max, (float) getWidth()), Math.min(((float) round2) + max2, (float) getHeight()));
    }

    private float getTargetAspectRatio() {
        return ((float) this.mAspectRatioX) / ((float) this.mAspectRatioY);
    }

    private void init(Context context, AttributeSet attributeSet) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.CropImageView, 0, 0);
        this.mGuidelinesMode = obtainStyledAttributes.getInteger(3, 1);
        this.mFixAspectRatio = obtainStyledAttributes.getBoolean(2, false);
        this.mAspectRatioX = obtainStyledAttributes.getInteger(0, 1);
        this.mAspectRatioY = obtainStyledAttributes.getInteger(1, 1);
        obtainStyledAttributes.recycle();
        Resources resources = context.getResources();
        this.mBorderPaint = PaintUtil.newBorderPaint(resources);
        this.mGuidelinePaint = PaintUtil.newGuidelinePaint(resources);
        this.mSurroundingAreaOverlayPaint = PaintUtil.newSurroundingAreaOverlayPaint(resources);
        this.mCornerPaint = PaintUtil.newCornerPaint(resources);
        this.mHandleRadius = resources.getDimension(R.dimen.target_radius);
        this.mSnapRadius = resources.getDimension(R.dimen.snap_radius);
        this.mBorderThickness = resources.getDimension(R.dimen.border_thickness);
        this.mCornerThickness = resources.getDimension(R.dimen.corner_thickness);
        this.mCornerLength = resources.getDimension(R.dimen.corner_length);
    }

    private void initCropWindow(RectF rectF) {
        if (this.mFixAspectRatio) {
            initCropWindowWithFixedAspectRatio(rectF);
            return;
        }
        float width = rectF.width() * 0.1f;
        float height = rectF.height() * 0.1f;
        Edge.LEFT.setCoordinate(rectF.left + width);
        Edge.TOP.setCoordinate(rectF.top + height);
        Edge.RIGHT.setCoordinate(rectF.right - width);
        Edge.BOTTOM.setCoordinate(rectF.bottom - height);
    }

    private void initCropWindowWithFixedAspectRatio(RectF rectF) {
        if (AspectRatioUtil.calculateAspectRatio(rectF) > getTargetAspectRatio()) {
            float calculateWidth = AspectRatioUtil.calculateWidth(rectF.height(), getTargetAspectRatio()) / 2.0f;
            Edge.LEFT.setCoordinate(rectF.centerX() - calculateWidth);
            Edge.TOP.setCoordinate(rectF.top);
            Edge.RIGHT.setCoordinate(rectF.centerX() + calculateWidth);
            Edge.BOTTOM.setCoordinate(rectF.bottom);
            return;
        }
        float calculateHeight = AspectRatioUtil.calculateHeight(rectF.width(), getTargetAspectRatio());
        Edge.LEFT.setCoordinate(rectF.left);
        float f = calculateHeight / 2.0f;
        Edge.TOP.setCoordinate(rectF.centerY() - f);
        Edge.RIGHT.setCoordinate(rectF.right);
        Edge.BOTTOM.setCoordinate(rectF.centerY() + f);
    }

    private void onActionDown(float f, float f2) {
        float coordinate = Edge.LEFT.getCoordinate();
        float coordinate2 = Edge.TOP.getCoordinate();
        float coordinate3 = Edge.RIGHT.getCoordinate();
        float coordinate4 = Edge.BOTTOM.getCoordinate();
        this.mPressedHandle = HandleUtil.getPressedHandle(f, f2, coordinate, coordinate2, coordinate3, coordinate4, this.mHandleRadius);
        if (this.mPressedHandle != null) {
            HandleUtil.getOffset(this.mPressedHandle, f, f2, coordinate, coordinate2, coordinate3, coordinate4, this.mTouchOffset);
            invalidate();
        }
    }

    private void onActionMove(float f, float f2) {
        if (this.mPressedHandle != null) {
            float f3 = f + this.mTouchOffset.x;
            float f4 = f2 + this.mTouchOffset.y;
            if (this.mFixAspectRatio) {
                this.mPressedHandle.updateCropWindow(f3, f4, getTargetAspectRatio(), this.mBitmapRect, this.mSnapRadius);
            } else {
                this.mPressedHandle.updateCropWindow(f3, f4, this.mBitmapRect, this.mSnapRadius);
            }
            invalidate();
        }
    }

    private void onActionUp() {
        if (this.mPressedHandle != null) {
            this.mPressedHandle = null;
            invalidate();
        }
    }

    private boolean shouldGuidelinesBeShown() {
        if (this.mGuidelinesMode != 2) {
            return this.mGuidelinesMode == 1 && this.mPressedHandle != null;
        }
        return true;
    }

    public Bitmap getCroppedImage() {
        Drawable drawable = getDrawable();
        if (drawable == null || !(drawable instanceof BitmapDrawable)) {
            return null;
        }
        float[] fArr = new float[9];
        getImageMatrix().getValues(fArr);
        float f = fArr[0];
        float f2 = fArr[4];
        float f3 = fArr[2];
        float f4 = fArr[5];
        Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
        float coordinate = (Edge.LEFT.getCoordinate() - f3) / f;
        float coordinate2 = (Edge.TOP.getCoordinate() - f4) / f2;
        float min = Math.min(Edge.getWidth() / f, ((float) bitmap.getWidth()) - coordinate);
        float min2 = Math.min(Edge.getHeight() / f2, ((float) bitmap.getHeight()) - coordinate2);
        int i = (int) coordinate;
        int i2 = (int) coordinate2;
        int floor = (int) Math.floor((double) min);
        int floor2 = (int) Math.floor((double) min2);
        if (floor == 0) {
            floor = 1;
        }
        if (floor2 == 0) {
            floor2 = 1;
        }
        int i3 = i + floor;
        if (i3 > bitmap.getWidth()) {
            i -= i3 - bitmap.getWidth();
        }
        int i4 = i2 + floor2;
        if (i4 > bitmap.getHeight()) {
            i2 -= i4 - bitmap.getHeight();
        }
        return Bitmap.createBitmap(bitmap, i, i2, floor, floor2);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        drawDarkenedSurroundingArea(canvas);
        drawGuidelines(canvas);
        drawBorder(canvas);
        drawCorners(canvas);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.mBitmapRect = getBitmapRect();
        initCropWindow(this.mBitmapRect);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!isEnabled()) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                onActionDown(motionEvent.getX(), motionEvent.getY());
                return true;
            case 1:
            case 3:
                getParent().requestDisallowInterceptTouchEvent(false);
                onActionUp();
                return true;
            case 2:
                onActionMove(motionEvent.getX(), motionEvent.getY());
                getParent().requestDisallowInterceptTouchEvent(true);
                return true;
            default:
                return false;
        }
    }

    public void setAspectRatio(int i, int i2) {
        if (i <= 0 || i2 <= 0) {
            throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
        }
        this.mAspectRatioX = i;
        this.mAspectRatioY = i2;
        if (this.mFixAspectRatio) {
            requestLayout();
        }
    }

    public void setFixedAspectRatio(boolean z) {
        this.mFixAspectRatio = z;
        requestLayout();
    }

    public void setGuidelines(int i) {
        this.mGuidelinesMode = i;
        invalidate();
    }
}

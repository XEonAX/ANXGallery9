package com.miui.gallery.editor.photo.core.imports.doodle.painter.vector;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Parcel;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode.DoodleDrawableType;

public abstract class DoodleVectorNode extends DoodleNode {
    private static final DoodleDrawableType DOODLE_TYPE = DoodleDrawableType.VECTOR;
    private float[] mCurrentPoint;
    private float[] mEnd;
    private boolean mInverse;
    private Matrix mMatrix;
    private float[] mStart;

    public DoodleVectorNode(Resources resources) {
        super(resources);
        this.mStart = new float[2];
        this.mEnd = new float[2];
        this.mMatrix = new Matrix();
        this.mCurrentPoint = new float[2];
        this.mInverse = false;
    }

    public DoodleVectorNode(Resources resources, boolean z) {
        super(resources);
        this.mStart = new float[2];
        this.mEnd = new float[2];
        this.mMatrix = new Matrix();
        this.mCurrentPoint = new float[2];
        this.mInverse = z;
    }

    protected DoodleVectorNode(Parcel parcel) {
        super(parcel);
        this.mStart = new float[2];
        this.mEnd = new float[2];
        this.mMatrix = new Matrix();
        this.mCurrentPoint = new float[2];
        this.mRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
    }

    public void appendScale(float f) {
        float width = this.mRectF.width();
        float f2 = ((f * width) - width) / 2.0f;
        this.mMatrix.reset();
        this.mMatrix.postRotate(-this.mDegrees, this.mRectF.centerX(), this.mRectF.centerY());
        this.mStart[0] = this.mStartPoint.x;
        this.mStart[1] = this.mStartPoint.y;
        this.mEnd[0] = this.mEndPoint.x;
        this.mEnd[1] = this.mEndPoint.y;
        this.mMatrix.mapPoints(this.mStart);
        this.mMatrix.mapPoints(this.mEnd);
        float[] fArr = this.mStart;
        fArr[0] = fArr[0] - f2;
        float[] fArr2 = this.mEnd;
        fArr2[0] = fArr2[0] + f2;
        this.mMatrix.reset();
        this.mMatrix.postRotate(this.mDegrees, this.mRectF.centerX(), this.mRectF.centerY());
        this.mMatrix.mapPoints(this.mStart);
        this.mMatrix.mapPoints(this.mEnd);
        this.mStartPoint.x = this.mStart[0];
        this.mStartPoint.y = this.mStart[1];
        this.mEndPoint.x = this.mEnd[0];
        this.mEndPoint.y = this.mEnd[1];
        refreshRectByPoint();
        countDecoration();
    }

    /* access modifiers changed from: protected */
    public void count() {
    }

    public float countRotateX() {
        return (this.mInverse ? this.mEndPoint : this.mStartPoint).x;
    }

    public float countRotateY() {
        return (this.mInverse ? this.mEndPoint : this.mStartPoint).y;
    }

    public int describeContents() {
        return 0;
    }

    public void draw(Canvas canvas) {
        if (!this.mRectF.isEmpty()) {
            drawSafely(canvas);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void drawSafely(Canvas canvas);

    public DoodleDrawableType getDoodleType() {
        return DOODLE_TYPE;
    }

    /* access modifiers changed from: protected */
    public void onReceivePosition(float f, float f2, boolean z) {
        if (!z) {
            refreshRectByPoint();
        }
    }

    public void processOnDownEvent(float f, float f2) {
    }

    public void processRotateEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
    }

    public void processScaleEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        this.mCurrentPoint[0] = f3;
        this.mCurrentPoint[1] = f4;
        float f9 = this.mRotateX + this.mUserLocationX;
        float f10 = this.mRotateY + this.mUserLocationY;
        appendDegrees((float) Math.toDegrees(Math.atan2((double) (this.mCurrentPoint[1] - f10), (double) (this.mCurrentPoint[0] - f9)) - Math.atan2((double) (f8 - f10), (double) (f7 - f9))));
        this.mMatrix.reset();
        this.mMatrix.postRotate(-getRotateDegrees(), f9, f10);
        this.mMatrix.mapPoints(this.mCurrentPoint);
        float height = this.mOutLineRectF.height() / 2.0f;
        float[] fArr = this.mCurrentPoint;
        fArr[1] = fArr[1] - height;
        if (this.mInverse) {
            float[] fArr2 = this.mCurrentPoint;
            fArr2[0] = fArr2[0] + this.mOutLineOffsetX;
        } else {
            float[] fArr3 = this.mCurrentPoint;
            fArr3[0] = fArr3[0] - this.mOutLineOffsetX;
        }
        this.mMatrix.reset();
        this.mMatrix.postRotate(getRotateDegrees(), f9, f10);
        this.mMatrix.mapPoints(this.mCurrentPoint);
        if (this.mInverse) {
            this.mStartPoint.x = this.mCurrentPoint[0] - this.mUserLocationX;
            this.mStartPoint.y = this.mCurrentPoint[1] - this.mUserLocationY;
        } else {
            this.mEndPoint.x = this.mCurrentPoint[0] - this.mUserLocationX;
            this.mEndPoint.y = this.mCurrentPoint[1] - this.mUserLocationY;
        }
        refreshRectByPoint();
        countDecoration();
    }

    /* access modifiers changed from: protected */
    public void refreshRectByPoint() {
        float strokeWidth = this.mPaint.getStrokeWidth() / 2.0f;
        setDegrees((float) Math.toDegrees(Math.atan2((double) (this.mEndPoint.y - this.mStartPoint.y), (double) (this.mEndPoint.x - this.mStartPoint.x))));
        this.mStart[0] = this.mStartPoint.x;
        this.mStart[1] = this.mStartPoint.y;
        this.mEnd[0] = this.mEndPoint.x;
        this.mEnd[1] = this.mEndPoint.y;
        this.mRotateX = countRotateX();
        this.mRotateY = countRotateY();
        this.mMatrix.reset();
        this.mMatrix.postRotate(-getRotateDegrees(), this.mRotateX, this.mRotateY);
        this.mMatrix.mapPoints(this.mStart);
        this.mMatrix.mapPoints(this.mEnd);
        this.mRectF.left = this.mStart[0];
        this.mRectF.right = this.mEnd[0];
        this.mRectF.top = this.mStart[1] - strokeWidth;
        this.mRectF.bottom = this.mStart[1] + strokeWidth;
        this.mRotateX = countRotateX();
        this.mRotateY = countRotateY();
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mRectF, i);
    }
}

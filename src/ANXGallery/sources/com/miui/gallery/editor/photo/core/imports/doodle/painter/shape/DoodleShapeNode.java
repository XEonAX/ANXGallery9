package com.miui.gallery.editor.photo.core.imports.doodle.painter.shape;

import android.content.res.Resources;
import android.graphics.Matrix;
import android.os.Parcel;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode.DoodleDrawableType;

public abstract class DoodleShapeNode extends DoodleNode {
    private static final DoodleDrawableType DOODLE_TYPE = DoodleDrawableType.SHAPE;
    private float[] mCurrentPoint = new float[2];
    private Matrix mMatrix = new Matrix();
    private float[] mPrePoint = new float[2];

    public DoodleShapeNode(Resources resources) {
        super(resources);
        this.mRectF.setEmpty();
    }

    protected DoodleShapeNode(Parcel parcel) {
        super(parcel);
    }

    public void appendScale(float f) {
        float width = this.mRectF.width();
        float height = this.mRectF.height();
        float f2 = ((width * f) - width) / 2.0f;
        float f3 = ((f * height) - height) / 2.0f;
        if (this.mStartPoint.x > this.mEndPoint.x) {
            f2 = -f2;
        }
        if (this.mStartPoint.y > this.mEndPoint.y) {
            f3 = -f3;
        }
        this.mStartPoint.x -= f2;
        this.mStartPoint.y -= f3;
        this.mEndPoint.x += f2;
        this.mEndPoint.y += f3;
        refreshRectByPoint(this.mStartPoint, this.mEndPoint);
        countDecoration();
    }

    /* access modifiers changed from: protected */
    public void count() {
        this.mEndPoint.x = this.mRectF.right;
        this.mEndPoint.y = this.mRectF.bottom;
    }

    public float countRotateX() {
        return this.mRectF.centerX();
    }

    public float countRotateY() {
        return this.mRectF.centerY();
    }

    public int describeContents() {
        return 0;
    }

    public DoodleDrawableType getDoodleType() {
        return DOODLE_TYPE;
    }

    /* access modifiers changed from: protected */
    public void onReceivePosition(float f, float f2, boolean z) {
        if (!z) {
            refreshRectByPoint(this.mStartPoint, this.mEndPoint);
        }
    }

    public void processOnDownEvent(float f, float f2) {
        refreshPointByRect(this.mStartPoint, this.mEndPoint);
    }

    public void processOnUp() {
        super.processOnUp();
        this.mEndPoint.x = this.mRectF.right;
        this.mEndPoint.y = this.mRectF.bottom;
    }

    public void processScaleEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        this.mCurrentPoint[0] = f3;
        this.mCurrentPoint[1] = f4;
        this.mPrePoint[0] = this.mCurrentPoint[0] - f5;
        this.mPrePoint[1] = this.mCurrentPoint[1] - f6;
        this.mMatrix.reset();
        this.mMatrix.postRotate(-this.mDegrees, this.mRotateX + this.mUserLocationX, this.mRotateY + this.mUserLocationY);
        this.mMatrix.mapPoints(this.mPrePoint);
        this.mMatrix.mapPoints(this.mCurrentPoint);
        float f9 = this.mCurrentPoint[0] - this.mPrePoint[0];
        float f10 = this.mCurrentPoint[1] - this.mPrePoint[1];
        this.mEndPoint.x -= f9;
        this.mEndPoint.y -= f10;
        refreshRectByPoint(this.mStartPoint, this.mEndPoint);
        countDecoration();
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
    }
}

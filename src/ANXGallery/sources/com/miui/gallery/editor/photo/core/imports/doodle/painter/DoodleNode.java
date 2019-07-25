package com.miui.gallery.editor.photo.core.imports.doodle.painter;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;
import com.miui.gallery.util.Log;

public abstract class DoodleNode extends BaseDrawNode implements Parcelable {
    private boolean mCanSelected;
    private int mColor;
    private float mCorrectionDegrees;
    protected float mDegrees;
    protected PointF mEndPoint;
    private boolean mIsInit;
    private Matrix mMatrix;
    protected final float mOutLineOffsetX;
    protected final float mOutLineOffsetY;
    protected RectF mOutLineRectF;
    protected Paint mPaint;
    protected RectF mRectF;
    protected RectF mRectFTemp;
    protected Rect mRectTemp;
    protected float mRotateX;
    protected float mRotateY;
    protected float mScale;
    protected PointF mStartPoint;
    private RectF mStrokeRect;
    private float mStrokeWidth;
    protected float mUserLocationX;
    protected float mUserLocationY;

    public enum DoodleDrawableType {
        PATH,
        SHAPE,
        VECTOR
    }

    public DoodleNode(Resources resources) {
        this.mRectF = new RectF();
        this.mOutLineRectF = new RectF();
        this.mStrokeRect = new RectF();
        this.mRectTemp = new Rect();
        this.mRectFTemp = new RectF();
        this.mUserLocationX = 0.0f;
        this.mUserLocationY = 0.0f;
        this.mScale = 1.0f;
        this.mDegrees = 0.0f;
        this.mMatrix = new Matrix();
        this.mRotateX = 0.0f;
        this.mRotateY = 0.0f;
        this.mStartPoint = new PointF();
        this.mEndPoint = new PointF();
        this.mIsInit = false;
        this.mCorrectionDegrees = 5.0f;
        this.mCanSelected = true;
        initPaint();
        this.mOutLineOffsetX = resources.getDimension(R.dimen.doodle_outline_offset_x);
        this.mOutLineOffsetY = resources.getDimension(R.dimen.doodle_outline_offset_y);
        init(resources);
    }

    protected DoodleNode(Parcel parcel) {
        this(GalleryApp.sGetAndroidContext().getResources());
        this.mStrokeWidth = parcel.readFloat();
        this.mColor = parcel.readInt();
        this.mUserLocationX = parcel.readFloat();
        this.mUserLocationY = parcel.readFloat();
        this.mDegrees = parcel.readFloat();
        this.mRotateX = parcel.readFloat();
        this.mRotateY = parcel.readFloat();
        this.mStartPoint = (PointF) parcel.readParcelable(PointF.class.getClassLoader());
        this.mEndPoint = (PointF) parcel.readParcelable(PointF.class.getClassLoader());
    }

    private void initPaint() {
        this.mPaint = new Paint(1);
        this.mPaint.setStyle(Style.STROKE);
    }

    private void offsetRect(RectF rectF) {
        rectF.offset(this.mUserLocationX, this.mUserLocationY);
    }

    private void refreshRotateCenter() {
        Log.d("DoodleNode", "--- refreshRotateCenter ---");
        float f = this.mRotateX;
        float f2 = this.mRotateY;
        this.mRotateX = countRotateX();
        this.mRotateY = countRotateY();
        if (f != this.mRotateX || f2 != this.mRotateY) {
            Log.d("DoodleNode", "--- refreshRotateCenter real ---");
            float[] fArr = {this.mRotateX, this.mRotateY};
            this.mMatrix.reset();
            this.mMatrix.postRotate(this.mDegrees, f, f2);
            this.mMatrix.mapPoints(fArr);
            this.mUserLocationX += fArr[0] - this.mRotateX;
            this.mUserLocationY += fArr[1] - this.mRotateY;
            countDecoration();
        }
    }

    private static float resolveRotateDegree(float f, float f2) {
        if (f < 0.0f) {
            f += 360.0f;
        }
        float f3 = f % 360.0f;
        if (f3 > 0.0f && f3 < f2) {
            f3 = 0.0f;
        }
        if (f3 > 360.0f - f2) {
            f3 = 0.0f;
        }
        if (f3 != 90.0f && f3 > 90.0f - f2 && f3 < f2 + 90.0f) {
            f3 = 90.0f;
        }
        if (f3 != 180.0f && f3 > 180.0f - f2 && f3 < f2 + 180.0f) {
            f3 = 180.0f;
        }
        if (f3 == 270.0f || f3 <= 270.0f - f2 || f3 >= f2 + 270.0f) {
            return f3;
        }
        return 270.0f;
    }

    public void appendDegrees(float f) {
        this.mDegrees += f;
        if (this.mDegrees < 0.0f) {
            this.mDegrees += 360.0f;
        }
        if (this.mDegrees >= 360.0f) {
            this.mDegrees %= 360.0f;
        }
    }

    public abstract void appendScale(float f);

    public void appendUserLocationX(float f) {
        this.mUserLocationX += f;
    }

    public void appendUserLocationY(float f) {
        this.mUserLocationY += f;
    }

    /* access modifiers changed from: protected */
    public void configCanvas(Canvas canvas, boolean z) {
        canvas.translate(this.mUserLocationX, this.mUserLocationY);
        if (z) {
            canvas.rotate(getRotateDegrees(), this.mRotateX, this.mRotateY);
        }
    }

    public boolean contains(float f, float f2) {
        getStrokeRectF(this.mRectFTemp);
        offsetRect(this.mRectFTemp);
        this.mMatrix.reset();
        this.mMatrix.postRotate(-getRotateDegrees(), this.mRotateX + this.mUserLocationX, this.mRotateY + this.mUserLocationY);
        float[] fArr = {f, f2};
        this.mMatrix.mapPoints(fArr);
        return this.mRectFTemp.contains(fArr[0], fArr[1]);
    }

    /* access modifiers changed from: protected */
    public abstract void count();

    public void countDecoration() {
        this.mOutLineRectF.set(this.mRectF);
        this.mOutLineRectF.inset(-(((this.mOutLineRectF.width() * this.mScale) - this.mOutLineRectF.width()) / 2.0f), -(((this.mOutLineRectF.height() * this.mScale) - this.mOutLineRectF.height()) / 2.0f));
        this.mOutLineRectF.inset(-this.mOutLineOffsetX, -this.mOutLineOffsetY);
        this.mStrokeRect.set(this.mOutLineRectF);
    }

    public abstract float countRotateX();

    public abstract float countRotateY();

    public void countSize() {
        count();
        countDecoration();
        this.mRotateX = countRotateX();
        this.mRotateY = countRotateY();
    }

    public int describeContents() {
        return 0;
    }

    public abstract String getDoodleName();

    public abstract DoodleDrawableType getDoodleType();

    public void getRectF(RectF rectF) {
        rectF.set(this.mRectF);
    }

    public float getRotateDegrees() {
        return this.mDegrees;
    }

    public float getRotateX() {
        return this.mRotateX;
    }

    public float getRotateY() {
        return this.mRotateY;
    }

    public void getStrokeRectF(RectF rectF) {
        rectF.set(this.mOutLineRectF);
    }

    public float getUserLocationX() {
        return this.mUserLocationX;
    }

    public float getUserLocationY() {
        return this.mUserLocationY;
    }

    /* access modifiers changed from: protected */
    public abstract void init(Resources resources);

    public void initForParcelable(Context context) {
        setPaintSize(this.mStrokeWidth);
        setPaintColor(this.mColor);
    }

    public boolean isCanSelected() {
        return this.mCanSelected;
    }

    /* access modifiers changed from: protected */
    public abstract void onReceivePosition(float f, float f2, boolean z);

    public abstract void processOnDownEvent(float f, float f2);

    public void processOnUp() {
        refreshRotateCenter();
    }

    public void processRotateEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        float f9 = this.mRotateX + this.mUserLocationX;
        float f10 = this.mRotateY + this.mUserLocationY;
        appendDegrees((float) Math.toDegrees(Math.atan2((double) (f4 - f10), (double) (f3 - f9)) - Math.atan2((double) (f8 - f10), (double) (f7 - f9))));
        setDegrees(resolveRotateDegree(this.mDegrees, this.mCorrectionDegrees));
        countDecoration();
    }

    public abstract void processScaleEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8);

    public void receivePosition(float f, float f2) {
        if (!this.mIsInit) {
            this.mStartPoint.set(f, f2);
            this.mIsInit = true;
            onReceivePosition(f, f2, true);
            return;
        }
        this.mEndPoint.set(f, f2);
        onReceivePosition(f, f2, false);
    }

    /* access modifiers changed from: protected */
    public void refreshPointByRect(PointF pointF, PointF pointF2) {
        pointF.set(this.mRectF.left, this.mRectF.top);
        pointF2.set(this.mRectF.right, this.mRectF.bottom);
    }

    /* access modifiers changed from: protected */
    public void refreshRectByPoint() {
        refreshRectByPoint(this.mStartPoint, this.mEndPoint);
    }

    /* access modifiers changed from: protected */
    public void refreshRectByPoint(PointF pointF, PointF pointF2) {
        boolean z = false;
        boolean z2 = pointF.x <= pointF2.x;
        if (pointF.y <= pointF2.y) {
            z = true;
        }
        this.mRectF.left = z2 ? pointF.x : pointF2.x;
        this.mRectF.right = !z2 ? pointF.x : pointF2.x;
        this.mRectF.top = z ? pointF.y : pointF2.y;
        this.mRectF.bottom = !z ? pointF.y : pointF2.y;
    }

    public void setCanSelected(boolean z) {
        this.mCanSelected = z;
    }

    public void setDegrees(float f) {
        this.mDegrees = f;
        if (this.mDegrees < 0.0f) {
            this.mDegrees += 360.0f;
        }
        if (this.mDegrees >= 360.0f) {
            this.mDegrees %= 360.0f;
        }
    }

    public void setPaintColor(int i) {
        this.mColor = i;
        this.mPaint.setColor(i);
    }

    public void setPaintSize(float f) {
        this.mStrokeWidth = f;
        this.mPaint.setStrokeWidth(f);
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(this.mStrokeWidth);
        parcel.writeInt(this.mColor);
        parcel.writeFloat(this.mUserLocationX);
        parcel.writeFloat(this.mUserLocationY);
        parcel.writeFloat(getRotateDegrees());
        parcel.writeFloat(this.mRotateX);
        parcel.writeFloat(this.mRotateY);
        parcel.writeParcelable(this.mStartPoint, i);
        parcel.writeParcelable(this.mEndPoint, i);
    }
}

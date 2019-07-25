package com.miui.gallery.editor.photo.core.imports.doodle.painter.path;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Path;
import android.graphics.PointF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode.DoodleDrawableType;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableMatrix;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelablePathUtils;
import java.util.ArrayList;
import java.util.List;

public class DoodlePathNode extends DoodleNode implements Parcelable {
    public static final Creator<DoodlePathNode> CREATOR = new Creator<DoodlePathNode>() {
        public DoodlePathNode createFromParcel(Parcel parcel) {
            return new DoodlePathNode(parcel);
        }

        public DoodlePathNode[] newArray(int i) {
            return new DoodlePathNode[i];
        }
    };
    private static final DoodleItem DOODLE_ITEM = DoodleItem.PATH;
    private static final DoodleDrawableType DOODLE_TYPE = DoodleDrawableType.PATH;
    private Matrix mMatrix = new Matrix();
    private ParcelableMatrix mParcelableMatrix = new ParcelableMatrix();
    private Path mPath = new Path();
    private List<PointF> mPointFList = new ArrayList();

    public DoodlePathNode(Resources resources) {
        super(resources);
    }

    protected DoodlePathNode(Parcel parcel) {
        super(parcel);
        this.mPointFList = parcel.createTypedArrayList(PointF.CREATOR);
        this.mParcelableMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
    }

    public void append(float f, float f2) {
        if (this.mPath.isEmpty()) {
            this.mPath.moveTo(f, f2);
        } else {
            PointF pointF = (PointF) this.mPointFList.get(this.mPointFList.size() - 1);
            this.mPath.quadTo(pointF.x, pointF.y, (pointF.x + f) / 2.0f, (pointF.y + f2) / 2.0f);
        }
        this.mPointFList.add(new PointF(f, f2));
    }

    public void appendScale(float f) {
        if (f >= 1.0f || ((double) this.mScale) >= 0.2d) {
            this.mScale *= f;
            this.mMatrix.reset();
            this.mMatrix.postScale(f, f, this.mRectF.centerX(), this.mRectF.centerY());
            this.mParcelableMatrix.postConcat(this.mMatrix);
            this.mPath.transform(this.mMatrix);
            countDecoration();
        }
    }

    public void count() {
        this.mPath.computeBounds(this.mRectF, true);
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

    public void draw(Canvas canvas) {
        canvas.save();
        configCanvas(canvas, true);
        canvas.drawPath(this.mPath, this.mPaint);
        canvas.restore();
    }

    public String getDoodleName() {
        return DOODLE_ITEM.name();
    }

    public DoodleDrawableType getDoodleType() {
        return DOODLE_TYPE;
    }

    /* access modifiers changed from: protected */
    public void init(Resources resources) {
        this.mPaint.setStrokeJoin(Join.ROUND);
        this.mPaint.setStrokeCap(Cap.ROUND);
    }

    public void initForParcelable(Context context) {
        super.initForParcelable(context);
        this.mPaint.setStrokeJoin(Join.ROUND);
        this.mPaint.setStrokeCap(Cap.ROUND);
        this.mPath = ParcelablePathUtils.getPathFromPointList(this.mPointFList);
        this.mPath.transform(this.mParcelableMatrix);
    }

    /* access modifiers changed from: protected */
    public void onReceivePosition(float f, float f2, boolean z) {
        append(f, f2);
    }

    public void processOnDownEvent(float f, float f2) {
    }

    public void processScaleEvent(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        getRectF(this.mRectFTemp);
        this.mRectFTemp.offset(this.mUserLocationX, this.mUserLocationY);
        float centerX = this.mRectFTemp.centerX();
        float centerY = this.mRectFTemp.centerY();
        appendScale((float) (Math.hypot((double) (f3 - centerX), (double) (f4 - centerY)) / Math.hypot((double) (f7 - centerX), (double) (f8 - centerY))));
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeTypedList(this.mPointFList);
        parcel.writeParcelable(this.mParcelableMatrix, i);
    }
}

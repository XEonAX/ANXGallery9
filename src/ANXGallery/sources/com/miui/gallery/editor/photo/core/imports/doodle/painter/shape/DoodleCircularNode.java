package com.miui.gallery.editor.photo.core.imports.doodle.painter.shape;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;

public class DoodleCircularNode extends DoodleShapeNode {
    public static final Creator<DoodleCircularNode> CREATOR = new Creator<DoodleCircularNode>() {
        public DoodleCircularNode createFromParcel(Parcel parcel) {
            return new DoodleCircularNode(parcel);
        }

        public DoodleCircularNode[] newArray(int i) {
            return new DoodleCircularNode[i];
        }
    };
    private static final DoodleItem DOODLE_ITEM = DoodleItem.CIRCULAR;

    public DoodleCircularNode(Resources resources) {
        super(resources);
    }

    protected DoodleCircularNode(Parcel parcel) {
        super(parcel);
        this.mRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    public void draw(Canvas canvas) {
        canvas.save();
        configCanvas(canvas, true);
        canvas.drawOval(this.mRectF, this.mPaint);
        canvas.restore();
    }

    public String getDoodleName() {
        return DOODLE_ITEM.name();
    }

    /* access modifiers changed from: protected */
    public void init(Resources resources) {
        this.mPaint.setStrokeJoin(Join.ROUND);
        this.mPaint.setStrokeCap(Cap.ROUND);
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mRectF, i);
    }
}

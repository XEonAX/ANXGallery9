package com.miui.gallery.editor.photo.core.imports.doodle.painter.shape;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;

public class DoodleRectangleNode extends DoodleShapeNode {
    public static final Creator<DoodleRectangleNode> CREATOR = new Creator<DoodleRectangleNode>() {
        public DoodleRectangleNode createFromParcel(Parcel parcel) {
            return new DoodleRectangleNode(parcel);
        }

        public DoodleRectangleNode[] newArray(int i) {
            return new DoodleRectangleNode[i];
        }
    };
    private static final DoodleItem DOODLE_ITEM = DoodleItem.RECTANGLE;

    public DoodleRectangleNode(Resources resources) {
        super(resources);
    }

    protected DoodleRectangleNode(Parcel parcel) {
        super(parcel);
        this.mRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    public void draw(Canvas canvas) {
        canvas.save();
        configCanvas(canvas, true);
        canvas.drawRect(this.mRectF, this.mPaint);
        canvas.restore();
    }

    public String getDoodleName() {
        return DOODLE_ITEM.name();
    }

    /* access modifiers changed from: protected */
    public void init(Resources resources) {
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mRectF, i);
    }
}

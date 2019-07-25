package com.miui.gallery.editor.photo.core.imports.doodle.painter.vector;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;

public class DoodleLineNode extends DoodleVectorNode {
    public static final Creator<DoodleLineNode> CREATOR = new Creator<DoodleLineNode>() {
        public DoodleLineNode createFromParcel(Parcel parcel) {
            return new DoodleLineNode(parcel);
        }

        public DoodleLineNode[] newArray(int i) {
            return new DoodleLineNode[i];
        }
    };
    private static final DoodleItem DOODLE_ITEM = DoodleItem.LINE;

    public DoodleLineNode(Resources resources) {
        super(resources);
    }

    protected DoodleLineNode(Parcel parcel) {
        super(parcel);
    }

    public int describeContents() {
        return 0;
    }

    public void drawSafely(Canvas canvas) {
        canvas.save();
        configCanvas(canvas, false);
        canvas.drawLine(this.mStartPoint.x, this.mStartPoint.y, this.mEndPoint.x, this.mEndPoint.y, this.mPaint);
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
    }
}

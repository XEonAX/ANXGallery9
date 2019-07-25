package com.miui.gallery.editor.photo.core.imports.frame;

import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.model.IPositionChangeData;
import com.miui.gallery.editor.photo.core.imports.frame.FrameEditorView.FrameEntry;

class FrameRenderData extends RenderData implements IPositionChangeData {
    public static final Creator<FrameRenderData> CREATOR = new Creator<FrameRenderData>() {
        public FrameRenderData createFromParcel(Parcel parcel) {
            return new FrameRenderData(parcel);
        }

        public FrameRenderData[] newArray(int i) {
            return new FrameRenderData[i];
        }
    };
    FrameEntry mFrameEntry;

    protected FrameRenderData(Parcel parcel) {
        super(parcel);
        this.mFrameEntry = (FrameEntry) parcel.readParcelable(FrameEntry.class.getClassLoader());
    }

    FrameRenderData(FrameEntry frameEntry) {
        this.mFrameEntry = frameEntry;
    }

    public int describeContents() {
        return 0;
    }

    public void refreshTargetAreaPosition(RectF rectF, RectF rectF2) {
        this.mFrameEntry.refreshTargetAreaPosition(rectF, rectF2);
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mFrameEntry, i);
    }
}

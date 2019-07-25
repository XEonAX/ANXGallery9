package com.miui.gallery.editor.photo.core;

import android.os.Parcel;
import android.os.Parcelable;

public abstract class RenderData implements Parcelable {
    public Effect mType;

    public RenderData() {
    }

    protected RenderData(Parcel parcel) {
        this.mType = (Effect) parcel.readParcelable(Effect.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public final Effect getType() {
        return this.mType;
    }

    /* access modifiers changed from: 0000 */
    public final RenderData merge(RenderData renderData) {
        RenderData onMerge = onMerge(renderData);
        if (onMerge != null) {
            onMerge.mType = this.mType;
        }
        return onMerge;
    }

    /* access modifiers changed from: protected */
    public RenderData onMerge(RenderData renderData) {
        return null;
    }

    /* access modifiers changed from: protected */
    public void onRelease() {
    }

    public final void release() {
        onRelease();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mType, i);
    }
}

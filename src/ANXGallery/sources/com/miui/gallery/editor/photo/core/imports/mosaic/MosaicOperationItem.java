package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.LinkedList;

class MosaicOperationItem implements Parcelable {
    public static final Creator<MosaicOperationItem> CREATOR = new Creator<MosaicOperationItem>() {
        public MosaicOperationItem createFromParcel(Parcel parcel) {
            return new MosaicOperationItem(parcel);
        }

        public MosaicOperationItem[] newArray(int i) {
            return new MosaicOperationItem[i];
        }
    };
    final MosaicGLEntity mosaicGLEntity;
    final LinkedList<PaintingItem> paintingItems = new LinkedList<>();

    static class PaintingItem implements Parcelable {
        public static final Creator<PaintingItem> CREATOR = new Creator<PaintingItem>() {
            public PaintingItem createFromParcel(Parcel parcel) {
                return new PaintingItem(parcel);
            }

            public PaintingItem[] newArray(int i) {
                return new PaintingItem[i];
            }
        };
        final LinkedList<GLRectF> points = new LinkedList<>();

        PaintingItem() {
        }

        protected PaintingItem(Parcel parcel) {
            parcel.readTypedList(this.points, GLRectF.CREATOR);
        }

        /* access modifiers changed from: 0000 */
        public void add(GLRectF gLRectF) {
            this.points.add(gLRectF);
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isEmpty() {
            return this.points.isEmpty();
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeTypedList(this.points);
        }
    }

    protected MosaicOperationItem(Parcel parcel) {
        this.mosaicGLEntity = (MosaicGLEntity) parcel.readParcelable(MosaicGLEntity.class.getClassLoader());
        parcel.readTypedList(this.paintingItems, PaintingItem.CREATOR);
    }

    MosaicOperationItem(MosaicGLEntity mosaicGLEntity2) {
        this.mosaicGLEntity = mosaicGLEntity2;
    }

    /* access modifiers changed from: 0000 */
    public void add(PaintingItem paintingItem) {
        this.paintingItems.add(paintingItem);
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public boolean isEmpty() {
        return this.paintingItems.isEmpty();
    }

    /* access modifiers changed from: 0000 */
    public PaintingItem removeLast() {
        return (PaintingItem) this.paintingItems.removeLast();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mosaicGLEntity, i);
        parcel.writeTypedList(this.paintingItems);
    }
}

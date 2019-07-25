package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class GLRectF implements Parcelable {
    public static final Creator<GLRectF> CREATOR = new Creator<GLRectF>() {
        public GLRectF createFromParcel(Parcel parcel) {
            return new GLRectF(parcel);
        }

        public GLRectF[] newArray(int i) {
            return new GLRectF[i];
        }
    };
    private float bottom;
    private float left;
    private float right;
    private float top;

    static class Iterator {
        private final float mBitmapHeight;
        private final float mBitmapWidth;
        private GLRectF mGLRectF = new GLRectF();
        private int mSize;
        private final float mXPixel;
        private float mXStep;
        private final float mYPixel;
        private float mYStep;

        public Iterator(float f, float f2) {
            this.mBitmapWidth = f;
            this.mBitmapHeight = f2;
            this.mXPixel = 1.0f / this.mBitmapWidth;
            this.mYPixel = 1.0f / this.mBitmapHeight;
        }

        public void countMiddleRect(GLRectF gLRectF, GLRectF gLRectF2) {
            countMiddleRect(gLRectF, gLRectF2, Math.max(gLRectF.width() * this.mBitmapWidth, gLRectF.height() * this.mBitmapHeight) / 5.0f);
        }

        public void countMiddleRect(GLRectF gLRectF, GLRectF gLRectF2, float f) {
            float centerX = gLRectF2.centerX() - gLRectF.centerX();
            float centerY = gLRectF2.centerY() - gLRectF.centerY();
            this.mSize = Math.max(Math.abs(Math.round((centerX / this.mXPixel) / f)), Math.abs(Math.round((centerY / this.mYPixel) / f)));
            this.mXStep = centerX / ((float) (this.mSize + 1));
            this.mYStep = centerY / ((float) (this.mSize + 1));
            this.mGLRectF.set(gLRectF);
        }

        public boolean hasNext() {
            return this.mSize >= 0;
        }

        public void next(float[] fArr) {
            if (this.mSize >= 0) {
                this.mGLRectF.offset(this.mXStep, this.mYStep);
                this.mGLRectF.getVertex(fArr);
                this.mSize--;
                return;
            }
            throw new RuntimeException("iterator size error!!!");
        }
    }

    public GLRectF() {
    }

    protected GLRectF(Parcel parcel) {
        this.left = parcel.readFloat();
        this.top = parcel.readFloat();
        this.right = parcel.readFloat();
        this.bottom = parcel.readFloat();
    }

    public GLRectF(float[] fArr) {
        setByVertex(fArr);
    }

    public float centerX() {
        return (this.left + this.right) * 0.5f;
    }

    public final float centerY() {
        return (this.top + this.bottom) * 0.5f;
    }

    public int describeContents() {
        return 0;
    }

    public void getVertex(float[] fArr) {
        fArr[0] = this.left;
        fArr[1] = this.bottom;
        fArr[2] = this.right;
        fArr[3] = this.bottom;
        fArr[4] = this.left;
        fArr[5] = this.top;
        fArr[6] = this.right;
        fArr[7] = this.top;
    }

    public final float height() {
        return this.top - this.bottom;
    }

    public void offset(float f, float f2) {
        this.left += f;
        this.top += f2;
        this.right += f;
        this.bottom += f2;
    }

    public void set(GLRectF gLRectF) {
        this.left = gLRectF.left;
        this.top = gLRectF.top;
        this.right = gLRectF.right;
        this.bottom = gLRectF.bottom;
    }

    public void setByVertex(float[] fArr) {
        this.left = fArr[0];
        this.top = fArr[5];
        this.right = fArr[2];
        this.bottom = fArr[1];
    }

    public final float width() {
        return this.right - this.left;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(this.left);
        parcel.writeFloat(this.top);
        parcel.writeFloat(this.right);
        parcel.writeFloat(this.bottom);
    }
}

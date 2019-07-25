package com.nostra13.universalimageloader.core.imageaware;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;

public class NonViewAware implements ImageAware {
    protected ImageSize imageSize;
    protected String imageUri;
    private SparseArray<Object> mKeyedTags;
    protected ViewScaleType scaleType;

    public NonViewAware(ImageSize imageSize2, ViewScaleType viewScaleType) {
        this(null, imageSize2, viewScaleType);
    }

    public NonViewAware(String str, ImageSize imageSize2, ViewScaleType viewScaleType) {
        if (imageSize2 == null) {
            throw new IllegalArgumentException("imageSize must not be null");
        } else if (viewScaleType != null) {
            this.imageUri = str;
            this.imageSize = imageSize2;
            this.scaleType = viewScaleType;
        } else {
            throw new IllegalArgumentException("scaleType must not be null");
        }
    }

    private void setKeyedTag(int i, Object obj) {
        if (this.mKeyedTags == null) {
            this.mKeyedTags = new SparseArray<>(2);
        }
        this.mKeyedTags.put(i, obj);
    }

    public Bitmap getBitmap() {
        return null;
    }

    public int getHeight() {
        return this.imageSize.getHeight();
    }

    public int getId() {
        return TextUtils.isEmpty(this.imageUri) ? super.hashCode() : this.imageUri.hashCode();
    }

    public ViewScaleType getScaleType() {
        return this.scaleType;
    }

    public Object getTag(int i) {
        if (this.mKeyedTags != null) {
            return this.mKeyedTags.get(i);
        }
        return null;
    }

    public int getWidth() {
        return this.imageSize.getWidth();
    }

    public View getWrappedView() {
        return null;
    }

    public boolean isCollected() {
        return false;
    }

    public void saveBitmap(Bitmap bitmap) {
    }

    public boolean setImageBitmap(Bitmap bitmap) {
        return true;
    }

    public boolean setImageDrawable(Drawable drawable) {
        return true;
    }

    public void setTag(int i, Object obj) {
        if ((i >>> 24) >= 2) {
            setKeyedTag(i, obj);
            return;
        }
        throw new IllegalArgumentException("The key must be an application-specific resource id.");
    }
}

package com.miui.gallery.util.photoview;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import java.lang.ref.WeakReference;
import java.util.Locale;

public class Tile {
    private static Paint sPaint;
    private TileBit mBit;
    private int mColumn;
    private RectF mDisplayRect;
    private WeakReference<BitmapRecycleCallback> mRecycleCallbackRef;
    private int mRefreshId = -1;
    private int mRow;
    private int mSampleSize;
    private int mState;
    private Rect mTileRect;

    public Tile(Rect rect, RectF rectF, int i, BitmapRecycleCallback bitmapRecycleCallback) {
        this.mTileRect = rect;
        this.mDisplayRect = rectF;
        this.mSampleSize = i;
        this.mRecycleCallbackRef = new WeakReference<>(bitmapRecycleCallback);
        setActive(true);
    }

    private BitmapRecycleCallback getBitmapRecycleCallback() {
        if (this.mRecycleCallbackRef != null) {
            return (BitmapRecycleCallback) this.mRecycleCallbackRef.get();
        }
        return null;
    }

    private static Paint getPaint() {
        if (sPaint == null) {
            sPaint = new Paint();
        }
        return sPaint;
    }

    private boolean isContentValidate() {
        return this.mBit != null && this.mBit.isContentValidate();
    }

    private void setActive(boolean z) {
        this.mState &= -4;
        if (z) {
            this.mState |= 0;
        } else {
            this.mState |= 2;
        }
    }

    private void setDecoded() {
        this.mState &= -13;
        if (isContentValidate()) {
            this.mState |= 4;
        } else {
            this.mState |= 8;
        }
    }

    public boolean decode(TileBitProvider tileBitProvider) {
        if (tileBitProvider != null) {
            this.mBit = tileBitProvider.getTileBit(this.mTileRect, this.mSampleSize);
        }
        setDecoded();
        return isContentValidate();
    }

    public boolean draw(Canvas canvas, Paint paint) {
        if (!isContentValidate()) {
            return false;
        }
        if (paint == null) {
            paint = getPaint();
        }
        this.mBit.draw(canvas, new RectF(this.mDisplayRect.left, this.mDisplayRect.top, this.mDisplayRect.left + (((this.mDisplayRect.width() * ((float) this.mBit.getValidateWidth())) * ((float) this.mSampleSize)) / ((float) this.mTileRect.width())), this.mDisplayRect.top + (((this.mDisplayRect.height() * ((float) this.mBit.getValidateHeight())) * ((float) this.mSampleSize)) / ((float) this.mTileRect.height()))), paint);
        return true;
    }

    public int getRefreshId() {
        return this.mRefreshId;
    }

    public Rect getTileRect() {
        return this.mTileRect;
    }

    public boolean isActive() {
        return (this.mState & 3) == 0;
    }

    public void recycle() {
        this.mBit.recycle(getBitmapRecycleCallback());
        this.mBit = null;
        setActive(false);
        setDecoded();
        this.mRefreshId = -1;
    }

    public void setIndex(int i, int i2) {
        this.mRow = i;
        this.mColumn = i2;
    }

    public void setRefreshId(int i) {
        this.mRefreshId = i;
    }

    public String toString() {
        return String.format(Locale.US, "tileRect %s, displayRect %s, sampleSize %d, state %d, refreshId %d", new Object[]{String.valueOf(this.mTileRect), String.valueOf(this.mDisplayRect), Integer.valueOf(this.mSampleSize), Integer.valueOf(this.mState), Integer.valueOf(this.mRefreshId)});
    }

    /* access modifiers changed from: protected */
    public void updateDisplayParam(RectF rectF) {
        this.mDisplayRect.set(rectF);
        setActive(true);
    }

    /* access modifiers changed from: protected */
    public void updateTileParam(Rect rect, int i) {
        this.mTileRect.set(rect);
        this.mSampleSize = i;
    }
}

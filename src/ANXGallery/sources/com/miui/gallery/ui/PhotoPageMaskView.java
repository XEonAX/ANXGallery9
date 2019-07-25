package com.miui.gallery.ui;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.app.BottomMenuFragment;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.util.MiscUtil;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class PhotoPageMaskView extends View {
    private boolean isActionBarDividerVisible;
    private boolean isMaskVisible;
    private boolean isSplitBarDividerVisible;
    /* access modifiers changed from: private */
    public int mActionBarDividerY;
    /* access modifiers changed from: private */
    public Drawable mActionBarMask;
    private ValueAnimator mActionBarMaskAnim;
    private Paint mDividerPaint;
    private BottomMenuFragment mHost;
    /* access modifiers changed from: private */
    public int mSplitBarDividerY;
    private int mSplitBarHeight;
    /* access modifiers changed from: private */
    public Drawable mSplitBarMask;
    private int mSystemWindowInsetTop;

    private void cancelAnim() {
        if (this.mActionBarMaskAnim != null) {
            this.mActionBarMaskAnim.cancel();
            this.mActionBarMaskAnim = null;
        }
    }

    /* access modifiers changed from: private */
    public int getActionBarHeight() {
        if (this.mHost == null || this.mHost.getActionBar() == null) {
            return -1;
        }
        return this.mSystemWindowInsetTop + getContext().getResources().getDimensionPixelSize(R.dimen.photo_page_actionbar_height);
    }

    private ValueAnimator getMaskAnim(boolean z) {
        if (z) {
            ValueAnimator duration = ValueAnimator.ofInt(new int[]{0, 255}).setDuration((long) getResources().getInteger(R.integer.photo_bar_mask_in_duration));
            duration.setInterpolator(new CubicEaseOutInterpolator());
            return duration;
        }
        ValueAnimator duration2 = ValueAnimator.ofInt(new int[]{255, 0}).setDuration((long) getResources().getInteger(R.integer.photo_bar_mask_out_duration));
        duration2.setInterpolator(new CubicEaseInInterpolator());
        return duration2;
    }

    /* access modifiers changed from: private */
    public int getSplitBarHeight() {
        if (this.mHost != null && this.mSplitBarHeight == -1) {
            this.mSplitBarHeight = this.mHost.getMenuCollapsedHeight();
        }
        return (this.mSplitBarHeight > 0 ? this.mSplitBarHeight : MiscUtil.getDefaultSplitActionBarHeight(getContext())) + ViewCompat.getSystemWindowInsetBottom(this);
    }

    private void initActionBarDividerPos() {
        this.mActionBarDividerY = getActionBarHeight();
    }

    private void initSplitBarDividerPos() {
        if (getSplitBarHeight() > 0) {
            this.mSplitBarDividerY = getHeight() - getSplitBarHeight();
        } else {
            this.mSplitBarDividerY = -1;
        }
    }

    private boolean setMaskBounds() {
        int actionBarHeight = getActionBarHeight();
        int splitBarHeight = getSplitBarHeight();
        if (actionBarHeight == -1 || splitBarHeight == -1) {
            return false;
        }
        if (this.mActionBarMask != null) {
            this.mActionBarMask.setBounds(0, 0, getWidth(), actionBarHeight);
        }
        if (this.mSplitBarMask != null) {
            this.mSplitBarMask.setBounds(0, getHeight() - splitBarHeight, getWidth(), getHeight());
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.isActionBarDividerVisible && this.mActionBarDividerY != -1) {
            canvas.drawLine(0.0f, (float) this.mActionBarDividerY, (float) getWidth(), (float) this.mActionBarDividerY, this.mDividerPaint);
        }
        if (this.isSplitBarDividerVisible && this.mSplitBarDividerY != -1) {
            canvas.drawLine(0.0f, (float) this.mSplitBarDividerY, (float) getWidth(), (float) this.mSplitBarDividerY, this.mDividerPaint);
        }
        if (this.mActionBarMask != null) {
            this.mActionBarMask.draw(canvas);
        }
        if (this.mSplitBarMask != null) {
            this.mSplitBarMask.draw(canvas);
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        cancelAnim();
        setMaskBounds();
        initActionBarDividerPos();
        initSplitBarDividerPos();
        int i5 = this.isMaskVisible ? 255 : 0;
        if (this.mActionBarMask != null) {
            this.mActionBarMask.setAlpha(i5);
        }
        if (this.mSplitBarMask != null) {
            this.mSplitBarMask.setAlpha(i5);
        }
        invalidate();
    }

    public boolean setActionBarDividerVisible(boolean z) {
        if (z == this.isActionBarDividerVisible) {
            return false;
        }
        this.isActionBarDividerVisible = z;
        if (z) {
            initActionBarDividerPos();
        }
        invalidate();
        return true;
    }

    public boolean setActionBarMaskVisible(boolean z, boolean z2) {
        int i = 0;
        if ((this.mActionBarMask == null && this.mSplitBarMask == null) || z == this.isMaskVisible || !setMaskBounds()) {
            return false;
        }
        this.isMaskVisible = z;
        cancelAnim();
        if (z2) {
            this.mActionBarMaskAnim = getMaskAnim(z);
            this.mActionBarMaskAnim.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    int intValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                    if (PhotoPageMaskView.this.mActionBarMask != null) {
                        PhotoPageMaskView.this.mActionBarMask.setAlpha(intValue);
                        int access$600 = (int) (((((float) PhotoPageMaskView.this.getActionBarHeight()) * 1.0f) * ((float) intValue)) / 255.0f);
                        PhotoPageMaskView.this.mActionBarMask.setBounds(0, 0, PhotoPageMaskView.this.getWidth(), access$600);
                        PhotoPageMaskView.this.mActionBarDividerY = access$600;
                    }
                    if (PhotoPageMaskView.this.mSplitBarMask != null) {
                        PhotoPageMaskView.this.mSplitBarMask.setAlpha(intValue);
                        int access$900 = (int) (((((float) PhotoPageMaskView.this.getSplitBarHeight()) * 1.0f) * ((float) intValue)) / 255.0f);
                        PhotoPageMaskView.this.mSplitBarMask.setBounds(0, PhotoPageMaskView.this.getHeight() - access$900, PhotoPageMaskView.this.getWidth(), PhotoPageMaskView.this.getHeight());
                        PhotoPageMaskView.this.mSplitBarDividerY = PhotoPageMaskView.this.getHeight() - access$900;
                    }
                    PhotoPageMaskView.this.invalidate();
                }
            });
            this.mActionBarMaskAnim.start();
        } else {
            if (z) {
                i = 255;
            }
            if (this.mActionBarMask != null) {
                this.mActionBarMask.setAlpha(i);
            }
            if (this.mSplitBarMask != null) {
                this.mSplitBarMask.setAlpha(i);
            }
            invalidate();
        }
        return true;
    }

    public void setHost(BottomMenuFragment bottomMenuFragment) {
        this.mHost = bottomMenuFragment;
    }

    public boolean setSplitBarDividerVisible(boolean z) {
        if (z == this.isSplitBarDividerVisible) {
            return false;
        }
        this.isSplitBarDividerVisible = z;
        if (z) {
            initSplitBarDividerPos();
        }
        invalidate();
        return true;
    }
}

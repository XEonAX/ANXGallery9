package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.OverScroller;
import com.miui.gallery.R;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;

public class BabyAlbumDetailPageScrollView extends LinearLayout {
    private boolean isTopHidden = false;
    private int mActionBarHeight;
    Rect mActionbarMask;
    private boolean mDragging;
    private InnerScollerStateChangedMessager mInnerScollerStateChangedMessager;
    private float mLastY;
    private int mMaskColor;
    Paint mMaskPaint;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private OverScroller mScroller;
    private int mTopViewHeight;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;

    interface InnerScollerStateChangedMessager {
        boolean disappearFloatingView();

        View getRecommendFaceButton();

        boolean isScoll2Top();

        void setNormalActionBarBackground();

        void setNullActionBarBackground();
    }

    public BabyAlbumDetailPageScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setOrientation(1);
        this.mScroller = new OverScroller(context);
        this.mVelocityTracker = VelocityTracker.obtain();
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.mMaximumVelocity = ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
        this.mMinimumVelocity = ViewConfiguration.get(context).getScaledMinimumFlingVelocity();
        this.mMaskColor = context.getResources().getColor(R.color.baby_album_action_bar_mask);
    }

    public void computeScroll() {
        if (this.mScroller.computeScrollOffset()) {
            scrollTo(0, this.mScroller.getCurrY());
            invalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mTopViewHeight != 0 && canvas.getWidth() != 0) {
            if (this.mActionbarMask == null) {
                this.mActionbarMask = new Rect(0, 0, canvas.getWidth(), this.mActionBarHeight);
            }
            if (this.mMaskPaint == null) {
                this.mMaskPaint = new Paint();
                this.mMaskPaint.setColor(this.mMaskColor);
            }
            canvas.saveLayerAlpha(0.0f, 0.0f, (float) canvas.getWidth(), (float) canvas.getHeight(), (getScrollY() * 255) / this.mTopViewHeight, 31);
            canvas.translate(0.0f, (float) getScrollY());
            canvas.drawRect(this.mActionbarMask, this.mMaskPaint);
            canvas.restore();
        }
    }

    public void fling(int i) {
        this.mScroller.fling(0, getScrollY(), 0, i, 0, 0, 0, this.mTopViewHeight);
        invalidate();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        float y = motionEvent.getY();
        if (action != 0) {
            if (action == 2) {
                float f = y - this.mLastY;
                if (Math.abs(f) > ((float) this.mTouchSlop)) {
                    this.mDragging = true;
                    if (!this.isTopHidden || (this.mInnerScollerStateChangedMessager.isScoll2Top() && this.isTopHidden && f > 0.0f)) {
                        return true;
                    }
                }
            }
        } else if (this.mInnerScollerStateChangedMessager.disappearFloatingView()) {
            return true;
        } else {
            this.mLastY = y;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (getChildCount() > 0) {
            int i3 = 0;
            View view = null;
            for (int i4 = 0; i4 < getChildCount(); i4++) {
                view = getChildAt(i4);
                if (view instanceof StickyGridHeadersGridView) {
                    break;
                }
            }
            if (view != null) {
                int measuredHeight = getMeasuredHeight();
                if (view.getMeasuredHeight() < measuredHeight) {
                    int childMeasureSpec = getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight(), ((LayoutParams) view.getLayoutParams()).width);
                    int paddingTop = (measuredHeight - getPaddingTop()) - getPaddingBottom();
                    View recommendFaceButton = this.mInnerScollerStateChangedMessager.getRecommendFaceButton();
                    if (recommendFaceButton != null && recommendFaceButton.getVisibility() == 0) {
                        i3 = recommendFaceButton.getMeasuredHeight();
                    }
                    view.measure(childMeasureSpec, MeasureSpec.makeMeasureSpec((paddingTop - (this.mActionBarHeight * 2)) - i3, 1073741824));
                }
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.mVelocityTracker.addMovement(motionEvent);
        int action = motionEvent.getAction();
        float y = motionEvent.getY();
        switch (action) {
            case 0:
                if (!this.mScroller.isFinished()) {
                    this.mScroller.abortAnimation();
                }
                this.mVelocityTracker.clear();
                this.mVelocityTracker.addMovement(motionEvent);
                this.mLastY = y;
                return true;
            case 1:
                this.mDragging = false;
                this.mVelocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
                int yVelocity = (int) this.mVelocityTracker.getYVelocity();
                if (Math.abs(yVelocity) > this.mMinimumVelocity) {
                    fling(-yVelocity);
                }
                this.mVelocityTracker.clear();
                break;
            case 2:
                float f = y - this.mLastY;
                if (!this.mDragging && Math.abs(f) > ((float) this.mTouchSlop)) {
                    this.mDragging = true;
                }
                if (this.mDragging) {
                    scrollBy(0, (int) (-f));
                    this.mLastY = y;
                    break;
                }
                break;
            case 3:
                this.mDragging = false;
                if (!this.mScroller.isFinished()) {
                    this.mScroller.abortAnimation();
                    break;
                }
                break;
        }
        return super.onTouchEvent(motionEvent);
    }

    public void scrollTo(int i, int i2) {
        boolean z = false;
        if (i2 < 0) {
            i2 = 0;
        }
        if (i2 > this.mTopViewHeight) {
            i2 = this.mTopViewHeight;
        }
        if (i2 != getScrollY()) {
            super.scrollTo(i, i2);
        }
        if (getScrollY() == this.mTopViewHeight) {
            z = true;
        }
        if (z != this.isTopHidden) {
            if (!this.isTopHidden) {
                this.mInnerScollerStateChangedMessager.setNormalActionBarBackground();
            } else {
                this.mInnerScollerStateChangedMessager.setNullActionBarBackground();
            }
            this.isTopHidden = z;
        }
    }

    public void setInnerScollerMessager(InnerScollerStateChangedMessager innerScollerStateChangedMessager) {
        this.mInnerScollerStateChangedMessager = innerScollerStateChangedMessager;
    }

    public void setTopViewHeight(int i) {
        this.mActionBarHeight = i;
        this.mTopViewHeight = getContext().getResources().getDimensionPixelSize(R.dimen.baby_album_page_header_height) - i;
    }
}

package com.miui.gallery.adapter;

import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import com.miui.gallery.GalleryApp;

public class ExcludeOnTouchListener implements OnTouchListener {
    private Rect mExcludeRegion;
    private View mExcludedView;
    private View mHostView;
    private int mLastX;
    private int mLastY;
    private int mMoveX;
    private int mMoveY;
    private OnTouchValidListener mOnTouchValidListener;
    private int mSlop = ViewConfiguration.get(GalleryApp.sGetAndroidContext()).getScaledTouchSlop();

    interface OnTouchValidListener {
        void onTouchValid(View view);
    }

    public ExcludeOnTouchListener(View view, View view2, OnTouchValidListener onTouchValidListener) {
        this.mHostView = view;
        this.mExcludedView = view2;
        this.mOnTouchValidListener = onTouchValidListener;
    }

    private void initExcludeRegion() {
        if (this.mExcludeRegion == null || this.mExcludeRegion.width() == 0 || this.mExcludeRegion.height() == 0) {
            Rect rect = new Rect();
            Rect rect2 = new Rect();
            this.mExcludedView.getGlobalVisibleRect(rect);
            this.mHostView.getGlobalVisibleRect(rect2);
            this.mExcludeRegion = new Rect();
            this.mExcludeRegion.set(rect.left - rect2.left, rect.top - rect2.top, rect.right - rect2.left, rect.bottom - rect2.top);
            this.mExcludeRegion.inset(-this.mExcludeRegion.width(), -this.mExcludeRegion.height());
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        int x = (int) motionEvent.getX();
        int y = (int) motionEvent.getY();
        initExcludeRegion();
        if (this.mExcludeRegion.contains(x, y)) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                this.mLastX = x;
                this.mLastY = y;
                this.mMoveX = 0;
                this.mMoveY = 0;
                return true;
            case 1:
                if (this.mMoveX <= this.mSlop && this.mMoveY <= this.mSlop) {
                    if (this.mOnTouchValidListener != null) {
                        this.mOnTouchValidListener.onTouchValid(view);
                    }
                    return true;
                }
            case 2:
                this.mMoveX += Math.abs(this.mLastX - x);
                this.mMoveY += Math.abs(this.mLastY - y);
                this.mLastX = x;
                this.mLastY = y;
                break;
        }
        return false;
    }
}

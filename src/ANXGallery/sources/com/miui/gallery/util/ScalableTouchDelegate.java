package com.miui.gallery.util;

import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewConfiguration;

public class ScalableTouchDelegate extends TouchDelegate {
    private Rect mBounds;
    private boolean mDelegateTargeted;
    private View mDelegateView;
    private View mHostView;
    private float mScale;
    private int mSlop;
    private Rect mSlopBounds;

    public ScalableTouchDelegate(float f, View view, View view2) {
        super(null, view2);
        this.mScale = f < 1.0f ? 0.0f : f - 1.0f;
        this.mBounds = new Rect();
        this.mSlop = ViewConfiguration.get(view2.getContext()).getScaledTouchSlop();
        this.mSlopBounds = new Rect(this.mBounds);
        this.mDelegateView = view2;
        this.mHostView = view;
    }

    private void setBounds() {
        if (this.mBounds.isEmpty()) {
            Rect rect = new Rect();
            Rect rect2 = new Rect();
            this.mDelegateView.getGlobalVisibleRect(rect);
            this.mHostView.getGlobalVisibleRect(rect2);
            if (rect2.contains(rect)) {
                this.mBounds.set(rect.left - rect2.left, rect.top - rect2.top, rect.right - rect2.left, rect.bottom - rect2.top);
                this.mBounds.inset(-((int) (((float) rect.width()) * this.mScale)), -((int) (((float) rect.height()) * this.mScale)));
                this.mSlopBounds.set(this.mBounds);
                this.mSlopBounds.inset(-this.mSlop, -this.mSlop);
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        int x = (int) motionEvent.getX();
        int y = (int) motionEvent.getY();
        boolean z2 = true;
        switch (motionEvent.getAction()) {
            case 0:
                setBounds();
                if (this.mBounds.contains(x, y)) {
                    this.mDelegateTargeted = true;
                    z = true;
                    break;
                }
            case 1:
            case 2:
                z = this.mDelegateTargeted;
                if (z) {
                    z2 = this.mSlopBounds.contains(x, y);
                    break;
                }
                break;
            case 3:
                boolean z3 = this.mDelegateTargeted;
                this.mDelegateTargeted = false;
                z = z3;
                break;
            default:
                z = false;
                break;
        }
        if (!z) {
            return false;
        }
        View view = this.mDelegateView;
        if (z2) {
            motionEvent.setLocation((float) (view.getWidth() / 2), (float) (view.getHeight() / 2));
        } else {
            float f = (float) (-(this.mSlop * 2));
            motionEvent.setLocation(f, f);
        }
        return view.dispatchTouchEvent(motionEvent);
    }
}

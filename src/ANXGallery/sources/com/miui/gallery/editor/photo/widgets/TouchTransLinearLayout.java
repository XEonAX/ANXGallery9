package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;

public class TouchTransLinearLayout extends LinearLayout {
    OnTouchEvent mOnTouchEvent;

    public interface OnTouchEvent {
        boolean onTouchEvent(MotionEvent motionEvent);
    }

    public TouchTransLinearLayout(Context context) {
        super(context);
    }

    public TouchTransLinearLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public TouchTransLinearLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public OnTouchEvent getOnTouchEvent() {
        return this.mOnTouchEvent;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return this.mOnTouchEvent != null ? this.mOnTouchEvent.onTouchEvent(motionEvent) : super.onTouchEvent(motionEvent);
    }

    public void setOnTouchEvent(OnTouchEvent onTouchEvent) {
        this.mOnTouchEvent = onTouchEvent;
    }
}

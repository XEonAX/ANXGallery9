package com.miui.gallery.widget;

import android.view.View;
import android.view.View.OnClickListener;

public class MultiClickListener implements OnClickListener {
    private int mClickCount;
    private long mDuration;
    private long mLastClickTime;
    private int mMaxClickCount;
    private OnClickListener mOnClickListener;

    public MultiClickListener(int i, OnClickListener onClickListener) {
        this(500, i, onClickListener);
    }

    public MultiClickListener(long j, int i, OnClickListener onClickListener) {
        this.mDuration = j;
        this.mMaxClickCount = i;
        this.mOnClickListener = onClickListener;
    }

    private void callClick(View view) {
        if (this.mOnClickListener != null) {
            this.mOnClickListener.onClick(view);
        }
    }

    public void onClick(View view) {
        if (this.mMaxClickCount == 1) {
            callClick(view);
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastClickTime > this.mDuration) {
            this.mClickCount = 0;
        }
        this.mLastClickTime = currentTimeMillis;
        this.mClickCount++;
        if (this.mClickCount >= this.mMaxClickCount) {
            this.mLastClickTime = 0;
            this.mClickCount = 0;
            callClick(view);
        }
    }
}

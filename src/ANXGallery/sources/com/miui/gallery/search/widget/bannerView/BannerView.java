package com.miui.gallery.search.widget.bannerView;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ViewAnimator;
import com.miui.gallery.R;

public class BannerView extends ViewAnimator implements OnDataChangedListener, ILoopController {
    private BaseBannerAdapter mAdapter;
    private int mDefaultItemDisplayDuration;
    private boolean mIsStarted;
    /* access modifiers changed from: private */
    public int mPosition;
    private AnimRunnable mRunnable;
    private boolean mShouldStartLoopingWhenAttached;

    private class AnimRunnable implements Runnable {
        private AnimRunnable() {
        }

        public void run() {
            BannerView.this.performNext();
            BannerView.this.mPosition = BannerView.this.getCircledNextPosition();
            BannerView.this.postDelayed(BannerView.this.mPosition);
        }
    }

    public BannerView(Context context) {
        this(context, null);
    }

    public BannerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mDefaultItemDisplayDuration = 3000;
        this.mPosition = -1;
        this.mShouldStartLoopingWhenAttached = false;
        this.mRunnable = new AnimRunnable();
        init(context, attributeSet);
    }

    /* access modifiers changed from: private */
    public int getCircledNextPosition() {
        return (this.mPosition + 1) % this.mAdapter.getCount();
    }

    private void init(Context context, AttributeSet attributeSet) {
        setAnimateFirstView(false);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.BannerView);
        this.mDefaultItemDisplayDuration = obtainStyledAttributes.getInteger(0, this.mDefaultItemDisplayDuration);
        obtainStyledAttributes.recycle();
    }

    /* access modifiers changed from: private */
    public void postDelayed(int i) {
        BaseBannerItemData item = this.mAdapter.getItem(i);
        postDelayed(this.mRunnable, (long) (item.getDisplayDuration() != -1 ? item.getDisplayDuration() : this.mDefaultItemDisplayDuration));
    }

    private void setupAdapter() {
        for (int i = 0; i < getChildCount(); i++) {
            getChildAt(i).clearAnimation();
        }
        removeAllViews();
        this.mPosition = 0;
        if (this.mAdapter.getCount() > 0) {
            for (int i2 = 0; i2 < 2; i2++) {
                View view = this.mAdapter.getView(this);
                view.setTag(Integer.valueOf(i2));
                addView(view, i2);
            }
            this.mAdapter.bindView(getCurrentView(), this.mPosition);
        }
    }

    public int getCurrentPosition() {
        return this.mPosition;
    }

    public boolean isLooping() {
        return this.mIsStarted;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isLooping() && this.mShouldStartLoopingWhenAttached) {
            startLoop();
        }
    }

    public void onChanged() {
        boolean z;
        if (isLooping()) {
            z = true;
            stopLoop();
        } else {
            z = false;
        }
        setupAdapter();
        if (z) {
            startLoop();
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (isLooping()) {
            stopLoop();
            this.mShouldStartLoopingWhenAttached = true;
        }
    }

    public void performNext() {
        View currentView = getCurrentView();
        if (currentView != null) {
            this.mAdapter.bindView(getChildAt((((Integer) currentView.getTag()).intValue() + 1) % getChildCount()), getCircledNextPosition());
            showNext();
        }
    }

    public void setAdapter(BaseBannerAdapter baseBannerAdapter) {
        if (baseBannerAdapter == null) {
            throw new RuntimeException("adapter must not be null");
        } else if (this.mAdapter == null) {
            this.mAdapter = baseBannerAdapter;
            this.mAdapter.setOnDataChangedListener(this);
            setupAdapter();
        } else {
            throw new RuntimeException("you have already set an Adapter");
        }
    }

    public void startLoop() {
        if (this.mAdapter == null) {
            throw new RuntimeException("You must call setContentAdapter() before start");
        } else if (!this.mIsStarted) {
            this.mIsStarted = true;
            if (this.mAdapter.getCount() > 1) {
                postDelayed(this.mPosition);
            }
        }
    }

    public void stopLoop() {
        removeCallbacks(this.mRunnable);
        this.mIsStarted = false;
    }
}

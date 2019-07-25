package com.miui.gallery.card.ui.detail;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.card.model.BaseMedia;
import com.miui.gallery.widget.SlideShowView;
import com.miui.gallery.widget.SlideShowView.OnRefreshedListener;
import java.util.List;

public class SlideShowHeaderView extends RelativeLayout {
    private boolean mIsPlayEnable;
    /* access modifiers changed from: private */
    public boolean mIsPlayIconInited;
    private final OnGlobalLayoutListener mOnGlobalLayoutListener;
    /* access modifiers changed from: private */
    public final View mPlayIcon;
    private ObjectAnimator mPlayIconAlphaAnim;
    private final SlideShowController mSlideShowController;
    /* access modifiers changed from: private */
    public final SlideShowView mSlideShowView;

    public SlideShowHeaderView(Context context) {
        this(context, null);
    }

    public SlideShowHeaderView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SlideShowHeaderView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mIsPlayIconInited = false;
        this.mOnGlobalLayoutListener = new OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                if (SlideShowHeaderView.this.mIsPlayIconInited) {
                    SlideShowHeaderView.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    return;
                }
                int measuredHeight = SlideShowHeaderView.this.mPlayIcon.getMeasuredHeight();
                if (measuredHeight != 0) {
                    SlideShowHeaderView.this.mIsPlayIconInited = true;
                    int measuredWidth = SlideShowHeaderView.this.mPlayIcon.getMeasuredWidth();
                    int measuredWidth2 = SlideShowHeaderView.this.mSlideShowView.getMeasuredWidth();
                    int measuredHeight2 = SlideShowHeaderView.this.mSlideShowView.getMeasuredHeight();
                    int dimensionPixelSize = SlideShowHeaderView.this.getContext().getResources().getDimensionPixelSize(R.dimen.story_slide_header_play_icon_margin);
                    LayoutParams layoutParams = new LayoutParams(-2, -2);
                    layoutParams.setMargins((measuredWidth2 - measuredWidth) - dimensionPixelSize, (measuredHeight2 - measuredHeight) - dimensionPixelSize, 0, 0);
                    SlideShowHeaderView.this.mPlayIcon.setLayoutParams(layoutParams);
                }
            }
        };
        LayoutInflater.from(context).inflate(R.layout.slide_show_header, this);
        this.mSlideShowView = (SlideShowView) findViewById(R.id.slide);
        this.mSlideShowView.setSlideDuration(3500);
        this.mSlideShowController = new SlideShowController(this.mSlideShowView, 3500);
        this.mPlayIcon = findViewById(R.id.play_icon);
        getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
    }

    private void startPlayIconAlphaAnim(boolean z) {
        if (this.mPlayIconAlphaAnim != null && this.mPlayIconAlphaAnim.isRunning()) {
            this.mPlayIconAlphaAnim.cancel();
        }
        if (z) {
            this.mPlayIconAlphaAnim = ObjectAnimator.ofFloat(this.mPlayIcon, "alpha", new float[]{this.mPlayIcon.getAlpha(), 1.0f});
        } else {
            this.mPlayIconAlphaAnim = ObjectAnimator.ofFloat(this.mPlayIcon, "alpha", new float[]{this.mPlayIcon.getAlpha(), 0.0f});
        }
        this.mPlayIconAlphaAnim.setDuration(150);
        this.mPlayIconAlphaAnim.start();
    }

    public View getPlayIcon() {
        return this.mPlayIcon;
    }

    public boolean isPlayEnable() {
        return this.mIsPlayEnable;
    }

    public void pause() {
        this.mSlideShowController.pause();
    }

    public void resume() {
        this.mSlideShowController.resume();
    }

    public void setPlayEnable(boolean z) {
        this.mIsPlayEnable = z;
        if (z && this.mPlayIcon.getAlpha() != 1.0f) {
            startPlayIconAlphaAnim(true);
        } else if (!z && this.mPlayIcon.getAlpha() != 0.0f) {
            startPlayIconAlphaAnim(false);
        }
    }

    public void setSlideRefreshedListener(OnRefreshedListener onRefreshedListener) {
        this.mSlideShowView.setRefreshListener(onRefreshedListener);
    }

    public void updateMedias(List<? extends BaseMedia> list) {
        this.mSlideShowController.updateMedias(list);
    }
}

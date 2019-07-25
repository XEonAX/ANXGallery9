package com.miui.gallery.video.editor.widget;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miui.gallery.R;
import miui.view.animation.CubicEaseOutInterpolator;

public class DownloadView extends RelativeLayout {
    /* access modifiers changed from: private */
    public ImageView mImageView;
    private ObjectAnimator mRotationAnimal;

    private abstract class MyAnimalListener implements AnimatorListener {
        private MyAnimalListener() {
        }

        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
        }
    }

    public DownloadView(Context context) {
        super(context);
        initView();
    }

    public DownloadView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    private void doDownloading() {
        this.mImageView.setImageResource(R.drawable.editor_downloading);
        rotation();
    }

    /* access modifiers changed from: private */
    public void hide(View view, AnimatorListener animatorListener) {
        ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("alpha", new float[]{1.0f, 0.0f}), PropertyValuesHolder.ofFloat("scaleX", new float[]{1.0f, 0.6f}), PropertyValuesHolder.ofFloat("scaleY", new float[]{1.0f, 0.6f})});
        if (animatorListener != null) {
            ofPropertyValuesHolder.addListener(animatorListener);
        }
        ofPropertyValuesHolder.setInterpolator(new CubicEaseOutInterpolator());
        ofPropertyValuesHolder.setDuration(250).start();
    }

    private void initView() {
        this.mImageView = new ImageView(getContext());
        addView(this.mImageView, -2, -2);
    }

    private void rotation() {
        if (this.mRotationAnimal != null) {
            this.mRotationAnimal.end();
        }
        this.mRotationAnimal = ObjectAnimator.ofFloat(this.mImageView, "rotation", new float[]{0.0f, 360.0f});
        this.mRotationAnimal.setRepeatCount(-1);
        this.mRotationAnimal.setInterpolator(new LinearInterpolator());
        this.mRotationAnimal.setDuration(1000);
        this.mRotationAnimal.start();
    }

    /* access modifiers changed from: private */
    public void show(View view, AnimatorListener animatorListener) {
        ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, 1.0f}), PropertyValuesHolder.ofFloat("scaleX", new float[]{0.6f, 1.0f}), PropertyValuesHolder.ofFloat("scaleY", new float[]{0.6f, 1.0f})});
        if (animatorListener != null) {
            ofPropertyValuesHolder.addListener(animatorListener);
        }
        ofPropertyValuesHolder.setInterpolator(new CubicEaseOutInterpolator());
        ofPropertyValuesHolder.setDuration(350).start();
    }

    public void clearAnimation() {
        super.clearAnimation();
        if (this.mRotationAnimal != null) {
            this.mRotationAnimal.end();
            this.mRotationAnimal = null;
        }
        this.mImageView.clearAnimation();
    }

    public void endDownloading() {
        hide(this.mImageView, new MyAnimalListener() {
            public void onAnimationEnd(Animator animator) {
                DownloadView.this.show(DownloadView.this.mImageView, new MyAnimalListener() {
                    {
                        DownloadView downloadView = DownloadView.this;
                    }

                    public void onAnimationEnd(Animator animator) {
                        DownloadView.this.hide(DownloadView.this, null);
                    }

                    public void onAnimationStart(Animator animator) {
                        super.onAnimationStart(animator);
                        DownloadView.this.mImageView.setImageResource(R.drawable.editor_downloaded);
                    }
                });
            }
        });
    }

    public void setStateImage(int i) {
        clearAnimation();
        if (i != 0) {
            switch (i) {
                case 17:
                    setVisibility(8);
                    return;
                case 18:
                    setVisibility(0);
                    doDownloading();
                    return;
                case 19:
                case 20:
                    setVisibility(0);
                    this.mImageView.setImageResource(R.drawable.editor_download);
                    return;
                default:
                    return;
            }
        } else {
            setVisibility(0);
            endDownloading();
        }
    }
}

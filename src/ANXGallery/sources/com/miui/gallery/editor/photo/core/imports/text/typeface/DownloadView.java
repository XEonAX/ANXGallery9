package com.miui.gallery.editor.photo.core.imports.text.typeface;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import miui.view.animation.CubicEaseOutInterpolator;

public class DownloadView extends LinearLayout {
    /* access modifiers changed from: private */
    public ImageView mImageView;
    private ObjectAnimator mRotationAnimal;
    /* access modifiers changed from: private */
    public TextView mTextView;

    public DownloadView(Context context) {
        super(context);
        initView(context);
    }

    public DownloadView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView(context);
    }

    private void doDownloading() {
        this.mImageView.setImageResource(R.drawable.editor_downloading);
        rotation();
    }

    private void endDownloading() {
        hide(this.mImageView, new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                DownloadView.this.show(DownloadView.this.mImageView, new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        super.onAnimationEnd(animator);
                        DownloadView.this.hide(DownloadView.this, null);
                        DownloadView.this.mTextView.setText("");
                    }

                    public void onAnimationStart(Animator animator) {
                        super.onAnimationStart(animator);
                        DownloadView.this.mImageView.setImageResource(R.drawable.editor_downloaded);
                    }
                });
            }
        });
    }

    /* access modifiers changed from: private */
    public void hide(View view, AnimatorListenerAdapter animatorListenerAdapter) {
        view.setAlpha(1.0f);
        view.setScaleX(1.0f);
        view.setScaleY(1.0f);
        view.animate().alpha(0.0f).scaleX(0.6f).scaleY(0.6f).setDuration(250).setListener(animatorListenerAdapter).setInterpolator(new CubicEaseOutInterpolator());
    }

    private void initView(Context context) {
        inflate(context, R.layout.photo_editor_text_download_view, this);
        this.mTextView = (TextView) findViewById(R.id.text_item);
        this.mImageView = (ImageView) findViewById(R.id.img_item);
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
    public void show(View view, AnimatorListenerAdapter animatorListenerAdapter) {
        view.setAlpha(0.0f);
        view.setScaleX(0.6f);
        view.setScaleY(0.6f);
        view.animate().alpha(1.0f).scaleX(1.0f).scaleY(1.0f).setDuration(350).setListener(animatorListenerAdapter).setInterpolator(new CubicEaseOutInterpolator());
    }

    public void clearAnimator() {
        if (this.mRotationAnimal != null) {
            this.mRotationAnimal.end();
            this.mRotationAnimal = null;
        }
        this.mImageView.animate().cancel();
    }

    public void setStateImage(int i) {
        clearAnimator();
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

    public void setText(CharSequence charSequence) {
        this.mTextView.setText(charSequence);
    }
}

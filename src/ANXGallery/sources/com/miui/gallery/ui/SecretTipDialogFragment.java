package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.QuadraticEaseInOutInterpolator;

public class SecretTipDialogFragment extends GalleryDialogFragment {
    private OnDismissListener mOnDismissListener;
    /* access modifiers changed from: private */
    public SecretTipDialog mSecretTipDialog;

    private class SecretTipDialog extends Dialog implements OnClickListener {
        /* access modifiers changed from: private */
        public boolean mAnimationCanceled = false;
        private AnimatorSet mAnimatorSet = null;
        /* access modifiers changed from: private */
        public View mContentContainer;
        private AnimatorUpdateListener mContentPaddingUpdateListener = new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                SecretTipDialog.this.mContentContainer.setPadding(0, ((Integer) valueAnimator.getAnimatedValue()).intValue(), 0, 0);
            }
        };
        private Button mPositiveBtn;
        private OnClickListener mPositiveListener;
        private View mPressIndicator;

        public SecretTipDialog(Context context) {
            super(context);
        }

        private AnimatorSet loadAnimator() {
            float fraction = SecretTipDialogFragment.this.getResources().getFraction(R.fraction.secret_anim_press_scale, 1, 1);
            ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this.mPressIndicator, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scaleX", new float[]{fraction, 1.0f}), PropertyValuesHolder.ofFloat("scaleY", new float[]{fraction, 1.0f}), PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, 1.0f})});
            ofPropertyValuesHolder.setInterpolator(new CubicEaseInOutInterpolator());
            ofPropertyValuesHolder.setDuration((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_press_duration));
            ofPropertyValuesHolder.setStartDelay((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_pause0_duration));
            int dimensionPixelSize = SecretTipDialogFragment.this.getResources().getDimensionPixelSize(R.dimen.secret_anim_content_end_top_padding);
            int dimensionPixelSize2 = SecretTipDialogFragment.this.getResources().getDimensionPixelSize(R.dimen.secret_anim_content_initial_top_padding);
            ValueAnimator ofInt = ValueAnimator.ofInt(new int[]{dimensionPixelSize2, dimensionPixelSize});
            ofInt.addUpdateListener(this.mContentPaddingUpdateListener);
            ofInt.setInterpolator(new QuadraticEaseInOutInterpolator());
            ofInt.setStartDelay((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_pause1_duration));
            ofInt.setDuration((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_slide_down_duration));
            ValueAnimator ofInt2 = ValueAnimator.ofInt(new int[]{dimensionPixelSize, dimensionPixelSize2});
            ofInt2.addUpdateListener(this.mContentPaddingUpdateListener);
            ofInt2.setInterpolator(new QuadraticEaseInOutInterpolator());
            ofInt2.setStartDelay((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_pause2_duration));
            ofInt2.setDuration((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_slide_up_duration));
            ObjectAnimator ofPropertyValuesHolder2 = ObjectAnimator.ofPropertyValuesHolder(this.mPressIndicator, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scaleX", new float[]{1.0f, fraction}), PropertyValuesHolder.ofFloat("scaleY", new float[]{1.0f, fraction}), PropertyValuesHolder.ofFloat("alpha", new float[]{1.0f, 0.0f})});
            ofPropertyValuesHolder2.setInterpolator(new CubicEaseInOutInterpolator());
            ofPropertyValuesHolder2.setDuration((long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_release_duration));
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playSequentially(new Animator[]{ofPropertyValuesHolder, ofInt, ofInt2, ofPropertyValuesHolder2});
            return animatorSet;
        }

        public void onClick(View view) {
            if (view.getId() == R.id.positive_btn && this.mPositiveListener != null) {
                this.mPositiveListener.onClick(view);
            }
        }

        /* access modifiers changed from: protected */
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            setContentView(R.layout.secret_tip_dialog);
            this.mContentContainer = SecretTipDialogFragment.this.mSecretTipDialog.findViewById(R.id.content_container);
            this.mPressIndicator = SecretTipDialogFragment.this.mSecretTipDialog.findViewById(R.id.press_indicator);
            this.mPositiveBtn = (Button) findViewById(R.id.positive_btn);
            this.mPositiveBtn.setOnClickListener(this);
            Window window = getWindow();
            LayoutParams attributes = window.getAttributes();
            attributes.gravity = 80;
            attributes.width = -1;
            attributes.height = -2;
            window.setAttributes(attributes);
        }

        public void onPause() {
            if (this.mAnimatorSet != null && this.mAnimatorSet.isStarted()) {
                this.mAnimatorSet.pause();
            }
        }

        public void onResume() {
            if (this.mAnimatorSet == null || !this.mAnimatorSet.isPaused()) {
                startAnimation();
            } else {
                this.mAnimatorSet.resume();
            }
        }

        public SecretTipDialog setPositiveButtonOnClickListener(OnClickListener onClickListener) {
            this.mPositiveListener = onClickListener;
            return this;
        }

        public void startAnimation() {
            if (SecretTipDialogFragment.this.getActivity() != null) {
                stopAnimation();
                if (!this.mAnimationCanceled) {
                    if (this.mAnimatorSet == null) {
                        this.mAnimatorSet = loadAnimator();
                    }
                    this.mAnimatorSet.addListener(new AnimatorListenerAdapter() {
                        public void onAnimationCancel(Animator animator) {
                            SecretTipDialog.this.mAnimationCanceled = true;
                        }

                        public void onAnimationEnd(Animator animator) {
                            if (SecretTipDialog.this.mAnimationCanceled) {
                                SecretTipDialog.this.mAnimationCanceled = false;
                            } else if (SecretTipDialogFragment.this.getActivity() != null) {
                                ThreadManager.getMainHandler().postDelayed(new Runnable() {
                                    public void run() {
                                        if (SecretTipDialogFragment.this.getActivity() != null) {
                                            SecretTipDialog.this.startAnimation();
                                        }
                                    }
                                }, (long) SecretTipDialogFragment.this.getResources().getInteger(R.integer.secret_anim_pause3_duration));
                            }
                        }
                    });
                    this.mAnimatorSet.start();
                }
            }
        }

        public void stopAnimation() {
            if (this.mAnimatorSet != null) {
                this.mAnimatorSet.cancel();
                this.mAnimatorSet = null;
            }
        }
    }

    /* access modifiers changed from: private */
    public void onDone(DialogInterface dialogInterface) {
        if (getActivity() != null) {
            if (this.mSecretTipDialog != null) {
                this.mSecretTipDialog.stopAnimation();
            }
            if (this.mOnDismissListener != null) {
                this.mOnDismissListener.onDismiss(dialogInterface);
            } else {
                dismissAllowingStateLoss();
            }
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        onDone(dialogInterface);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mSecretTipDialog = new SecretTipDialog(getActivity()).setPositiveButtonOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                SecretTipDialogFragment.this.onDone(SecretTipDialogFragment.this.mSecretTipDialog);
            }
        });
        return this.mSecretTipDialog;
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        onDone(dialogInterface);
    }

    public void onPause() {
        super.onPause();
        if (this.mSecretTipDialog != null) {
            this.mSecretTipDialog.onPause();
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mSecretTipDialog != null) {
            this.mSecretTipDialog.onResume();
        }
    }

    public void setOnDismissListener(OnDismissListener onDismissListener) {
        this.mOnDismissListener = onDismissListener;
    }
}

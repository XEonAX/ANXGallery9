package com.miui.gallery.editor.photo.app;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.transition.ChangeBounds;
import android.transition.TransitionValues;
import android.util.Property;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.miui.gallery.util.MiscUtil;

class ImageTransition extends ChangeBounds {
    private static Property<ImageView, Matrix> PROPERTY_MATRIX = new Property<ImageView, Matrix>(Matrix.class, "matrix") {
        public Matrix get(ImageView imageView) {
            return imageView.getImageMatrix();
        }

        public void set(ImageView imageView, Matrix matrix) {
            imageView.setImageMatrix(matrix);
        }
    };
    private boolean mEnter;
    private int mImageHeight;
    private int mImageWidth;
    private Matrix mMatrix = new Matrix();

    private static class ConfigCropType implements AnimatorListener {
        private ScaleType mScaleType;

        private ConfigCropType() {
        }

        public void onAnimationCancel(Animator animator) {
            ((ImageView) ((ObjectAnimator) animator).getTarget()).setScaleType(this.mScaleType);
        }

        public void onAnimationEnd(Animator animator) {
            ((ImageView) ((ObjectAnimator) animator).getTarget()).setScaleType(this.mScaleType);
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
            ImageView imageView = (ImageView) ((ObjectAnimator) animator).getTarget();
            this.mScaleType = imageView.getScaleType();
            imageView.setScaleType(ScaleType.MATRIX);
        }
    }

    public ImageTransition(boolean z, Matrix matrix, int i, int i2) {
        this.mEnter = z;
        this.mMatrix.set(matrix);
        this.mImageWidth = i;
        this.mImageHeight = i2;
    }

    private void captureInitialMatrix(TransitionValues transitionValues) {
        RectF rectF = new RectF();
        rectF.set(0.0f, 0.0f, (float) this.mImageWidth, (float) this.mImageHeight);
        RectF rectF2 = new RectF();
        ImageView imageView = (ImageView) transitionValues.view;
        rectF2.set(0.0f, 0.0f, (float) imageView.getDrawable().getIntrinsicWidth(), (float) imageView.getDrawable().getIntrinsicHeight());
        Matrix matrix = new Matrix();
        matrix.setRectToRect(rectF2, rectF, ScaleToFit.FILL);
        matrix.postConcat(this.mMatrix);
        transitionValues.values.put("image-matrix", matrix);
    }

    private void captureMatrix(TransitionValues transitionValues) {
        ImageView imageView = (ImageView) transitionValues.view;
        Matrix matrix = new Matrix();
        RectF rectF = new RectF();
        rectF.set(0.0f, 0.0f, (float) imageView.getWidth(), (float) imageView.getHeight());
        RectF rectF2 = new RectF();
        rectF2.set(0.0f, 0.0f, (float) imageView.getDrawable().getIntrinsicWidth(), (float) imageView.getDrawable().getIntrinsicHeight());
        matrix.setRectToRect(rectF2, rectF, ScaleToFit.CENTER);
        transitionValues.values.put("image-matrix", matrix);
    }

    public void captureEndValues(TransitionValues transitionValues) {
        super.captureEndValues(transitionValues);
        if (!this.mEnter) {
            captureInitialMatrix(transitionValues);
        } else {
            captureMatrix(transitionValues);
        }
    }

    public void captureStartValues(TransitionValues transitionValues) {
        super.captureStartValues(transitionValues);
        if (this.mEnter) {
            captureInitialMatrix(transitionValues);
        } else {
            captureMatrix(transitionValues);
        }
    }

    public Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        boolean z;
        ObjectAnimator objectAnimator;
        if (transitionValues == null || transitionValues2 == null) {
            return null;
        }
        Animator createAnimator = super.createAnimator(viewGroup, transitionValues, transitionValues2);
        if (!this.mEnter) {
            Drawable drawable = ((ImageView) transitionValues.view).getDrawable();
            z = !MiscUtil.floatNear((((float) this.mImageWidth) * 1.0f) / ((float) this.mImageHeight), (((float) drawable.getIntrinsicWidth()) * 1.0f) / ((float) drawable.getIntrinsicHeight()), 0.01f);
        } else {
            z = false;
        }
        if (z) {
            objectAnimator = ObjectAnimator.ofFloat(transitionValues.view, "transitionAlpha", new float[]{0.0f});
        } else {
            ObjectAnimator objectAnimator2 = new ObjectAnimator();
            objectAnimator2.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofObject(PROPERTY_MATRIX, new MatrixEvaluator(), new Matrix[]{(Matrix) transitionValues.values.get("image-matrix"), (Matrix) transitionValues2.values.get("image-matrix")})});
            objectAnimator2.setTarget(transitionValues2.view);
            objectAnimator2.addListener(new ConfigCropType());
            objectAnimator = objectAnimator2;
        }
        if (createAnimator == null) {
            return objectAnimator;
        }
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(new Animator[]{createAnimator, objectAnimator});
        return animatorSet;
    }

    public String[] getTransitionProperties() {
        String[] transitionProperties = super.getTransitionProperties();
        String[] strArr = new String[(transitionProperties.length + 1)];
        System.arraycopy(transitionProperties, 0, strArr, 0, transitionProperties.length);
        strArr[transitionProperties.length] = "image-matrix";
        return strArr;
    }
}

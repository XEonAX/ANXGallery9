package com.miui.gallery.editor.photo.widgets;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.PopupWindow;
import com.miui.gallery.R;

public class PaintSizePopupWindow extends PopupWindow {
    private AnimatorUpdateListener mAnimatorUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            PaintSizePopupWindow.this.getContentView().setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
        }
    };
    private PaintSizeView mPaintView;
    private ValueAnimator mValueAnimator;

    public PaintSizePopupWindow(Context context) {
        super(getCustomView(context), getCustomWidth(context), getCustomHeight(context));
        setBackgroundDrawable(new ColorDrawable(0));
        setAnimationStyle(2131820722);
        this.mPaintView = (PaintSizeView) getContentView().findViewById(R.id.paint_view);
        this.mValueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mValueAnimator.setDuration((long) context.getResources().getInteger(R.integer.paint_anim_duration));
        this.mValueAnimator.setInterpolator(new DecelerateInterpolator());
        this.mValueAnimator.addUpdateListener(this.mAnimatorUpdateListener);
    }

    private static int getCustomHeight(Context context) {
        return context.getResources().getDimensionPixelSize(R.dimen.paint_window_size);
    }

    private static View getCustomView(Context context) {
        return View.inflate(context, R.layout.paint_size_popupwindow, null);
    }

    private static int getCustomWidth(Context context) {
        return context.getResources().getDimensionPixelSize(R.dimen.paint_window_size);
    }

    public void dismiss() {
        this.mValueAnimator.cancel();
        super.dismiss();
    }

    public void setPaintSize(int i) {
        this.mPaintView.setDiameter(i);
    }

    public void showAtLocation(View view, int i, int i2, int i3) {
        super.showAtLocation(view, i, i2, i3);
        getContentView().setAlpha(0.0f);
        this.mValueAnimator.cancel();
        this.mValueAnimator.start();
    }
}

package com.miui.gallery.widget;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.IMultiThemeView.Theme;
import com.miui.gallery.widget.IMultiThemeView.ThemeTransition;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class PhotoPageLayout extends FrameLayout implements IMultiThemeView {
    private static final Theme DEFAULT_THEME = Theme.LIGHT;
    private float mAnimFinalValue;
    /* access modifiers changed from: private */
    public float mBackgroundAlpha;
    private int mBackgroundColor;
    private ValueAnimator mColorAnim;
    /* access modifiers changed from: private */
    public float mPreBackgroundAlpha;
    private int mPreBackgroundColor;
    private Theme mTheme;
    /* access modifiers changed from: private */
    public ThemeTransition mTransition;

    public PhotoPageLayout(Context context) {
        this(context, null);
    }

    public PhotoPageLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PhotoPageLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void cancelBackgroundTransition() {
        if (isBackColorTransiting()) {
            this.mColorAnim.cancel();
        }
    }

    private void drawBackground(Canvas canvas) {
        if (isBackColorTransiting()) {
            int i = this.mPreBackgroundColor;
            float f = this.mPreBackgroundAlpha;
            int i2 = this.mBackgroundColor;
            float f2 = this.mBackgroundAlpha;
            if (this.mTransition == ThemeTransition.FADE_OUT) {
                i = this.mBackgroundColor;
                f = this.mBackgroundAlpha;
                i2 = this.mPreBackgroundColor;
                f2 = this.mPreBackgroundAlpha;
            }
            if (f > 0.0f) {
                canvas.save();
                drawColor(canvas, i, f);
                canvas.restore();
            }
            drawColor(canvas, i2, f2);
            return;
        }
        drawColor(canvas, this.mBackgroundColor, this.mBackgroundAlpha);
    }

    private void drawColor(Canvas canvas, int i, float f) {
        if (f > 0.0f) {
            canvas.drawColor(genColor(i, f));
        }
    }

    private int genColor(int i, float f) {
        return Color.argb((int) (f * 255.0f), Color.red(i), Color.green(i), Color.blue(i));
    }

    private int getBackgroundColor(Theme theme) {
        switch (theme) {
            case LIGHT:
                return getContext().getResources().getColor(R.color.photo_page_default_background);
            case DARK:
                return getContext().getResources().getColor(R.color.photo_page_fullscreen_background);
            default:
                return 0;
        }
    }

    private Interpolator getDefaultTransitionInterpolator(ThemeTransition themeTransition) {
        switch (themeTransition) {
            case FADE_IN:
                return new CubicEaseOutInterpolator();
            case FADE_OUT:
                return new SineEaseInOutInterpolator();
            default:
                return null;
        }
    }

    private long getDefaultTransitionTime(ThemeTransition themeTransition) {
        switch (themeTransition) {
            case FADE_IN:
                return (long) getResources().getInteger(R.integer.photo_background_in_duration);
            case FADE_OUT:
                return (long) getResources().getInteger(R.integer.photo_background_out_duration);
            default:
                return 0;
        }
    }

    private void init() {
        setWillNotDraw(false);
        this.mBackgroundAlpha = 1.0f;
        this.mPreBackgroundAlpha = 0.0f;
        setTheme(DEFAULT_THEME);
    }

    private boolean isBackColorTransiting() {
        return this.mColorAnim != null && this.mColorAnim.isRunning();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        drawBackground(canvas);
        super.onDraw(canvas);
    }

    public void setBackgroundAlpha(float f) {
        if (!isBackColorTransiting() || !MiscUtil.floatEquals(f, this.mAnimFinalValue)) {
            cancelBackgroundTransition();
            this.mPreBackgroundAlpha = 0.0f;
            if (!MiscUtil.floatEquals(this.mBackgroundAlpha, f)) {
                this.mBackgroundAlpha = f;
                invalidate();
            }
            return;
        }
        Log.d("PhotoPageLayout", "color transiting while set alpha %s", (Object) Float.valueOf(f));
    }

    public void setTheme(Theme theme) {
        setTheme(theme, ThemeTransition.NONE);
    }

    public void setTheme(Theme theme, ThemeTransition themeTransition) {
        setTheme(theme, themeTransition, getDefaultTransitionInterpolator(themeTransition), getDefaultTransitionTime(themeTransition));
    }

    public void setTheme(Theme theme, ThemeTransition themeTransition, Interpolator interpolator, long j) {
        float f;
        if (this.mTheme != theme) {
            Log.d("PhotoPageLayout", "setTheme %s -> %s", this.mTheme, theme);
            this.mTheme = theme;
            this.mPreBackgroundColor = this.mBackgroundColor;
            this.mBackgroundColor = getBackgroundColor(theme);
            this.mTransition = themeTransition;
            float f2 = 0.0f;
            switch (themeTransition) {
                case FADE_IN:
                    this.mPreBackgroundAlpha = this.mBackgroundAlpha;
                    this.mBackgroundAlpha = 0.0f;
                    if (isBackColorTransiting()) {
                        this.mPreBackgroundAlpha = this.mAnimFinalValue;
                    } else {
                        this.mAnimFinalValue = this.mPreBackgroundAlpha;
                    }
                    f2 = this.mAnimFinalValue;
                    f = 0.0f;
                    break;
                case FADE_OUT:
                    if (isBackColorTransiting()) {
                        this.mBackgroundAlpha = this.mAnimFinalValue;
                    } else {
                        this.mAnimFinalValue = this.mBackgroundAlpha;
                    }
                    f = this.mAnimFinalValue;
                    this.mPreBackgroundAlpha = f;
                    break;
                default:
                    this.mPreBackgroundAlpha = 0.0f;
                    this.mBackgroundAlpha = 1.0f;
                    this.mAnimFinalValue = 1.0f;
                    f = 1.0f;
                    f2 = 1.0f;
                    break;
            }
            if (!MiscUtil.floatEquals(f, f2)) {
                cancelBackgroundTransition();
                if (j <= 0) {
                    j = getDefaultTransitionTime(themeTransition);
                }
                if (interpolator == null) {
                    interpolator = getDefaultTransitionInterpolator(themeTransition);
                }
                this.mColorAnim = ValueAnimator.ofFloat(new float[]{f, f2}).setDuration(j);
                this.mColorAnim.setInterpolator(interpolator);
                this.mColorAnim.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        switch (AnonymousClass2.$SwitchMap$com$miui$gallery$widget$IMultiThemeView$ThemeTransition[PhotoPageLayout.this.mTransition.ordinal()]) {
                            case 1:
                                PhotoPageLayout.this.mBackgroundAlpha = floatValue;
                                break;
                            case 2:
                                PhotoPageLayout.this.mPreBackgroundAlpha = floatValue;
                                break;
                        }
                        PhotoPageLayout.this.invalidate();
                    }
                });
                this.mColorAnim.start();
            } else {
                invalidate();
            }
        }
    }
}

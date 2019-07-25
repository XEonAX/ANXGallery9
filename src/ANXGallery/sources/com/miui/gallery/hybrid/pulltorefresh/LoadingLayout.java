package com.miui.gallery.hybrid.pulltorefresh;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.Mode;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.Orientation;

@SuppressLint({"ViewConstructor"})
public abstract class LoadingLayout extends FrameLayout implements ILoadingLayout {
    static final Interpolator ANIMATION_INTERPOLATOR = new LinearInterpolator();
    protected final ImageView mHeaderImage = ((ImageView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_image));
    protected final ProgressBar mHeaderProgress = ((ProgressBar) this.mInnerLayout.findViewById(R.id.pull_to_refresh_progress));
    private final TextView mHeaderText = ((TextView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_text));
    private View mInnerLayout = findViewById(R.id.fl_inner);
    protected final Mode mMode;
    private CharSequence mPullLabel;
    private CharSequence mRefreshingLabel;
    private CharSequence mReleaseLabel;
    protected final Orientation mScrollDirection;
    private final TextView mSubHeaderText = ((TextView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_sub_text));
    private boolean mUseIntrinsicAnimation;

    /* renamed from: com.miui.gallery.hybrid.pulltorefresh.LoadingLayout$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode = new int[Mode.values().length];
        static final /* synthetic */ int[] $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation = new int[Orientation.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(11:0|1|2|3|(2:5|6)|7|9|10|11|12|14) */
        /* JADX WARNING: Code restructure failed: missing block: B:15:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:11:0x0032 */
        static {
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.PULL_FROM_START.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.PULL_FROM_END.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[Orientation.VERTICAL.ordinal()] = 1;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[Orientation.HORIZONTAL.ordinal()] = 2;
        }
    }

    public LoadingLayout(Context context, Mode mode, Orientation orientation, TypedArray typedArray) {
        super(context);
        this.mMode = mode;
        this.mScrollDirection = orientation;
        int i = AnonymousClass1.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[orientation.ordinal()];
        LayoutInflater.from(context).inflate(R.layout.hybrid_pull_to_refresh_header_vertical, this);
        LayoutParams layoutParams = (LayoutParams) this.mInnerLayout.getLayoutParams();
        int i2 = AnonymousClass1.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[mode.ordinal()];
        layoutParams.gravity = orientation == Orientation.VERTICAL ? 80 : 5;
        this.mPullLabel = context.getString(R.string.hybrid_pull_to_refresh_pull_label);
        this.mRefreshingLabel = context.getString(R.string.hybrid_pull_to_refresh_refreshing_label);
        this.mReleaseLabel = context.getString(R.string.hybrid_pull_to_refresh_release_label);
        if (typedArray.hasValue(7)) {
            Drawable drawable = typedArray.getDrawable(7);
            if (drawable != null) {
                ViewCompat.setBackground(this, drawable);
            }
        }
        if (typedArray.hasValue(9)) {
            TypedValue typedValue = new TypedValue();
            typedArray.getValue(9, typedValue);
            setTextAppearance(typedValue.data);
        }
        if (typedArray.hasValue(19)) {
            TypedValue typedValue2 = new TypedValue();
            typedArray.getValue(19, typedValue2);
            setSubTextAppearance(typedValue2.data);
        }
        if (typedArray.hasValue(10)) {
            ColorStateList colorStateList = typedArray.getColorStateList(10);
            if (colorStateList != null) {
                setTextColor(colorStateList);
            }
        }
        if (typedArray.hasValue(8)) {
            ColorStateList colorStateList2 = typedArray.getColorStateList(8);
            if (colorStateList2 != null) {
                setSubTextColor(colorStateList2);
            }
        }
        Drawable drawable2 = null;
        if (typedArray.hasValue(2)) {
            drawable2 = typedArray.getDrawable(2);
        }
        if (AnonymousClass1.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[mode.ordinal()] != 2) {
            if (typedArray.hasValue(5)) {
                drawable2 = typedArray.getDrawable(5);
            } else if (typedArray.hasValue(6)) {
                drawable2 = typedArray.getDrawable(6);
            }
        } else if (typedArray.hasValue(4)) {
            drawable2 = typedArray.getDrawable(4);
        } else if (typedArray.hasValue(3)) {
            drawable2 = typedArray.getDrawable(3);
        }
        if (drawable2 == null) {
            drawable2 = context.getResources().getDrawable(getDefaultDrawableResId());
        }
        setLoadingDrawable(drawable2);
        reset();
    }

    private void setSubHeaderText(CharSequence charSequence) {
        if (this.mSubHeaderText == null) {
            return;
        }
        if (TextUtils.isEmpty(charSequence)) {
            this.mSubHeaderText.setVisibility(8);
            return;
        }
        this.mSubHeaderText.setText(charSequence);
        if (8 == this.mSubHeaderText.getVisibility()) {
            this.mSubHeaderText.setVisibility(0);
        }
    }

    private void setSubTextAppearance(int i) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), i);
        }
    }

    private void setSubTextColor(ColorStateList colorStateList) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(colorStateList);
        }
    }

    private void setTextAppearance(int i) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextAppearance(getContext(), i);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), i);
        }
    }

    private void setTextColor(ColorStateList colorStateList) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextColor(colorStateList);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(colorStateList);
        }
    }

    public final int getContentSize() {
        return AnonymousClass1.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[this.mScrollDirection.ordinal()] != 2 ? this.mInnerLayout.getHeight() : this.mInnerLayout.getWidth();
    }

    /* access modifiers changed from: protected */
    public abstract int getDefaultDrawableResId();

    /* access modifiers changed from: protected */
    public abstract void onLoadingDrawableSet(Drawable drawable);

    public final void onPull(float f) {
        if (!this.mUseIntrinsicAnimation) {
            onPullImpl(f);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void onPullImpl(float f);

    public final void pullToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mPullLabel);
        }
        pullToRefreshImpl();
    }

    /* access modifiers changed from: protected */
    public abstract void pullToRefreshImpl();

    public final void refreshing() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mRefreshingLabel);
        }
        if (this.mUseIntrinsicAnimation) {
            ((AnimationDrawable) this.mHeaderImage.getDrawable()).start();
        } else {
            refreshingImpl();
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void refreshingImpl();

    public final void releaseToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mReleaseLabel);
        }
        releaseToRefreshImpl();
    }

    /* access modifiers changed from: protected */
    public abstract void releaseToRefreshImpl();

    public final void reset() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mPullLabel);
        }
        this.mHeaderImage.setVisibility(0);
        if (this.mUseIntrinsicAnimation) {
            ((AnimationDrawable) this.mHeaderImage.getDrawable()).stop();
        } else {
            resetImpl();
        }
        if (this.mSubHeaderText == null) {
            return;
        }
        if (TextUtils.isEmpty(this.mSubHeaderText.getText())) {
            this.mSubHeaderText.setVisibility(8);
        } else {
            this.mSubHeaderText.setVisibility(0);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void resetImpl();

    public final void setHeight(int i) {
        getLayoutParams().height = i;
        requestLayout();
    }

    public void setLastUpdatedLabel(CharSequence charSequence) {
        setSubHeaderText(charSequence);
    }

    public final void setLoadingDrawable(Drawable drawable) {
        this.mHeaderImage.setImageDrawable(drawable);
        this.mUseIntrinsicAnimation = drawable instanceof AnimationDrawable;
        onLoadingDrawableSet(drawable);
    }

    public void setPullLabel(CharSequence charSequence) {
        this.mPullLabel = charSequence;
    }

    public void setRefreshingLabel(CharSequence charSequence) {
        this.mRefreshingLabel = charSequence;
    }

    public void setReleaseLabel(CharSequence charSequence) {
        this.mReleaseLabel = charSequence;
    }

    public void setTextTypeface(Typeface typeface) {
        this.mHeaderText.setTypeface(typeface);
    }

    public final void setWidth(int i) {
        getLayoutParams().width = i;
        requestLayout();
    }
}

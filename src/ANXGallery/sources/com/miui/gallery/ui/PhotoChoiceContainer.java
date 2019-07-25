package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.miui.gallery.R;
import com.miui.gallery.widget.slip.ISlipAnimView;

public class PhotoChoiceContainer extends FrameLayout implements ISlipAnimView {
    private int mInitPadding;
    private int mSlipPadding;
    private float mSlipPaddingRatio;

    public PhotoChoiceContainer(Context context) {
        this(context, null);
    }

    public PhotoChoiceContainer(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PhotoChoiceContainer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mInitPadding = 0;
        this.mSlipPadding = 0;
        this.mSlipPaddingRatio = 0.0f;
    }

    private void doSlipAnim(float f) {
        if (this.mSlipPadding > 0) {
            setPadding(getPaddingLeft(), (int) (((float) this.mInitPadding) + (((float) (this.mSlipPadding - this.mInitPadding)) * f)), getPaddingRight(), getPaddingBottom());
        }
    }

    public boolean hasOverlappingRendering() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mInitPadding = getPaddingTop();
        this.mSlipPaddingRatio = getResources().getFraction(R.fraction.share_channel_slip_padding_ratio, 1, 1);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.mSlipPadding == 0 || z) {
            this.mSlipPadding = (int) (((float) (i4 - i2)) * this.mSlipPaddingRatio);
        }
    }

    public void onSlipping(float f) {
        doSlipAnim(f);
        setAlpha(f);
    }
}

package com.miui.gallery.ui;

import android.content.Context;
import android.support.constraint.ConstraintLayout;
import android.util.AttributeSet;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.slip.ISlipAnimView;

public class PhotoChoiceTitle extends ConstraintLayout implements ISlipAnimView {
    private ImageView mExitButton;
    private TextView mTitle;

    public PhotoChoiceTitle(Context context) {
        this(context, null);
    }

    public PhotoChoiceTitle(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PhotoChoiceTitle(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private void doSlipAnim(float f) {
        ((LayoutParams) getLayoutParams()).topMargin = (int) ((1.0f - f) * ((float) getHeight()));
        if (MiscUtil.floatEquals(f, 0.0f)) {
            setVisibility(4);
        } else {
            setVisibility(0);
        }
    }

    public ImageView getExitButton() {
        return this.mExitButton;
    }

    public TextView getTitle() {
        return this.mTitle;
    }

    public boolean hasOverlappingRendering() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mTitle = (TextView) findViewById(R.id.choice_mode_title);
        this.mExitButton = (ImageView) findViewById(R.id.choice_mode_exit);
    }

    public void onSlipping(float f) {
        doSlipAnim(f);
        setAlpha(f);
    }
}

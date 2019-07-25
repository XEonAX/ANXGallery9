package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.R;

public class AlbumPageListEmptyItem extends RelativeLayout {
    private boolean mIsFirstLayout = true;
    private ViewGroup mTextContainer;
    private float mTextVerticalPercent = getResources().getFraction(R.fraction.album_page_empty_text_vertical_percent, 1, 1);
    private TextView mTextView;

    public AlbumPageListEmptyItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mTextView = (TextView) findViewById(R.id.text);
        if (this.mTextView != null) {
            this.mTextView.setVisibility(4);
            if (getParent() != null && (getParent() instanceof ViewGroup)) {
                this.mTextContainer = (ViewGroup) getParent();
            }
            setMinimumHeight(Math.max(ScreenConfig.getScreenHeight(), ScreenConfig.getScreenWidth()));
            return;
        }
        throw new RuntimeException("textView shouldn't be null!");
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.mIsFirstLayout || z) {
            if (this.mTextView.getVisibility() != 0) {
                this.mTextView.setVisibility(0);
            }
            if (this.mTextContainer != null) {
                int measuredHeight = (this.mTextContainer.getMeasuredHeight() - i2) - ((int) Math.max(0.0f, this.mTextContainer.getTranslationY()));
                int i5 = (int) (((float) measuredHeight) * this.mTextVerticalPercent);
                if (this.mTextView.getVisibility() != 8) {
                    this.mTextView.layout(this.mTextView.getLeft(), i5, this.mTextView.getRight(), this.mTextView.getHeight() + i5);
                }
                setBottom(i2 + measuredHeight);
            }
            this.mIsFirstLayout = false;
        }
    }

    public void setTextContainer(ViewGroup viewGroup) {
        this.mTextContainer = viewGroup;
    }
}

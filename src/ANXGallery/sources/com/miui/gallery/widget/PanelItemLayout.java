package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class PanelItemLayout {
    private View mArrow;
    private Context mContext;
    private ViewGroup mDetailContainer;
    private final int mMsgDrawableGonePadding;
    private final int mMsgDrawableVisiblePadding = 0;
    private View mPanelItem;
    private TextView mTitle;
    private ImageView mTitleDrawable;

    public PanelItemLayout(Context context) {
        this.mContext = context;
        this.mMsgDrawableGonePadding = context.getResources().getDimensionPixelSize(R.dimen.panel_item_padding_start);
    }

    private void ensureView() {
        if (this.mPanelItem == null) {
            this.mPanelItem = LayoutInflater.from(this.mContext).inflate(R.layout.panel_item, null);
            this.mTitleDrawable = (ImageView) this.mPanelItem.findViewById(R.id.message_drawable);
            this.mTitle = (TextView) this.mPanelItem.findViewById(R.id.message);
            this.mArrow = this.mPanelItem.findViewById(R.id.right_arrow);
            this.mDetailContainer = (LinearLayout) this.mPanelItem.findViewById(R.id.detail_container);
        }
    }

    public View addDetail(int i) {
        if (i == 0) {
            return null;
        }
        ensureView();
        return addDetail(LayoutInflater.from(this.mContext).inflate(i, this.mDetailContainer, false));
    }

    public View addDetail(View view) {
        if (view != null) {
            ensureView();
            this.mDetailContainer.addView(view, this.mDetailContainer.getChildCount());
        }
        return view;
    }

    public void clearDetails() {
        if (this.mDetailContainer != null) {
            this.mDetailContainer.removeAllViews();
        }
    }

    public View getView() {
        ensureView();
        return this.mPanelItem;
    }

    public void setOnClickListener(OnClickListener onClickListener) {
        ensureView();
        this.mPanelItem.setOnClickListener(onClickListener);
    }

    public void setTitle(CharSequence charSequence) {
        ensureView();
        this.mTitle.setText(charSequence);
    }

    public void setTitleDrawable(Drawable drawable) {
        ensureView();
        this.mTitleDrawable.setImageDrawable(drawable);
        if (drawable != null && this.mTitleDrawable.getVisibility() == 8) {
            this.mPanelItem.setPadding(this.mMsgDrawableVisiblePadding, this.mPanelItem.getPaddingTop(), this.mPanelItem.getPaddingEnd(), this.mPanelItem.getPaddingBottom());
            this.mTitleDrawable.setVisibility(0);
        } else if (drawable == null && this.mTitleDrawable.getVisibility() == 0) {
            this.mPanelItem.setPadding(this.mMsgDrawableGonePadding, this.mPanelItem.getPaddingTop(), this.mPanelItem.getPaddingEnd(), this.mPanelItem.getPaddingBottom());
            this.mTitleDrawable.setVisibility(8);
        }
    }

    public void showArrow(boolean z) {
        ensureView();
        this.mArrow.setVisibility(z ? 0 : 8);
    }
}

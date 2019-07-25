package com.miui.gallery.movie.ui.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class MoviePreviewMenuTitle extends LinearLayout implements OnClickListener {
    private IMenuTitleClickListener mListener;
    private TextView mLongVideoTitleView;
    private TextView mShortVideoTitleView;

    public interface IMenuTitleClickListener {
        void onLongVideoTitleViewClick();

        void onShortVideoTitleViewClick();
    }

    public MoviePreviewMenuTitle(Context context) {
        super(context);
        init(context);
    }

    public MoviePreviewMenuTitle(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    private void init(Context context) {
        inflate(context, R.layout.movie_fragment_preview_title, this);
    }

    public void onClick(View view) {
        if (this.mListener != null) {
            int id = view.getId();
            if (id != R.id.tv_long_video_title) {
                if (id == R.id.tv_short_video_title && !this.mShortVideoTitleView.isSelected()) {
                    this.mListener.onShortVideoTitleViewClick();
                    updateTitleViewState(true);
                }
            } else if (!this.mLongVideoTitleView.isSelected()) {
                this.mListener.onLongVideoTitleViewClick();
                updateTitleViewState(false);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mShortVideoTitleView = (TextView) findViewById(R.id.tv_short_video_title);
        this.mLongVideoTitleView = (TextView) findViewById(R.id.tv_long_video_title);
        this.mShortVideoTitleView.setOnClickListener(this);
        this.mLongVideoTitleView.setOnClickListener(this);
    }

    public void removeListener() {
        this.mListener = null;
    }

    public void setListener(IMenuTitleClickListener iMenuTitleClickListener) {
        this.mListener = iMenuTitleClickListener;
    }

    public void updateTitleViewState(boolean z) {
        this.mLongVideoTitleView.setSelected(!z);
        this.mShortVideoTitleView.setSelected(z);
    }
}

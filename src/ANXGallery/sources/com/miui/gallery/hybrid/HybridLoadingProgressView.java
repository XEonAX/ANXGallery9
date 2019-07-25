package com.miui.gallery.hybrid;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.util.ToastUtils;

public class HybridLoadingProgressView extends LinearLayout {
    private Button mButton;
    private int mErrorResId;
    /* access modifiers changed from: private */
    public HybridOnRefreshListener mOnRefreshListener;
    private ProgressBar mProgressBar;
    private CharSequence mText;
    private int mTextResId;
    private TextView mTextView;

    public enum HybridLoadingState {
        NETWORK_ERROR(R.string.hybrid_network_unavaliable),
        SERVICE_ERROR(R.string.hybrid_service_unavailiable),
        DATA_ERROR(R.string.hybrid_data_error),
        LOCATION_ERROR(R.string.hybrid_locating_fail),
        OK(17039370);
        
        private int mDefaultDescription;

        private HybridLoadingState(int i) {
            this.mDefaultDescription = i;
        }

        public int getDescription() {
            return this.mDefaultDescription;
        }
    }

    public interface HybridOnRefreshListener {
        void onRefresh();
    }

    public HybridLoadingProgressView(Context context) {
        this(context, null);
    }

    public HybridLoadingProgressView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        LayoutInflater.from(context).inflate(R.layout.hybrid_loading_progress, this, true);
        this.mProgressBar = (ProgressBar) findViewById(R.id.progress);
        this.mTextView = (TextView) findViewById(R.id.text);
        this.mButton = (Button) findViewById(R.id.button);
    }

    private void hideView(View view) {
        if (view != null && view.getVisibility() == 0) {
            if (view.isShown()) {
                view.startAnimation(AnimationUtils.loadAnimation(getContext(), R.anim.disappear));
            }
            view.setVisibility(8);
        }
    }

    private void showView(View view) {
        if (view != null && view.getVisibility() == 8) {
            view.startAnimation(AnimationUtils.loadAnimation(getContext(), R.anim.appear));
            view.setVisibility(0);
        }
    }

    private void updateStyle(boolean z) {
        if (z) {
            getLayoutParams().height = -2;
            setBackgroundResource(R.drawable.hybrid_loading_view_bg);
            return;
        }
        getLayoutParams().height = -1;
        setBackground(null);
    }

    public int getProgress() {
        return this.mProgressBar.getProgress();
    }

    public void onError(boolean z, final HybridLoadingState hybridLoadingState, String str) {
        if (this.mErrorResId > 0) {
            str = getContext().getResources().getString(this.mErrorResId);
        } else if (TextUtils.isEmpty(str)) {
            str = getContext().getResources().getString(hybridLoadingState.getDescription());
        }
        updateStyle(z);
        if (z) {
            hideView(this);
            ToastUtils.makeText(getContext(), (CharSequence) str);
            return;
        }
        showView(this);
        this.mProgressBar.setVisibility(8);
        this.mTextView.setVisibility(0);
        this.mTextView.setText(str);
        this.mButton.setVisibility(0);
        if (hybridLoadingState == HybridLoadingState.NETWORK_ERROR) {
            this.mTextView.setCompoundDrawablesWithIntrinsicBounds(null, getContext().getResources().getDrawable(R.drawable.hybrid_loading_network_error), null, null);
            this.mButton.setVisibility(0);
            this.mButton.setText(R.string.hybrid_check_network);
        } else {
            this.mTextView.setCompoundDrawablesWithIntrinsicBounds(null, getContext().getResources().getDrawable(R.drawable.hybrid_loading_list_empty), null, null);
            this.mButton.setText(R.string.hybrid_try_again);
            if (this.mOnRefreshListener == null) {
                this.mButton.setVisibility(8);
            }
        }
        this.mButton.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (hybridLoadingState == HybridLoadingState.NETWORK_ERROR) {
                    Intent intent = new Intent("android.settings.SETTINGS");
                    intent.addFlags(268435456);
                    HybridLoadingProgressView.this.getContext().startActivity(intent);
                } else if (HybridLoadingProgressView.this.mOnRefreshListener != null) {
                    HybridLoadingProgressView.this.mOnRefreshListener.onRefresh();
                }
            }
        });
    }

    public void onInit(boolean z, boolean z2, HybridOnRefreshListener hybridOnRefreshListener) {
        this.mOnRefreshListener = hybridOnRefreshListener;
        updateStyle(z);
        if (z2) {
            setVisibility(0);
            this.mProgressBar.setVisibility(0);
            this.mTextView.setVisibility(8);
            this.mButton.setVisibility(8);
        } else if (z) {
            setVisibility(8);
        } else {
            setVisibility(0);
            this.mProgressBar.setVisibility(8);
            this.mButton.setVisibility(8);
        }
    }

    public void onStartLoading(boolean z) {
        updateStyle(z);
        this.mProgressBar.setVisibility(0);
        this.mTextView.setVisibility(8);
        this.mButton.setVisibility(8);
        showView(this);
    }

    public void onStopLoading(boolean z) {
        updateStyle(z);
        if (z) {
            hideView(this);
            return;
        }
        showView(this);
        this.mProgressBar.setVisibility(8);
        if (this.mTextResId != 0) {
            this.mTextView.setVisibility(0);
            this.mTextView.setText(this.mTextResId);
        } else if (!TextUtils.isEmpty(this.mText)) {
            this.mTextView.setVisibility(0);
            this.mTextView.setText(this.mText);
        }
        this.mTextView.setCompoundDrawablesWithIntrinsicBounds(null, getContext().getResources().getDrawable(R.drawable.hybrid_loading_list_empty), null, null);
        this.mButton.setVisibility(8);
    }

    public void setEmptyText(int i) {
        this.mTextResId = i;
    }

    public void setErrorText(int i) {
        this.mErrorResId = i;
    }

    public void setIndeterminate(boolean z) {
        if (this.mProgressBar.isIndeterminate() != z) {
            LayoutParams layoutParams = (LayoutParams) this.mProgressBar.getLayoutParams();
            if (z) {
                layoutParams.width = -2;
                layoutParams.height = -2;
                layoutParams.gravity = 17;
            } else {
                layoutParams.width = -1;
                layoutParams.height = (int) TypedValue.applyDimension(1, 1.0f, getResources().getDisplayMetrics());
                layoutParams.gravity = 48;
            }
            this.mProgressBar.setLayoutParams(layoutParams);
            this.mProgressBar.setIndeterminate(z);
        }
    }

    public void setProgress(int i) {
        this.mProgressBar.setProgress(i);
    }
}

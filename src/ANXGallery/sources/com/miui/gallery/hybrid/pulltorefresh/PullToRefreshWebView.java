package com.miui.gallery.hybrid.pulltorefresh;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.webkit.WebView;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.AnimationStyle;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.Mode;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.Orientation;

public class PullToRefreshWebView extends PullToRefreshBase<WebView> {
    public PullToRefreshWebView(Context context) {
        super(context);
    }

    public PullToRefreshWebView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshWebView(Context context, Mode mode) {
        super(context, mode);
    }

    public PullToRefreshWebView(Context context, Mode mode, AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    /* access modifiers changed from: protected */
    public WebView createRefreshableView(Context context, AttributeSet attributeSet) {
        return new WebView(context, attributeSet);
    }

    public final Orientation getPullToRefreshScrollDirection() {
        return Orientation.VERTICAL;
    }

    /* access modifiers changed from: protected */
    public boolean isReadyForPullEnd() {
        return ((float) ((WebView) this.mRefreshableView).getScrollY()) >= ((float) Math.floor((double) (((float) ((WebView) this.mRefreshableView).getContentHeight()) * ((WebView) this.mRefreshableView).getScale()))) - ((float) ((WebView) this.mRefreshableView).getHeight());
    }

    /* access modifiers changed from: protected */
    public boolean isReadyForPullStart() {
        return ((WebView) this.mRefreshableView).getScrollY() == 0 && !isRefreshing();
    }

    /* access modifiers changed from: protected */
    public void onPtrRestoreInstanceState(Bundle bundle) {
        super.onPtrRestoreInstanceState(bundle);
        ((WebView) this.mRefreshableView).restoreState(bundle);
    }

    /* access modifiers changed from: protected */
    public void onPtrSaveInstanceState(Bundle bundle) {
        super.onPtrSaveInstanceState(bundle);
        ((WebView) this.mRefreshableView).saveState(bundle);
    }
}

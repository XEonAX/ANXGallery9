package com.miui.gallery.hybrid.pulltorefresh;

import android.graphics.drawable.Drawable;
import java.util.HashSet;
import java.util.Iterator;

public class LoadingLayoutProxy implements ILoadingLayout {
    private final HashSet<LoadingLayout> mLoadingLayouts = new HashSet<>();

    LoadingLayoutProxy() {
    }

    public void addLayout(LoadingLayout loadingLayout) {
        if (loadingLayout != null) {
            this.mLoadingLayouts.add(loadingLayout);
        }
    }

    public void setLastUpdatedLabel(CharSequence charSequence) {
        Iterator it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            ((LoadingLayout) it.next()).setLastUpdatedLabel(charSequence);
        }
    }

    public void setLoadingDrawable(Drawable drawable) {
        Iterator it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            ((LoadingLayout) it.next()).setLoadingDrawable(drawable);
        }
    }

    public void setPullLabel(CharSequence charSequence) {
        Iterator it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            ((LoadingLayout) it.next()).setPullLabel(charSequence);
        }
    }

    public void setRefreshingLabel(CharSequence charSequence) {
        Iterator it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            ((LoadingLayout) it.next()).setRefreshingLabel(charSequence);
        }
    }

    public void setReleaseLabel(CharSequence charSequence) {
        Iterator it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            ((LoadingLayout) it.next()).setReleaseLabel(charSequence);
        }
    }
}

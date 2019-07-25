package com.miui.gallery.collage.app.common;

import android.app.Fragment;
import android.os.Bundle;
import com.miui.gallery.collage.app.common.CollageRenderFragment;
import com.miui.gallery.collage.core.CollagePresenter;

public abstract class CollageMenuFragment<P extends CollagePresenter, R extends CollageRenderFragment> extends Fragment {
    protected P mPresenter;
    private R mRenderFragment;

    public R getRenderFragment() {
        return this.mRenderFragment;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public void setPresenter(P p) {
        this.mPresenter = p;
    }

    public void setRenderFragment(CollageRenderFragment collageRenderFragment) {
        this.mRenderFragment = collageRenderFragment;
    }
}

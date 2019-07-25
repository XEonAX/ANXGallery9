package com.miui.gallery.collage.core.layout;

import android.content.Context;
import android.util.SparseArray;
import com.miui.gallery.R;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.app.common.CollageMenuFragment;
import com.miui.gallery.collage.app.common.CollageRenderFragment;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.collage.app.layout.LayoutMenuFragment;
import com.miui.gallery.collage.core.CollagePresenter;
import com.miui.gallery.collage.core.CollagePresenter.DataLoadListener;
import com.miui.gallery.collage.core.RenderEngine;
import java.util.List;

public class LayoutPresenter extends CollagePresenter {
    /* access modifiers changed from: private */
    public SparseArray<List<LayoutModel>> mLayoutSparseArray = new SparseArray<>();

    /* access modifiers changed from: protected */
    public RenderEngine createEngine(Context context, BitmapManager bitmapManager) {
        return new LayoutRenderEngine(context, bitmapManager);
    }

    public List<LayoutModel> getLayouts(int i) {
        return (List) this.mLayoutSparseArray.get(i);
    }

    public String getMenuFragmentTag() {
        return "fragment_layout:menu";
    }

    public String getRenderFragmentTag() {
        return "fragment_layout:render";
    }

    public int getTitle() {
        return R.string.collage_title_layout;
    }

    /* access modifiers changed from: protected */
    public boolean hasResourceData() {
        return this.mLayoutSparseArray.size() != 0;
    }

    /* access modifiers changed from: protected */
    public IDataLoader onCreateDataLoader(final DataLoadListener dataLoadListener) {
        return new LayoutDataLoader(this.mViewInterface.getContext().getAssets(), new DataLoadListener() {
            public void onDataLoad(SparseArray<List<LayoutModel>> sparseArray) {
                LayoutPresenter.this.mLayoutSparseArray.clear();
                for (int i = 0; i < sparseArray.size(); i++) {
                    int keyAt = sparseArray.keyAt(i);
                    LayoutPresenter.this.mLayoutSparseArray.put(keyAt, sparseArray.get(keyAt));
                }
                if (dataLoadListener != null) {
                    dataLoadListener.onDataLoad();
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public CollageMenuFragment onCreateMenuFragment() {
        return new LayoutMenuFragment();
    }

    /* access modifiers changed from: protected */
    public CollageRenderFragment onCreateRenderFragment() {
        return new LayoutFragment();
    }

    /* access modifiers changed from: protected */
    public void onDetach() {
    }

    public boolean supportImageSize(int i) {
        return i > 1;
    }
}

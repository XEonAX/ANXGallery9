package com.miui.gallery.collage.core.poster;

import android.content.Context;
import android.util.SparseArray;
import com.miui.gallery.R;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.app.common.CollageMenuFragment;
import com.miui.gallery.collage.app.common.CollageRenderFragment;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.collage.app.poster.PosterMenuFragment;
import com.miui.gallery.collage.core.CollagePresenter;
import com.miui.gallery.collage.core.CollagePresenter.DataLoadListener;
import com.miui.gallery.collage.core.RenderEngine;
import com.miui.gallery.collage.core.layout.LayoutModel;
import java.util.List;

public class PosterPresenter extends CollagePresenter {
    /* access modifiers changed from: private */
    public SparseArray<List<LayoutModel>> mPosterLayoutSparseArray = new SparseArray<>();
    /* access modifiers changed from: private */
    public SparseArray<List<PosterModel>> mPosterSparseArray = new SparseArray<>();

    private static int getPosterLayoutIndex(PosterModel posterModel, int i) {
        int[] iArr;
        for (int i2 : posterModel.collageModels) {
            if (i2 / 10 == i) {
                return i2 % 10;
            }
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public RenderEngine createEngine(Context context, BitmapManager bitmapManager) {
        return new PosterRenderEngine(context, bitmapManager);
    }

    public String getMenuFragmentTag() {
        return "fragment_poster:menu";
    }

    public LayoutModel getPosterCollageLayout(PosterModel posterModel) {
        int posterLayoutIndex = getPosterLayoutIndex(posterModel, this.mImageCount);
        if (posterLayoutIndex != -1) {
            return (LayoutModel) ((List) this.mPosterLayoutSparseArray.get(this.mImageCount)).get(posterLayoutIndex);
        }
        return null;
    }

    public List<PosterModel> getPosters() {
        return (List) this.mPosterSparseArray.get(this.mImageCount);
    }

    public String getRenderFragmentTag() {
        return "fragment_poster:render";
    }

    public int getTitle() {
        return R.string.collage_title_poster;
    }

    /* access modifiers changed from: protected */
    public boolean hasResourceData() {
        return (this.mPosterLayoutSparseArray.size() == 0 || this.mPosterSparseArray.size() == 0) ? false : true;
    }

    public IDataLoader onCreateDataLoader(final DataLoadListener dataLoadListener) {
        return new PosterDataLoader(this.mViewInterface.getContext().getAssets(), new DataLoadListener() {
            public void onDataLoad(SparseArray<List<LayoutModel>> sparseArray, SparseArray<List<PosterModel>> sparseArray2) {
                PosterPresenter.this.mPosterLayoutSparseArray.clear();
                for (int i = 0; i < sparseArray.size(); i++) {
                    int keyAt = sparseArray.keyAt(i);
                    PosterPresenter.this.mPosterLayoutSparseArray.put(keyAt, sparseArray.get(keyAt));
                }
                PosterPresenter.this.mPosterSparseArray.clear();
                for (int i2 = 0; i2 < sparseArray2.size(); i2++) {
                    int keyAt2 = sparseArray2.keyAt(i2);
                    PosterPresenter.this.mPosterSparseArray.put(keyAt2, sparseArray2.get(keyAt2));
                }
                if (dataLoadListener != null) {
                    dataLoadListener.onDataLoad();
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public CollageMenuFragment onCreateMenuFragment() {
        return new PosterMenuFragment();
    }

    /* access modifiers changed from: protected */
    public CollageRenderFragment onCreateRenderFragment() {
        return new PosterFragment();
    }

    /* access modifiers changed from: protected */
    public void onDetach() {
    }
}

package com.miui.gallery.collage.core.stitching;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.app.common.CollageMenuFragment;
import com.miui.gallery.collage.app.common.CollageRenderFragment;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.collage.app.stitching.StitchingMenuFragment;
import com.miui.gallery.collage.core.CollagePresenter;
import com.miui.gallery.collage.core.CollagePresenter.DataLoadListener;
import com.miui.gallery.collage.core.RenderEngine;
import java.util.ArrayList;
import java.util.List;

public class StitchingPresenter extends CollagePresenter {
    /* access modifiers changed from: private */
    public List<StitchingModel> mStitchingModelList = new ArrayList();

    /* access modifiers changed from: protected */
    public RenderEngine createEngine(Context context, BitmapManager bitmapManager) {
        return new StitchingEngine(context, bitmapManager);
    }

    public String getMenuFragmentTag() {
        return "fragment_stitching:menu";
    }

    public String getRenderFragmentTag() {
        return "fragment_stitching:render";
    }

    public List<StitchingModel> getStitching() {
        return this.mStitchingModelList;
    }

    public int getTitle() {
        return R.string.collage_title_stitching;
    }

    /* access modifiers changed from: protected */
    public boolean hasResourceData() {
        return !this.mStitchingModelList.isEmpty();
    }

    /* access modifiers changed from: protected */
    public IDataLoader onCreateDataLoader(final DataLoadListener dataLoadListener) {
        return new StitchingDataLoader(this.mViewInterface.getContext().getAssets(), new DataLoadListener() {
            public void onDataLoad(List<StitchingModel> list) {
                StitchingPresenter.this.mStitchingModelList.clear();
                StitchingPresenter.this.mStitchingModelList.addAll(list);
                if (dataLoadListener != null) {
                    dataLoadListener.onDataLoad();
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public CollageMenuFragment onCreateMenuFragment() {
        return new StitchingMenuFragment();
    }

    /* access modifiers changed from: protected */
    public CollageRenderFragment onCreateRenderFragment() {
        return new StitchingFragment();
    }

    /* access modifiers changed from: protected */
    public void onDetach() {
    }

    public boolean supportImageSize(int i) {
        return i > 1;
    }
}

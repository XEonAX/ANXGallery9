package com.miui.gallery.collage.app.stitching;

import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.collage.app.common.AbstractStitchingFragment;
import com.miui.gallery.collage.app.common.CollageMenuFragment;
import com.miui.gallery.collage.core.CollagePresenter.DataLoadListener;
import com.miui.gallery.collage.core.stitching.StitchingModel;
import com.miui.gallery.collage.core.stitching.StitchingPresenter;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.OnItemClickListener;
import java.util.ArrayList;
import java.util.List;

public class StitchingMenuFragment extends CollageMenuFragment<StitchingPresenter, AbstractStitchingFragment> {
    private boolean mDataInit = false;
    /* access modifiers changed from: private */
    public boolean mDataReady = false;
    private DataLoadListener mInitDataLoadListener = new DataLoadListener() {
        public void onDataLoad() {
            StitchingMenuFragment.this.mDataReady = true;
            StitchingMenuFragment.this.reloadData();
            StitchingMenuFragment.this.notifyDataInit();
        }
    };
    private OnItemClickListener mOnItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
            StitchingMenuFragment.this.mStitchingAdapter.setSelection(i);
            StitchingMenuFragment.this.onSelectModel(i);
            return true;
        }
    };
    private SimpleRecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public StitchingAdapter mStitchingAdapter;
    private List<StitchingModel> mStitchingModelList = new ArrayList();
    private boolean mViewReady = false;

    /* access modifiers changed from: private */
    public void notifyDataInit() {
        if (this.mViewReady && this.mDataReady && !this.mDataInit) {
            onSelectModel(0);
            this.mStitchingAdapter.setOnItemClickListener(this.mOnItemClickListener);
            this.mDataInit = true;
        }
    }

    /* access modifiers changed from: private */
    public void onSelectModel(int i) {
        if (this.mStitchingModelList.size() != 0) {
            ((AbstractStitchingFragment) getRenderFragment()).onSelectModel((StitchingModel) this.mStitchingModelList.get(i));
        }
    }

    /* access modifiers changed from: private */
    public void reloadData() {
        this.mStitchingModelList.clear();
        List stitching = ((StitchingPresenter) this.mPresenter).getStitching();
        if (stitching != null) {
            this.mStitchingModelList.addAll(stitching);
        }
        this.mStitchingAdapter.notifyDataSetChanged();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ((StitchingPresenter) this.mPresenter).loadDataFromResourceAsync(this.mInitDataLoadListener);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.collage_stitching_menu, viewGroup, false);
    }

    public void onViewCreated(View view, Bundle bundle) {
        this.mRecyclerView = (SimpleRecyclerView) view;
        this.mStitchingAdapter = new StitchingAdapter(getActivity(), this.mStitchingModelList, new Selector(getResources().getDrawable(R.drawable.collage_item_background_selector)));
        this.mRecyclerView.setLayoutManager(new ScrollControlLinearLayoutManager(getActivity(), 0, false));
        this.mRecyclerView.addItemDecoration(new BlankDivider(getResources(), R.dimen.collage_menu_item_margin, 0));
        this.mRecyclerView.setAdapter(this.mStitchingAdapter);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mRecyclerView);
        this.mViewReady = true;
        notifyDataInit();
    }
}

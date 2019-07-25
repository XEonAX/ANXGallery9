package com.miui.gallery.video.editor.fragment;

import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.NoScrollViewPager;
import com.miui.gallery.util.Log;
import com.miui.gallery.video.editor.Filter;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.adapter.FilterAdjustPageAdapter;
import com.miui.gallery.video.editor.adapter.FilterRecyclerViewAdapter;
import com.miui.gallery.video.editor.ui.MenuFragment;
import com.miui.gallery.video.editor.ui.menu.FilterAdjustView;
import com.miui.gallery.video.editor.widget.AdjustView;
import com.miui.gallery.video.editor.widget.AdjustView.IAdjustEffectChangeListener;
import com.miui.gallery.video.editor.widget.AdjustView.IFilterAdjustHeadViewListener;
import com.miui.gallery.video.editor.widget.FilterAdjustHeadView;
import com.miui.gallery.video.editor.widget.FilterAdjustHeadView.FilterHeadViewClickListener;
import com.miui.gallery.video.editor.widget.FilterView;
import com.miui.gallery.video.editor.widget.FilterView.OnItemSelectedListener;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import java.util.ArrayList;
import java.util.List;

public class FilterAdjustFragment extends MenuFragment {
    /* access modifiers changed from: private */
    public AdjustView mAdjustView;
    private View mCancelView;
    /* access modifiers changed from: private */
    public FilterAdjustHeadView mFilterAdjustHeadView;
    /* access modifiers changed from: private */
    public FilterView mFilterView;
    /* access modifiers changed from: private */
    public ConstraintLayout mHeadBar;
    /* access modifiers changed from: private */
    public NoScrollViewPager mNoScrollViewPager;
    private View mOkView;
    private FilterAdjustPageAdapter mPageAdapter;
    private int mSavedSelectedFilterIndex = -1;
    /* access modifiers changed from: private */
    public TextView mTitleView;
    private List<View> mViewList;
    /* access modifiers changed from: private */
    public boolean showFilterView = true;

    private boolean doFilterCancel() {
        if (this.mVideoEditor == null) {
            Log.d("FilterAdjustFragment", "doCancel: videoEditor is null.");
            return false;
        }
        this.mVideoEditor.restoreEditState();
        return this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                if (FilterAdjustFragment.this.mVideoEditor != null) {
                    FilterAdjustFragment.this.mVideoEditor.play();
                    FilterAdjustFragment.this.onExitMode();
                }
            }
        });
    }

    private void initData() {
        this.mViewList = new ArrayList();
        this.mFilterView = new FilterView(this.mContext);
        this.mAdjustView = new AdjustView(this.mContext);
        this.mViewList.add(this.mFilterView);
        this.mViewList.add(this.mAdjustView);
        this.mTitleView.setText(this.mContext.getResources().getString(R.string.video_editor_filter));
        this.mFilterAdjustHeadView.selectFilter(this.showFilterView);
        this.mFilterView.updateSelectedItemPosition(this.mSavedSelectedFilterIndex);
        this.mPageAdapter = new FilterAdjustPageAdapter(this.mViewList);
        this.mNoScrollViewPager.setAdapter(this.mPageAdapter);
    }

    private void initListener() {
        this.mFilterAdjustHeadView.setHeadViewClickListener(new FilterHeadViewClickListener() {
            public void onAdjustClick() {
                if (FilterAdjustFragment.this.mAdjustView != null) {
                    FilterAdjustFragment.this.mNoScrollViewPager.setCurrentItem(1);
                    FilterAdjustFragment.this.mTitleView.setText(FilterAdjustFragment.this.mContext.getResources().getString(R.string.video_editor_adjust));
                    FilterAdjustFragment.this.showFilterView = false;
                    FilterAdjustFragment.this.mAdjustView.refreshData();
                }
            }

            public void onFilterClick() {
                if (FilterAdjustFragment.this.mFilterView != null) {
                    FilterAdjustFragment.this.mNoScrollViewPager.setCurrentItem(0);
                    FilterAdjustFragment.this.mTitleView.setText(FilterAdjustFragment.this.mContext.getResources().getString(R.string.video_editor_filter));
                    FilterAdjustFragment.this.showFilterView = true;
                }
            }
        });
        this.mAdjustView.setIFilterAdjustHeadViewListener(new IFilterAdjustHeadViewListener() {
            public void addFilterViewToHeadBar(View view) {
                FilterAdjustFragment.this.mHeadBar.removeAllViews();
                FilterAdjustFragment.this.mHeadBar.setPadding(0, 0, 0, 0);
                FilterAdjustFragment.this.mHeadBar.addView(FilterAdjustFragment.this.mFilterAdjustHeadView);
            }

            public void addSeekBarToHeadBar(View view) {
                if (view != null) {
                    FilterAdjustFragment.this.mHeadBar.addView(view, -1, -2);
                    FilterAdjustFragment.this.mHeadBar.setPadding(0, FilterAdjustFragment.this.getResources().getDimensionPixelSize(R.dimen.editor_menu_seek_bar_top), 0, 0);
                }
            }

            public void removeAllViewFromHeadBar() {
                FilterAdjustFragment.this.mHeadBar.removeAllViews();
            }
        });
        this.mAdjustView.setIAdjustEffectChangeListener(new IAdjustEffectChangeListener() {
            public void adjustBrightness(int i) {
                FilterAdjustFragment.this.mVideoEditor.adjustBrightness(i);
                FilterAdjustFragment.this.mVideoEditor.setVideoEditorAdjust(true);
            }

            public void adjustContrast(int i) {
                FilterAdjustFragment.this.mVideoEditor.adjustContrast(i);
                FilterAdjustFragment.this.mVideoEditor.setVideoEditorAdjust(true);
            }

            public void adjustSaturation(int i) {
                FilterAdjustFragment.this.mVideoEditor.adjustSaturation(i);
                FilterAdjustFragment.this.mVideoEditor.setVideoEditorAdjust(true);
            }

            public void adjustSharpness(int i) {
                FilterAdjustFragment.this.mVideoEditor.adjustSharpness(i);
                FilterAdjustFragment.this.mVideoEditor.setVideoEditorAdjust(true);
            }

            public void adjustVignetteRange(int i) {
                FilterAdjustFragment.this.mVideoEditor.adjustVignetteRange(i);
                FilterAdjustFragment.this.mVideoEditor.setVideoEditorAdjust(true);
            }
        });
        this.mOkView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                FilterAdjustFragment.this.doApply();
            }
        });
        this.mCancelView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                FilterAdjustFragment.this.doCancel();
            }
        });
        this.mFilterView.setItemSelectedListener(new OnItemSelectedListener() {
            public boolean onItemSelect(SingleChoiceRecyclerViewAdapter singleChoiceRecyclerViewAdapter, int i, boolean z) {
                Filter filter = ((FilterRecyclerViewAdapter) singleChoiceRecyclerViewAdapter).getFilter(i);
                if (filter == null) {
                    return true;
                }
                FilterAdjustFragment.this.mVideoEditor.setFilter(filter);
                return FilterAdjustFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                    public void onCompleted() {
                        FilterAdjustFragment.this.mVideoEditor.play();
                        FilterAdjustFragment.this.recordEventWithEffectChanged();
                        FilterAdjustFragment.this.updatePalyBtnView();
                    }
                });
            }
        });
    }

    public boolean doApply() {
        if ((this.mAdjustView != null && this.mAdjustView.isTracking()) || this.mVideoEditor == null || this.mVideoEditor.getState() == 200) {
            return false;
        }
        this.mVideoEditor.saveEditState();
        if (this.mFilterView != null) {
            this.mSavedSelectedFilterIndex = this.mFilterView.getSelectedItemPosition();
        }
        recordEventWithApply();
        onExitMode();
        return true;
    }

    public boolean doCancel() {
        if (this.mAdjustView != null && this.mAdjustView.isTracking()) {
            return false;
        }
        if (this.showFilterView) {
            doFilterCancel();
        } else {
            this.mAdjustView.doCancel();
            if (this.mVideoEditor != null) {
                this.mVideoEditor.setVideoEditorAdjust(false);
            }
            doFilterCancel();
        }
        recordEventWithCancel();
        return true;
    }

    public List<String> getCurrentEffect() {
        ArrayList arrayList = new ArrayList();
        if (this.mFilterView != null) {
            List filterCurrentEffect = this.mFilterView.getFilterCurrentEffect();
            if (filterCurrentEffect != null) {
                arrayList.addAll(filterCurrentEffect);
            }
        }
        if (this.mAdjustView != null) {
            List adjustCurrentEffect = this.mAdjustView.getAdjustCurrentEffect();
            if (adjustCurrentEffect != null) {
                arrayList.addAll(adjustCurrentEffect);
            }
            this.mAdjustView.clearCurrentEffects();
        }
        return arrayList;
    }

    public int getEffectId() {
        return R.id.video_editor_filter;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        FilterAdjustView filterAdjustView = new FilterAdjustView(viewGroup.getContext());
        this.mNoScrollViewPager = (NoScrollViewPager) filterAdjustView.findViewById(R.id.filter_pager);
        this.mFilterAdjustHeadView = (FilterAdjustHeadView) filterAdjustView.findViewById(R.id.filter_and_just_head_view);
        this.mCancelView = filterAdjustView.findViewById(R.id.cancel);
        this.mOkView = filterAdjustView.findViewById(R.id.ok);
        this.mTitleView = (TextView) filterAdjustView.findViewById(R.id.title);
        this.mHeadBar = (ConstraintLayout) filterAdjustView.findViewById(R.id.head_area);
        initData();
        initListener();
        return filterAdjustView;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mPageAdapter != null) {
            this.mPageAdapter = null;
        }
        if (this.mFilterAdjustHeadView != null) {
            this.mFilterAdjustHeadView.setHeadViewClickListener(null);
        }
        if (this.mFilterView != null) {
            this.mFilterView = null;
        }
        if (this.mAdjustView != null) {
            this.mAdjustView = null;
        }
    }
}

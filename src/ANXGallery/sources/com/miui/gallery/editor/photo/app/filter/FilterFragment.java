package com.miui.gallery.editor.photo.app.filter;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.annotation.SuppressLint;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyCheckHelper;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyDownloadStateListener;
import com.miui.gallery.editor.photo.app.menu.FilterView;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.editor.photo.core.common.model.FilterCategory;
import com.miui.gallery.editor.photo.core.common.model.FilterData;
import com.miui.gallery.editor.photo.core.imports.filter.FilterCategoryData;
import com.miui.gallery.editor.photo.core.imports.filter.FilterItem;
import com.miui.gallery.editor.photo.core.imports.filter.FilterRenderFragment;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.seekbar.BasicSeekBar;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.xiaomi.skytransfer.SkyTranFilter;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class FilterFragment extends MenuFragment<AbstractEffectFragment, SdkProvider<FilterCategory, AbstractEffectFragment>> {
    /* access modifiers changed from: private */
    public List<FilterCategory> mCategories;
    /* access modifiers changed from: private */
    public ViewPager mFilterPager;
    /* access modifiers changed from: private */
    public FilterHeadAdapter mHeaderAdapter;
    /* access modifiers changed from: private */
    public boolean mIsSkySegmentDone;
    /* access modifiers changed from: private */
    public boolean mIsSkySegmentSuccess;
    /* access modifiers changed from: private */
    public boolean mIsSkyToSelect;
    private OnItemClickListener mItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            if (((FilterCategory) FilterFragment.this.mCategories.get(i)).getFilterCategory() != 7 || SkyCheckHelper.isSkyAvailable()) {
                FilterFragment.this.mFilterPager.setCurrentItem(i, true);
                FilterFragment.this.mHeaderAdapter.setSelectedItemPosition(i);
                return true;
            }
            FilterFragment.this.mIsSkyToSelect = true;
            SkyCheckHelper.getInstance().startDownloadWithCheck(FilterFragment.this.getActivity());
            return false;
        }
    };
    private FilterPagerAdapter mPagerAdapter;
    private SimpleRecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public SeekBar mSeekBar;
    private OnSeekBarChangeListener mSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            FilterFragment.this.doConfig(i);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    };
    /* access modifiers changed from: private */
    public FilterData mSelectedItem;
    /* access modifiers changed from: private */
    public FilterCategoryData mSkyCategory;
    private SkyDownloadStateListener mSkyDownloadStateListener = new SkyDownloadStateListener() {
        public static /* synthetic */ void lambda$onFinish$91(AnonymousClass2 r2) {
            FilterFragment.this.mSkyCategory.setDownloadState(0);
            FilterFragment.this.mHeaderAdapter.notifyItemChanged(FilterFragment.this.mSkyHeadIndex);
        }

        public void onDownloadStart(int i) {
            FilterFragment.this.mSkyCategory.setDownloadState(2);
            FilterFragment.this.mHeaderAdapter.notifyItemChanged(FilterFragment.this.mSkyHeadIndex);
        }

        public void onDownloading(int i, int i2) {
            FilterFragment.this.mSkyCategory.setDownloadPercent(((float) i2) / 100.0f);
            FilterFragment.this.mHeaderAdapter.notifyItemChanged(FilterFragment.this.mSkyHeadIndex);
        }

        public void onFinish(int i, boolean z, int i2) {
            if (SkyCheckHelper.isSkyAvailable()) {
                FilterFragment.this.doSkyTransferProcess();
                if (FilterFragment.this.mIsSkyToSelect) {
                    FilterFragment.this.mFilterPager.setCurrentItem(FilterFragment.this.mSkyHeadIndex, true);
                    FilterFragment.this.mHeaderAdapter.setSelectedItemPosition(FilterFragment.this.mSkyHeadIndex);
                    FilterFragment.this.mIsSkyToSelect = false;
                }
                FilterFragment.this.mSkyCategory.setDownloadState(3);
                FilterFragment.this.mHeaderAdapter.notifyItemChanged(FilterFragment.this.mSkyHeadIndex);
                ToastUtils.makeText((Context) FilterFragment.this.getActivity(), (int) R.string.filter_sky_download_finish);
                FilterFragment.this.mFilterPager.postDelayed(new Runnable() {
                    public final void run() {
                        AnonymousClass2.lambda$onFinish$91(AnonymousClass2.this);
                    }
                }, 1000);
                return;
            }
            FilterFragment.this.mSkyCategory.setDownloadState(1);
            FilterFragment.this.mHeaderAdapter.notifyItemChanged(FilterFragment.this.mSkyHeadIndex);
            ToastUtils.makeText((Context) FilterFragment.this.getActivity(), (int) R.string.filter_sky_download_failed);
        }
    };
    /* access modifiers changed from: private */
    public int mSkyHeadIndex;
    private TextView mTitle;
    private LinearLayout mTopPanel;

    private class FilterPagerAdapter extends PagerAdapter {
        private FilterAdapter[] mFilterAdapters;
        private OnItemClickListener mOnItemClickListener;

        private FilterPagerAdapter() {
            this.mFilterAdapters = new FilterAdapter[FilterFragment.this.mCategories.size()];
            this.mOnItemClickListener = new OnItemClickListener() {
                public static /* synthetic */ void lambda$OnItemClick$95(AnonymousClass1 r2, FilterRenderFragment filterRenderFragment, FilterItem filterItem, FilterAdapter filterAdapter, int i, Boolean bool) throws Exception {
                    FilterFragment.this.mIsSkySegmentSuccess = bool.booleanValue();
                    if (!bool.booleanValue()) {
                        filterRenderFragment.hideProgressView();
                    }
                    FilterPagerAdapter.this.doSelectSky(filterItem, filterAdapter, i);
                }

                @SuppressLint({"CheckResult"})
                public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
                    ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
                    FilterAdapter filterAdapter = (FilterAdapter) recyclerView.getAdapter();
                    FilterItem filterItem = (FilterItem) filterAdapter.getItemData(i);
                    if (filterItem == null) {
                        Log.e("FilterFragment", "FilterAdapter get filterData null:pos is %d", (Object) Integer.valueOf(i));
                        return true;
                    }
                    if (!filterItem.equals(FilterFragment.this.mSelectedItem)) {
                        if (filterItem.isNone() && filterAdapter.isInEditMode()) {
                            filterAdapter.exitEditMode();
                            FilterFragment.this.showTopPanel(false);
                        }
                        if (!filterItem.isSkyTransfer() || filterItem.isNone()) {
                            FilterPagerAdapter.this.doSelectRender(filterItem, filterAdapter, i);
                        } else if (FilterFragment.this.mIsSkySegmentDone) {
                            FilterPagerAdapter.this.doSelectSky(filterItem, filterAdapter, i);
                        } else {
                            FilterRenderFragment filterRenderFragment = (FilterRenderFragment) FilterFragment.this.getRenderFragment();
                            filterRenderFragment.showProgressView();
                            Observable observeOn = Observable.create($$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8.INSTANCE).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread());
                            $$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M r0 = new Consumer(this, filterRenderFragment, filterItem, filterAdapter, i) {
                                private final /* synthetic */ AnonymousClass1 f$0;
                                private final /* synthetic */ FilterRenderFragment f$1;
                                private final /* synthetic */ FilterItem f$2;
                                private final /* synthetic */ FilterAdapter f$3;
                                private final /* synthetic */ int f$4;

                                public final 
/*
Method generation error in method: com.miui.gallery.editor.photo.app.filter.-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M.accept(java.lang.Object):null, dex: classes.dex
                                java.lang.NullPointerException
                                	at jadx.core.codegen.ClassGen.useType(ClassGen.java:442)
                                	at jadx.core.codegen.MethodGen.addDefinition(MethodGen.java:109)
                                	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:311)
                                	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:262)
                                	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:225)
                                	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:661)
                                	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:595)
                                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:353)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:239)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:213)
                                	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:109)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:55)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
                                	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:148)
                                	at jadx.core.codegen.RegionGen.connectElseIf(RegionGen.java:163)
                                	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:144)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
                                	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:138)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:210)
                                	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:203)
                                	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:316)
                                	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:262)
                                	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:225)
                                	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:661)
                                	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:595)
                                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:353)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:223)
                                	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:418)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:239)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:213)
                                	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:109)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:55)
                                	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
                                	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:210)
                                	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:203)
                                	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:316)
                                	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:262)
                                	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:225)
                                	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:110)
                                	at jadx.core.codegen.ClassGen.addInnerClasses(ClassGen.java:237)
                                	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:224)
                                	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:110)
                                	at jadx.core.codegen.ClassGen.makeClass(ClassGen.java:76)
                                	at jadx.core.codegen.CodeGen.wrapCodeGen(CodeGen.java:44)
                                	at jadx.core.codegen.CodeGen.generateJavaCode(CodeGen.java:32)
                                	at jadx.core.codegen.CodeGen.generate(CodeGen.java:20)
                                	at jadx.core.ProcessClass.process(ProcessClass.java:36)
                                	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
                                	at jadx.api.JavaClass.decompile(JavaClass.java:62)
                                	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
                                
*/
                            };
                            observeOn.subscribe((Consumer<? super T>) r0);
                        }
                    } else if (filterAdapter.isInEditMode()) {
                        filterAdapter.exitEditMode();
                        FilterFragment.this.showTopPanel(false);
                    } else if (!filterItem.isNone()) {
                        filterAdapter.enterEditMode();
                        FilterFragment.this.mSeekBar.setProgress(filterItem.progress);
                        FilterFragment.this.showTopPanel(true);
                    }
                    return true;
                }
            };
        }

        private void clearOtherSelector() {
            for (int i = 0; i < this.mFilterAdapters.length; i++) {
                if (!(i == FilterFragment.this.mFilterPager.getCurrentItem() || this.mFilterAdapters[i] == null)) {
                    if (FilterFragment.this.mSelectedItem == null || !FilterFragment.this.mSelectedItem.isNone()) {
                        this.mFilterAdapters[i].clearSelected();
                    } else {
                        this.mFilterAdapters[i].setSelectedIndex(0);
                    }
                }
            }
        }

        /* access modifiers changed from: private */
        public void doSelectRender(FilterItem filterItem, FilterAdapter filterAdapter, int i) {
            FilterFragment.this.doRender(filterItem, Integer.valueOf(filterItem.progress));
            filterAdapter.setSelectedIndex(i);
            FilterFragment.this.mSelectedItem = filterItem;
            if (filterAdapter.isInEditMode() && !filterItem.isNone()) {
                FilterFragment.this.mSeekBar.setProgress(filterItem.progress);
            }
            clearOtherSelector();
        }

        /* access modifiers changed from: private */
        public void doSelectSky(FilterItem filterItem, FilterAdapter filterAdapter, int i) {
            if (!FilterFragment.this.mIsSkySegmentSuccess) {
                ToastUtils.makeText((Context) FilterFragment.this.getActivity(), (int) R.string.filter_sky_detect_forbidden_tips);
            } else {
                doSelectRender(filterItem, filterAdapter, i);
            }
        }

        private int findSelected(List<FilterData> list) {
            if (FilterFragment.this.mSelectedItem == null || FilterFragment.this.mSelectedItem.isNone()) {
                return 0;
            }
            for (int i = 0; i < list.size(); i++) {
                if (((FilterData) list.get(i)).equals(FilterFragment.this.mSelectedItem)) {
                    ((FilterData) list.get(i)).progress = FilterFragment.this.mSelectedItem.progress;
                    return i;
                }
            }
            return -1;
        }

        private FilterAdapter getCurrentAdapter() {
            return this.mFilterAdapters[FilterFragment.this.mFilterPager.getCurrentItem()];
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            viewGroup.removeView((View) obj);
        }

        public int getCount() {
            return FilterFragment.this.mCategories.size();
        }

        public Object instantiateItem(ViewGroup viewGroup, int i) {
            SimpleRecyclerView simpleRecyclerView = new SimpleRecyclerView(FilterFragment.this.getActivity());
            FilterCategory filterCategory = (FilterCategory) FilterFragment.this.mCategories.get(i);
            List filterDatas = filterCategory.getFilterDatas();
            ArrayList arrayList = new ArrayList(filterDatas.size());
            arrayList.addAll(filterDatas);
            ScrollControlLinearLayoutManager scrollControlLinearLayoutManager = new ScrollControlLinearLayoutManager(FilterFragment.this.getActivity());
            scrollControlLinearLayoutManager.setOrientation(0);
            simpleRecyclerView.setLayoutManager(scrollControlLinearLayoutManager);
            FilterAdapter filterAdapter = new FilterAdapter(arrayList, filterCategory.highlighColor, filterCategory.subHighlighColor, filterCategory.subItemSize);
            filterAdapter.setOnItemClickListener(this.mOnItemClickListener);
            filterAdapter.setSelectedIndex(findSelected(arrayList));
            simpleRecyclerView.setAdapter(filterAdapter);
            simpleRecyclerView.addItemDecoration(new BlankDivider(FilterFragment.this.getResources(), R.dimen.editor_menu_filter_item_gap, 0));
            viewGroup.addView(simpleRecyclerView);
            this.mFilterAdapters[i] = filterAdapter;
            HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView);
            return simpleRecyclerView;
        }

        public boolean isViewFromObject(View view, Object obj) {
            return view == obj;
        }

        public void updateProgressValue(int i) {
            FilterAdapter currentAdapter = getCurrentAdapter();
            if (currentAdapter != null && currentAdapter.isInEditMode()) {
                currentAdapter.update(i);
            }
        }
    }

    public FilterFragment() {
        super(Effect.FILTER);
    }

    /* access modifiers changed from: private */
    public void doConfig(int i) {
        this.mPagerAdapter.updateProgressValue(i);
        if (this.mSelectedItem != null) {
            this.mSelectedItem.progress = i;
        }
        ((AbstractEffectFragment) getRenderFragment()).clear();
        ((AbstractEffectFragment) getRenderFragment()).add(this.mSelectedItem, Integer.valueOf(i));
        ((AbstractEffectFragment) getRenderFragment()).render();
    }

    /* access modifiers changed from: private */
    public void doRender(FilterData filterData, Object obj) {
        ((AbstractEffectFragment) getRenderFragment()).clear();
        ((AbstractEffectFragment) getRenderFragment()).add(filterData, obj);
        ((AbstractEffectFragment) getRenderFragment()).render();
    }

    /* access modifiers changed from: private */
    @SuppressLint({"CheckResult"})
    public void doSkyTransferProcess() {
        Observable.create(new ObservableOnSubscribe() {
            public final void subscribe(ObservableEmitter observableEmitter) {
                observableEmitter.onNext(Integer.valueOf(SkyTranFilter.getInstance().segment(FilterFragment.this.getPreview())));
            }
        }).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                FilterFragment.lambda$doSkyTransferProcess$93(FilterFragment.this, (Integer) obj);
            }
        });
    }

    public static /* synthetic */ void lambda$doSkyTransferProcess$93(FilterFragment filterFragment, Integer num) throws Exception {
        boolean z = true;
        filterFragment.mIsSkySegmentDone = true;
        if (num.intValue() == 2) {
            z = false;
        }
        filterFragment.mIsSkySegmentSuccess = z;
        HashMap hashMap = new HashMap();
        hashMap.put("result", String.valueOf(num));
        GallerySamplingStatHelper.recordCountEvent("photo_editor", "sky_filter_result", hashMap);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mCategories = new ArrayList();
        this.mCategories.addAll(this.mSdkProvider.list());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        FilterView filterView = new FilterView(viewGroup.getContext());
        this.mTopPanel = (LinearLayout) filterView.findViewById(R.id.top_panel);
        this.mSeekBar = new BasicSeekBar(getActivity());
        this.mSeekBar.setOnSeekBarChangeListener(this.mSeekBarChangeListener);
        this.mSeekBar.setMax(100);
        this.mTopPanel.addView(this.mSeekBar, -1, -2);
        if (SkyCheckHelper.isSkyEnable()) {
            this.mSkyCategory = new FilterCategoryData(7, GalleryApp.sGetAndroidContext().getString(R.string.filter_category_sky), GalleryApp.sGetAndroidContext().getResources().getColor(R.color.filter_category_sky));
            this.mCategories.add(this.mSkyCategory);
            this.mSkyHeadIndex = this.mCategories.size() - 1;
        }
        this.mHeaderAdapter = new FilterHeadAdapter(this.mCategories);
        this.mRecyclerView = (SimpleRecyclerView) filterView.findViewById(R.id.filter_type_list);
        this.mRecyclerView.setAdapter(this.mHeaderAdapter);
        this.mHeaderAdapter.setOnItemClickListener(this.mItemClickListener);
        this.mFilterPager = (ViewPager) filterView.findViewById(R.id.filter_pager);
        this.mFilterPager.setOffscreenPageLimit(1);
        this.mPagerAdapter = new FilterPagerAdapter();
        this.mFilterPager.setAdapter(this.mPagerAdapter);
        this.mFilterPager.setCurrentItem(0, false);
        this.mTitle = (TextView) filterView.findViewById(R.id.title);
        this.mTitle.setText(R.string.photo_editor_filter);
        if (SkyCheckHelper.isSkyEnable() && !SkyCheckHelper.isSkyAvailable()) {
            this.mSkyCategory.setDownloadState(1);
            SkyCheckHelper.getInstance().setDownloadStateListener(this.mSkyDownloadStateListener);
            SkyCheckHelper.getInstance().startDownloadWithWifi();
        }
        return filterView;
    }

    public void onDestroy() {
        super.onDestroy();
        SkyCheckHelper.getInstance().setDownloadStateListener(null);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (SkyCheckHelper.isSkyAvailable()) {
            doSkyTransferProcess();
        }
    }

    public void showTopPanel(boolean z) {
        int i = 8;
        this.mTopPanel.setVisibility(z ? 0 : 8);
        SimpleRecyclerView simpleRecyclerView = this.mRecyclerView;
        if (!z) {
            i = 0;
        }
        simpleRecyclerView.setVisibility(i);
        if (z) {
            ObjectAnimator objectAnimator = new ObjectAnimator();
            objectAnimator.setTarget(this.mTopPanel);
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{getResources().getDimension(R.dimen.photo_editor_filter_tab_offset), 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
            objectAnimator.setDuration((long) getResources().getInteger(R.integer.photo_editor_filter_tab_appear_duration));
            objectAnimator.start();
            ObjectAnimator objectAnimator2 = new ObjectAnimator();
            objectAnimator2.setTarget(this.mRecyclerView);
            objectAnimator2.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, -getResources().getDimension(R.dimen.photo_editor_filter_tab_offset)}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
            objectAnimator2.setInterpolator(new CubicEaseOutInterpolator());
            objectAnimator2.setDuration((long) getResources().getInteger(R.integer.photo_editor_filter_tab_disappear_duration));
            objectAnimator2.start();
            return;
        }
        ObjectAnimator objectAnimator3 = new ObjectAnimator();
        objectAnimator3.setTarget(this.mRecyclerView);
        objectAnimator3.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{-getResources().getDimension(R.dimen.photo_editor_filter_tab_offset), 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
        objectAnimator3.setInterpolator(new CubicEaseOutInterpolator());
        objectAnimator3.setDuration((long) getResources().getInteger(R.integer.photo_editor_filter_tab_appear_duration));
        objectAnimator3.start();
        ObjectAnimator objectAnimator4 = new ObjectAnimator();
        objectAnimator4.setTarget(this.mTopPanel);
        objectAnimator4.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, getResources().getDimension(R.dimen.photo_editor_filter_tab_offset)}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
        objectAnimator4.setInterpolator(new CubicEaseOutInterpolator());
        objectAnimator4.setDuration((long) getResources().getInteger(R.integer.photo_editor_filter_tab_disappear_duration));
        objectAnimator4.start();
    }
}

package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.HomePageStartupHelper;
import com.miui.gallery.activity.HomePageStartupHelper.Attacher;
import com.miui.gallery.activity.HomePageStartupHelper.DataLoadListener;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.adapter.HomePageAdapter;
import com.miui.gallery.adapter.MediaMonthAdapter;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.discovery.DiscoveryMessageManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.preference.GalleryPreferences.HomePage;
import com.miui.gallery.preference.GalleryPreferences.MonthView;
import com.miui.gallery.preference.GalleryPreferences.Search;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.search.widget.BannerSearchBar;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.AIAlbumDisplayHelper.DisplayStatusCallback;
import com.miui.gallery.ui.AIAlbumDisplayHelper.WeakReferencedAIAlbumDisplayStatusObserver;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.OnAppFocusedListener;
import com.miui.gallery.util.SafeBroadcastReceiver;
import com.miui.gallery.util.SafeBroadcastReceiver.WeakReceiver;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.EmptyPage;
import com.miui.gallery.widget.PanelBar;
import com.miui.gallery.widget.TwoStageDrawer;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapper;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.transition.FuzzyMatchItem;
import com.miui.gallery.widget.recyclerview.transition.TransitionAnchor;
import com.miui.gallery.widget.recyclerview.transition.TransitionHelper;
import com.miui.gallery.widget.recyclerview.transition.TransitionListenerAdapter;
import com.miui.gallery.widget.stickyheader.StickyGridLayoutManager;
import com.miui.gallery.widget.stickyheader.StickyHeaderGridLayoutManager;
import com.miui.gallery.widget.stickyheader.StickyHeaderGridRecyclerView;
import com.miui.gallery.widget.stickyheader.StickyHeaderLinearLayoutManager;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderRecyclerView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class HomePageFragment extends BaseMediaFragment implements DisplayStatusCallback, OnAppFocusedListener {
    public static final String[] PHOTOS_LOADER_PROJECTION = HomePageAdapter.PROJECTION;
    public static final Uri PHOTOS_LOADER_URI = Media.URI.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).appendQueryParameter("generate_headers", String.valueOf(true)).build();
    /* access modifiers changed from: private */
    public static final Uri PHOTOS_PAGE_URI = Media.URI.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
    private BannerSearchBar mBannerSearchBar;
    private MultiChoiceModeListener mChoiceModeListener = new MultiChoiceModeListener() {
        private MenuItem mAddToAlbum;
        private MenuItem mDelete;
        private MenuItem mProduce;
        private MenuItem mSend;

        private void updateMenuState() {
            if (HomePageFragment.this.mHomeGridViewWrapper.getCheckedItemCount() < 1) {
                this.mDelete.setEnabled(false);
                this.mAddToAlbum.setEnabled(false);
                this.mProduce.setEnabled(false);
                this.mSend.setEnabled(false);
                return;
            }
            this.mDelete.setEnabled(true);
            this.mAddToAlbum.setEnabled(true);
            this.mProduce.setEnabled(true);
            this.mSend.setEnabled(true);
        }

        /* JADX WARNING: type inference failed for: r11v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r11v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 35
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 3 */
        public boolean onActionItemClicked(final ActionMode actionMode, MenuItem menuItem) {
            int itemId = menuItem.getItemId();
            if (itemId == R.id.action_produce) {
                MediaAndAlbumOperations.doProduceCreation(HomePageFragment.this.mActivity, new OnCompleteListener() {
                    public void onComplete(long[] jArr) {
                        List checkedItems = HomePageFragment.this.mHomeGridViewWrapper.getCheckedItems();
                        int i = 0;
                        for (int i2 = 0; i2 < checkedItems.size(); i2++) {
                            if (ImageFeatureCacheManager.getInstance().isBestImage(((CheckedItem) checkedItems.get(i2)).getId(), false, false, null)) {
                                i++;
                            }
                        }
                        HashMap hashMap = new HashMap();
                        hashMap.put("count", Integer.valueOf(checkedItems.size()));
                        hashMap.put("best_image_count", Integer.valueOf(i));
                        GallerySamplingStatHelper.recordCountEvent("home", "produce", hashMap);
                        actionMode.finish();
                    }
                }, HomePageFragment.this.mHomeGridViewWrapper.getCheckedItems());
            } else if (itemId == R.id.action_send) {
                HomePageFragment.this.onSend(null, null);
            } else if (itemId == R.id.add_to_album) {
                MediaAndAlbumOperations.addToAlbum(HomePageFragment.this.mActivity, new OnAddAlbumListener() {
                    public void onComplete(long[] jArr, boolean z) {
                        actionMode.finish();
                        GallerySamplingStatHelper.recordCountEvent("home", "add_to_album");
                    }
                }, 1, true, true, HomePageFragment.this.mHomeGridViewWrapper.isCheckedItemContainVideo(), MiscUtil.ListToArray(HomePageFragment.this.getBurstCheckedItemIds()));
            } else if (itemId != R.id.delete) {
                return false;
            } else {
                MediaAndAlbumOperations.delete(HomePageFragment.this.mActivity, "HomePageFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
                    /* JADX WARNING: type inference failed for: r7v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: type inference failed for: r7v11, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 30
                    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
                    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
                    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
                    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
                    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
                    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
                    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
                    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
                     */
                    /* JADX WARNING: Unknown variable types count: 2 */
                    public void onDeleted(int i, long[] jArr) {
                        if (HomePageFragment.this.mActivity != null) {
                            ToastUtils.makeText((Context) HomePageFragment.this.mActivity, (CharSequence) HomePageFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                            if (i > 0) {
                                SoundUtils.playSoundForOperation(HomePageFragment.this.mActivity, 0);
                            }
                            actionMode.finish();
                            HashMap hashMap = new HashMap();
                            hashMap.put("count", Integer.valueOf(i));
                            GallerySamplingStatHelper.recordCountEvent("home", "delete_photo", hashMap);
                        }
                    }
                }, -1, "", 1, 26, MiscUtil.ListToArray(HomePageFragment.this.getBurstCheckedItemIds()));
            }
            return true;
        }

        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            updateMenuState();
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 44
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(HomePageFragment.this.mActivity) ? R.menu.v15_home_page_menu : R.menu.home_page_menu, menu);
            this.mAddToAlbum = menu.findItem(R.id.add_to_album);
            this.mDelete = menu.findItem(R.id.delete);
            this.mProduce = menu.findItem(R.id.action_produce);
            this.mSend = menu.findItem(R.id.action_send);
            if (HomePageFragment.this.mHomePageTopBarController != null) {
                HomePageFragment.this.mHomePageTopBarController.setEnable(false);
            }
            if (HomePageFragment.this.mSearchBarController != null) {
                HomePageFragment.this.mSearchBarController.onPause();
                HomePageFragment.this.mSearchBarController.setEnable(false);
            }
            ImageSelectionTipFragment.showImageSelectionTipDialogIfNecessary(HomePageFragment.this.getActivity());
            GallerySamplingStatHelper.recordCountEvent("home", "action_mode_create");
            GallerySamplingStatHelper.recordNumericPropertyEvent("best_image", "best_image_count", (long) ImageFeatureCacheManager.getInstance().getBestImageCount(false));
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            if (HomePageFragment.this.mHomePageTopBarController != null) {
                HomePageFragment.this.mHomePageTopBarController.setEnable(true);
            }
            if (HomePageFragment.this.mSearchBarController != null) {
                HomePageFragment.this.mSearchBarController.onResume();
                HomePageFragment.this.mSearchBarController.setEnable(true);
            }
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            updateMenuState();
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return false;
        }
    };
    /* access modifiers changed from: private */
    public TwoStageDrawer mDrawer;
    private EmptyPage mEmptyView;
    /* access modifiers changed from: private */
    public StickyHeaderGridRecyclerView mHomeGridView;
    /* access modifiers changed from: private */
    public EditableListViewWrapper mHomeGridViewWrapper;
    /* access modifiers changed from: private */
    public HomePageAdapter mHomePageAdapter;
    private HomePagePhotoLoaderCallback mHomePagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public HomePageStartupHelper mHomePageStartHelper;
    /* access modifiers changed from: private */
    public HomePageTopBarController mHomePageTopBarController;
    private boolean mIsStartupDone = false;
    /* access modifiers changed from: private */
    public MediaMonthAdapter mMonthAdapter;
    /* access modifiers changed from: private */
    public StickyHeaderRecyclerView mMonthView;
    /* access modifiers changed from: private */
    public TopSearchBarController mSearchBarController;
    private WeakReferencedAIAlbumDisplayStatusObserver mSearchBarStatusObserver;
    private FrameLayout mSearchContainer;
    /* access modifiers changed from: private */
    public FrameLayout mSearchTextPreview;
    private boolean mStartCalled;
    TransitionHelper mTransitionHelper = new TransitionHelper(new TransitionListenerAdapter() {
        public void onTransitionEnd(RecyclerView recyclerView, RecyclerView recyclerView2, boolean z) {
            if (z) {
                HomePageFragment.this.mDrawer.removeView(recyclerView);
                TransitionHelper.setRecycleChildVisibility(recyclerView, 0);
                ((StickyHeaderRecyclerView) recyclerView).setHeaderVisibility(0);
                recyclerView2.setVisibility(0);
                ((StickyHeaderRecyclerView) recyclerView2).setHeaderVisibility(0);
                TransitionHelper.setRecycleChildVisibility(recyclerView2, 0);
                HomePageFragment.this.mDrawer.setTargetView(recyclerView2);
                HomePageFragment.this.mDrawer.setScrollableView(recyclerView2);
                GalleryStatHelper.recordCountEvent("list_view", "list_view_enter_month");
                return;
            }
            TransitionHelper.setRecycleChildVisibility(recyclerView, 0);
            ((StickyHeaderRecyclerView) recyclerView).setHeaderVisibility(0);
            HomePageFragment.this.mDrawer.removeView(recyclerView2);
        }

        /* JADX WARNING: type inference failed for: r3v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 135
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public TransitionAnchor onTransitionPrepare(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f, float f2) {
            FuzzyMatchItem fuzzyMatchItem;
            FuzzyMatchItem fuzzyMatchItem2;
            int i2;
            View view = null;
            if (HomePageFragment.this.mHomeGridViewWrapper.isInActionMode()) {
                return null;
            }
            if (recyclerView == HomePageFragment.this.mHomeGridView) {
                if (HomePageFragment.this.mMonthView.getAdapter() == null) {
                    HomePageFragment.this.mMonthView.setAdapter(HomePageFragment.this.mMonthAdapter);
                    HomePageFragment.this.mMonthView.setStickyHeaderAdapter(HomePageFragment.this.mMonthAdapter);
                    HomePageFragment.this.mMonthView.setStickyHeaderLayoutManager(new StickyHeaderLinearLayoutManager(HomePageFragment.this.mMonthView));
                    HomePageFragment.this.mMonthView.setLayoutManager(new LinearLayoutManager(HomePageFragment.this.mActivity));
                }
                View findClosestViewUnder = TransitionHelper.findClosestViewUnder(HomePageFragment.this.mHomeGridView, f, f2);
                int childAdapterPositionForExternal = HomePageFragment.this.mHomeGridView.getChildAdapterPositionForExternal(findClosestViewUnder);
                if (childAdapterPositionForExternal == -1) {
                    Log.w("HomePageFragment", "can't find the position of item %s", findClosestViewUnder);
                    return null;
                }
                int top = findClosestViewUnder.getTop();
                fuzzyMatchItem2 = HomePageFragment.this.mHomePageAdapter.packageFuzzyMatchItem(childAdapterPositionForExternal);
                fuzzyMatchItem = HomePageFragment.this.mMonthAdapter.findFuzzyMatchItem(fuzzyMatchItem2);
                if (fuzzyMatchItem == null) {
                    Log.w("HomePageFragment", "can't find fuzzy math item from month adapter, maybe the data hasn't loaded");
                    return null;
                }
                Rect estimateItemFrame = HomePageFragment.this.mMonthAdapter.estimateItemFrame(HomePageFragment.this.mHomeGridView.getWidth(), fuzzyMatchItem.mPosition, fuzzyMatchItem.mId);
                if (estimateItemFrame == null) {
                    Log.w("HomePageFragment", "can't find estimate item, maybe the data hasn't loaded");
                    return null;
                }
                i2 = top - estimateItemFrame.top;
            } else if (recyclerView == HomePageFragment.this.mMonthView) {
                MonthView monthView = (MonthView) TransitionHelper.findClosestViewUnder(HomePageFragment.this.mMonthView, f, f2);
                fuzzyMatchItem2 = monthView.findClosestMatchItemUnder(f - ((float) monthView.getLeft()), f2 - ((float) monthView.getTop()));
                int top2 = monthView.getTop() + monthView.getItemFrame(fuzzyMatchItem2.mId).bottom;
                fuzzyMatchItem = HomePageFragment.this.mHomePageAdapter.findFuzzyMatchItem(fuzzyMatchItem2);
                if (fuzzyMatchItem == null) {
                    Log.w("HomePageFragment", "can't find fuzzy math item from home adapter, maybe the data hasn't loaded");
                    return null;
                }
                if (HomePageFragment.this.mHomeGridView.getChildCount() > 0) {
                    view = HomePageFragment.this.mHomeGridView.getChildAt(0);
                }
                i2 = Math.max(top2 - (view != null ? view.getHeight() : ThumbConfig.get().sMicroTargetSize.getHeight()), 0);
            } else {
                fuzzyMatchItem2 = null;
                fuzzyMatchItem = null;
                i2 = 0;
            }
            if (recyclerView2.getParent() == null) {
                HomePageFragment.this.mDrawer.addView(recyclerView2, 0);
            }
            recyclerView2.setVisibility(4);
            if (!(fuzzyMatchItem == null || fuzzyMatchItem.mPosition == -1)) {
                ((StickyHeaderRecyclerView) recyclerView2).scrollToPositionWithOffset(fuzzyMatchItem.mPosition, i2);
            }
            recyclerView2.invalidateItemDecorations();
            return new TransitionAnchor(fuzzyMatchItem2.mId, fuzzyMatchItem.mId);
        }

        public void onTransitionUpdate(RecyclerView recyclerView, RecyclerView recyclerView2, float f) {
            StickyHeaderRecyclerView stickyHeaderRecyclerView = (StickyHeaderRecyclerView) recyclerView;
            if (stickyHeaderRecyclerView.getHeaderVisibility() == 0) {
                TransitionHelper.setRecycleChildVisibility(recyclerView, 4);
                stickyHeaderRecyclerView.setHeaderVisibility(4);
                recyclerView.setVisibility(0);
            }
            StickyHeaderRecyclerView stickyHeaderRecyclerView2 = (StickyHeaderRecyclerView) recyclerView2;
            if (stickyHeaderRecyclerView2.getHeaderVisibility() != 0) {
                recyclerView2.setVisibility(4);
                stickyHeaderRecyclerView2.setHeaderVisibility(0);
                TransitionHelper.setRecycleChildVisibility(recyclerView2, 0);
            }
        }
    });
    private SafeBroadcastReceiver mVoiceAssistantReceiver;
    private WeakReceiver mWeakVoiceAssistantReceiver = new WeakReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (HomePageFragment.this.mHomeGridViewWrapper.isInActionMode()) {
                HomePageFragment.this.onSend(intent.getStringExtra("assistant_target_package"), intent.getStringExtra("assistant_target_class"));
            }
        }
    };

    private class HomePagePhotoLoaderCallback implements LoaderCallbacks {
        private boolean mIsFirstTime;
        private long startTime;

        private HomePagePhotoLoaderCallback() {
            this.mIsFirstTime = true;
        }

        private boolean isTopBarPermanent() {
            return HomePageFragment.this.mHomePageAdapter.getItemCount() == 0 && AccountCache.getAccount() == null;
        }

        private void saveHomePageIds() {
            ArrayList arrayList = new ArrayList(128);
            int i = 0;
            while (i < 128 && i < HomePageFragment.this.mHomePageAdapter.getItemCount()) {
                arrayList.add(Long.valueOf(HomePageFragment.this.mHomePageAdapter.getItemKey(i)));
                i++;
            }
            HomePage.setHomePageImageIds(TextUtils.join(",", arrayList));
        }

        private void updateAfterLoadFinished() {
            if (HomePageFragment.this.mHomePageAdapter.getItemCount() == 0) {
                HomePageFragment.this.inflateEmptyView();
            }
            if (HomePageFragment.this.mHomePageTopBarController != null) {
                boolean isTopBarPermanent = isTopBarPermanent();
                HomePageFragment.this.mHomePageTopBarController.setPermanent(isTopBarPermanent);
                HomePageFragment.this.mDrawer.setDragEnabled(!isTopBarPermanent);
            }
            saveHomePageIds();
        }

        /* JADX WARNING: type inference failed for: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 43
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 3 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            if (i == 1) {
                this.startTime = System.currentTimeMillis();
                CursorLoader cursorLoader = new CursorLoader(HomePageFragment.this.mActivity);
                cursorLoader.setUri(HomePageFragment.PHOTOS_LOADER_URI);
                cursorLoader.setProjection(HomePageFragment.PHOTOS_LOADER_PROJECTION);
                cursorLoader.setSelection("alias_show_in_homepage=1 AND sha1 NOT NULL");
                cursorLoader.setSortOrder("alias_sort_time DESC ");
                return cursorLoader;
            } else if (i == 2) {
                return DiscoveryMessageManager.getInstance().createLoader(HomePageFragment.this.mActivity, 1);
            } else {
                if (i != 3) {
                    return null;
                }
                Uri build = Media.URI_MONTH_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).appendQueryParameter("generate_headers", String.valueOf(true)).build();
                CursorLoader cursorLoader2 = new CursorLoader(HomePageFragment.this.mActivity);
                cursorLoader2.setUri(build);
                cursorLoader2.setProjection(HomePageFragment.PHOTOS_LOADER_PROJECTION);
                cursorLoader2.setSelection("alias_show_in_homepage=1 AND sha1 NOT NULL");
                cursorLoader2.setSortOrder("alias_sort_time DESC ");
                return cursorLoader2;
            }
        }

        public void onLoadFinished(Loader loader, Object obj) {
            int id = loader.getId();
            if (id == 1) {
                if (this.mIsFirstTime) {
                    Log.d("HomePageFragment", "onLoadFinished %d", (Object) Long.valueOf(System.currentTimeMillis() - this.startTime));
                    this.mIsFirstTime = false;
                }
                HomePageFragment.this.mHomePageAdapter.swapCursor((Cursor) obj);
                updateAfterLoadFinished();
            } else if (id == 2) {
                if (HomePageFragment.this.mHomePageTopBarController != null) {
                    HomePageFragment.this.mHomePageTopBarController.setDiscoveryMessage((ArrayList) obj);
                }
            } else if (id == 3) {
                HomePageFragment.this.mMonthAdapter.swapCursor((Cursor) obj);
                if (HomePageFragment.this.needShowMonthViewTip()) {
                    HomePageFragment.this.showMonthViewTip();
                }
            }
        }

        public void onLoaderReset(Loader loader) {
            if (loader.getId() == 2 && HomePageFragment.this.isResumed() && HomePageFragment.this.mHomePageTopBarController != null) {
                HomePageFragment.this.mHomePageTopBarController.setDiscoveryMessage(null);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r4v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 42
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 5 */
    private void addSearchContainer() {
        this.mSearchContainer = new FrameLayout(this.mActivity);
        this.mSearchContainer.setLayoutParams(new LayoutParams(-1, -2));
        this.mSearchContainer.setBackgroundColor(getResources().getColor(R.color.top_bar_background));
        this.mSearchContainer.setId(R.id.home_page_search_bar_container);
        if (Search.isSearchCacheStatusOpen(false)) {
            this.mSearchTextPreview = new FrameLayout(this.mActivity);
            int dip2px = MiscUtil.dip2px(this.mActivity, 38.5f);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, dip2px);
            int dip2px2 = MiscUtil.dip2px(this.mActivity, 10.0f);
            layoutParams.setMargins(dip2px2, 0, dip2px2, MiscUtil.dip2px(this.mActivity, 6.33f));
            this.mSearchTextPreview.setLayoutParams(layoutParams);
            this.mSearchTextPreview.setBackgroundColor(getResources().getColor(R.color.search_bar_placeholder_color));
            this.mSearchContainer.addView(this.mSearchTextPreview);
            this.mHomeGridView.setTranslationY((float) (dip2px + dip2px2));
        }
        this.mDrawer.addView(this.mSearchContainer);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 21
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void addTopBar() {
        PanelBar panelBar = new PanelBar(this.mActivity);
        panelBar.setId(R.id.home_page_top_bar);
        panelBar.setBackground(getResources().getDrawable(R.drawable.top_bar_single_bg));
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.message_bar_horizontal_margin);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.message_bar_vertical_margin);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(R.dimen.panel_item_height));
        layoutParams.setMargins(dimensionPixelSize, 0, dimensionPixelSize, dimensionPixelSize2);
        layoutParams.addRule(3, R.id.home_page_search_bar_container);
        panelBar.setLayoutParams(layoutParams);
        this.mDrawer.addView(panelBar);
        this.mDrawer.setSecondaryContentView(panelBar);
    }

    /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 49
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 3 */
    private void displaySearchBar() {
        if (this.mBannerSearchBar == null) {
            this.mBannerSearchBar = new BannerSearchBar(this.mActivity);
            this.mBannerSearchBar.setId(R.id.home_page_search_bar);
        }
        if (this.mSearchBarController == null) {
            this.mSearchBarController = new TopSearchBarController(this, this.mBannerSearchBar, "from_home_page");
        }
        this.mSearchContainer.setVisibility(0);
        if (isResumed()) {
            this.mSearchBarController.onResume();
        }
        if (this.mBannerSearchBar.getParent() != null) {
            this.mBannerSearchBar.post(new Runnable() {
                public void run() {
                    if (!HomePageFragment.this.mDrawer.isDrawerOpen()) {
                        HomePageFragment.this.mDrawer.halfOpenDrawer(true);
                    }
                }
            });
            return;
        }
        if (this.mSearchTextPreview == null) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
            int dip2px = MiscUtil.dip2px(this.mActivity, 10.0f);
            layoutParams.setMargins(dip2px, 0, dip2px, MiscUtil.dip2px(this.mActivity, 6.33f));
            this.mBannerSearchBar.setLayoutParams(layoutParams);
            this.mSearchContainer.addView(this.mBannerSearchBar);
            this.mBannerSearchBar.post(new Runnable() {
                public void run() {
                    if (!HomePageFragment.this.mDrawer.isDrawerOpen() || !HomePageFragment.this.mDrawer.isDrawerHalfOpen()) {
                        HomePageFragment.this.mDrawer.halfOpenDrawer(true);
                    }
                }
            });
        } else {
            this.mSearchTextPreview.addView(this.mBannerSearchBar);
            this.mBannerSearchBar.startAnimation(getSearchBarAppearAnimation());
        }
    }

    private void doOnStart() {
        if (!this.mStartCalled) {
            this.mHomePageAdapter.updateGalleryCloudSyncableState();
            if (this.mHomePageTopBarController != null) {
                this.mHomePageTopBarController.onResume();
            }
            ImageFeatureManager.getInstance().triggerNewImageCalculation();
            this.mStartCalled = true;
            if (getUserVisibleHint()) {
                onVisibleToUser();
            }
        }
    }

    private void doOnStop() {
        if (this.mStartCalled) {
            if (this.mHomePageTopBarController != null) {
                this.mHomePageTopBarController.onPause();
            }
            this.mStartCalled = false;
        }
    }

    /* access modifiers changed from: private */
    public ArrayList<Long> getBurstCheckedItemIds() {
        SparseBooleanArray checkedItemPositions = this.mHomeGridViewWrapper.getCheckedItemPositions();
        ArrayList<Long> arrayList = new ArrayList<>();
        for (int i = 0; i < checkedItemPositions.size(); i++) {
            int keyAt = checkedItemPositions.keyAt(i);
            if (checkedItemPositions.get(keyAt)) {
                arrayList.addAll(this.mHomePageAdapter.getBurstItemKeys(keyAt));
            }
        }
        return arrayList;
    }

    private AlphaAnimation getSearchBarAppearAnimation() {
        AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        alphaAnimation.setDuration(200);
        alphaAnimation.setInterpolator(new AccelerateInterpolator());
        alphaAnimation.setAnimationListener(new AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                if (HomePageFragment.this.mSearchTextPreview != null) {
                    HomePageFragment.this.mSearchTextPreview.setBackgroundColor(0);
                }
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }
        });
        return alphaAnimation;
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void inflateEmptyView() {
        if (this.mEmptyView == null) {
            this.mEmptyView = (EmptyPage) LayoutInflater.from(this.mActivity).inflate(R.layout.home_page_empty_view, null, false);
            this.mEmptyView.setOnActionButtonClickListener(new OnClickListener() {
                public void onClick(View view) {
                    IntentUtil.startCameraActivity(HomePageFragment.this.getActivity());
                }
            });
            this.mDrawer.addView(this.mEmptyView);
            this.mHomeGridViewWrapper.setEmptyView(this.mEmptyView);
        }
    }

    private boolean isEmpty() {
        return (this.mHomePageAdapter == null || this.mHomePageAdapter.getCursor() == null || this.mHomePageAdapter.getItemCount() != 0) ? false : true;
    }

    /* access modifiers changed from: private */
    public boolean needShowMonthViewTip() {
        return getUserVisibleHint() && this.mMonthAdapter != null && this.mMonthAdapter.getItemCount() > 0 && !MonthView.hasShownTip();
    }

    /* access modifiers changed from: private */
    public void onSend(String str, String str2) {
        SparseBooleanArray checkedItemPositions = this.mHomeGridViewWrapper.getCheckedItemPositions();
        ArrayList arrayList = new ArrayList(checkedItemPositions.size());
        ArrayList arrayList2 = new ArrayList(checkedItemPositions.size());
        int i = 0;
        int i2 = Integer.MAX_VALUE;
        for (int i3 = 0; i3 < checkedItemPositions.size(); i3++) {
            int keyAt = checkedItemPositions.keyAt(i3);
            if (checkedItemPositions.get(keyAt)) {
                arrayList.add(Integer.valueOf(keyAt));
                arrayList2.add(Long.valueOf(this.mHomePageAdapter.getItemKey(keyAt)));
                if (keyAt < i2) {
                    i2 = keyAt;
                }
            }
        }
        if (arrayList.size() != 0) {
            int[] iArr = new int[arrayList.size()];
            long[] jArr = new long[arrayList2.size()];
            for (int i4 = 0; i4 < arrayList.size(); i4++) {
                iArr[i4] = ((Integer) arrayList.get(i4)).intValue();
                jArr[i4] = ((Long) arrayList2.get(i4)).longValue();
            }
            if (i2 != Integer.MAX_VALUE) {
                i = i2;
            }
            ImageLoadParams imageLoadParams = new ImageLoadParams(this.mHomePageAdapter.getItemKey(i), this.mHomePageAdapter.getLocalPath(i), ThumbConfig.get().sMicroTargetSize, this.mHomePageAdapter.getItemDecodeRectF(i), i, this.mHomePageAdapter.getMimeType(i), this.mHomePageAdapter.getFileLength(i));
            IntentUtil.gotoPreviewSelectPage(this, PHOTOS_PAGE_URI, i, this.mHomePageAdapter.getItemCount(), "alias_show_in_homepage=1 AND sha1 NOT NULL", null, "alias_sort_time DESC ", imageLoadParams, jArr, iArr, str, str2);
            this.mHomeGridViewWrapper.stopActionMode();
            HashMap hashMap = new HashMap();
            hashMap.put("count", Integer.valueOf(checkedItemPositions.size()));
            GallerySamplingStatHelper.recordCountEvent("home", "send", hashMap);
        }
    }

    private void onVisibleToUser() {
        if (isEmpty()) {
            statHomeEmpty();
        }
        if (needShowMonthViewTip()) {
            showMonthViewTip();
        }
    }

    private void registerSearchStatusObserver() {
        this.mSearchBarStatusObserver = new WeakReferencedAIAlbumDisplayStatusObserver(this);
        onStatusChanged(AIAlbumDisplayHelper.getInstance().registerAIAlbumDisplayStatusObserver(this.mSearchBarStatusObserver));
    }

    /* access modifiers changed from: private */
    public void showMonthViewTip() {
        new MonthViewTipFragment().showAllowingStateLoss(getChildFragmentManager(), "monthViewTip");
        MonthView.setHasShownTip(true);
    }

    private void statHomeEmpty() {
        HashMap hashMap = new HashMap();
        hashMap.put("login", String.valueOf(AccountCache.getAccount() != null));
        GallerySamplingStatHelper.recordCountEvent("home", "home_empty", hashMap);
    }

    /* access modifiers changed from: private */
    public void transit(float f, float f2) {
        int i;
        RecyclerView recyclerView;
        int i2;
        RecyclerView recyclerView2;
        RecyclerView recyclerView3;
        StickyHeaderGridRecyclerView stickyHeaderGridRecyclerView = null;
        if (this.mHomeGridView == null || !this.mHomeGridView.isAttachedToWindow()) {
            i = 0;
            recyclerView = null;
        } else {
            stickyHeaderGridRecyclerView = this.mHomeGridView;
            recyclerView = this.mMonthView;
            i = 2;
        }
        if (this.mMonthView == null || !this.mMonthView.isAttachedToWindow()) {
            recyclerView2 = recyclerView;
            recyclerView3 = stickyHeaderGridRecyclerView;
            i2 = i;
        } else {
            StickyHeaderRecyclerView stickyHeaderRecyclerView = this.mMonthView;
            recyclerView2 = this.mHomeGridView;
            recyclerView3 = stickyHeaderRecyclerView;
            i2 = 1;
        }
        this.mTransitionHelper.startTransition(recyclerView3, recyclerView2, i2, f, f2);
    }

    private void unregisterSearchStatusObserver() {
        if (this.mSearchBarStatusObserver != null) {
            AIAlbumDisplayHelper.getInstance().unregisterAIAlbumDisplayStatusObserver(this.mSearchBarStatusObserver);
        }
    }

    private void updateConfiguration(Configuration configuration) {
        int findFirstVisibleItemPosition = this.mHomeGridView.findFirstVisibleItemPosition();
        GridLayoutManager gridLayoutManager = (GridLayoutManager) this.mHomeGridView.getLayoutManager();
        if (configuration.orientation == 2) {
            gridLayoutManager.setSpanCount(ThumbConfig.get().sMicroThumbColumnsLand);
        } else {
            gridLayoutManager.setSpanCount(ThumbConfig.get().sMicroThumbColumnsPortrait);
        }
        if (findFirstVisibleItemPosition != -1) {
            this.mHomeGridView.scrollToPositionWithOffset(findFirstVisibleItemPosition, 0);
        }
        this.mHomeGridView.invalidateItemDecorations();
    }

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return null;
    }

    /* access modifiers changed from: protected */
    public List<Loader> getLoaders() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(getLoaderManager().getLoader(1));
        arrayList.add(getLoaderManager().getLoader(2));
        arrayList.add(getLoaderManager().getLoader(3));
        return arrayList;
    }

    public String getPageName() {
        return "home";
    }

    public void onAppFocused() {
        if (this.mHomePageTopBarController != null) {
            this.mHomePageTopBarController.onAppFocused();
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration(configuration);
    }

    public void onDataBind() {
        if (!this.mIsStartupDone) {
            this.mIsStartupDone = true;
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    HomePageFragment.this.mHomePageStartHelper.onStartup();
                    HomePageFragment.this.onStartup();
                }
            });
        }
    }

    public void onDestroy() {
        if (this.mHomePageAdapter != null) {
            this.mHomePageAdapter.swapCursor(null);
        }
        super.onDestroy();
        if (this.mHomePageTopBarController != null) {
            this.mHomePageTopBarController.onDestroy();
        }
        DiscoveryMessageManager.getInstance().markAsReadByTypeAsync(GalleryApp.sGetAndroidContext(), 1);
    }

    public void onDestroyView() {
        unregisterSearchStatusObserver();
        super.onDestroyView();
    }

    /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v14, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 65
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 4 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mDrawer = new TwoStageDrawer(this.mActivity);
        this.mDrawer.setAlwaysShowTargetViewDivider(getResources().getBoolean(R.bool.homepage_alwaysShowTargetViewDivider));
        this.mHomeGridView = new StickyHeaderGridRecyclerView(this.mActivity);
        this.mHomeGridView.setLayoutParams(new LayoutParams(-1, -1));
        this.mHomeGridView.setItemAnimator(null);
        this.mHomeGridView.setOverScrollMode(2);
        this.mHomeGridViewWrapper = new EditableListViewWrapper(this.mHomeGridView);
        this.mHomePageAdapter = new HomePageAdapter(this.mActivity);
        this.mHomePageAdapter.setHasStableIds(true);
        this.mHomeGridViewWrapper.setAdapter(this.mHomePageAdapter);
        this.mHomeGridViewWrapper.setStickyHeaderAdapter(this.mHomePageAdapter);
        this.mHomeGridViewWrapper.setStickyHeaderLayoutManager(new StickyHeaderGridLayoutManager(this.mHomeGridView));
        this.mHomeGridViewWrapper.setLayoutManager(new StickyGridLayoutManager(this.mActivity, ThumbConfig.get().sMicroThumbColumnsPortrait));
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.micro_thumb_horizontal_spacing);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.micro_thumb_vertical_spacing);
        this.mHomeGridView.setHorizontalSpacing(dimensionPixelSize);
        this.mHomeGridView.setVerticalSpacing(dimensionPixelSize2);
        updateConfiguration(getResources().getConfiguration());
        this.mDrawer.addView(this.mHomeGridView);
        this.mHomePageStartHelper = ((Attacher) this.mActivity).getStartupHelper();
        this.mHomePageStartHelper.setDataLoaderListener(new DataLoadListener() {
            public void onDataLoadFinish(Cursor cursor) {
                if (HomePageFragment.this.mActivity != null) {
                    if (cursor != null) {
                        HomePageFragment.this.mHomePageAdapter.swapCursor(cursor);
                    }
                    HomePageFragment.this.onDataBind();
                }
            }
        });
        addSearchContainer();
        return this.mDrawer;
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 14
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onPause() {
        super.onPause();
        if (this.mSearchBarController != null) {
            this.mSearchBarController.onPause();
        }
        if (this.mVoiceAssistantReceiver != null) {
            LocalBroadcastManager.getInstance(this.mActivity).unregisterReceiver(this.mVoiceAssistantReceiver);
            this.mVoiceAssistantReceiver = null;
        }
    }

    /* access modifiers changed from: protected */
    public void onPhotoPageCreate(Intent intent) {
        super.onPhotoPageCreate(intent);
        doOnStop();
    }

    /* access modifiers changed from: protected */
    public void onPhotoPageDestroy(Intent intent) {
        super.onPhotoPageDestroy(intent);
        doOnStart();
    }

    /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 21
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onResume() {
        super.onResume();
        if (this.mSearchBarController != null && !this.mHomeGridViewWrapper.isInActionMode()) {
            this.mSearchBarController.onResume();
        }
        if (this.mVoiceAssistantReceiver == null) {
            this.mVoiceAssistantReceiver = new SafeBroadcastReceiver(this.mWeakVoiceAssistantReceiver);
            LocalBroadcastManager.getInstance(this.mActivity).registerReceiver(this.mVoiceAssistantReceiver, new IntentFilter("com.miui.gallery.action.VOICE_ASSISTANT_SELECT_SHARE"));
        }
    }

    public void onStart() {
        super.onStart();
        doOnStart();
    }

    /* JADX WARNING: type inference failed for: r3v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 97
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onStartup() {
        if (this.mActivity != null && !this.mActivity.isDestroyed()) {
            this.mDrawer.setContentViewBackground(getResources().getDrawable(R.drawable.top_bar_background));
            this.mDrawer.setTargetView(this.mHomeGridView);
            this.mDrawer.setPrimaryContentView(this.mSearchContainer);
            this.mDrawer.setScrollDivider(getResources().getDrawable(R.drawable.sync_status_scroll_divider));
            this.mDrawer.setScrollableView(this.mHomeGridView);
            this.mDrawer.setDragEnabled(true);
            this.mDrawer.setInitialDrawerState(1);
            addTopBar();
            if (this.mSearchTextPreview != null) {
                displaySearchBar();
            }
            this.mHomeGridView.setFastScrollStyle(R.style.FastScroll);
            this.mHomeGridView.setFastScrollEnabled(true);
            this.mHomeGridViewWrapper.setOnScrollListener(this.mHomePageAdapter.generateWrapScrollListener(null));
            this.mHomeGridViewWrapper.enableChoiceMode(true);
            this.mHomeGridViewWrapper.setMultiChoiceModeListener(this.mChoiceModeListener);
            this.mHomeGridViewWrapper.setOnItemClickListener(new OnItemClickListener() {
                public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
                    int i2 = i;
                    ImageLoadParams imageLoadParams = new ImageLoadParams(HomePageFragment.this.mHomePageAdapter.getItemKey(i2), HomePageFragment.this.mHomePageAdapter.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, HomePageFragment.this.mHomePageAdapter.getItemDecodeRectF(i2), i, HomePageFragment.this.mHomePageAdapter.getMimeType(i2), HomePageFragment.this.mHomePageAdapter.getFileLength(i2));
                    IntentUtil.gotoPhotoPage(HomePageFragment.this, recyclerView, HomePageFragment.PHOTOS_PAGE_URI, i, HomePageFragment.this.mHomePageAdapter.getItemCount(), "alias_show_in_homepage=1 AND sha1 NOT NULL", null, "alias_sort_time DESC ", imageLoadParams, false);
                    GallerySamplingStatHelper.recordNumericPropertyEvent("home", "click_micro_thumb", (long) i2);
                    return true;
                }
            });
            this.mHomePageTopBarController = new HomePageTopBarController(getActivity(), this.mDrawer, R.id.home_page_top_bar);
            if (this.mStartCalled) {
                this.mHomePageTopBarController.onAppFocused();
                this.mHomePageTopBarController.onResume();
            }
            registerSearchStatusObserver();
            this.mMonthView = new StickyHeaderRecyclerView(this.mActivity);
            this.mMonthView.setLayoutParams(new LayoutParams(-1, -1));
            this.mMonthView.setFastScrollStyle(R.style.FastScroll);
            this.mMonthView.setFastScrollEnabled(true);
            this.mMonthAdapter = new MediaMonthAdapter();
            this.mMonthAdapter.setHasStableIds(true);
            this.mMonthView.setOnItemClickListener(new OnItemClickListener() {
                public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
                    if (!(view instanceof MonthView) || ((MonthView) view).findMatchItemUnder(f, f2) == null) {
                        return false;
                    }
                    HomePageFragment.this.transit(f + ((float) view.getLeft()) + view.getTranslationX(), f2 + ((float) view.getTop()) + view.getTranslationY());
                    HashMap hashMap = new HashMap();
                    hashMap.put("position", String.valueOf(i));
                    GalleryStatHelper.recordCountEvent("list_view", "list_view_month_click", hashMap);
                    return true;
                }
            });
            this.mHomePagePhotoLoaderCallback = new HomePagePhotoLoaderCallback();
            getLoaderManager().initLoader(1, null, this.mHomePagePhotoLoaderCallback);
            getLoaderManager().initLoader(2, null, this.mHomePagePhotoLoaderCallback);
            getLoaderManager().initLoader(3, null, this.mHomePagePhotoLoaderCallback);
            this.mTransitionHelper.bindTransition(this.mHomeGridView, this.mMonthView, 2);
            this.mTransitionHelper.bindTransition(this.mMonthView, this.mHomeGridView, 1);
            this.mDrawer.setSupportMultiPoint(false);
        }
    }

    public void onStatusChanged(SparseBooleanArray sparseBooleanArray) {
        if (sparseBooleanArray.indexOfKey(1) < 0) {
            return;
        }
        if (sparseBooleanArray.get(1)) {
            Search.setIsSearchCacheStatusOpen(true);
            displaySearchBar();
            return;
        }
        Search.setIsSearchCacheStatusOpen(false);
        if (this.mSearchBarController != null) {
            this.mSearchBarController.onPause();
        }
        this.mSearchContainer.setVisibility(8);
    }

    public void onStop() {
        super.onStop();
        doOnStop();
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z) {
            onVisibleToUser();
        }
    }
}

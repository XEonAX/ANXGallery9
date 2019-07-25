package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.arch.lifecycle.Lifecycle.State;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.util.SortedList;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.util.SparseLongArray;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.google.common.base.Joiner;
import com.miui.account.AccountHelper;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumPageAdapter;
import com.miui.gallery.adapter.HeaderFooterRecyclerAdapterWrapper;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.loader.AlbumSnapshotLoader;
import com.miui.gallery.loader.AsyncContentLoader;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.AlbumList;
import com.miui.gallery.model.OtherAlbum;
import com.miui.gallery.provider.AlbumSnapshotHelper;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.search.widget.BannerSearchBar;
import com.miui.gallery.threadpool.GallerySchedulers;
import com.miui.gallery.ui.AIAlbumDisplayHelper.DisplayStatusCallback;
import com.miui.gallery.ui.AIAlbumDisplayHelper.WeakReferencedAIAlbumDisplayStatusObserver;
import com.miui.gallery.ui.BaseAlbumOperationDialogFragment.OnAlbumOperationDoneListener;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.widget.DividerTypeProvider;
import com.miui.gallery.widget.TwoStageDrawer;
import com.miui.gallery.widget.TwoStageDrawer.TriggerListener;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.miui.gallery.widget.recyclerview.ExtendedRecyclerView;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView.RecyclerContextMenuInfo;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.SectionedDividerItemDecoration;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Function;
import io.reactivex.subjects.PublishSubject;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class AlbumPageFragment extends BaseAlbumPageFragment implements DisplayStatusCallback {
    /* access modifiers changed from: private */
    public AlbumPageAdapterWrapper mAlbumPageAdapterWrapper;
    private AlbumPageHeaderController mAlbumPageHeaderController;
    private AlbumPagePhotoLoaderCallback mAlbumPagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public ExtendedRecyclerView mAlbumRecyclerView;
    /* access modifiers changed from: private */
    public PublishSubject<List<Album>> mAlbumsPublishSubject = PublishSubject.create();
    private BannerSearchBar mBannerSearchBar;
    private CompositeDisposable mCompositeDisposable = new CompositeDisposable();
    private View mCreateAlbumButton;
    /* access modifiers changed from: private */
    public TwoStageDrawer mDrawer;
    /* access modifiers changed from: private */
    public boolean mHasEnterPrivateEntry;
    private boolean mLoaderInitialized;
    /* access modifiers changed from: private */
    public long mNewlyCreatedAlbumId;
    /* access modifiers changed from: private */
    public OnAlbumOperationDoneListener mOnAlbumCreatedListener = new OnAlbumOperationDoneListener() {
        /* JADX WARNING: type inference failed for: r5v6, types: [com.miui.gallery.ui.AlbumPageFragment, android.app.Fragment] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v6, types: [com.miui.gallery.ui.AlbumPageFragment, android.app.Fragment]
  assigns: [com.miui.gallery.ui.AlbumPageFragment]
  uses: [android.app.Fragment]
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
        public void onOperationDone(long j, String str) {
            if (j > 0 && AlbumPageFragment.this.isAdded()) {
                AlbumPageFragment.this.mPendingDisplayCreateAlbum = true;
                AlbumPageFragment.this.mNewlyCreatedAlbumId = j;
                AddPhotosFragment.addPhotos(AlbumPageFragment.this, j);
            }
        }
    };
    /* access modifiers changed from: private */
    public boolean mPendingDisplayCreateAlbum;
    private TriggerListener mPrivateEntryTriggerListener = new TriggerListener() {
        public void onTriggerOpen(TwoStageDrawer twoStageDrawer) {
            if (!AlbumPageFragment.this.mHasEnterPrivateEntry) {
                AlbumPageFragment.this.enterPrivateEntry();
                AlbumPageFragment.this.mHasEnterPrivateEntry = true;
                GallerySamplingStatHelper.recordCountEvent("album", "enter_privacy_mode");
            }
        }

        public void onTriggerSlide(TwoStageDrawer twoStageDrawer, float f) {
        }
    };
    private TopSearchBarController mSearchBarController;
    private WeakReferencedAIAlbumDisplayStatusObserver mSearchStatusObserver = new WeakReferencedAIAlbumDisplayStatusObserver(this);
    /* access modifiers changed from: private */
    public boolean mShowAIAlbum = false;

    private static class AlbumPageAdapterWrapper extends HeaderFooterRecyclerAdapterWrapper<AlbumPageAdapter, BaseViewHolder> implements DividerTypeProvider, OnItemClickListener {
        public AlbumPageAdapterWrapper(AlbumPageAdapter albumPageAdapter) {
            super(albumPageAdapter);
        }

        private void recordViewAlbum(int i) {
            String albumLocalPath = ((AlbumPageAdapter) this.mWrapped).getAlbumLocalPath(i);
            if (((AlbumPageAdapter) this.mWrapped).isSystemAlbum(i)) {
                HashMap hashMap = new HashMap();
                hashMap.put("album_name", ((AlbumPageAdapter) this.mWrapped).getAlbumName(i));
                hashMap.put("album_server_id", ((AlbumPageAdapter) this.mWrapped).getServerId(i));
                hashMap.put("album_image_count", String.valueOf(((AlbumPageAdapter) this.mWrapped).getAlbumCount(i)));
                GallerySamplingStatHelper.recordCountEvent("album", "view_system_album", hashMap);
            } else if (!TextUtils.isEmpty(albumLocalPath)) {
                HashMap hashMap2 = new HashMap();
                hashMap2.put("album_path", albumLocalPath.toLowerCase());
                hashMap2.put("album_attribute", String.valueOf(((AlbumPageAdapter) this.mWrapped).getAttributes(i)));
                hashMap2.put("album_image_count", String.valueOf(((AlbumPageAdapter) this.mWrapped).getAlbumCount(i)));
                hashMap2.put("baby_album", String.valueOf(((AlbumPageAdapter) this.mWrapped).isBabyAlbum(i)));
                GallerySamplingStatHelper.recordCountEvent("album", "view_album", hashMap2);
            } else if (((AlbumPageAdapter) this.mWrapped).isOtherShareAlbum(i)) {
                HashMap hashMap3 = new HashMap();
                hashMap3.put("album_image_count", String.valueOf(((AlbumPageAdapter) this.mWrapped).getAlbumCount(i)));
                hashMap3.put("baby_album", String.valueOf(((AlbumPageAdapter) this.mWrapped).isBabyAlbum(i)));
                GallerySamplingStatHelper.recordCountEvent("album", "view_share_album", hashMap3);
            }
        }

        public int getBottomDividerType(int i) {
            if (i == -1) {
                return 0;
            }
            if (isHeaderPosition(i)) {
                return 3;
            }
            if (isFooterPosition(i)) {
                return 0;
            }
            return ((AlbumPageAdapter) this.mWrapped).getBottomDividerType(i - getHeadersCount());
        }

        public int getTopDividerType(int i) {
            if (i == -1) {
                return 0;
            }
            if (getHeadersCount() > 0 || i != 0) {
                return ((AlbumPageAdapter) this.mWrapped).getTopDividerType(i - getHeadersCount());
            }
            return 3;
        }

        /* access modifiers changed from: protected */
        public BaseViewHolder onCreateHeaderFooterViewHolder(View view) {
            BaseViewHolder baseViewHolder = new BaseViewHolder(view);
            baseViewHolder.setIsRecyclable(false);
            return baseViewHolder;
        }

        public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
            int i2 = i;
            if (isHeaderPosition(i) || isFooterPosition(i)) {
                return false;
            }
            int wrappedAdapterPosition = getWrappedAdapterPosition(i);
            recordViewAlbum(wrappedAdapterPosition);
            return ((AlbumPageAdapter) this.mWrapped).onItemClick(recyclerView, view, wrappedAdapterPosition, j, f, f2);
        }
    }

    private class AlbumPagePhotoLoaderCallback implements LoaderCallbacks {
        SoftReference<View> mFooterViewRef;
        SparseBooleanArray mIsManualLoad;
        SparseLongArray mLoaderCreateTime;
        OtherAlbum mOtherAlbumEntity;

        private AlbumPagePhotoLoaderCallback() {
            this.mLoaderCreateTime = new SparseLongArray();
            this.mIsManualLoad = new SparseBooleanArray();
        }

        private void dispatchAlbumUpdates(List<Album> list) {
            SortedList data = AlbumPageFragment.this.mAlbumPageAdapter.getData();
            if (MiscUtil.isValid(list)) {
                long currentTimeMillis = System.currentTimeMillis();
                data.replaceAll(list);
                Log.d("AlbumPageFragment", "dispatch updates to adapter costs [%d ms], [%d] items", Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Integer.valueOf(list.size()));
            } else if (data.size() > 0) {
                data.clear();
            } else {
                AlbumPageFragment.this.mAlbumPageAdapter.notifyDataSetChanged();
            }
            AlbumPageFragment.this.mDrawer.setDragEnabled(MiscUtil.isValid(list));
            AlbumPageFragment.this.updateHeaderAlbumUI();
            updateFooterUI();
        }

        private void statAlbumLoadTime(String str, long j, int i) {
            HashMap hashMap = new HashMap();
            hashMap.put("loader", str);
            hashMap.put("costs", String.valueOf(j));
            hashMap.put("count", String.valueOf(i));
            GallerySamplingStatHelper.recordCountEvent("album", "album_load_time", hashMap);
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [android.view.View] */
        /* JADX WARNING: type inference failed for: r1v6, types: [android.view.View] */
        /* JADX WARNING: type inference failed for: r0v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v9, types: [java.lang.Object, com.miui.gallery.ui.AlbumPageListEmptyItem] */
        /* JADX WARNING: type inference failed for: r1v10 */
        /* JADX WARNING: type inference failed for: r1v13, types: [android.view.View] */
        /* JADX WARNING: type inference failed for: r1v14 */
        /* JADX WARNING: type inference failed for: r1v15 */
        /* JADX WARNING: type inference failed for: r1v16 */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 71
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
        /* JADX WARNING: Removed duplicated region for block: B:23:0x008f  */
        /* JADX WARNING: Unknown variable types count: 4 */
        private void updateFooterUI() {
            int access$1500 = AlbumPageFragment.this.getRecyclerPaddingBottom();
            ? r1 = this.mFooterViewRef != null ? (View) this.mFooterViewRef.get() : 0;
            Adapter wrappedAdapter = AlbumPageFragment.this.mAlbumPageAdapterWrapper.getWrappedAdapter();
            boolean z = true;
            if (this.mOtherAlbumEntity != null || wrappedAdapter.getItemCount() > 0) {
                if (r1 != 0) {
                    AlbumPageFragment.this.mAlbumPageAdapterWrapper.removeFooterView(r1);
                    if (z) {
                        AlbumPageFragment.this.mRecyclerView.invalidateItemDecorations();
                    }
                    AlbumPageFragment.this.mRecyclerView.setPadding(AlbumPageFragment.this.mRecyclerView.getPaddingLeft(), AlbumPageFragment.this.mRecyclerView.getTop(), AlbumPageFragment.this.mRecyclerView.getPaddingRight(), access$1500);
                }
            } else if (AlbumPageFragment.this.mShowAIAlbum && SyncUtil.existXiaomiAccount(AlbumPageFragment.this.getActivity())) {
                if (r1 == 0) {
                    ? r12 = (AlbumPageListEmptyItem) LayoutInflater.from(AlbumPageFragment.this.mActivity).inflate(R.layout.album_page_list_empty_item, AlbumPageFragment.this.mRecyclerView, false);
                    r12.setTextContainer(AlbumPageFragment.this.mAlbumRecyclerView);
                    this.mFooterViewRef = new SoftReference<>(r12);
                    r1 = r12;
                }
                if (AlbumPageFragment.this.mAlbumPageAdapterWrapper.getFootersCount() == 0) {
                    AlbumPageFragment.this.mAlbumPageAdapterWrapper.addFooterView(r1);
                } else {
                    z = false;
                }
                access$1500 = 0;
                if (z) {
                }
                AlbumPageFragment.this.mRecyclerView.setPadding(AlbumPageFragment.this.mRecyclerView.getPaddingLeft(), AlbumPageFragment.this.mRecyclerView.getTop(), AlbumPageFragment.this.mRecyclerView.getPaddingRight(), access$1500);
            }
            z = false;
            if (z) {
            }
            AlbumPageFragment.this.mRecyclerView.setPadding(AlbumPageFragment.this.mRecyclerView.getPaddingLeft(), AlbumPageFragment.this.mRecyclerView.getTop(), AlbumPageFragment.this.mRecyclerView.getPaddingRight(), access$1500);
        }

        /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r5v15, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r5v18, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r5v23, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r5v32, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 66
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
        /* JADX WARNING: Unknown variable types count: 5 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            this.mIsManualLoad.put(i, true);
            this.mLoaderCreateTime.put(i, System.currentTimeMillis());
            if (i == 1) {
                return new AlbumSnapshotLoader(AlbumPageFragment.this.mActivity);
            }
            if (i == 2) {
                AsyncContentLoader asyncContentLoader = new AsyncContentLoader(AlbumPageFragment.this.mActivity, AlbumPageFragment.this.mAlbumConvertCallback);
                asyncContentLoader.setUri(AlbumPageFragment.this.getAlbumQueryUri(false));
                asyncContentLoader.setProjection(AlbumPageFragment.this.mAlbumPageAdapter.getProjection());
                asyncContentLoader.setSelection(AlbumPageFragment.this.getAlbumQuerySelection(false));
                return asyncContentLoader;
            } else if (i == 3) {
                CursorLoader cursorLoader = new CursorLoader(AlbumPageFragment.this.mActivity);
                cursorLoader.setUri(GalleryContract.Album.URI_SHARE_ALL);
                cursorLoader.setProjection(AlbumPageAdapter.SHARED_ALBUM_PROJECTION);
                cursorLoader.setSelection("count > 0");
                return cursorLoader;
            } else if (i == 4) {
                CursorLoader cursorLoader2 = new CursorLoader(AlbumPageFragment.this.mActivity);
                cursorLoader2.setUri(PeopleFace.PEOPLE_FACE_COVER_URI);
                return cursorLoader2;
            } else if (i != 5) {
                return null;
            } else {
                AsyncContentLoader asyncContentLoader2 = new AsyncContentLoader(AlbumPageFragment.this.mActivity, AlbumPageFragment.this.mAlbumConvertCallback);
                asyncContentLoader2.setUri(UriUtil.appendLimit(AlbumPageFragment.this.getAlbumQueryUri(true), 5));
                asyncContentLoader2.setProjection(AlbumPageFragment.this.mAlbumPageAdapter.getProjection());
                asyncContentLoader2.setSelection(AlbumPageFragment.this.getAlbumQuerySelection(true));
                asyncContentLoader2.setSortOrder("sortBy ASC ");
                return asyncContentLoader2;
            }
        }

        /* JADX WARNING: type inference failed for: r3v0 */
        /* JADX WARNING: type inference failed for: r3v9, types: [java.util.Collection, java.util.ArrayList] */
        /* JADX WARNING: type inference failed for: r3v10, types: [java.util.List, java.util.ArrayList] */
        /* JADX WARNING: type inference failed for: r3v11, types: [java.util.ArrayList] */
        /* JADX WARNING: type inference failed for: r3v12, types: [java.util.ArrayList] */
        /* JADX WARNING: type inference failed for: r3v14, types: [com.miui.gallery.model.AlbumList] */
        /* JADX WARNING: type inference failed for: r3v15, types: [java.util.List] */
        /* JADX WARNING: type inference failed for: r3v17, types: [java.util.List] */
        /* JADX WARNING: type inference failed for: r3v18 */
        /* JADX WARNING: type inference failed for: r3v19 */
        /* JADX WARNING: type inference failed for: r3v20 */
        /* JADX WARNING: type inference failed for: r3v21 */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], java.util.ArrayList, java.util.List, com.miui.gallery.model.AlbumList]
  uses: [?[int, boolean, OBJECT, ARRAY, byte, short, char], java.util.Collection, java.util.ArrayList, java.util.List]
  mth insns count: 132
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
        /* JADX WARNING: Removed duplicated region for block: B:64:0x013e  */
        /* JADX WARNING: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
        /* JADX WARNING: Unknown variable types count: 4 */
        public void onLoadFinished(Loader loader, Object obj) {
            int i;
            int i2;
            int size;
            int id = loader.getId();
            long currentTimeMillis = System.currentTimeMillis();
            ? r3 = 0;
            if (id == 1) {
                if (obj != null) {
                    r3 = (List) obj;
                }
                size = r3 != 0 ? r3.size() : 0;
                if (size <= 0) {
                    AlbumPageFragment.this.mAlbumRecyclerView.inflateEmptyView();
                }
                dispatchAlbumUpdates(r3);
                AlbumPageFragment.this.startToLoadAlbumExtraInfo();
            } else if (id == 2) {
                if (obj != null) {
                    r3 = (AlbumList) obj;
                }
                size = r3 != 0 ? r3.size() : 0;
                if (size <= 0) {
                    AlbumPageFragment.this.mAlbumRecyclerView.inflateEmptyView();
                }
                if (MiscUtil.isValid(r3)) {
                    AlbumPageFragment.this.mAlbumsPublishSubject.onNext(new ArrayList(r3));
                } else {
                    AlbumPageFragment.this.mAlbumsPublishSubject.onNext(Collections.emptyList());
                }
                if (this.mOtherAlbumEntity != null) {
                    if (r3 == 0) {
                        r3 = new ArrayList(1);
                    }
                    r3.add(this.mOtherAlbumEntity);
                    r3 = r3;
                }
                dispatchAlbumUpdates(r3);
                AlbumPageFragment.this.scrollToNewlyCreatedAlbum(r3, AlbumPageFragment.this.mAlbumPageAdapter.getData());
            } else {
                if (id == 3) {
                    Cursor cursor = (Cursor) obj;
                    i = cursor != null ? cursor.getCount() : 0;
                    AlbumPageFragment.this.mAlbumPageAdapter.setSharedAlbums(cursor);
                } else if (id == 4) {
                    Cursor cursor2 = (Cursor) obj;
                    i = cursor2 != null ? cursor2.getCount() : 0;
                    AlbumPageFragment.this.mAlbumPageAdapter.setPeopleFaceCover(cursor2);
                } else if (id == 5) {
                    ArrayList arrayList = obj != null ? (AlbumList) obj : null;
                    if (MiscUtil.isValid(arrayList)) {
                        i2 = arrayList.size();
                        OtherAlbum otherAlbum = new OtherAlbum();
                        ArrayList arrayList2 = new ArrayList(i2);
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            arrayList2.add(((Album) it.next()).getLocalizedAlbumName());
                        }
                        otherAlbum.setAlbumName(Joiner.on(AlbumPageFragment.this.getString(R.string.name_split)).skipNulls().join((Iterable<?>) arrayList2));
                        otherAlbum.setAlbumNames(arrayList2);
                        otherAlbum.setCount(i2);
                        this.mOtherAlbumEntity = otherAlbum;
                        AlbumPageFragment.this.mAlbumPageAdapter.getData().add(this.mOtherAlbumEntity);
                    } else {
                        if (this.mOtherAlbumEntity != null) {
                            AlbumPageFragment.this.mAlbumPageAdapter.getData().remove(this.mOtherAlbumEntity);
                        }
                        this.mOtherAlbumEntity = null;
                        i2 = 0;
                    }
                    updateFooterUI();
                } else {
                    i = 0;
                }
                if (!this.mIsManualLoad.get(id)) {
                    this.mIsManualLoad.put(id, false);
                    long j = currentTimeMillis - this.mLoaderCreateTime.get(id);
                    Log.d("AlbumPageFragment", "load [%d] items for [%s] costs [%d ms]", Integer.valueOf(i), AlbumPageFragment.this.loaderId2Name(id), Long.valueOf(j));
                    statAlbumLoadTime(AlbumPageFragment.this.loaderId2Name(id), j, i);
                    return;
                }
                return;
            }
            i = size;
            if (!this.mIsManualLoad.get(id)) {
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class OnCreateNewAlbumListener implements OnClickListener {
        private OnCreateNewAlbumListener() {
        }

        public void onClick(View view) {
            AlbumCreatorDialogFragment albumCreatorDialogFragment = new AlbumCreatorDialogFragment();
            albumCreatorDialogFragment.setOnAlbumOperationDoneListener(AlbumPageFragment.this.mOnAlbumCreatedListener);
            albumCreatorDialogFragment.showAllowingStateLoss(AlbumPageFragment.this.getFragmentManager(), "AlbumCreatorDialogFragment");
            GallerySamplingStatHelper.recordCountEvent("album", "create_album");
        }
    }

    private static class SnapshotFunction implements Function<List<Album>, Integer> {
        private SnapshotFunction() {
        }

        public Integer apply(List<Album> list) throws Exception {
            return Integer.valueOf(AlbumSnapshotHelper.persist(list));
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.ui.AlbumPageFragment, android.app.Fragment] */
    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
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
    private void doEnterPrivateEntry() {
        if (AccountHelper.getXiaomiAccount(this.mActivity) != null) {
            AuthenticatePrivacyPasswordFragment.startAuthenticatePrivacyPassword(this);
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.ui.AlbumPageFragment, android.app.Fragment] */
    /* access modifiers changed from: private */
    public void enterPrivateEntry() {
        Bundle bundle = new Bundle();
        bundle.putInt("check_login_and_sync", 3);
        bundle.putSerializable("cloud_guide_source", CloudGuideSource.SECRET);
        LoginAndSyncCheckFragment.checkLoginAndSyncState(this, bundle);
    }

    /* access modifiers changed from: private */
    public String getAlbumQuerySelection(boolean z) {
        return z ? "classification = 1" : "classification = 0";
    }

    /* access modifiers changed from: private */
    public Uri getAlbumQueryUri(boolean z) {
        return GalleryContract.Album.URI.buildUpon().appendQueryParameter("join_face", String.valueOf(!z && !this.mShowAIAlbum && AccountCache.getAccount() != null)).appendQueryParameter("join_video", String.valueOf(!z)).appendQueryParameter("join_share", String.valueOf(!z)).appendQueryParameter("join_recent", String.valueOf(!z)).appendQueryParameter("join_favorites", String.valueOf(!z)).appendQueryParameter("exclude_empty_album", "true").appendQueryParameter("fill_covers", String.valueOf(!z)).build();
    }

    /* access modifiers changed from: private */
    public int getRecyclerPaddingBottom() {
        int height = (this.mCreateAlbumButton == null || this.mCreateAlbumButton.getVisibility() == 8) ? 0 : this.mCreateAlbumButton.getHeight();
        return height > 0 ? height + (getResources().getDimensionPixelSize(R.dimen.album_fab_margin) * 2) : getResources().getDimensionPixelSize(R.dimen.album_item_placeholder_height);
    }

    private boolean isEmpty() {
        return this.mAlbumPageAdapter != null && this.mAlbumPageAdapter.getItemCount() == 0;
    }

    public static /* synthetic */ void lambda$onStatusChanged$31(AlbumPageFragment albumPageFragment) {
        if (!albumPageFragment.mDrawer.isDrawerOpen()) {
            albumPageFragment.mDrawer.openDrawer();
        }
    }

    /* access modifiers changed from: private */
    public String loaderId2Name(int i) {
        switch (i) {
            case 1:
                return "albums_snapshot";
            case 2:
                return "albums";
            case 3:
                return "share_albums";
            case 4:
                return "people_face_cover";
            case 5:
                return "other_album";
            default:
                return String.valueOf(i);
        }
    }

    private void onVisibleToUser() {
        if (isEmpty()) {
            statAlbumEmpty();
        }
    }

    /* access modifiers changed from: private */
    public void scrollToNewlyCreatedAlbum(ArrayList<Album> arrayList, SortedList<Album> sortedList) {
        if (this.mPendingDisplayCreateAlbum) {
            this.mPendingDisplayCreateAlbum = false;
            if (arrayList != null) {
                System.currentTimeMillis();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Album album = (Album) it.next();
                    if (album.getAlbumId() == this.mNewlyCreatedAlbumId) {
                        int indexOf = sortedList.indexOf(album);
                        if (indexOf != -1) {
                            this.mAlbumRecyclerView.smoothScrollToPosition(indexOf + this.mAlbumPageAdapterWrapper.getHeadersCount());
                            return;
                        }
                        return;
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void startToLoadAlbumExtraInfo() {
        Log.d("AlbumPageFragment", "startToLoadAlbumExtraInfo");
        getLoaderManager().initLoader(2, null, this.mAlbumPagePhotoLoaderCallback);
        getLoaderManager().initLoader(3, null, this.mAlbumPagePhotoLoaderCallback);
        getLoaderManager().initLoader(5, null, this.mAlbumPagePhotoLoaderCallback);
        if (!this.mShowAIAlbum) {
            getLoaderManager().initLoader(4, null, this.mAlbumPagePhotoLoaderCallback);
        }
        getLoaderManager().destroyLoader(1);
    }

    private void startToLoadAlbums() {
        Log.d("AlbumPageFragment", "startToLoadAlbums");
        if (this.mAlbumPagePhotoLoaderCallback != null) {
            getLoaderManager().initLoader(1, null, this.mAlbumPagePhotoLoaderCallback);
            this.mLoaderInitialized = true;
        }
    }

    private void statAlbumEmpty() {
        HashMap hashMap = new HashMap();
        hashMap.put("login", String.valueOf(AccountCache.getAccount() != null));
        GallerySamplingStatHelper.recordCountEvent("album", "album_empty", hashMap);
    }

    /* access modifiers changed from: private */
    public void updateHeaderAlbumUI() {
        if (SyncUtil.existXiaomiAccount(getActivity()) && this.mShowAIAlbum) {
            if (this.mAlbumPageHeaderController == null) {
                this.mAlbumPageHeaderController = new AlbumPageHeaderController(this, this.mRecyclerView);
            }
            if (this.mAlbumPageAdapterWrapper.getHeadersCount() == 0) {
                this.mAlbumPageAdapterWrapper.addHeaderView(this.mAlbumPageHeaderController.getView());
            }
        } else if (this.mAlbumPageAdapterWrapper.getHeadersCount() > 0) {
            this.mAlbumPageAdapterWrapper.removeHeaderView(this.mAlbumPageHeaderController.getView());
        }
    }

    public String getPageName() {
        return "album";
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 != -1) {
            this.mHasEnterPrivateEntry = false;
        } else if (i == 29) {
            int intExtra = intent.getIntExtra("check_login_and_sync", -1);
            if (intExtra == 1 || intExtra == 2) {
                super.onActivityResult(i, i2, intent);
                return;
            } else if (intExtra == 3) {
                doEnterPrivateEntry();
            }
        } else if (i == 36) {
            Log.d("AlbumPageFragment", "onActivityResult");
            IntentUtil.enterPrivateAlbum(getActivity());
        }
        super.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLoaderInitialized = false;
        this.mCompositeDisposable.add(this.mAlbumsPublishSubject.observeOn(GallerySchedulers.misc()).delay(350, TimeUnit.MILLISECONDS, GallerySchedulers.misc()).throttleLatest(3000, TimeUnit.MILLISECONDS, GallerySchedulers.misc(), true).map(new SnapshotFunction()).subscribe());
    }

    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenuInfo contextMenuInfo) {
        if (contextMenuInfo != null) {
            int i = ((RecyclerContextMenuInfo) contextMenuInfo).position;
            if (!this.mAlbumPageAdapterWrapper.isHeaderPosition(i) && !this.mAlbumPageAdapterWrapper.isFooterPosition(i)) {
                setContextMenuItems(contextMenu, this.mAlbumPageAdapterWrapper.getWrappedAdapterPosition(i));
            }
        }
    }

    public void onDestroy() {
        this.mCompositeDisposable.dispose();
        super.onDestroy();
    }

    public void onDestroyView() {
        AIAlbumDisplayHelper.getInstance().unregisterAIAlbumDisplayStatusObserver(this.mSearchStatusObserver);
        super.onDestroyView();
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 86
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
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.album_page, viewGroup, false);
        this.mAlbumRecyclerView = (ExtendedRecyclerView) inflate.findViewById(R.id.album_list);
        this.mRecyclerView = (GalleryRecyclerView) this.mAlbumRecyclerView.getRecycler();
        this.mAlbumPageAdapter = new AlbumPageAdapter(this.mActivity);
        this.mAlbumPageAdapter.registerAdapterDataObserver(new AdapterDataObserver() {
            public void onChanged() {
                AlbumPageFragment.this.getActivity().closeContextMenu();
            }
        });
        this.mAlbumPageAdapterWrapper = new AlbumPageAdapterWrapper(this.mAlbumPageAdapter);
        this.mAlbumRecyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        SectionedDividerItemDecoration sectionedDividerItemDecoration = new SectionedDividerItemDecoration(getActivity(), R.drawable.section_divider_bg, R.drawable.item_divider_bg, this.mAlbumPageAdapterWrapper);
        sectionedDividerItemDecoration.setItemDividerPadding(new Rect(getResources().getDimensionPixelSize(R.dimen.album_cover_container_size_small), 0, 0, 0));
        this.mAlbumRecyclerView.addItemDecoration(sectionedDividerItemDecoration);
        this.mAlbumRecyclerView.setItemAnimator(null);
        this.mAlbumRecyclerView.setAdapter(this.mAlbumPageAdapterWrapper);
        this.mRecyclerView.setOnItemClickListener(this.mAlbumPageAdapterWrapper);
        this.mAlbumPagePhotoLoaderCallback = new AlbumPagePhotoLoaderCallback();
        this.mCreateAlbumButton = inflate.findViewById(R.id.create_album);
        this.mCreateAlbumButton.setOnClickListener(new OnCreateNewAlbumListener());
        this.mDrawer = (TwoStageDrawer) inflate;
        this.mDrawer.setTriggerListener(this.mPrivateEntryTriggerListener);
        this.mBannerSearchBar = (BannerSearchBar) inflate.findViewById(R.id.album_page_search_bar);
        SparseBooleanArray registerAIAlbumDisplayStatusObserver = AIAlbumDisplayHelper.getInstance().registerAIAlbumDisplayStatusObserver(this.mSearchStatusObserver);
        this.mShowAIAlbum = registerAIAlbumDisplayStatusObserver.get(2, false);
        boolean z = registerAIAlbumDisplayStatusObserver.get(1, false);
        Log.d("AlbumPageFragment", "Init search bar: %s, ai album: %s", Boolean.valueOf(z), Boolean.valueOf(this.mShowAIAlbum));
        if (z) {
            this.mBannerSearchBar.setVisibility(0);
            if (this.mSearchBarController == null) {
                this.mSearchBarController = new TopSearchBarController(this, this.mBannerSearchBar, "from_album_page");
            }
            this.mDrawer.post(new Runnable() {
                public final void run() {
                    AlbumPageFragment.this.mDrawer.openDrawer();
                }
            });
        } else {
            this.mBannerSearchBar.setVisibility(8);
        }
        if (this.mUserFirstVisible && !this.mLoaderInitialized) {
            startToLoadAlbums();
        }
        return inflate;
    }

    public void onPause() {
        super.onPause();
        if (this.mSearchBarController != null) {
            this.mSearchBarController.onPause();
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mSearchBarController != null) {
            this.mSearchBarController.onResume();
        }
    }

    public void onStart() {
        super.onStart();
        this.mHasEnterPrivateEntry = false;
        if (getUserVisibleHint()) {
            onVisibleToUser();
        }
    }

    public void onStatusChanged(SparseBooleanArray sparseBooleanArray) {
        if (sparseBooleanArray != null) {
            if (sparseBooleanArray.indexOfKey(1) >= 0) {
                boolean z = sparseBooleanArray.get(1);
                Log.d("AlbumPageFragment", "New search bar status %s", (Object) Boolean.valueOf(z));
                if (z) {
                    if (this.mSearchBarController == null) {
                        this.mSearchBarController = new TopSearchBarController(this, this.mBannerSearchBar, "from_album_page");
                    }
                    this.mBannerSearchBar.setVisibility(0);
                    this.mSearchBarController.onResume();
                    this.mBannerSearchBar.post(new Runnable() {
                        public final void run() {
                            AlbumPageFragment.lambda$onStatusChanged$31(AlbumPageFragment.this);
                        }
                    });
                } else {
                    if (this.mSearchBarController != null) {
                        this.mSearchBarController.onPause();
                    }
                    this.mBannerSearchBar.setVisibility(8);
                }
            }
            if (sparseBooleanArray.indexOfKey(2) >= 0) {
                this.mShowAIAlbum = sparseBooleanArray.get(2);
                Log.d("AlbumPageFragment", "New ai album status %s", (Object) Boolean.valueOf(this.mShowAIAlbum));
                if (this.mShowAIAlbum) {
                    getLoaderManager().destroyLoader(4);
                } else {
                    getLoaderManager().restartLoader(4, null, this.mAlbumPagePhotoLoaderCallback);
                }
                getLoaderManager().destroyLoader(2);
                getLoaderManager().initLoader(2, null, this.mAlbumPagePhotoLoaderCallback);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (getUserVisibleHint()) {
            if (!this.mLoaderInitialized && getLifecycle().getCurrentState().isAtLeast(State.CREATED) && getView() != null) {
                startToLoadAlbums();
            }
            onVisibleToUser();
        }
    }
}

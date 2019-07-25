package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumPageAdapter;
import com.miui.gallery.loader.AsyncContentLoader;
import com.miui.gallery.model.AlbumConstants;
import com.miui.gallery.model.AlbumList;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.recyclerview.ExtendedRecyclerView;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.SectionedDividerItemDecoration;
import java.util.HashMap;

public class AlbumLocalPageFragment extends BaseAlbumPageFragment implements OnItemClickListener {
    private AlbumPagePhotoLoaderCallback mAlbumPagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public ExtendedRecyclerView mAlbumRecyclerView;
    /* access modifiers changed from: private */
    public boolean mPendingLoadExtraInfo;

    private class AlbumPagePhotoLoaderCallback implements LoaderCallbacks {
        private AlbumPagePhotoLoaderCallback() {
        }

        private String getSelection() {
            return "classification = 1";
        }

        /* JADX WARNING: type inference failed for: r4v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r4v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            if (i == 1) {
                AsyncContentLoader asyncContentLoader = new AsyncContentLoader(AlbumLocalPageFragment.this.mActivity, AlbumLocalPageFragment.this.mAlbumConvertCallback);
                asyncContentLoader.setUri(Album.URI.buildUpon().appendQueryParameter("join_video", "false").appendQueryParameter("join_face", "false").appendQueryParameter("join_share", "false").appendQueryParameter("exclude_empty_album", "true").build());
                asyncContentLoader.setProjection(AlbumLocalPageFragment.this.mAlbumPageAdapter.getProjection());
                asyncContentLoader.setSelection(getSelection());
                asyncContentLoader.setSortOrder("sortBy ASC ");
                return asyncContentLoader;
            } else if (i != 2) {
                return null;
            } else {
                CursorLoader cursorLoader = new CursorLoader(AlbumLocalPageFragment.this.mActivity);
                cursorLoader.setUri(Album.URI_SHARE_ALL);
                cursorLoader.setProjection(AlbumConstants.SHARED_ALBUM_PROJECTION);
                cursorLoader.setSelection("count > 0");
                return cursorLoader;
            }
        }

        public void onLoadFinished(Loader loader, Object obj) {
            if (loader.getId() == 1) {
                AlbumList albumList = obj != null ? (AlbumList) obj : null;
                if (MiscUtil.isValid(albumList)) {
                    AlbumLocalPageFragment.this.mAlbumPageAdapter.getData().replaceAll(albumList);
                } else {
                    AlbumLocalPageFragment.this.mAlbumRecyclerView.inflateEmptyView();
                    AlbumLocalPageFragment.this.mAlbumPageAdapter.getData().clear();
                }
                if (AlbumLocalPageFragment.this.mPendingLoadExtraInfo) {
                    AlbumLocalPageFragment.this.mPendingLoadExtraInfo = false;
                    AlbumLocalPageFragment.this.startToLoadExtraInfo();
                }
            } else if (loader.getId() == 2) {
                AlbumLocalPageFragment.this.mAlbumPageAdapter.setSharedAlbums((Cursor) obj);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private void recordViewAlbum(int i) {
        String albumLocalPath = this.mAlbumPageAdapter.getAlbumLocalPath(i);
        if (!TextUtils.isEmpty(albumLocalPath)) {
            HashMap hashMap = new HashMap();
            hashMap.put("album_path", albumLocalPath.toLowerCase());
            hashMap.put("album_attribute", String.valueOf(this.mAlbumPageAdapter.getAttributes(i)));
            hashMap.put("album_image_count", String.valueOf(this.mAlbumPageAdapter.getAlbumCount(i)));
            GallerySamplingStatHelper.recordCountEvent("album", "view_other_album", hashMap);
        }
    }

    private void startToLoadAlbums() {
        Log.d("AlbumLocalPageFragment", "startToLoadAlbums");
        getLoaderManager().initLoader(1, null, this.mAlbumPagePhotoLoaderCallback);
        this.mPendingLoadExtraInfo = true;
    }

    /* access modifiers changed from: private */
    public void startToLoadExtraInfo() {
        Log.d("AlbumLocalPageFragment", "startToLoadExtraInfo");
        getLoaderManager().initLoader(2, null, this.mAlbumPagePhotoLoaderCallback);
    }

    public String getPageName() {
        return "album_local";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        startToLoadAlbums();
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 40
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        setHasOptionsMenu(true);
        View inflate = layoutInflater.inflate(R.layout.album_page_others, viewGroup, false);
        this.mAlbumRecyclerView = (ExtendedRecyclerView) inflate.findViewById(R.id.album_list);
        this.mRecyclerView = (GalleryRecyclerView) this.mAlbumRecyclerView.getRecycler();
        this.mAlbumRecyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        this.mAlbumPageAdapter = new AlbumPageAdapter(this.mActivity);
        SectionedDividerItemDecoration sectionedDividerItemDecoration = new SectionedDividerItemDecoration(getActivity(), R.drawable.section_divider_bg, R.drawable.item_divider_bg, this.mAlbumPageAdapter);
        sectionedDividerItemDecoration.setItemDividerPadding(new Rect(getResources().getDimensionPixelSize(R.dimen.album_cover_container_size_small), 0, 0, 0));
        this.mAlbumRecyclerView.addItemDecoration(sectionedDividerItemDecoration);
        this.mAlbumRecyclerView.setItemAnimator(null);
        this.mAlbumRecyclerView.setAdapter(this.mAlbumPageAdapter);
        this.mRecyclerView.setOnItemClickListener(this);
        this.mAlbumPagePhotoLoaderCallback = new AlbumPagePhotoLoaderCallback();
        this.mActivity.getActionBar().setTitle(this.mActivity.getString(R.string.other_album));
        return inflate;
    }

    public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
        if (this.mAlbumPageAdapter == null) {
            return false;
        }
        int i2 = i;
        recordViewAlbum(i);
        return this.mAlbumPageAdapter.onItemClick(recyclerView, view, i, j, f, f2);
    }

    public void onStart() {
        super.onStart();
        this.mAlbumPageAdapter.updateGalleryCloudSyncableState();
    }
}

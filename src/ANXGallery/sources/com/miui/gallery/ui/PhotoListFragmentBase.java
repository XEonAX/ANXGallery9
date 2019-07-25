package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;

public abstract class PhotoListFragmentBase extends BaseMediaFragment {
    protected GridView mAlbumDetailGridView;
    protected LoaderCallbacks mAlbumDetailLoaderCallback;
    protected long mAlbumId = -1;
    protected String mAlbumName;
    protected View mEmptyView;

    private class PhotoListLoaderCallback implements LoaderCallbacks {
        private PhotoListLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(PhotoListFragmentBase.this.mActivity);
            PhotoListFragmentBase.this.configLoader(cursorLoader);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            Cursor cursor = (Cursor) obj;
            PhotoListFragmentBase.this.mayDoAdditionalWork(cursor);
            PhotoListFragmentBase.this.getAdapter().swapCursor(cursor);
            if (PhotoListFragmentBase.this.getAdapter().getCount() == 0) {
                PhotoListFragmentBase.this.setEmptyViewVisibility(0);
            } else {
                PhotoListFragmentBase.this.setEmptyViewVisibility(8);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    /* access modifiers changed from: protected */
    public void configLoader(CursorLoader cursorLoader) {
        cursorLoader.setUri(getUri());
        cursorLoader.setProjection(getProjection());
        cursorLoader.setSelection(getSelection());
        cursorLoader.setSelectionArgs(getSelectionArgs());
        cursorLoader.setSortOrder(getCurrentSortOrder());
    }

    /* access modifiers changed from: protected */
    public abstract AlbumDetailSimpleAdapter getAdapter();

    /* access modifiers changed from: protected */
    public String getCurrentSortOrder() {
        return "alias_sort_time DESC ";
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener getGridViewOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                int i2 = i;
                AlbumDetailSimpleAdapter viewAdapter = PhotoListFragmentBase.this.getViewAdapter();
                ImageLoadParams imageLoadParams = new ImageLoadParams(viewAdapter.getItemKey(i2), viewAdapter.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, viewAdapter.getItemDecodeRectF(i2), i, viewAdapter.getMimeType(i2), viewAdapter.getItemSecretKey(i2), viewAdapter.getFileLength(i2));
                IntentUtil.gotoPhotoPage(PhotoListFragmentBase.this, adapterView, PhotoListFragmentBase.this.getUri(), i, viewAdapter.getCount(), PhotoListFragmentBase.this.getSelection(), PhotoListFragmentBase.this.getSelectionArgs(), PhotoListFragmentBase.this.getCurrentSortOrder(), imageLoadParams, PhotoListFragmentBase.this.mAlbumId, PhotoListFragmentBase.this.mAlbumName, PhotoListFragmentBase.this.getSupportOperationMask(), !PhotoListFragmentBase.this.getAdapter().supportFoldBurstItems());
                GallerySamplingStatHelper.recordNumericPropertyEvent(PhotoListFragmentBase.this.getPageName(), "click_micro_thumb", (long) i2);
            }
        };
    }

    /* access modifiers changed from: protected */
    public abstract int getLayoutSource();

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return getLoaderManager().getLoader(1);
    }

    /* access modifiers changed from: protected */
    public LoaderCallbacks getLoaderCallback() {
        if (this.mAlbumDetailLoaderCallback == null) {
            this.mAlbumDetailLoaderCallback = new PhotoListLoaderCallback();
        }
        return this.mAlbumDetailLoaderCallback;
    }

    /* access modifiers changed from: protected */
    public String[] getProjection() {
        return AlbumDetailSimpleAdapter.PROJECTION;
    }

    /* access modifiers changed from: protected */
    public abstract String getSelection();

    /* access modifiers changed from: protected */
    public abstract String[] getSelectionArgs();

    /* access modifiers changed from: protected */
    public int getSupportOperationMask() {
        return -1;
    }

    /* access modifiers changed from: protected */
    public abstract Uri getUri();

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getViewAdapter() {
        return getAdapter();
    }

    /* access modifiers changed from: protected */
    public void mayDoAdditionalWork(Cursor cursor) {
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        getLoaderManager().initLoader(1, null, getLoaderCallback());
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mAlbumDetailGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsLand);
        } else {
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsPortrait);
        }
        this.mAlbumDetailGridView.setSelection(firstVisiblePosition);
    }

    public void onDestroy() {
        AlbumDetailSimpleAdapter viewAdapter = getViewAdapter();
        if (viewAdapter != null) {
            viewAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(getLayoutSource(), viewGroup, false);
        this.mAlbumDetailGridView = (GridView) inflate.findViewById(R.id.grid);
        this.mEmptyView = inflate.findViewById(16908292);
        setEmptyViewVisibility(8);
        return inflate;
    }

    public void onStart() {
        super.onStart();
        getAdapter().updateGalleryCloudSyncableState();
    }

    /* access modifiers changed from: protected */
    public void setEmptyViewVisibility(int i) {
        if (this.mEmptyView != null) {
            this.mEmptyView.setVisibility(i);
        }
    }
}

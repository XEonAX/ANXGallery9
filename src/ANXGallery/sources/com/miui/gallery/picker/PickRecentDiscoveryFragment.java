package com.miui.gallery.picker;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.RecentDiscoveryAdapter;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.picker.helper.CursorUtils;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.picker.helper.PickerItemHolder;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.RecentDiscoveredMedia;
import com.miui.gallery.ui.Checkable;
import com.miui.gallery.ui.MicroThumbGridItem;
import com.miui.gallery.util.AlbumsCursorHelper;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;

public class PickRecentDiscoveryFragment extends PickAlbumDetailFragmentBase {
    /* access modifiers changed from: private */
    public PickRecentAlbumTimelineAdapter mAdapter;
    /* access modifiers changed from: private */
    public AlbumItemCheckListener mAlbumItemCheckListener;
    private RecentDiscoveryLoaderCallback mLoaderCallback;

    private class PickRecentAlbumTimelineAdapter extends RecentDiscoveryAdapter {
        public PickRecentAlbumTimelineAdapter(Context context) {
            super(context, DisplayScene.SCENE_NONE, true);
        }

        public void doBindData(View view, Context context, Cursor cursor) {
            super.doBindData(view, context, cursor);
            PickRecentDiscoveryFragment.this.bindCheckState(view, cursor);
            PickerItemHolder.bindView(cursor.getPosition(), view, this, PickRecentDiscoveryFragment.this.mAlbumItemCheckListener);
        }
    }

    private class RecentDiscoveryLoaderCallback implements LoaderCallbacks {
        private RecentDiscoveryLoaderCallback() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(PickRecentDiscoveryFragment.this.mActivity);
            switch (i) {
                case 1:
                    cursorLoader.setUri(PickRecentDiscoveryFragment.this.getUri());
                    cursorLoader.setProjection(RecentDiscoveryAdapter.PROJECTION);
                    cursorLoader.setSelection(PickRecentDiscoveryFragment.this.getSelection());
                    cursorLoader.setSelectionArgs(PickRecentDiscoveryFragment.this.getSelectionArgs());
                    cursorLoader.setSortOrder(PickRecentDiscoveryFragment.this.getSortOrder());
                    break;
                case 2:
                    cursorLoader.setUri(Album.URI_ALL);
                    cursorLoader.setProjection(AlbumsCursorHelper.ALL_ALBUMS_PROJECTION);
                    cursorLoader.setSortOrder("sortBy ASC ");
                    break;
            }
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            switch (loader.getId()) {
                case 1:
                    PickRecentDiscoveryFragment.this.mAdapter.swapCursor((Cursor) obj);
                    PickRecentDiscoveryFragment.this.copy2Pick();
                    return;
                case 2:
                    PickRecentDiscoveryFragment.this.mAdapter.setAllAlbums((Cursor) obj);
                    return;
                default:
                    return;
            }
        }

        public void onLoaderReset(Loader loader) {
            switch (loader.getId()) {
                case 1:
                    PickRecentDiscoveryFragment.this.mAdapter.changeCursor(null);
                    return;
                case 2:
                    PickRecentDiscoveryFragment.this.mAdapter.setAllAlbums(null);
                    return;
                default:
                    return;
            }
        }
    }

    public PickRecentDiscoveryFragment() {
        super("recent");
    }

    /* access modifiers changed from: private */
    public String getSelection() {
        if (getPicker().getMediaType() != MediaType.ALL) {
            return "serverType=?";
        }
        return null;
    }

    /* access modifiers changed from: private */
    public String[] getSelectionArgs() {
        if (getPicker().getMediaType() == MediaType.IMAGE) {
            return new String[]{String.valueOf(1)};
        } else if (getPicker().getMediaType() != MediaType.IMAGE) {
            return null;
        } else {
            return new String[]{String.valueOf(2)};
        }
    }

    /* access modifiers changed from: private */
    public String getSortOrder() {
        return "dateModified DESC";
    }

    private void updateConfiguration(Configuration configuration) {
        this.mAlbumDetailGridView.setNumColumns(configuration.orientation == 2 ? ThumbConfig.get().sMicroThumbRecentColumnsLand : ThumbConfig.get().sMicroThumbRecentColumnsPortrait);
    }

    /* access modifiers changed from: protected */
    public void bindCheckState(View view, Cursor cursor) {
        if (this.mPicker.getMode() == Mode.SINGLE) {
            if (view instanceof MicroThumbGridItem) {
                ((MicroThumbGridItem) view).setSimilarMarkEnable(true);
            }
            return;
        }
        Checkable checkable = (Checkable) view;
        checkable.setCheckable(true);
        checkable.setChecked(this.mPicker.contains(CursorUtils.getSha1(cursor)));
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_recent_album";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return RecentDiscoveredMedia.URI.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).appendQueryParameter("remove_processing_items", String.valueOf(true)).appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mLoaderCallback = new RecentDiscoveryLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mLoaderCallback);
        getLoaderManager().initLoader(2, null, this.mLoaderCallback);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration(configuration);
        this.mAlbumDetailGridView.setSelection(this.mAlbumDetailGridView.getFirstVisiblePosition());
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mAdapter = new PickRecentAlbumTimelineAdapter(this.mActivity);
        this.mAdapter.setShareAlbums(null);
    }

    public void onDestroy() {
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.album_recent, viewGroup, false);
        this.mAlbumDetailGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mAlbumDetailGridView.setHeadersIgnorePadding(true);
        this.mAlbumDetailGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mAlbumDetailGridView.setAdapter((ListAdapter) this.mAdapter);
        this.mAlbumItemCheckListener = new AlbumItemCheckListener(this.mPicker);
        intialSelections();
        return inflate;
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return this.mAdapter.supportFoldBurstItems();
    }
}

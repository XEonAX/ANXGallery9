package com.miui.gallery.picker;

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
import android.widget.GridView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.picker.helper.CursorUtils;
import com.miui.gallery.picker.helper.PickableBaseTimeLineAdapterWrapper;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.ui.Checkable;
import com.miui.gallery.widget.EmptyPage;

public class PickHomePageFragment extends PickerFragment {
    private EmptyPage mEmptyView;
    private GridView mHomeGridView;
    /* access modifiers changed from: private */
    public PickableBaseTimeLineAdapterWrapper mHomePageAdapter;
    private HomePagePhotoLoaderCallback mHomePagePhotoLoaderCallback;

    private class HomePagePhotoLoaderCallback implements LoaderCallbacks {
        private HomePagePhotoLoaderCallback() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(PickHomePageFragment.this.mActivity);
            cursorLoader.setUri(PickHomePageFragment.this.getUri());
            cursorLoader.setProjection(PickerHomePageAdapter.PROJECTION);
            cursorLoader.setSortOrder("alias_sort_time DESC ");
            if (PickHomePageFragment.this.getPicker().getMediaType() != MediaType.ALL) {
                cursorLoader.setSelection("alias_show_in_homepage=1 AND serverType=?");
            } else {
                cursorLoader.setSelection("alias_show_in_homepage=1");
            }
            if (PickHomePageFragment.this.getPicker().getMediaType() == MediaType.IMAGE) {
                cursorLoader.setSelectionArgs(new String[]{String.valueOf(1)});
            } else if (PickHomePageFragment.this.getPicker().getMediaType() == MediaType.VIDEO) {
                cursorLoader.setSelectionArgs(new String[]{String.valueOf(2)});
            }
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            PickHomePageFragment.this.mHomePageAdapter.swapCursor((Cursor) obj);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private void refreshPickState() {
        int firstVisiblePosition = this.mHomeGridView.getFirstVisiblePosition();
        for (int i = 0; i < this.mHomeGridView.getChildCount(); i++) {
            View childAt = this.mHomeGridView.getChildAt(i);
            if (childAt instanceof Checkable) {
                ((Checkable) childAt).setChecked(this.mPicker.contains(CursorUtils.getSha1((Cursor) this.mHomeGridView.getItemAtPosition(firstVisiblePosition + i))));
            }
        }
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_home";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Media.URI.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).appendQueryParameter("generate_headers", String.valueOf(true)).appendQueryParameter("remove_processing_items", String.valueOf(true)).build();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mHomePagePhotoLoaderCallback = new HomePagePhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mHomePagePhotoLoaderCallback);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mHomeGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mHomeGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsLand);
        } else {
            this.mHomeGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsPortrait);
        }
        this.mHomeGridView.setSelection(firstVisiblePosition);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mHomePageAdapter = new PickableBaseTimeLineAdapterWrapper(this.mPicker, new PickerHomePageAdapter(this.mActivity, DisplayScene.SCENE_NONE));
    }

    public void onDestroy() {
        if (this.mHomePageAdapter != null) {
            this.mHomePageAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.picker_home_page, viewGroup, false);
        this.mHomeGridView = (GridView) inflate.findViewById(R.id.grid);
        this.mHomeGridView.setAdapter(this.mHomePageAdapter);
        this.mHomeGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mEmptyView = (EmptyPage) inflate.findViewById(16908292);
        this.mHomeGridView.setEmptyView(this.mEmptyView);
        this.mEmptyView.setVisibility(8);
        return inflate;
    }

    public void onPermissionsChecked() {
        this.mHomePageAdapter.notifyDataSetChanged();
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        if (this.mPicker.getMode() != Mode.SINGLE) {
            return false;
        }
        this.mPicker.pick(CursorUtils.getSha1(cursor));
        this.mPicker.done();
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z && isResumed()) {
            refreshPickState();
        }
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return true;
    }
}

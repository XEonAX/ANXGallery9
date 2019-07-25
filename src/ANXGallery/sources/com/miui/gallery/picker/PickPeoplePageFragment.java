package com.miui.gallery.picker;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Intent;
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
import com.miui.gallery.R;
import com.miui.gallery.adapter.PeoplePageAdapter;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.ui.PeoplePageGridItem;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;

public class PickPeoplePageFragment extends PickerFragment {
    /* access modifiers changed from: private */
    public boolean mIsOnlyPickPeople;
    private GridView mPeopleGridView;
    private EditableListViewWrapperDeprecated mPeopleGridViewWrapper;
    /* access modifiers changed from: private */
    public PeoplePageAdapter mPeoplePageAdapter;
    private PeoplePagePhotoLoaderCallback mPeoplePagePhotoLoaderCallback;

    private class PeoplePagePhotoLoaderCallback implements LoaderCallbacks {
        private PeoplePagePhotoLoaderCallback() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(PickPeoplePageFragment.this.mActivity);
            cursorLoader.setUri(PeopleFace.PERSONS_URI);
            cursorLoader.setProjection(PeopleCursorHelper.PROJECTION);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            PickPeoplePageFragment.this.mPeoplePageAdapter.swapCursor((Cursor) obj);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_people";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return null;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mPeoplePagePhotoLoaderCallback = new PeoplePagePhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mPeoplePagePhotoLoaderCallback);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mPeopleGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mPeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns_land));
        } else {
            this.mPeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns));
        }
        this.mPeopleGridView.setSelection(firstVisiblePosition);
    }

    public void onDestroy() {
        if (this.mPeoplePageAdapter != null) {
            this.mPeoplePageAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.people_page, viewGroup, false);
        this.mPeopleGridView = (GridView) inflate.findViewById(R.id.grid);
        this.mPeopleGridViewWrapper = new EditableListViewWrapperDeprecated(this.mPeopleGridView);
        this.mPeoplePageAdapter = new PeoplePageAdapter(this.mActivity);
        this.mPeopleGridViewWrapper.setAdapter(this.mPeoplePageAdapter);
        this.mPeopleGridViewWrapper.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                Intent intent = new Intent();
                String peopleIdOfItem = PickPeoplePageFragment.this.mPeoplePageAdapter.getPeopleIdOfItem(i);
                String peopleLocalIdOfItem = PickPeoplePageFragment.this.mPeoplePageAdapter.getPeopleLocalIdOfItem(i);
                intent.putExtra("server_id_of_album", peopleIdOfItem);
                intent.putExtra("local_id_of_album", peopleLocalIdOfItem);
                intent.putExtra("album_name", ((PeoplePageGridItem) view).getName());
                int i2 = -1;
                if (PickPeoplePageFragment.this.mIsOnlyPickPeople) {
                    PickPeoplePageFragment.this.mActivity.setResult(-1, intent);
                    PickPeoplePageFragment.this.mActivity.finish();
                    return;
                }
                intent.putExtra("relationType", PickPeoplePageFragment.this.mPeoplePageAdapter.getRelationTypeOfItem(i));
                intent.setClass(PickPeoplePageFragment.this.mActivity, PickFaceAlbumActivity.class);
                Picker picker = ((PickerActivity) PickPeoplePageFragment.this.mActivity).getPicker();
                String str = "pick-upper-bound";
                if (picker.getMode() != Mode.UNLIMITED) {
                    i2 = picker.capacity();
                }
                intent.putExtra(str, i2);
                intent.putExtra("pick-lower-bound", PickPeoplePageFragment.this.mPicker.baseline());
                intent.putExtra("picker_media_type", picker.getMediaType().ordinal());
                intent.putExtra("picker_result_set", PickerActivity.copyPicker(picker));
                intent.putExtra("picker_result_type", picker.getResultType().ordinal());
                PickPeoplePageFragment.this.mActivity.startActivityForResult(intent, 1);
            }
        });
        ((StickyGridHeadersGridView) inflate.findViewById(R.id.grid)).setAreHeadersSticky(false);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        return false;
    }

    public void setIsPickPeople(boolean z) {
        this.mIsOnlyPickPeople = z;
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return false;
    }
}

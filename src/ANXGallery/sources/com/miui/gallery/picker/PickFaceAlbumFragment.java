package com.miui.gallery.picker;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.FacePageAdapter;
import com.miui.gallery.picker.helper.CursorUtils;
import com.miui.gallery.picker.helper.PickerItemHolder;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;

public class PickFaceAlbumFragment extends PickAlbumDetailFragmentBase {
    /* access modifiers changed from: private */
    public PickAlbumDetailTimeLineAdapter mAdapter;
    /* access modifiers changed from: private */
    public AlbumItemCheckListener mAlbumItemCheckListener;
    private FacePagePhotoLoaderCallback mFacePagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public long mLocalIdOfAlbum;
    /* access modifiers changed from: private */
    public String mServerIdOfAlbum;

    private class FacePagePhotoLoaderCallback implements LoaderCallbacks {
        private FacePagePhotoLoaderCallback() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            String str;
            String stringExtra = PickFaceAlbumFragment.this.mActivity.getIntent().getStringExtra("pick_face_ids_in");
            if (!TextUtils.isEmpty(stringExtra)) {
                StringBuilder sb = new StringBuilder();
                sb.append("_id in ( ");
                sb.append(stringExtra);
                sb.append(")");
                str = sb.toString();
            } else {
                str = null;
            }
            CursorLoader cursorLoader = new CursorLoader(PickFaceAlbumFragment.this.mActivity);
            cursorLoader.setUri(PickFaceAlbumFragment.this.getUri());
            cursorLoader.setProjection(FacePageAdapter.PROJECTION);
            cursorLoader.setSelection(str);
            cursorLoader.setSelectionArgs(new String[]{PickFaceAlbumFragment.this.mServerIdOfAlbum, String.valueOf(PickFaceAlbumFragment.this.mLocalIdOfAlbum)});
            cursorLoader.setSortOrder("dateTaken DESC ");
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            PickFaceAlbumFragment.this.mAdapter.swapCursor((Cursor) obj);
            PickFaceAlbumFragment.this.copy2Pick();
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class PickAlbumDetailTimeLineAdapter extends FacePageAdapter {
        public PickAlbumDetailTimeLineAdapter(Context context) {
            super(context);
        }

        public void doBindView(View view, Context context, Cursor cursor) {
            super.doBindView(view, context, cursor);
            PickFaceAlbumFragment.this.bindCheckState(view, cursor);
            PickerItemHolder.bindView(cursor.getPosition(), view, this, PickFaceAlbumFragment.this.mAlbumItemCheckListener);
        }
    }

    public PickFaceAlbumFragment() {
        super("face-album");
    }

    /* access modifiers changed from: protected */
    public long getKey(Cursor cursor) {
        return CursorUtils.getFacePhotoId(cursor);
    }

    /* access modifiers changed from: protected */
    public String getLocalPath(Cursor cursor) {
        return this.mAdapter.getItemPath(cursor);
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_face_album";
    }

    /* access modifiers changed from: protected */
    public String getPreviewOrder() {
        return "dateTaken DESC ";
    }

    /* access modifiers changed from: protected */
    public String getPreviewSelection(Cursor cursor) {
        return null;
    }

    /* access modifiers changed from: protected */
    public String[] getPreviewSelectionArgs(Cursor cursor) {
        StringBuilder sb = new StringBuilder();
        sb.append("'");
        sb.append(CursorUtils.getFaceId(cursor));
        sb.append("'");
        return new String[]{sb.toString()};
    }

    /* access modifiers changed from: protected */
    public Uri getPreviewUri() {
        return PeopleFace.RECOMMEND_FACES_OF_ONE_PERSON_URI;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return PeopleFace.ONE_PERSON_URI;
    }

    /* access modifiers changed from: protected */
    public boolean isPreviewFace() {
        return true;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mServerIdOfAlbum = this.mActivity.getIntent().getStringExtra("server_id_of_album");
        this.mLocalIdOfAlbum = Long.parseLong(this.mActivity.getIntent().getStringExtra("local_id_of_album"));
        this.mFacePagePhotoLoaderCallback = new FacePagePhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mFacePagePhotoLoaderCallback);
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

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mAdapter = new PickAlbumDetailTimeLineAdapter(this.mActivity);
        if (this.mActivity.getIntent().getBooleanExtra("need_pick_face_id", false)) {
            this.mAdapter.changeDisplayMode();
        }
    }

    public void onDestroy() {
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.face_page, viewGroup, false);
        this.mAlbumDetailGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mAlbumDetailGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mAlbumDetailGridView.setAdapter((ListAdapter) this.mAdapter);
        this.mAlbumItemCheckListener = new AlbumItemCheckListener(this.mPicker);
        intialSelections();
        return inflate;
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        if (!this.mActivity.getIntent().getBooleanExtra("need_pick_face_id", false)) {
            return super.onPhotoItemClick(cursor);
        }
        this.mPicker.pick(CursorUtils.getFaceId(cursor));
        ((PickAlbumDetailActivityBase) this.mActivity).setResultCode(-1);
        this.mPicker.done();
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return false;
    }
}

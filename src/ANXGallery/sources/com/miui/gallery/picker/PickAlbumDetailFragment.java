package com.miui.gallery.picker;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.ContentUris;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailTimeLineAdapter;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.PickerItemHolder;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.widget.SortByHeader;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;

public class PickAlbumDetailFragment extends PickAlbumDetailFragmentBase {
    private static final String SELECTION_ONLY_LOCAL;
    private AlbumDetailLoaderCallback mAlbumDetailLoaderCallback;
    /* access modifiers changed from: private */
    public PickAlbumDetailSimpleAdapter mAlbumDetailSimpleAdapter;
    /* access modifiers changed from: private */
    public PickAlbumDetailTimeLineAdapter mAlbumDetailTimeLineAdapter;
    private long mAlbumId;
    /* access modifiers changed from: private */
    public AlbumItemCheckListener mAlbumItemCheckListener;
    /* access modifiers changed from: private */
    public SortBy mCurrentSortBy = SortBy.NONE;
    private boolean mIsOtherSharedAlbum;
    private boolean mIsPanoAlbum;
    private OnSortByClickListener mOnSortByClickListener;
    /* access modifiers changed from: private */
    public SortByHeader mSortByHeader;
    private String mSortOrder = " DESC ";

    private class AlbumDetailLoaderCallback implements LoaderCallbacks {
        private AlbumDetailLoaderCallback() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(PickAlbumDetailFragment.this.mActivity);
            PickAlbumDetailFragment.this.configLoader(cursorLoader, SortBy.DATE);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            if (PickAlbumDetailFragment.this.mCurrentSortBy == SortBy.DATE) {
                PickAlbumDetailFragment.this.mAlbumDetailGridView.setAdapter((ListAdapter) PickAlbumDetailFragment.this.mAlbumDetailTimeLineAdapter);
                PickAlbumDetailFragment.this.mAlbumDetailTimeLineAdapter.swapCursor((Cursor) obj);
            } else {
                PickAlbumDetailFragment.this.mAlbumDetailGridView.setAdapter((ListAdapter) PickAlbumDetailFragment.this.mAlbumDetailSimpleAdapter);
                PickAlbumDetailFragment.this.mAlbumDetailSimpleAdapter.swapCursor((Cursor) obj);
            }
            PickAlbumDetailFragment.this.mSortByHeader.updateCurrentSortView(PickAlbumDetailFragment.this.mCurrentSortBy, PickAlbumDetailFragment.this.getSortByIndicatorResource());
            PickAlbumDetailFragment.this.copy2Pick();
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class OnSortByClickListener implements OnClickListener {
        private OnSortByClickListener() {
        }

        public void onClick(View view) {
            Loader loader = PickAlbumDetailFragment.this.getLoaderManager().getLoader(1);
            int id = view.getId();
            if (id == R.id.datetime_container) {
                PickAlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.DATE);
            } else if (id == R.id.name_container) {
                PickAlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.NAME);
            } else if (id == R.id.size_container) {
                PickAlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.SIZE);
            }
            loader.forceLoad();
        }
    }

    private class PickAlbumDetailSimpleAdapter extends AlbumDetailSimpleAdapter {
        public PickAlbumDetailSimpleAdapter(Context context) {
            super(context, DisplayScene.SCENE_NONE);
        }

        public void doBindData(View view, Context context, Cursor cursor) {
            super.doBindData(view, context, cursor);
            PickAlbumDetailFragment.this.bindCheckState(view, cursor);
            PickerItemHolder.bindView(cursor.getPosition(), view, this, PickAlbumDetailFragment.this.mAlbumItemCheckListener);
        }
    }

    private class PickAlbumDetailTimeLineAdapter extends AlbumDetailTimeLineAdapter {
        public PickAlbumDetailTimeLineAdapter(Context context) {
            super(context, DisplayScene.SCENE_NONE);
        }

        public void doBindData(View view, Context context, Cursor cursor) {
            super.doBindData(view, context, cursor);
            PickAlbumDetailFragment.this.bindCheckState(view, cursor);
            PickerItemHolder.bindView(cursor.getPosition(), view, this, PickAlbumDetailFragment.this.mAlbumItemCheckListener);
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(" AND ");
        sb.append(Cloud.ALIAS_LOCAL_MEDIA);
        SELECTION_ONLY_LOCAL = sb.toString();
    }

    public PickAlbumDetailFragment() {
        super("album");
    }

    /* access modifiers changed from: private */
    public void configLoader(CursorLoader cursorLoader, SortBy sortBy) {
        cursorLoader.setUri(getUri(sortBy));
        cursorLoader.setProjection(AlbumDetailTimeLineAdapter.PROJECTION);
        cursorLoader.setSelection(getSelection());
        cursorLoader.setSelectionArgs(getSelectionArgs());
        cursorLoader.setSortOrder(configOrderBy(sortBy));
    }

    private String configOrderBy(SortBy sortBy) {
        String sortByString = getSortByString(sortBy);
        if (this.mCurrentSortBy == sortBy) {
            this.mSortOrder = TextUtils.equals(this.mSortOrder, " DESC ") ? " ASC " : " DESC ";
        } else {
            this.mSortOrder = " DESC ";
            this.mCurrentSortBy = sortBy;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(sortByString);
        sb.append(this.mSortOrder);
        String sb2 = sb.toString();
        onSortByChanged();
        return sb2;
    }

    private String getSelection() {
        if (this.mIsOtherSharedAlbum) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        if (this.mAlbumId == 2147483647L) {
            sb.append("serverType = ? AND ");
            sb.append("alias_hidden = ?");
        } else if (this.mIsPanoAlbum) {
            sb.append("title LIKE ?  AND ");
            sb.append("alias_hidden = ?");
        } else if (this.mAlbumId == 2147483642) {
            sb.append("alias_is_favorite = ? AND ");
            sb.append("alias_hidden = ? AND ");
            sb.append("localGroupId != ?");
            if (getPicker().getMediaType() != MediaType.ALL) {
                sb.append(" AND serverType = ?");
            }
        } else {
            sb.append("localGroupId = ? ");
            if (getPicker().getMediaType() != MediaType.ALL) {
                sb.append(" AND serverType=? ");
            }
        }
        if (isOnlyShowLocal()) {
            sb.append(SELECTION_ONLY_LOCAL);
        }
        return sb.toString();
    }

    private String[] getSelectionArgs() {
        if (this.mAlbumId == 2147483647L) {
            return new String[]{String.valueOf(2), String.valueOf(0)};
        } else if (this.mIsPanoAlbum) {
            return new String[]{"PANO_.*", String.valueOf(0)};
        } else if (this.mIsOtherSharedAlbum) {
            return null;
        } else {
            if (this.mAlbumId == 2147483642) {
                MediaType mediaType = getPicker().getMediaType();
                if (mediaType == MediaType.ALL) {
                    return new String[]{String.valueOf(1), String.valueOf(0), String.valueOf(-1000)};
                }
                String[] strArr = new String[4];
                strArr[0] = String.valueOf(1);
                strArr[1] = String.valueOf(0);
                strArr[2] = String.valueOf(-1000);
                strArr[3] = mediaType == MediaType.IMAGE ? String.valueOf(1) : String.valueOf(2);
                return strArr;
            } else if (getPicker().getMediaType() == MediaType.IMAGE) {
                return new String[]{String.valueOf(this.mAlbumId), String.valueOf(1)};
            } else if (getPicker().getMediaType() == MediaType.VIDEO) {
                return new String[]{String.valueOf(this.mAlbumId), String.valueOf(2)};
            } else {
                return new String[]{String.valueOf(this.mAlbumId)};
            }
        }
    }

    /* access modifiers changed from: private */
    public int getSortByIndicatorResource() {
        return TextUtils.equals(this.mSortOrder, " ASC ") ? R.drawable.sort_by_item_arrow_up : R.drawable.sort_by_item_arrow_down;
    }

    private String getSortByString(SortBy sortBy) {
        switch (sortBy) {
            case NAME:
                return "title";
            case SIZE:
                return "size";
            default:
                return "alias_sort_time";
        }
    }

    private Uri getUri(SortBy sortBy) {
        return this.mIsOtherSharedAlbum ? ContentUris.withAppendedId(Media.URI_OTHER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build(), this.mAlbumId) : sortBy == SortBy.DATE ? Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).appendQueryParameter("remove_duplicate_items", String.valueOf(true)).appendQueryParameter("remove_processing_items", String.valueOf(true)).build() : Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).appendQueryParameter("remove_processing_items", String.valueOf(true)).build();
    }

    private boolean isOnlyShowLocal() {
        return LocalMode.isOnlyShowLocalPhoto();
    }

    private void onSortByChanged() {
        this.mAlbumDetailSimpleAdapter.setCurrentSortBy(this.mCurrentSortBy);
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_album_detail";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return getUri(SortBy.NONE);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mAlbumDetailLoaderCallback = new AlbumDetailLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mAlbumDetailLoaderCallback);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mAlbumDetailTimeLineAdapter = new PickAlbumDetailTimeLineAdapter(this.mActivity);
        this.mAlbumDetailSimpleAdapter = new PickAlbumDetailSimpleAdapter(this.mActivity);
    }

    public void onDestroy() {
        if (this.mAlbumDetailSimpleAdapter != null) {
            this.mAlbumDetailSimpleAdapter.swapCursor(null);
        }
        if (this.mAlbumDetailTimeLineAdapter != null) {
            this.mAlbumDetailTimeLineAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.album_detail, viewGroup, false);
        this.mAlbumDetailGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mAlbumDetailGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mAlbumItemCheckListener = new AlbumItemCheckListener(this.mPicker);
        this.mOnSortByClickListener = new OnSortByClickListener();
        this.mSortByHeader = (SortByHeader) inflate.findViewById(R.id.sortby_header);
        this.mSortByHeader.setOnSortByClickListener(this.mOnSortByClickListener);
        intialSelections();
        return inflate;
    }

    public void setAlbumId(long j) {
        this.mAlbumId = j;
    }

    public void setIsOtherSharedAlbum(boolean z) {
        this.mIsOtherSharedAlbum = z;
    }

    public void setIsPanoAlbum(boolean z) {
        this.mIsPanoAlbum = z;
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        if (this.mAlbumDetailSimpleAdapter != null) {
            return this.mAlbumDetailSimpleAdapter.supportFoldBurstItems();
        }
        if (this.mAlbumDetailTimeLineAdapter != null) {
            this.mAlbumDetailTimeLineAdapter.supportFoldBurstItems();
        }
        return false;
    }
}

package com.miui.gallery.picker;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.Rect;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v7.util.SortedList;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumAdapterBase;
import com.miui.gallery.loader.AlbumConvertCallback;
import com.miui.gallery.loader.AlbumSnapshotLoader;
import com.miui.gallery.loader.AsyncContentLoader;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.AlbumConstants;
import com.miui.gallery.model.AlbumList;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.recyclerview.ExtendedRecyclerView;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.SectionedDividerItemDecoration;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class PickAlbumPageFragment extends PickerFragment {
    /* access modifiers changed from: private */
    public AlbumAdapterBase mAlbumPageAdapter;
    private AlbumPagePhotoLoaderCallback mAlbumPagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public ExtendedRecyclerView mAlbumRecyclerView;
    private boolean mLoadInited;

    private class AlbumPagePhotoLoaderCallback implements LoaderCallbacks {
        private AlbumPagePhotoLoaderCallback() {
        }

        private void dispatchAlbumUpdates(List<Album> list) {
            if ((list != null ? list.size() : 0) <= 0) {
                PickAlbumPageFragment.this.mAlbumRecyclerView.inflateEmptyView();
            }
            SortedList data = PickAlbumPageFragment.this.mAlbumPageAdapter.getData();
            if (MiscUtil.isValid(list)) {
                data.replaceAll(list);
            } else if (data.size() > 0) {
                data.clear();
            } else {
                PickAlbumPageFragment.this.mAlbumPageAdapter.notifyDataSetChanged();
            }
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            if (i == 1) {
                return new AlbumSnapshotLoader(PickAlbumPageFragment.this.mActivity);
            }
            if (i == 2) {
                AsyncContentLoader asyncContentLoader = new AsyncContentLoader(PickAlbumPageFragment.this.mActivity, new AlbumConvertCallback());
                asyncContentLoader.setUri(PickAlbumPageFragment.this.getAlbumQueryUri());
                asyncContentLoader.setProjection(PickAlbumPageFragment.this.mAlbumPageAdapter.getProjection());
                asyncContentLoader.setSelection("media_count>0");
                return asyncContentLoader;
            } else if (i == 3) {
                CursorLoader cursorLoader = new CursorLoader(PickAlbumPageFragment.this.mActivity);
                cursorLoader.setUri(GalleryContract.Album.URI_SHARE_ALL);
                cursorLoader.setProjection(AlbumConstants.SHARED_ALBUM_PROJECTION);
                cursorLoader.setSelection("count > 0");
                return cursorLoader;
            } else if (i != 4) {
                return null;
            } else {
                CursorLoader cursorLoader2 = new CursorLoader(PickAlbumPageFragment.this.mActivity);
                cursorLoader2.setUri(PeopleFace.PEOPLE_FACE_COVER_URI);
                return cursorLoader2;
            }
        }

        public void onLoadFinished(Loader loader, Object obj) {
            int id = loader.getId();
            List list = null;
            if (id == 1) {
                if (obj != null) {
                    list = (List) obj;
                }
                dispatchAlbumUpdates(list);
                PickAlbumPageFragment.this.startToLoadAlbumExtraInfo();
            } else if (id == 2) {
                if (obj != null) {
                    list = (AlbumList) obj;
                }
                dispatchAlbumUpdates(list);
            } else if (id == 3) {
                PickAlbumPageFragment.this.mAlbumPageAdapter.setSharedAlbums((Cursor) obj);
            } else if (id == 4) {
                PickAlbumPageFragment.this.mAlbumPageAdapter.setPeopleFaceCover((Cursor) obj);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    /* access modifiers changed from: private */
    public Uri getAlbumQueryUri() {
        MediaType mediaType = getPicker().getMediaType();
        boolean z = false;
        boolean z2 = mediaType != MediaType.IMAGE;
        if (mediaType != MediaType.VIDEO) {
            z = true;
        }
        Builder appendQueryParameter = GalleryContract.Album.URI.buildUpon().appendQueryParameter("join_face", String.valueOf(z)).appendQueryParameter("join_video", String.valueOf(z2)).appendQueryParameter("join_share", "true").appendQueryParameter("join_recent", "true").appendQueryParameter("join_favorites", "true").appendQueryParameter("remove_duplicate_items", "true").appendQueryParameter("fill_covers", "true");
        if (mediaType == MediaType.IMAGE) {
            appendQueryParameter.appendQueryParameter("media_type", String.valueOf(1));
        } else if (mediaType == MediaType.VIDEO) {
            appendQueryParameter.appendQueryParameter("media_type", String.valueOf(2));
        }
        return appendQueryParameter.build();
    }

    /* access modifiers changed from: private */
    public void startToLoadAlbumExtraInfo() {
        Log.d("PickAlbumPageFragment", "startToLoadAlbumExtraInfo");
        getLoaderManager().restartLoader(2, null, this.mAlbumPagePhotoLoaderCallback);
        getLoaderManager().initLoader(3, null, this.mAlbumPagePhotoLoaderCallback);
        if (getPicker().getMediaType() != MediaType.VIDEO) {
            getLoaderManager().initLoader(4, null, this.mAlbumPagePhotoLoaderCallback);
        }
        getLoaderManager().destroyLoader(1);
    }

    private void startToLoadAlbums() {
        Log.d("PickAlbumPageFragment", "startToLoadAlbums");
        getLoaderManager().initLoader(1, null, this.mAlbumPagePhotoLoaderCallback);
        this.mLoadInited = true;
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "picker_album";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return null;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i2 == 0) {
            this.mPicker.cancel();
            return;
        }
        List<String> list = (List) intent.getSerializableExtra("internal_key_updated_selection");
        if (list != null) {
            Log.d("PickAlbumPageFragment", "Pick result of pre album: %s ", (Object) Integer.valueOf(list.size()));
            ArrayList arrayList = new ArrayList();
            for (String str : this.mPicker) {
                if (!list.contains(str)) {
                    arrayList.add(str);
                }
            }
            Log.d("PickAlbumPageFragment", "Deleted items in pre album : %s ", (Object) arrayList);
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                this.mPicker.remove((String) it.next());
            }
            for (String str2 : list) {
                if (!this.mPicker.contains(str2)) {
                    this.mPicker.pick(str2);
                }
            }
            if (i2 == -1) {
                this.mPicker.done();
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLoadInited = false;
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.picker_album_page, viewGroup, false);
        this.mAlbumRecyclerView = (ExtendedRecyclerView) inflate.findViewById(R.id.album_list);
        this.mAlbumRecyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        this.mAlbumPageAdapter = new AlbumAdapterBase(this.mActivity);
        this.mAlbumPageAdapter.setInPickMode(true);
        SectionedDividerItemDecoration sectionedDividerItemDecoration = new SectionedDividerItemDecoration(getActivity(), R.drawable.section_divider_bg, R.drawable.item_divider_bg, this.mAlbumPageAdapter);
        sectionedDividerItemDecoration.setItemDividerPadding(new Rect(getResources().getDimensionPixelSize(R.dimen.album_cover_container_size_small), 0, 0, 0));
        this.mAlbumRecyclerView.addItemDecoration(sectionedDividerItemDecoration);
        this.mAlbumRecyclerView.setItemAnimator(null);
        this.mAlbumRecyclerView.setAdapter(this.mAlbumPageAdapter);
        ((GalleryRecyclerView) this.mAlbumRecyclerView.getRecycler()).setOnItemClickListener(new OnItemClickListener() {
            public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
                Intent intent = new Intent();
                if (AlbumAdapterBase.isFaceAlbum(j)) {
                    intent.setClass(PickAlbumPageFragment.this.mActivity, PickPeopleActivity.class);
                } else if (AlbumAdapterBase.isRecentAlbum(j)) {
                    intent.setClass(PickAlbumPageFragment.this.mActivity, PickRecentDiscoveryActivity.class);
                    intent.putExtra("album_id", j);
                    intent.putExtra("album_name", PickAlbumPageFragment.this.mAlbumPageAdapter.getAlbumName(i));
                } else {
                    intent.setClass(PickAlbumPageFragment.this.mActivity, PickAlbumDetailActivity.class);
                }
                intent.putExtra("other_share_album", PickAlbumPageFragment.this.mAlbumPageAdapter.isOtherShareAlbum(i));
                intent.putExtra("owner_share_album", PickAlbumPageFragment.this.mAlbumPageAdapter.isOwnerShareAlbum(i));
                intent.putExtra("pano_album", PickAlbumPageFragment.this.mAlbumPageAdapter.isPanoAlbum(i));
                intent.putExtra("album_id", j);
                intent.putExtra("album_name", PickAlbumPageFragment.this.mAlbumPageAdapter.getAlbumName(i));
                intent.putExtra("pick-upper-bound", PickAlbumPageFragment.this.mPicker.getMode() == Mode.UNLIMITED ? -1 : PickAlbumPageFragment.this.mPicker.capacity());
                intent.putExtra("pick-lower-bound", PickAlbumPageFragment.this.mPicker.baseline());
                intent.putExtra("picker_media_type", PickAlbumPageFragment.this.mPicker.getMediaType().ordinal());
                intent.putExtra("picker_result_set", PickerActivity.copyPicker(PickAlbumPageFragment.this.mPicker));
                intent.putExtra("picker_result_type", PickAlbumPageFragment.this.mPicker.getResultType().ordinal());
                PickAlbumPageFragment.this.startActivityForResult(intent, 1);
                return true;
            }
        });
        this.mAlbumPagePhotoLoaderCallback = new AlbumPagePhotoLoaderCallback();
        return inflate;
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        return false;
    }

    public void onStart() {
        super.onStart();
        this.mAlbumPageAdapter.updateGalleryCloudSyncableState();
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (getUserVisibleHint() && !this.mLoadInited) {
            startToLoadAlbums();
            this.mLoadInited = true;
        }
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return true;
    }
}

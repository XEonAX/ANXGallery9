package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.widget.PagerGridLayout;
import com.miui.gallery.widget.PagerGridLayout.OnPageChangedListener;

public class RecommendFacePageFragment extends BaseMediaFragment implements OnPageChangedListener {
    private Button confirmButton;
    private ViewStub mEmptyViewStub;
    /* access modifiers changed from: private */
    public PagerGridLayout mFaceGroup;
    private Handler mHandler = new Handler();
    private long mLocalIdOfAlbum;
    public boolean mNoMoreRecommendations = false;
    private View mNormalView;
    private String mPeopleName;
    /* access modifiers changed from: private */
    public RecommendFaceGroupAdapter mRecommendFaceAdapter;
    /* access modifiers changed from: private */
    public String mRecommendFaceIds;
    private String mServerIdOfAlbum;

    private class FaceRecommendPhotoLoaderCallback implements LoaderCallbacks {
        private FaceRecommendPhotoLoaderCallback() {
        }

        private String getOrderBy() {
            return "dateTaken DESC ";
        }

        private Uri getUri() {
            return PeopleFace.RECOMMEND_FACES_OF_ONE_PERSON_URI;
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(RecommendFacePageFragment.this.getActivity());
            cursorLoader.setUri(getUri());
            cursorLoader.setProjection(RecommendFaceGroupAdapter.PROJECTION);
            cursorLoader.setSelectionArgs(new String[]{RecommendFacePageFragment.this.mRecommendFaceIds});
            cursorLoader.setSortOrder(getOrderBy());
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            RecommendFacePageFragment.this.mRecommendFaceAdapter.swapCursor((Cursor) obj);
            RecommendFacePageFragment.this.mFaceGroup.setAdapter(RecommendFacePageFragment.this.mRecommendFaceAdapter);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private void setTitle() {
        if (this.mActivity != null) {
            this.mActivity.getActionBar().setTitle(getString(R.string.more_face));
        }
    }

    public void changeToNextPage() {
        if (this.mFaceGroup != null) {
            this.mFaceGroup.changeToNextPage();
        }
    }

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return null;
    }

    public String getPageName() {
        return "face_recommend";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mServerIdOfAlbum = this.mActivity.getIntent().getStringExtra("server_id_of_album");
        this.mLocalIdOfAlbum = this.mActivity.getIntent().getLongExtra("local_id_of_album", -1);
        this.mPeopleName = this.mActivity.getIntent().getStringExtra("album_name");
        this.mRecommendFaceIds = this.mActivity.getIntent().getStringExtra("server_ids_of_faces");
        setTitle();
        this.mRecommendFaceAdapter = new RecommendFaceGroupAdapter(this, this.mServerIdOfAlbum, Long.valueOf(this.mLocalIdOfAlbum)) {
            public int getColumnsCount() {
                return 3;
            }

            /* access modifiers changed from: protected */
            public int getLayoutId() {
                return R.layout.recommend_face_cover_item_large;
            }

            public int getRowsCount() {
                return 4;
            }
        };
        getLoaderManager().initLoader(2, null, new FaceRecommendPhotoLoaderCallback());
    }

    public void onActivityFinish() {
        if (this.mNoMoreRecommendations) {
            Intent intent = new Intent();
            intent.putExtra("all_faces_confirmed", true);
            this.mActivity.setResult(-1, intent);
        }
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.recommend_face_page, null, false);
        this.mFaceGroup = (PagerGridLayout) inflate.findViewById(R.id.face_group);
        this.mFaceGroup.setOnPageChangedListener(this);
        this.confirmButton = (Button) inflate.findViewById(R.id.confirm_recommend);
        this.mEmptyViewStub = (ViewStub) inflate.findViewById(R.id.recommend_face_page_empty_view);
        this.mNormalView = inflate.findViewById(R.id.normal_view);
        this.confirmButton.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                RecommendFacePageFragment.this.changeToNextPage();
            }
        });
        return inflate;
    }

    public void onPageChanged(int i, int i2, boolean z) {
        if (z) {
            this.mNormalView.setVisibility(8);
            this.mNoMoreRecommendations = true;
            View inflate = this.mEmptyViewStub.inflate();
            ((TextView) inflate.findViewById(R.id.content)).setText(R.string.empty_recommend_face_page_view);
            inflate.findViewById(R.id.back).setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    RecommendFacePageFragment.this.mActivity.finish();
                }
            });
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mFaceGroup != null) {
            this.mFaceGroup.freshCurrentPage();
        }
    }
}

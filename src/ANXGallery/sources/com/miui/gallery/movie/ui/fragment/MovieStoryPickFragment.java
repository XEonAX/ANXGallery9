package com.miui.gallery.movie.ui.fragment;

import android.app.Activity;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.movie.ui.activity.MovieStoryPickActivity;
import com.miui.gallery.movie.ui.adapter.StoryMoviePickAdapter;
import com.miui.gallery.picker.PickerFragment;
import com.miui.gallery.picker.helper.PickableBaseTimeLineAdapterWrapper;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.widget.EmptyPage;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.Iterator;

public class MovieStoryPickFragment extends PickerFragment {
    /* access modifiers changed from: private */
    public Activity mActivity;
    /* access modifiers changed from: private */
    public PickableBaseTimeLineAdapterWrapper mAdapter;
    private long mCardId;
    private EmptyPage mEmptyView;
    private StickyGridHeadersGridView mGridView;
    private Intent mIntent;
    private LoaderCallbacks mLoaderCallbacks = new LoaderCallbacks() {
        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(MovieStoryPickFragment.this.mActivity);
            cursorLoader.setUri(MovieStoryPickFragment.this.getUri());
            cursorLoader.setProjection(MovieStoryPickFragment.this.getProjection());
            cursorLoader.setSelection(MovieStoryPickFragment.this.getSelection());
            cursorLoader.setSortOrder(MovieStoryPickFragment.this.getOrder());
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            MovieStoryPickFragment.this.mAdapter.swapCursor((Cursor) obj);
        }

        public void onLoaderReset(Loader loader) {
        }
    };
    private StoryMoviePickAdapter mStoryMoviePickAdapter;

    /* access modifiers changed from: private */
    public String getOrder() {
        return "alias_create_time DESC ";
    }

    /* access modifiers changed from: private */
    public String[] getProjection() {
        return StoryMoviePickAdapter.PROJECTION;
    }

    /* access modifiers changed from: private */
    public String getSelection() {
        Card cardByCardId = CardManager.getInstance().getCardByCardId(this.mCardId);
        if (cardByCardId == null) {
            return "";
        }
        return String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", cardByCardId.getSelectedMediaSha1s())});
    }

    public static /* synthetic */ void lambda$onInflateView$133(MovieStoryPickFragment movieStoryPickFragment, AdapterView adapterView, View view, int i, long j) {
        MovieStoryPickFragment movieStoryPickFragment2 = movieStoryPickFragment;
        int i2 = i;
        Cursor cursor = (Cursor) movieStoryPickFragment2.mStoryMoviePickAdapter.getItem(i2);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(ItemViewInfo.getImageInfo(view, 0));
        ImageLoadParams imageLoadParams = new ImageLoadParams(movieStoryPickFragment2.mStoryMoviePickAdapter.getItemKey(i2), movieStoryPickFragment2.mStoryMoviePickAdapter.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, (RectF) null, 0, movieStoryPickFragment2.mStoryMoviePickAdapter.getMimeType(i2), movieStoryPickFragment.isPreviewFace(), movieStoryPickFragment2.mStoryMoviePickAdapter.getFileLength(i2));
        IntentUtil.gotoPhotoPageFromPicker(movieStoryPickFragment2.mActivity, movieStoryPickFragment.getPreviewUri(), movieStoryPickFragment2.getPreviewSelection(cursor), movieStoryPickFragment2.getPreviewSelectionArgs(cursor), movieStoryPickFragment.getPreviewOrder(), imageLoadParams, arrayList, !movieStoryPickFragment.supportFoldBurstItems());
    }

    private boolean parseIntent() {
        if (this.mIntent == null) {
            Log.d("StoryMoviePickFragment", "parseIntent is fail. ");
            this.mActivity.finish();
            return false;
        }
        this.mCardId = this.mIntent.getLongExtra("card_id", 0);
        ArrayList stringArrayListExtra = this.mIntent.getStringArrayListExtra("pick_sha1");
        if (MiscUtil.isValid(stringArrayListExtra)) {
            Iterator it = stringArrayListExtra.iterator();
            while (it.hasNext()) {
                this.mPicker.pick((String) it.next());
            }
        }
        Log.d("StoryMoviePickFragment", "parseIntent is success. ");
        return true;
    }

    public String getPageName() {
        return "story_picker_home";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        if (parseIntent()) {
            getLoaderManager().initLoader(17, null, this.mLoaderCallbacks);
        }
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mActivity = activity;
        this.mIntent = ((MovieStoryPickActivity) this.mActivity).getResultIntent();
    }

    public void onDestroy() {
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.story_movie_pick_fragment, viewGroup, false);
        this.mGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid_view);
        this.mGridView.setOnItemClickListener(new OnItemClickListener() {
            public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
                MovieStoryPickFragment.lambda$onInflateView$133(MovieStoryPickFragment.this, adapterView, view, i, j);
            }
        });
        this.mStoryMoviePickAdapter = new StoryMoviePickAdapter((Context) this.mActivity, this.mPicker);
        this.mAdapter = new PickableBaseTimeLineAdapterWrapper(this.mPicker, this.mStoryMoviePickAdapter);
        this.mGridView.setAdapter((ListAdapter) this.mAdapter);
        this.mEmptyView = (EmptyPage) inflate.findViewById(16908292);
        this.mGridView.setEmptyView(this.mEmptyView);
        this.mEmptyView.setVisibility(8);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean supportFoldBurstItems() {
        return false;
    }
}

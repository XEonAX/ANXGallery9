package com.miui.gallery.ui;

import android.app.LoaderManager;
import android.app.LoaderManager.LoaderCallbacks;
import android.arch.lifecycle.DefaultLifecycleObserver;
import android.arch.lifecycle.DefaultLifecycleObserver.CC;
import android.arch.lifecycle.LifecycleOwner;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.util.SparseLongArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.common.collect.Lists;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumPageHeaderAdapter;
import com.miui.gallery.app.Fragment;
import com.miui.gallery.model.FaceAlbumCover;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.preference.GalleryPreferences.SearchBackedAlbum;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.SearchStatusLoader;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.query.QueryLoader;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.resultpage.DataListResultProcessor;
import com.miui.gallery.search.resultpage.DataListSourceResult;
import com.miui.gallery.threadpool.GallerySchedulers;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.face.FaceRegionRectF;
import com.miui.gallery.util.face.PeopleItem;
import com.miui.gallery.widget.recyclerview.GridItemSpacingDecoration;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.subjects.PublishSubject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class AlbumPageHeaderController implements LoaderCallbacks, DefaultLifecycleObserver {
    private AlbumPageHeaderAdapter mAdapter;
    private int mAlbumCoverNum;
    private CompositeDisposable mCompositeDisposable = new CompositeDisposable();
    private Fragment mFragment;
    private SparseBooleanArray mIsManualLoad = new SparseBooleanArray();
    private boolean mIsPeopleAlbumSnapshotValid = false;
    private SparseLongArray mLoaderCreateTime = new SparseLongArray();
    private ArrayList<Long> mLocationsAlbumCoverServerIds;
    private PublishSubject<ArrayList<Long>> mLocationsSubject;
    private RecyclerView mRecyclerView;
    private int mSearchStatus = -1;
    private ArrayList<Long> mTagsAlbumCoverServerIds;
    private PublishSubject<ArrayList<Long>> mTagsSubject;

    public AlbumPageHeaderController(Fragment fragment, ViewGroup viewGroup) {
        this.mFragment = fragment;
        this.mFragment.getLifecycle().addObserver(this);
        Resources resources = this.mFragment.getResources();
        this.mRecyclerView = (RecyclerView) LayoutInflater.from(this.mFragment.getActivity()).inflate(R.layout.album_page_header_recycler, viewGroup, false);
        this.mRecyclerView.setLayoutManager(new GridLayoutManager(this.mFragment.getActivity(), resources.getInteger(R.integer.album_page_header_columns)));
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.message_bar_vertical_margin);
        this.mRecyclerView.addItemDecoration(new GridItemSpacingDecoration(this.mRecyclerView, false, dimensionPixelSize, dimensionPixelSize));
        this.mRecyclerView.setItemAnimator(null);
        this.mAdapter = new AlbumPageHeaderAdapter(this.mFragment.getActivity());
        this.mAdapter.setHasStableIds(true);
        this.mAlbumCoverNum = this.mFragment.getResources().getInteger(R.integer.album_page_header_cover_num);
        this.mLocationsAlbumCoverServerIds = new ArrayList<>();
        this.mTagsAlbumCoverServerIds = new ArrayList<>();
        this.mLocationsSubject = PublishSubject.create();
        this.mTagsSubject = PublishSubject.create();
        subscribeSubject(this.mLocationsSubject, -3);
        subscribeSubject(this.mTagsSubject, -4);
        setSearchBackedAlbumCoversByPreferences();
        this.mRecyclerView.setAdapter(this.mAdapter);
        getLoaderManager().initLoader(-1, null, this);
    }

    private QueryLoader buildQueryLoaderByType(SectionType sectionType) {
        Builder builder = new Builder(SearchType.SEARCH_TYPE_RESULT_LIST);
        builder.addParam(nexExportFormat.TAG_FORMAT_TYPE, sectionType.getName());
        builder.addParam("pos", MovieStatUtils.DOWNLOAD_SUCCESS);
        builder.addParam("num", String.valueOf(this.mAlbumCoverNum));
        builder.addParam("secureMode", String.valueOf(true));
        builder.addParam("use_persistent_response", String.valueOf(true));
        return new QueryLoader(this.mFragment.getActivity(), builder.build(), new DataListResultProcessor());
    }

    private LoaderManager getLoaderManager() {
        return this.mFragment.getLoaderManager();
    }

    private boolean isAlbumCoverValid(Context context, long j) {
        Boolean bool = (Boolean) SafeDBUtil.safeQuery(context, Cloud.CLOUD_URI, new String[]{"count(*)"}, "serverId = ? AND ((localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))) AND ((localGroupId!=-1000))", new String[]{String.valueOf(j)}, (String) null, (QueryHandler<T>) $$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ.INSTANCE);
        return bool != null && bool.booleanValue();
    }

    static /* synthetic */ Boolean lambda$isAlbumCoverValid$23(Cursor cursor) {
        boolean z = false;
        if (cursor != null && cursor.moveToFirst() && cursor.getInt(0) > 0) {
            z = true;
        }
        return Boolean.valueOf(z);
    }

    public static /* synthetic */ Boolean lambda$null$24(AlbumPageHeaderController albumPageHeaderController, Long l) throws Exception {
        return Boolean.valueOf(l != null && l.longValue() > 0 && albumPageHeaderController.isAlbumCoverValid(GalleryApp.sGetAndroidContext(), l.longValue()));
    }

    static /* synthetic */ boolean lambda$null$25(Boolean bool) throws Exception {
        return !bool.booleanValue();
    }

    static /* synthetic */ Boolean lambda$null$27(Boolean bool, Boolean bool2) throws Exception {
        return Boolean.valueOf(bool.booleanValue() && bool2.booleanValue());
    }

    public static /* synthetic */ void lambda$subscribeSubject$29(AlbumPageHeaderController albumPageHeaderController, int i, Boolean bool) throws Exception {
        Log.d("AlbumPageHeaderController", "loader [%d] need restart [%b]", Integer.valueOf(i), Boolean.valueOf(!bool.booleanValue()));
        if (!bool.booleanValue()) {
            albumPageHeaderController.getLoaderManager().restartLoader(i, null, albumPageHeaderController);
        }
    }

    private String loaderId2Name(int i) {
        switch (i) {
            case -5:
                return "search_status";
            case -4:
                return "tags_album_cover";
            case -3:
                return "locations_album_cover";
            case -2:
                return "people_album_cover";
            case -1:
                return "people_album_cover_snapshot";
            default:
                return String.valueOf(i);
        }
    }

    private long parseAlbumCoverServerId(String str) {
        try {
            return Long.parseLong(Uri.parse(str).getQueryParameter("serverId"));
        } catch (Exception unused) {
            Log.e("AlbumPageHeaderController", "Invalid album cover Uri: %s", (Object) str);
            return -1;
        }
    }

    private ArrayList<FaceAlbumCover> parsePeopleCoversFromSnapshot(Cursor cursor) {
        if (cursor == null || cursor.isClosed() || cursor.getCount() <= 0) {
            return null;
        }
        ArrayList<FaceAlbumCover> arrayList = new ArrayList<>();
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            PeopleItem fromCursor = PeopleItem.fromCursor(cursor);
            if (fromCursor != null) {
                FaceAlbumCover faceAlbumCover = new FaceAlbumCover();
                faceAlbumCover.coverId = fromCursor.getCloudId();
                String str = !TextUtils.isEmpty(fromCursor.getThumbFile()) ? fromCursor.getThumbFile() : !TextUtils.isEmpty(fromCursor.getLocalFile()) ? fromCursor.getLocalFile() : fromCursor.getMicroThumbFile();
                faceAlbumCover.coverPath = str;
                faceAlbumCover.coverSha1 = fromCursor.getSha1();
                faceAlbumCover.coverSyncState = 0;
                faceAlbumCover.coverSize = fromCursor.getSize();
                FaceRegionRectF faceRegionRectF = new FaceRegionRectF(fromCursor.getFaceXScale(), fromCursor.getFaceYScale(), fromCursor.getFaceXScale() + fromCursor.getFaceWScale(), fromCursor.getFaceYScale() + fromCursor.getFaceHScale(), fromCursor.getExifOrientation());
                faceAlbumCover.faceRectF = faceRegionRectF;
                arrayList.add(faceAlbumCover);
            }
            cursor.moveToNext();
        }
        return arrayList;
    }

    private void setSearchBackedAlbumCoversByPreferences() {
        List locationsAlbumServerIds = SearchBackedAlbum.getLocationsAlbumServerIds();
        if (MiscUtil.isValid(locationsAlbumServerIds)) {
            this.mAdapter.setAlbumCover(1, Lists.newArrayList((Iterable<? extends E>) locationsAlbumServerIds));
        }
        List tagsAlbumServerIds = SearchBackedAlbum.getTagsAlbumServerIds();
        if (MiscUtil.isValid(tagsAlbumServerIds)) {
            this.mAdapter.setAlbumCover(2, Lists.newArrayList((Iterable<? extends E>) tagsAlbumServerIds));
        }
    }

    private void startDeferredLoad() {
        getLoaderManager().initLoader(-2, null, this);
        getLoaderManager().initLoader(-3, null, this);
        getLoaderManager().initLoader(-4, null, this);
        getLoaderManager().initLoader(-5, null, this);
        getLoaderManager().destroyLoader(-1);
    }

    private void statAlbumLoadTime(String str, long j, int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("loader", str);
        hashMap.put("costs", String.valueOf(j));
        hashMap.put("count", String.valueOf(i));
        GallerySamplingStatHelper.recordCountEvent("album_page_header", "classify_album_cover_load_time", hashMap);
    }

    private void subscribeSubject(PublishSubject<ArrayList<Long>> publishSubject, int i) {
        this.mCompositeDisposable.add(publishSubject.observeOn(GallerySchedulers.misc()).switchMap(new Function(i) {
            private final /* synthetic */ int f$1;

            {
                this.f$1 = r2;
            }

            public final Object apply(Object obj) {
                return Flowable.fromIterable((ArrayList) obj).map(new Function() {
                    public final Object apply(Object obj) {
                        return AlbumPageHeaderController.lambda$null$24(AlbumPageHeaderController.this, (Long) obj);
                    }
                }).takeUntil($$Lambda$AlbumPageHeaderController$pIK9VJvmhl8spqi_rk5eabbG0hI.INSTANCE).doOnCancel(new Action(this.f$1) {
                    private final /* synthetic */ int f$0;

                    {
                        this.f$0 = r1;
                    }

                    public final void run() {
                        Log.d("AlbumPageHeaderController", "doOnCancel for [%d]", (Object) Integer.valueOf(this.f$0));
                    }
                }).reduce($$Lambda$AlbumPageHeaderController$CCJXUj62jmfWFJAjAoqtiujldDU.INSTANCE).toObservable();
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer(i) {
            private final /* synthetic */ int f$1;

            {
                this.f$1 = r2;
            }

            public final void accept(Object obj) {
                AlbumPageHeaderController.lambda$subscribeSubject$29(AlbumPageHeaderController.this, this.f$1, (Boolean) obj);
            }
        }));
    }

    private void takeSnapshot4PeopleAlbum() {
        Completable.defer($$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg.INSTANCE).delaySubscription(1500, TimeUnit.MILLISECONDS, GallerySchedulers.misc()).subscribe();
    }

    private void updateSearchStatus(int i) {
        if (i != this.mSearchStatus) {
            if (SearchConstants.isErrorStatus(this.mSearchStatus) && !SearchConstants.isErrorStatus(i)) {
                getLoaderManager().restartLoader(-3, null, this);
                getLoaderManager().restartLoader(-4, null, this);
            }
            this.mSearchStatus = i;
        }
    }

    public View getView() {
        return this.mRecyclerView;
    }

    public /* synthetic */ void onCreate(LifecycleOwner lifecycleOwner) {
        CC.$default$onCreate(this, lifecycleOwner);
    }

    public Loader onCreateLoader(int i, Bundle bundle) {
        this.mIsManualLoad.put(i, true);
        this.mLoaderCreateTime.put(i, System.currentTimeMillis());
        switch (i) {
            case -5:
                return new SearchStatusLoader(this.mFragment.getActivity(), null);
            case -4:
                return buildQueryLoaderByType(SectionType.SECTION_TYPE_TAG_LIST);
            case -3:
                return buildQueryLoaderByType(SectionType.SECTION_TYPE_LOCATION_LIST);
            case -2:
                CursorLoader cursorLoader = new CursorLoader(this.mFragment.getActivity());
                cursorLoader.setUri(PeopleFace.PEOPLE_FACE_COVER_URI);
                return cursorLoader;
            case -1:
                CursorLoader cursorLoader2 = new CursorLoader(this.mFragment.getActivity());
                CursorLoader cursorLoader3 = cursorLoader2;
                cursorLoader3.setUri(UriUtil.appendLimit(PeopleFace.PEOPLE_SNAPSHOT_URI, this.mAlbumCoverNum));
                cursorLoader3.setProjection(PeopleItem.COMPAT_PROJECTION);
                return cursorLoader2;
            default:
                return null;
        }
    }

    public void onDestroy(LifecycleOwner lifecycleOwner) {
        this.mFragment.getLifecycle().removeObserver(this);
        this.mCompositeDisposable.dispose();
    }

    public void onLoadFinished(Loader loader, Object obj) {
        int id = loader.getId();
        long currentTimeMillis = System.currentTimeMillis();
        ArrayList arrayList = null;
        switch (loader.getId()) {
            case -5:
                if (obj instanceof Integer) {
                    updateSearchStatus(((Integer) obj).intValue());
                    break;
                }
                break;
            case -4:
                if (obj instanceof DataListSourceResult) {
                    this.mTagsAlbumCoverServerIds.clear();
                    SuggestionCursor data = ((DataListSourceResult) obj).getData();
                    if (data != null && data.getCount() > 0) {
                        arrayList = new ArrayList();
                        data.moveToFirst();
                        while (!data.isAfterLast()) {
                            String suggestionIcon = data.getSuggestionIcon();
                            arrayList.add(suggestionIcon);
                            this.mTagsAlbumCoverServerIds.add(Long.valueOf(parseAlbumCoverServerId(suggestionIcon)));
                            data.moveToNext();
                        }
                    }
                }
                this.mAdapter.setAlbumCover(2, arrayList);
                SearchBackedAlbum.setTagsAlbumServerIds(arrayList);
                break;
            case -3:
                if (obj instanceof DataListSourceResult) {
                    this.mLocationsAlbumCoverServerIds.clear();
                    SuggestionCursor data2 = ((DataListSourceResult) obj).getData();
                    if (data2 != null && data2.getCount() > 0) {
                        arrayList = new ArrayList();
                        data2.moveToFirst();
                        while (!data2.isAfterLast()) {
                            String suggestionIcon2 = data2.getSuggestionIcon();
                            arrayList.add(suggestionIcon2);
                            this.mLocationsAlbumCoverServerIds.add(Long.valueOf(parseAlbumCoverServerId(suggestionIcon2)));
                            data2.moveToNext();
                        }
                    }
                }
                this.mAdapter.setAlbumCover(1, arrayList);
                SearchBackedAlbum.setLocationsAlbumServerIds(arrayList);
                break;
            case -2:
                Cursor cursor = obj instanceof Cursor ? (Cursor) obj : null;
                if (!(cursor == null || cursor.getExtras() == null)) {
                    arrayList = cursor.getExtras().getParcelableArrayList("face_album_cover");
                }
                this.mAdapter.setAlbumCover(0, arrayList);
                if (MiscUtil.isValid(arrayList) && !this.mIsPeopleAlbumSnapshotValid) {
                    this.mIsPeopleAlbumSnapshotValid = true;
                    takeSnapshot4PeopleAlbum();
                    break;
                }
            case -1:
                if (obj instanceof Cursor) {
                    try {
                        ArrayList parsePeopleCoversFromSnapshot = parsePeopleCoversFromSnapshot((Cursor) obj);
                        if (MiscUtil.isValid(parsePeopleCoversFromSnapshot)) {
                            this.mAdapter.setAlbumCover(0, parsePeopleCoversFromSnapshot);
                            this.mIsPeopleAlbumSnapshotValid = true;
                        }
                    } finally {
                        MiscUtil.closeSilently((Cursor) obj);
                    }
                }
                startDeferredLoad();
                break;
        }
        if (this.mIsManualLoad.get(id)) {
            this.mIsManualLoad.put(id, false);
            long j = currentTimeMillis - this.mLoaderCreateTime.get(id);
            Log.d("AlbumPageHeaderController", "load [%d] items for [%s] costs [%d ms]", Integer.valueOf(this.mAlbumCoverNum), loaderId2Name(id), Long.valueOf(j));
            statAlbumLoadTime(loaderId2Name(id), j, this.mAlbumCoverNum);
        }
    }

    public void onLoaderReset(Loader loader) {
    }

    public /* synthetic */ void onPause(LifecycleOwner lifecycleOwner) {
        CC.$default$onPause(this, lifecycleOwner);
    }

    public void onResume(LifecycleOwner lifecycleOwner) {
        if (MiscUtil.isValid(this.mLocationsAlbumCoverServerIds)) {
            this.mLocationsSubject.onNext(new ArrayList(this.mLocationsAlbumCoverServerIds));
        }
        if (MiscUtil.isValid(this.mTagsAlbumCoverServerIds)) {
            this.mTagsSubject.onNext(new ArrayList(this.mTagsAlbumCoverServerIds));
        }
    }

    public /* synthetic */ void onStart(LifecycleOwner lifecycleOwner) {
        CC.$default$onStart(this, lifecycleOwner);
    }

    public /* synthetic */ void onStop(LifecycleOwner lifecycleOwner) {
        CC.$default$onStop(this, lifecycleOwner);
    }
}

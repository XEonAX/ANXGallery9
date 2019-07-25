package com.miui.gallery.ui;

import android.app.Fragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter.AlbumType;
import com.miui.gallery.adapter.AlbumDetailTimeLineAdapter;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.preference.GalleryPreferences.Secret;
import com.miui.gallery.ui.BaseAlbumOperationDialogFragment.OnAlbumOperationDoneListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.widget.ScrollableViewDrawer;
import com.miui.gallery.widget.SortByHeader;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.privacy.LockSettingsHelper;

public class AlbumDetailFragment extends AlbumDetailFragmentBase {
    private AlbumDetailSimpleAdapter mAlbumDetailSimpleAdapter;
    private AlbumDetailTimeLineAdapter mAlbumDetailTimelineAdapter;
    /* access modifiers changed from: private */
    public SortBy mCurrentSortBy = SortBy.NONE;
    private ScrollableViewDrawer mDrawer;
    private MenuStatusManager mMenuStatusManager;
    private boolean mNeedConfirmPassWord;
    private OnAlbumOperationDoneListener mOnAlbumRenamedListener = new OnAlbumOperationDoneListener() {
        public void onOperationDone(long j, String str) {
            if (j > 0 && AlbumDetailFragment.this.isAdded()) {
                AlbumDetailFragment.this.mAlbumName = str;
                AlbumDetailFragment.this.updateActionBarTitle();
            }
        }
    };
    private OnSortByClickListener mOnSortByClickListener;
    /* access modifiers changed from: private */
    public SortByHeader mSortByHeader;
    private int mSortByHeaderPaddingTop;
    private String mSortOrder = " DESC ";

    private class AlbumDetailLoaderCallback implements LoaderCallbacks {
        private AlbumDetailLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
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
            CursorLoader cursorLoader = new CursorLoader(AlbumDetailFragment.this.mActivity);
            AlbumDetailFragment.this.configLoader(cursorLoader, SortBy.DATE);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            AlbumDetailSimpleAdapter adapter = AlbumDetailFragment.this.getAdapter();
            adapter.swapCursor((Cursor) obj);
            AlbumDetailFragment.this.mAlbumDetailGridViewWrapper.setAdapter(adapter);
            AlbumDetailFragment.this.mAlbumDetailGridViewWrapper.setOnScrollListener(adapter.generateWrapScrollListener(null));
            AlbumDetailFragment.this.mSortByHeader.updateCurrentSortView(AlbumDetailFragment.this.mCurrentSortBy, AlbumDetailFragment.this.getSortByIndicatorResource());
            AlbumDetailFragment.this.updateActionBarTitle();
            if (adapter.getCount() == 0) {
                AlbumDetailFragment.this.mEmptyView.setVisibility(0);
            } else {
                AlbumDetailFragment.this.mEmptyView.setVisibility(8);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class OnSortByClickListener implements OnClickListener {
        private OnSortByClickListener() {
        }

        public void onClick(View view) {
            Loader loader = AlbumDetailFragment.this.getLoaderManager().getLoader(1);
            int id = view.getId();
            if (id == R.id.datetime_container) {
                AlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.DATE);
                GallerySamplingStatHelper.recordCountEvent("album_detail", "sort_by_date");
            } else if (id == R.id.name_container) {
                AlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.NAME);
                GallerySamplingStatHelper.recordCountEvent("album_detail", "sort_by_name");
            } else if (id == R.id.size_container) {
                GallerySamplingStatHelper.recordCountEvent("album_detail", "sort_by_size");
                AlbumDetailFragment.this.configLoader((CursorLoader) loader, SortBy.SIZE);
            }
            loader.forceLoad();
        }
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
            if (sortBy == SortBy.DATE) {
                this.mSortOrder = " DESC ";
            } else {
                this.mSortOrder = " ASC ";
            }
            this.mCurrentSortBy = sortBy;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(sortByString);
        sb.append(this.mSortOrder);
        String sb2 = sb.toString();
        onSortByChanged();
        return sb2;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    private void doChangeShowInPhotosTab(boolean z) {
        MediaAndAlbumOperations.doChangeShowInPhotosTab(this.mActivity, this.mAlbumId, z);
        this.mMenuStatusManager.onShowInPhotosTabStatusChanged(z);
    }

    private void doRename() {
        AlbumRenameDialogFragment.newInstance(this.mAlbumId, this.mAlbumName, this.mOnAlbumRenamedListener).showAllowingStateLoss(getFragmentManager(), "AlbumRenameDialogFragment");
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

    private boolean isCameraAlbum() {
        Intent intent = this.mActivity.getIntent();
        if (intent != null) {
            return TextUtils.equals(intent.getStringExtra("album_server_id"), String.valueOf(1));
        }
        return false;
    }

    private boolean isNeedConfirmPassWord() {
        return isSecretAlbum() && this.mNeedConfirmPassWord && !isInPhotoPage();
    }

    private void onSortByChanged() {
        getAdapter().setCurrentSortBy(this.mCurrentSortBy);
        if (this.mCurrentSortBy == SortBy.DATE) {
            setViewPaddingTop(this.mSortByHeader, this.mSortByHeaderPaddingTop);
            setViewPaddingTop(this.mDrawer, 0);
            return;
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.micro_thumb_horizontal_spacing);
        setViewPaddingTop(this.mSortByHeader, this.mSortByHeaderPaddingTop - dimensionPixelSize);
        setViewPaddingTop(this.mDrawer, dimensionPixelSize);
    }

    private void setViewPaddingTop(View view, int i) {
        view.setPadding(view.getPaddingLeft(), i, view.getPaddingRight(), view.getPaddingBottom());
    }

    private boolean showOptionsMenu() {
        return !isVirtualAlbum() && !this.mMenuStatusManager.isUnWriteable();
    }

    private boolean sortByChangeable() {
        return !isDailyAlbum();
    }

    /* access modifiers changed from: private */
    public void updateActionBarTitle() {
        this.mActivity.getActionBar().setTitle(this.mAlbumName);
    }

    /* access modifiers changed from: protected */
    public boolean doChangeAutoUpload(boolean z) {
        if (!super.doChangeAutoUpload(z)) {
            return false;
        }
        this.mMenuStatusManager.onAutoUploadStatusChanged(z);
        return true;
    }

    /* access modifiers changed from: protected */
    public void doChangeShowInOtherAlbums(boolean z) {
        super.doChangeShowInOtherAlbums(z);
        this.mMenuStatusManager.onShowInOtherAlbumsStatusChanged(z);
    }

    public void finish() {
        if (this.mActivity != null && !this.mActivity.isFinishing()) {
            this.mActivity.finish();
        }
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 69
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    public AlbumDetailSimpleAdapter getAdapter() {
        if (this.mCurrentSortBy != SortBy.DATE || isDailyAlbum()) {
            if (this.mAlbumDetailSimpleAdapter == null) {
                this.mAlbumDetailSimpleAdapter = new AlbumDetailSimpleAdapter(this.mActivity);
                if (this.mIsOtherShareAlbum) {
                    this.mAlbumDetailSimpleAdapter.setAlbumType(AlbumType.OTHER_SHARE);
                } else if (this.mIsScreenshotAlbum) {
                    this.mAlbumDetailSimpleAdapter.setAlbumType(AlbumType.SCREENSHOT);
                } else if (isSecretAlbum()) {
                    this.mAlbumDetailSimpleAdapter.setAlbumType(AlbumType.SECRET);
                } else if (isPanoAlbum()) {
                    this.mAlbumDetailSimpleAdapter.setAlbumType(AlbumType.PANO);
                } else if (isFavoritesAlbum()) {
                    this.mAlbumDetailSimpleAdapter.setAlbumType(AlbumType.FAVORITES);
                }
            }
            return this.mAlbumDetailSimpleAdapter;
        }
        if (this.mAlbumDetailTimelineAdapter == null) {
            this.mAlbumDetailTimelineAdapter = new AlbumDetailTimeLineAdapter(this.mActivity);
            if (this.mIsOtherShareAlbum) {
                this.mAlbumDetailTimelineAdapter.setAlbumType(AlbumType.OTHER_SHARE);
            } else if (this.mIsScreenshotAlbum) {
                this.mAlbumDetailTimelineAdapter.setAlbumType(AlbumType.SCREENSHOT);
            } else if (isSecretAlbum()) {
                this.mAlbumDetailTimelineAdapter.setAlbumType(AlbumType.SECRET);
            } else if (isPanoAlbum()) {
                this.mAlbumDetailTimelineAdapter.setAlbumType(AlbumType.PANO);
            } else if (isFavoritesAlbum()) {
                this.mAlbumDetailTimelineAdapter.setAlbumType(AlbumType.FAVORITES);
            }
        }
        return this.mAlbumDetailTimelineAdapter;
    }

    /* access modifiers changed from: protected */
    public String getCreatorIdByPosition(int i) {
        return getAdapter().getCreatorId(i);
    }

    /* access modifiers changed from: protected */
    public String getCurrentSortOrder() {
        StringBuilder sb = new StringBuilder();
        sb.append(getSortByString(this.mCurrentSortBy));
        sb.append(this.mSortOrder);
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.album_detail;
    }

    /* access modifiers changed from: protected */
    public LoaderCallbacks getLoaderCallback() {
        if (this.mAlbumDetailLoaderCallback == null) {
            this.mAlbumDetailLoaderCallback = new AlbumDetailLoaderCallback();
        }
        return this.mAlbumDetailLoaderCallback;
    }

    public String getPageName() {
        return isSecretAlbum() ? "album_secret" : isFavoritesAlbum() ? "album_favorites" : isCameraAlbum() ? "album_camera" : isVideoAlbum() ? "album_video" : this.mIsScreenshotAlbum ? "album_screenshot" : "album_detail";
    }

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getViewAdapter() {
        ListAdapter adapter = this.mAlbumDetailGridViewWrapper.getAdapter();
        return (adapter == null || !(adapter instanceof AlbumDetailSimpleAdapter)) ? super.getViewAdapter() : (AlbumDetailSimpleAdapter) adapter;
    }

    /* access modifiers changed from: protected */
    public boolean needEnableAutoUpload() {
        return this.mMenuStatusManager.canEnableAutoUpload();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mActivity.setImmersionMenuEnabled(showOptionsMenu());
        if (isSecretAlbum()) {
            this.mActivity.getWindow().addFlags(8192);
        }
        if (bundle != null) {
            this.mCurrentSortBy = (SortBy) bundle.getSerializable("album_detail_sort_by");
            if (sortByChangeable() && bundle.getBoolean("album_detail_drawer_state", false)) {
                this.mDrawer.openDrawer();
            }
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 27) {
            if (i2 != -1) {
                finish();
            } else {
                this.mNeedConfirmPassWord = false;
            }
            return;
        }
        super.onActivityResult(i, i2, intent);
    }

    public boolean onBackPressed() {
        if (!isSecretAlbum() || !Secret.isFirstAddSecret()) {
            return false;
        }
        Secret.setIsFirstAddSecret(false);
        SecretTipDialogFragment secretTipDialogFragment = new SecretTipDialogFragment();
        secretTipDialogFragment.setOnDismissListener(new OnDismissListener() {
            public void onDismiss(DialogInterface dialogInterface) {
                AlbumDetailFragment.this.finish();
            }
        });
        secretTipDialogFragment.showAllowingStateLoss(getActivity().getFragmentManager(), "SecretTip");
        return true;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(R.menu.album_detail_page_options, menu);
    }

    public void onDestroy() {
        if (this.mAlbumDetailSimpleAdapter != null) {
            this.mAlbumDetailSimpleAdapter.swapCursor(null);
        }
        if (this.mAlbumDetailTimelineAdapter != null) {
            this.mAlbumDetailTimelineAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onEnterActionMode() {
        if (this.mMenuStatusManager.canShowInPhotosTab()) {
            ImageSelectionTipFragment.showImageSelectionTipDialogIfNecessary(getActivity());
        }
        GallerySamplingStatHelper.recordNumericPropertyEvent("best_image", "best_image_count", (long) ImageFeatureCacheManager.getInstance().getBestImageCount(false));
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 38
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
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
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        Intent intent = this.mActivity.getIntent();
        MenuStatusManager menuStatusManager = new MenuStatusManager(this.mActivity, intent.getStringExtra("album_server_id"), intent.getLongExtra("attributes", 0), intent.getBooleanExtra("album_unwriteable", false), isOthersShareAlbum(), intent.getStringExtra("album_local_path"));
        this.mMenuStatusManager = menuStatusManager;
        this.mOnSortByClickListener = new OnSortByClickListener();
        if (!TextUtils.isEmpty(this.mAlbumName)) {
            updateActionBarTitle();
        }
        this.mDrawer = (ScrollableViewDrawer) onInflateView.findViewById(R.id.drawer);
        this.mSortByHeader = (SortByHeader) onInflateView.findViewById(R.id.sortby_header);
        this.mSortByHeaderPaddingTop = this.mSortByHeader.getPaddingTop();
        this.mSortByHeader.setOnSortByClickListener(this.mOnSortByClickListener);
        if (!sortByChangeable()) {
            this.mDrawer.setDragEnabled(false);
        }
        return onInflateView;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                if (!onBackPressed() && isAdded() && isResumed()) {
                    finish();
                }
                return true;
            case R.id.menu_disable_auto_upload /*2131296709*/:
                disableAutoUpload();
                GallerySamplingStatHelper.recordCountEvent("album_detail", "auto_upload_disable");
                return true;
            case R.id.menu_enable_auto_upload /*2131296712*/:
                enableAutoUpload();
                GallerySamplingStatHelper.recordCountEvent("album_detail", "auto_upload_enable");
                return true;
            case R.id.menu_move_to_other_albums /*2131296715*/:
                moveToOtherAlbums();
                GallerySamplingStatHelper.recordCountEvent("album_detail", "show_in_others_enable");
                return true;
            case R.id.menu_not_show_in_photos_tab /*2131296716*/:
                GallerySamplingStatHelper.recordCountEvent("album_detail", "show_in_home_disable");
                doChangeShowInPhotosTab(false);
                return true;
            case R.id.menu_remove_from_other_albums /*2131296722*/:
                removeFromOtherAlbums();
                GallerySamplingStatHelper.recordCountEvent("album_detail", "show_in_others_disable");
                return true;
            case R.id.menu_rename /*2131296723*/:
                doRename();
                GallerySamplingStatHelper.recordCountEvent("album", "rename_album");
                return true;
            case R.id.menu_show_in_photos_tab /*2131296727*/:
                doChangeShowInPhotosTab(true);
                GallerySamplingStatHelper.recordCountEvent("album_detail", "show_in_home_enable");
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    /* access modifiers changed from: protected */
    public void onPhotoPageDestroy(Intent intent) {
        super.onPhotoPageDestroy(intent);
        this.mNeedConfirmPassWord = false;
    }

    public void onPrepareOptionsMenu(Menu menu) {
        MenuItem findItem = menu.findItem(R.id.menu_add_photos);
        MenuItem findItem2 = menu.findItem(R.id.menu_remove_from_other_albums);
        MenuItem findItem3 = menu.findItem(R.id.menu_move_to_other_albums);
        MenuItem findItem4 = menu.findItem(R.id.menu_enable_auto_upload);
        MenuItem findItem5 = menu.findItem(R.id.menu_disable_auto_upload);
        MenuItem findItem6 = menu.findItem(R.id.menu_show_in_photos_tab);
        MenuItem findItem7 = menu.findItem(R.id.menu_not_show_in_photos_tab);
        MenuItem findItem8 = menu.findItem(R.id.menu_share);
        MenuItem findItem9 = menu.findItem(R.id.menu_rename);
        if (SyncUtil.isGalleryCloudSyncable(getActivity())) {
            findItem4.setVisible(this.mMenuStatusManager.canEnableAutoUpload());
            findItem5.setVisible(this.mMenuStatusManager.canDisableAutoUpload());
        } else {
            findItem4.setVisible(false);
            findItem5.setVisible(false);
        }
        findItem2.setVisible(this.mMenuStatusManager.canDisableShowInOtherAlbums());
        findItem3.setVisible(this.mMenuStatusManager.canEnableShowInOtherAlbums());
        findItem.setVisible(this.mMenuStatusManager.canAddPhotos());
        findItem6.setVisible(this.mMenuStatusManager.canEnableShowInPhotosTab());
        findItem7.setVisible(this.mMenuStatusManager.canDisableShowInPhotosTab());
        findItem8.setVisible(this.mMenuStatusManager.canShare());
        findItem9.setVisible(this.mMenuStatusManager.canRename());
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [android.app.Fragment, com.miui.gallery.ui.AlbumDetailFragment, com.miui.gallery.ui.AlbumDetailFragmentBase] */
    public void onResume() {
        super.onResume();
        if (isNeedConfirmPassWord()) {
            this.mNeedConfirmPassWord = false;
            LockSettingsHelper.startAuthenticatePasswordActivity((Fragment) this, 27);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putSerializable("album_detail_sort_by", this.mCurrentSortBy);
        bundle.putBoolean("album_detail_drawer_state", this.mDrawer.isDrawerOpen());
    }

    public void onStop() {
        super.onStop();
        this.mNeedConfirmPassWord = true;
    }
}

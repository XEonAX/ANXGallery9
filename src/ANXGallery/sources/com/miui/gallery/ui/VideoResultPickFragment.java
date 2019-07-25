package com.miui.gallery.ui;

import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter.AlbumType;
import com.miui.gallery.adapter.AlbumDetailTimeLineAdapter;
import com.miui.gallery.adapter.CleanerPhotoPickBaseAdapter;
import com.miui.gallery.cleaner.ScannerManager;
import com.miui.gallery.cleaner.VideoScanner;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.SortByHeader;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.SimpleMultiChoiceModeListener;
import java.util.HashMap;
import miui.gallery.support.MiuiSdkCompat;

public class VideoResultPickFragment extends PhotoListFragmentBase {
    public static final int[] DELETE_COUNT_STAGE = {20, 50, 100, 200, 500, 1000};
    /* access modifiers changed from: private */
    public AlbumDetailTimeLineAdapter mAdapter;
    /* access modifiers changed from: private */
    public SortBy mCurrentSortBy = SortBy.DATE;
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            if (VideoResultPickFragment.this.mIsFirstLoadFinish && VideoResultPickFragment.this.mAdapter.getCount() > 0) {
                VideoResultPickFragment.this.mIsFirstLoadFinish = false;
                VideoResultPickFragment.this.mGridViewWrapper.setAllItemsCheckState(true);
            }
            VideoResultPickFragment.this.onItemSelectedChanged();
        }
    };
    private Button mDeleteButton;
    private OnClickListener mDeleteButtonClickListener = new OnClickListener() {
        /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 15
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
        public void onClick(View view) {
            long[] checkedItemIds = VideoResultPickFragment.this.mGridViewWrapper.getCheckedItemIds();
            if (checkedItemIds != null && checkedItemIds.length > 0) {
                MediaAndAlbumOperations.delete(VideoResultPickFragment.this.mActivity, "VideoResultPickFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
                    /* JADX WARNING: type inference failed for: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: type inference failed for: r0v17, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 54
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
                    /* JADX WARNING: Unknown variable types count: 2 */
                    public void onDeleted(int i, long[] jArr) {
                        if (VideoResultPickFragment.this.mActivity != null) {
                            ToastUtils.makeText((Context) VideoResultPickFragment.this.mActivity, (CharSequence) VideoResultPickFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                            if (i > 0) {
                                SoundUtils.playSoundForOperation(VideoResultPickFragment.this.mActivity, 0);
                            }
                            VideoResultPickFragment.this.mScanner.removeItems(jArr);
                            VideoResultPickFragment.this.mScanResultIds = VideoResultPickFragment.this.mScanner.getScanResultIds();
                            VideoResultPickFragment.this.mGridViewWrapper.setAllItemsCheckState(false);
                            if (VideoResultPickFragment.this.mScanResultIds.length <= 0) {
                                VideoResultPickFragment.this.mActivity.finish();
                            }
                            HashMap hashMap = new HashMap();
                            hashMap.put("deleteCount", GallerySamplingStatHelper.formatValueStage((float) i, VideoResultPickFragment.DELETE_COUNT_STAGE));
                            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_video_used", hashMap);
                        }
                    }
                }, -1, "", 0, 47, checkedItemIds);
            }
        }
    };
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mGridViewWrapper;
    /* access modifiers changed from: private */
    public boolean mIsFirstLoadFinish = true;
    private SimpleMultiChoiceModeListener mMultiChoiceModeListener = new SimpleMultiChoiceModeListener() {
        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            VideoResultPickFragment.this.onItemSelectedChanged();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            VideoResultPickFragment.this.onItemSelectedChanged();
        }
    };
    private OnClickListener mOnSortByClickListener = new OnClickListener() {
        public void onClick(View view) {
            Loader loader = VideoResultPickFragment.this.getLoaderManager().getLoader(1);
            int id = view.getId();
            if (id == R.id.datetime_container) {
                VideoResultPickFragment.this.configLoader((CursorLoader) loader, SortBy.DATE);
                GallerySamplingStatHelper.recordCountEvent("cleaner", "video_sort_by_date");
            } else if (id == R.id.size_container) {
                GallerySamplingStatHelper.recordCountEvent("cleaner", "video_sort_by_size");
                VideoResultPickFragment.this.configLoader((CursorLoader) loader, SortBy.SIZE);
            }
            loader.forceLoad();
            VideoResultPickFragment.this.mSortByHeader.updateCurrentSortView(VideoResultPickFragment.this.mCurrentSortBy, VideoResultPickFragment.this.getSortByIndicatorResource());
        }
    };
    /* access modifiers changed from: private */
    public long[] mScanResultIds;
    /* access modifiers changed from: private */
    public VideoScanner mScanner;
    private Button mSelectButton;
    private OnClickListener mSelectListener = new OnClickListener() {
        public void onClick(View view) {
            boolean z = !VideoResultPickFragment.this.mGridViewWrapper.isAllItemsChecked();
            VideoResultPickFragment.this.mGridViewWrapper.setAllItemsCheckState(z);
            if (!z) {
                GallerySamplingStatHelper.recordCountEvent("cleaner", "similar_keep_clear_cancel");
            }
        }
    };
    /* access modifiers changed from: private */
    public SortByHeader mSortByHeader;
    private String mSortOrder = " DESC ";

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

    /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 23
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
    public void onItemSelectedChanged() {
        if (this.mAdapter.getCount() > 0) {
            this.mDeleteButton.setEnabled(this.mGridViewWrapper.getCheckedItemCount() > 0);
            this.mSelectButton.setVisibility(0);
            MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mSelectButton, this.mGridViewWrapper.isAllItemsChecked());
            return;
        }
        this.mDeleteButton.setEnabled(false);
        this.mSelectButton.setVisibility(8);
    }

    private void onSortByChanged() {
        getAdapter().setCurrentSortBy(this.mCurrentSortBy);
        this.mGridViewWrapper.clearChoices();
    }

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.video_result_pick_layout;
    }

    public String getPageName() {
        return "cleaner_video_result_pick";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return String.format("%s IN (%s) AND %s", new Object[]{"_id", TextUtils.join(",", MiscUtil.arrayToList(this.mScanResultIds)), VideoScanner.VALID_FILE});
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return getUri(this.mCurrentSortBy);
    }

    /* access modifiers changed from: protected */
    public Uri getUri(SortBy sortBy) {
        Uri build = Media.URI_OWNER_ALBUM_MEDIA.buildUpon().build();
        return sortBy == SortBy.DATE ? build.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build() : build;
    }

    /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 65
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
        this.mActivity.getActionBar().setTitle(R.string.cleaner_video_title);
        this.mAdapter = new CleanerPhotoPickBaseAdapter(this.mActivity);
        this.mAdapter.setCurrentSortBy(SortBy.DATE);
        this.mAdapter.setAlbumType(AlbumType.NORMAL);
        this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
        this.mGridViewWrapper = new EditableListViewWrapperDeprecated(this.mAlbumDetailGridView);
        this.mGridViewWrapper.setAdapter(this.mAdapter);
        this.mGridViewWrapper.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mGridViewWrapper.setMultiChoiceModeListener(this.mMultiChoiceModeListener);
        this.mGridViewWrapper.disableScaleImageViewAniWhenInActionMode();
        this.mGridViewWrapper.startChoiceMode();
        this.mDeleteButton = (Button) onInflateView.findViewById(R.id.delete);
        this.mDeleteButton.setOnClickListener(this.mDeleteButtonClickListener);
        this.mSelectButton = (Button) this.mActivity.getActionBar().getCustomView().findViewById(R.id.do_select);
        this.mSelectButton.setOnClickListener(this.mSelectListener);
        this.mScanner = (VideoScanner) ScannerManager.getInstance().getScanner(2);
        this.mScanResultIds = this.mScanner.getScanResultIds();
        this.mSortByHeader = (SortByHeader) onInflateView.findViewById(R.id.sortby_header);
        this.mSortByHeader.setOnSortByClickListener(this.mOnSortByClickListener);
        this.mSortByHeader.updateCurrentSortView(this.mCurrentSortBy, getSortByIndicatorResource());
        return onInflateView;
    }
}

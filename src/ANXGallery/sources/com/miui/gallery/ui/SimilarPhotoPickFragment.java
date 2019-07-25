package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.database.CursorWrapper;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.SimilarPhotoPickAdapter;
import com.miui.gallery.cleaner.BaseScanner.OnScanResultUpdateListener;
import com.miui.gallery.cleaner.ScanResult;
import com.miui.gallery.cleaner.ScannerManager;
import com.miui.gallery.cleaner.SimilarScanner;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.LoadMoreLayout;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.SimpleMultiChoiceModeListener;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import miui.widget.SlidingButton;

public class SimilarPhotoPickFragment extends PhotoListFragmentBase {
    public static final int[] DELETE_COUNT_STAGE = {20, 50, 100, 200, 500, 1000};
    /* access modifiers changed from: private */
    public SimilarPhotoPickAdapter mAdapter;
    /* access modifiers changed from: private */
    public ArrayList<Long> mCheckedHeaderGroupId = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<Long> mClusterGroupId;
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            if (SimilarPhotoPickFragment.this.mIsFirstLoadFinish && SimilarPhotoPickFragment.this.mAdapter.getCount() > 0) {
                SimilarPhotoPickFragment.this.mIsFirstLoadFinish = false;
                if (SimilarPhotoPickFragment.this.mKeepClearCheckBox.isChecked()) {
                    SimilarPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(true);
                }
            }
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
            long[] checkedItemIds = SimilarPhotoPickFragment.this.mGridViewWrapper.getCheckedItemIds();
            if (checkedItemIds != null && checkedItemIds.length > 0) {
                MediaAndAlbumOperations.delete(SimilarPhotoPickFragment.this.mActivity, "SimilarPhotoPickFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
                    /* JADX WARNING: type inference failed for: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: type inference failed for: r0v19, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 59
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
                        if (SimilarPhotoPickFragment.this.mActivity != null) {
                            ToastUtils.makeText((Context) SimilarPhotoPickFragment.this.mActivity, (CharSequence) SimilarPhotoPickFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                            if (i > 0) {
                                SoundUtils.playSoundForOperation(SimilarPhotoPickFragment.this.mActivity, 0);
                            }
                            SimilarPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(false);
                            SimilarPhotoPickFragment.this.mKeepClearCheckBox.setChecked(false);
                            SimilarPhotoPickFragment.this.mScanner.removeItems(jArr);
                            SimilarPhotoPickFragment.this.resetScanResult();
                            if (SimilarPhotoPickFragment.this.mScanResultIds.size() <= 0 && !SimilarPhotoPickFragment.this.mScanner.isLoadingValid()) {
                                SimilarPhotoPickFragment.this.mActivity.finish();
                            }
                            HashMap hashMap = new HashMap();
                            hashMap.put("deleteCount", GallerySamplingStatHelper.formatValueStage((float) i, SimilarPhotoPickFragment.DELETE_COUNT_STAGE));
                            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_similar_used", hashMap);
                        }
                    }
                }, -1, "", 0, 48, checkedItemIds);
            }
        }
    };
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mGridViewWrapper;
    /* access modifiers changed from: private */
    public ArrayList<Integer> mGroupItemCount;
    /* access modifiers changed from: private */
    public ArrayList<Integer> mGroupStartPos;
    /* access modifiers changed from: private */
    public boolean mIsFirstLoadFinish = true;
    /* access modifiers changed from: private */
    public boolean mIsScrolling = false;
    /* access modifiers changed from: private */
    public SlidingButton mKeepClearCheckBox;
    private OnCheckedChangeListener mKeepClearCheckListener = new OnCheckedChangeListener() {
        public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
            SimilarPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(z);
            if (!z) {
                GallerySamplingStatHelper.recordCountEvent("cleaner", "similar_keep_clear_cancel");
            }
        }
    };
    /* access modifiers changed from: private */
    public LoadMoreLayout mLoadMoreLayout;
    private SimpleMultiChoiceModeListener mMultiChoiceModeListener = new SimpleMultiChoiceModeListener() {
        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            SimilarPhotoPickFragment.this.mCheckedHeaderGroupId.clear();
            SimilarPhotoPickFragment.this.keepClearPhotos();
            SimilarPhotoPickFragment.this.onItemSelectedChanged();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            SimilarPhotoPickFragment.this.onItemSelectedChanged();
        }
    };
    /* access modifiers changed from: private */
    public boolean mNeedResetLoader;
    private OnScanResultUpdateListener mOnScanResultUpdateListener = new OnScanResultUpdateListener() {
        public void onUpdate(int i, long j, ScanResult scanResult) {
            if (SimilarPhotoPickFragment.this.getActivity() != null && i == 3) {
                if (SimilarPhotoPickFragment.this.mIsScrolling) {
                    SimilarPhotoPickFragment.this.mNeedResetLoader = true;
                } else {
                    SimilarPhotoPickFragment.this.restartLoader();
                }
            }
        }
    };
    private OnScrollListener mOnScrollListener = new OnScrollListener() {
        public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        }

        public void onScrollStateChanged(AbsListView absListView, int i) {
            if (SimilarPhotoPickFragment.this.getActivity() != null) {
                if (i == 0) {
                    SimilarPhotoPickFragment.this.mIsScrolling = false;
                    if (SimilarPhotoPickFragment.this.mNeedResetLoader) {
                        SimilarPhotoPickFragment.this.restartLoader();
                    }
                } else {
                    SimilarPhotoPickFragment.this.mIsScrolling = true;
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public List<Long> mScanResultIds;
    /* access modifiers changed from: private */
    public SimilarScanner mScanner;
    private SimilarPhotoPickLoaderCallback mSimilarPhotoPickLoaderCallbacks;

    private class SimilarPhotoPickLoaderCallback implements LoaderCallbacks {
        public CursorLoader mLoader;

        private SimilarPhotoPickLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 9
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
            this.mLoader = new CursorLoader(SimilarPhotoPickFragment.this.mActivity);
            SimilarPhotoPickFragment.this.configLoader(this.mLoader);
            return this.mLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            Cursor cursor = (Cursor) obj;
            ArrayList arrayList = new ArrayList(cursor.getCount());
            if (cursor.moveToFirst()) {
                do {
                    arrayList.add(Long.valueOf(cursor.getLong(0)));
                } while (cursor.moveToNext());
            }
            ArrayList arrayList2 = new ArrayList(SimilarPhotoPickFragment.this.mGroupItemCount);
            ArrayList arrayList3 = new ArrayList(SimilarPhotoPickFragment.this.mGroupStartPos);
            ArrayList arrayList4 = new ArrayList(SimilarPhotoPickFragment.this.mClusterGroupId);
            ArrayList arrayList5 = new ArrayList(SimilarPhotoPickFragment.this.mScanResultIds);
            Iterator it = arrayList5.iterator();
            int i = 0;
            while (it.hasNext()) {
                if (!arrayList.contains(Long.valueOf(((Long) it.next()).longValue()))) {
                    it.remove();
                    int i2 = 0;
                    int i3 = 0;
                    while (i2 < arrayList3.size() && ((Integer) arrayList3.get(i2)).intValue() <= i) {
                        i3 = i2;
                        i2++;
                    }
                    for (int i4 = i3 + 1; i4 < arrayList3.size(); i4++) {
                        int intValue = ((Integer) arrayList3.get(i4)).intValue() - 1;
                        if (intValue < 0) {
                            intValue = 0;
                        }
                        arrayList3.set(i4, Integer.valueOf(intValue));
                    }
                    if (((Integer) arrayList2.get(i3)).intValue() <= 1) {
                        arrayList2.remove(i3);
                        arrayList4.remove(i3);
                        arrayList3.remove(i3);
                    } else {
                        arrayList2.set(i3, Integer.valueOf(((Integer) arrayList2.get(i3)).intValue() - 1));
                    }
                } else {
                    i++;
                }
            }
            if (cursor.getCount() == arrayList5.size()) {
                SortCursor sortCursor = new SortCursor(cursor, arrayList5);
                Bundle bundle = new Bundle();
                bundle.putIntegerArrayList("extra_timeline_item_count_in_group", arrayList2);
                bundle.putIntegerArrayList("extra_timeline_group_start_pos", arrayList3);
                bundle.putLongArray("extra_timeline_group_ids", MiscUtil.ListToArray(arrayList4));
                sortCursor.setExtras(bundle);
                SimilarPhotoPickFragment.this.getAdapter().swapCursor(sortCursor);
                if (arrayList5.size() > 0) {
                    SimilarPhotoPickFragment.this.keepClearPhotos();
                }
            }
            if (SimilarPhotoPickFragment.this.getAdapter().getCount() == 0) {
                SimilarPhotoPickFragment.this.setEmptyViewVisibility(0);
            } else {
                SimilarPhotoPickFragment.this.setEmptyViewVisibility(8);
            }
            if (SimilarPhotoPickFragment.this.mScanner.isLoadingValid()) {
                SimilarPhotoPickFragment.this.mLoadMoreLayout.startLoad();
            } else {
                SimilarPhotoPickFragment.this.mLoadMoreLayout.setLoadComplete();
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class SortCursor extends CursorWrapper {
        private int mPos = 0;
        private ArrayList<Long> mResults;
        private int[] sortList = new int[getCount()];

        public SortCursor(Cursor cursor, ArrayList<Long> arrayList) {
            super(cursor);
            this.mResults = arrayList;
            initSortList();
        }

        private void initSortList() {
            Cursor wrappedCursor = getWrappedCursor();
            for (int i = 0; i < getCount(); i++) {
                if (wrappedCursor.moveToPosition(i)) {
                    long j = wrappedCursor.getLong(0);
                    int i2 = 0;
                    while (true) {
                        if (i2 >= this.mResults.size() || i2 >= getCount()) {
                            break;
                        } else if (j == ((Long) this.mResults.get(i2)).longValue()) {
                            this.sortList[i2] = i;
                            break;
                        } else {
                            i2++;
                        }
                    }
                }
            }
        }

        public int getPosition() {
            return this.mPos;
        }

        public boolean move(int i) {
            return moveToPosition(this.mPos + i);
        }

        public boolean moveToFirst() {
            return moveToPosition(0);
        }

        public boolean moveToLast() {
            return moveToPosition(getCount() - 1);
        }

        public boolean moveToNext() {
            return moveToPosition(this.mPos + 1);
        }

        public boolean moveToPosition(int i) {
            if (i < 0 || i >= this.sortList.length) {
                if (i < 0) {
                    this.mPos = -1;
                }
                if (i >= this.sortList.length) {
                    this.mPos = this.sortList.length;
                }
                return getWrappedCursor().moveToPosition(i);
            }
            this.mPos = i;
            return getWrappedCursor().moveToPosition(this.sortList[i]);
        }

        public boolean moveToPrevious() {
            return moveToPosition(this.mPos - 1);
        }
    }

    /* access modifiers changed from: private */
    public void keepClearPhotos() {
        ArrayList headerPositions = this.mAdapter.getHeaderPositions();
        long[] groupIds = this.mAdapter.getGroupIds();
        if (MiscUtil.isValid(headerPositions) && groupIds != null) {
            for (int i = 0; i < headerPositions.size(); i++) {
                if (!this.mCheckedHeaderGroupId.contains(Long.valueOf(groupIds[i]))) {
                    this.mGridViewWrapper.setItemChecked(((Integer) headerPositions.get(i)).intValue(), false);
                    this.mCheckedHeaderGroupId.add(Long.valueOf(groupIds[i]));
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void onItemSelectedChanged() {
        boolean z = false;
        if (this.mAdapter.getCount() > 0) {
            Button button = this.mDeleteButton;
            if (this.mGridViewWrapper.getCheckedItemCount() > 0) {
                z = true;
            }
            button.setEnabled(z);
            return;
        }
        this.mDeleteButton.setEnabled(false);
    }

    /* access modifiers changed from: private */
    public void resetScanResult() {
        this.mScanResultIds = this.mScanner.getScanResultIds();
        this.mGroupStartPos = this.mScanner.getGroupStartPos();
        this.mGroupItemCount = this.mScanner.getGroupItemCount();
        this.mClusterGroupId = this.mScanner.getClusterGroupId();
    }

    /* access modifiers changed from: private */
    public void restartLoader() {
        resetScanResult();
        if (isAdded()) {
            Loader loader = getLoaderManager().getLoader(1);
            if (loader != null) {
                configLoader((CursorLoader) loader);
                loader.forceLoad();
            }
        }
        this.mNeedResetLoader = false;
    }

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.similar_photo_pick_layout;
    }

    /* access modifiers changed from: protected */
    public LoaderCallbacks getLoaderCallback() {
        if (this.mSimilarPhotoPickLoaderCallbacks == null) {
            this.mSimilarPhotoPickLoaderCallbacks = new SimilarPhotoPickLoaderCallback();
        }
        return this.mSimilarPhotoPickLoaderCallbacks;
    }

    public String getPageName() {
        return "cleaner_similar_photo_pick";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", this.mScanResultIds)});
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (configuration.orientation == 2) {
            this.mAlbumDetailGridView.setNumColumns(getResources().getInteger(R.integer.thumbnail_similar_photo_pick_columns_land));
        } else {
            this.mAlbumDetailGridView.setNumColumns(getResources().getInteger(R.integer.thumbnail_similar_photo_pick_columns));
        }
        this.mAlbumDetailGridView.setSelection(this.mAlbumDetailGridView.getFirstVisiblePosition());
    }

    public void onDestroy() {
        super.onDestroy();
        this.mScanner.removeSingleItemGroups();
        this.mScanner.removeListener(this.mOnScanResultUpdateListener);
    }

    /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 77
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
        this.mActivity.getActionBar().setTitle(R.string.cleaner_similar_title);
        this.mActivity.getActionBar().getCustomView().findViewById(R.id.do_select).setVisibility(8);
        this.mAdapter = new SimilarPhotoPickAdapter(this.mActivity);
        this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
        this.mGridViewWrapper = new EditableListViewWrapperDeprecated(this.mAlbumDetailGridView);
        this.mGridViewWrapper.setAdapter(this.mAdapter);
        this.mGridViewWrapper.setEmptyView(this.mEmptyView);
        this.mGridViewWrapper.setMultiChoiceModeListener(this.mMultiChoiceModeListener);
        this.mGridViewWrapper.disableScaleImageViewAniWhenInActionMode();
        this.mGridViewWrapper.startChoiceMode();
        ((StickyGridHeadersGridView) this.mAlbumDetailGridView).setHeadersIgnorePadding(true);
        this.mAlbumDetailGridView.setOnScrollListener(this.mOnScrollListener);
        boolean z = false;
        this.mLoadMoreLayout = (LoadMoreLayout) layoutInflater.inflate(R.layout.load_more_layout, this.mAlbumDetailGridView, false);
        ((StickyGridHeadersGridView) this.mAlbumDetailGridView).addFooterView(this.mLoadMoreLayout);
        this.mDeleteButton = (Button) onInflateView.findViewById(R.id.delete);
        Button button = this.mDeleteButton;
        if (this.mGridViewWrapper.getCheckedItemCount() > 0) {
            z = true;
        }
        button.setEnabled(z);
        this.mDeleteButton.setOnClickListener(this.mDeleteButtonClickListener);
        this.mKeepClearCheckBox = onInflateView.findViewById(R.id.keep_clear_check_box);
        this.mKeepClearCheckBox.setOnPerformCheckedChangeListener(this.mKeepClearCheckListener);
        this.mKeepClearCheckBox.setEnabled(true);
        this.mKeepClearCheckBox.setChecked(true);
        this.mScanner = (SimilarScanner) ScannerManager.getInstance().getScanner(3);
        this.mScanner.addListener(this.mOnScanResultUpdateListener);
        resetScanResult();
        return onInflateView;
    }

    public void onResume() {
        super.onResume();
        if (!this.mIsScrolling && this.mNeedResetLoader) {
            restartLoader();
        }
    }
}

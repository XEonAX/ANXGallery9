package com.miui.gallery.ui;

import android.content.Context;
import android.content.res.Configuration;
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
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter.AlbumType;
import com.miui.gallery.adapter.CleanerPhotoPickBaseAdapter;
import com.miui.gallery.cleaner.ScannerManager;
import com.miui.gallery.cleaner.ScreenshotScanner;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.SimpleMultiChoiceModeListener;
import java.util.HashMap;
import miui.gallery.support.MiuiSdkCompat;

public class ScreenshotPhotoPickFragment extends PhotoListFragmentBase {
    public static final int[] DELETE_COUNT_STAGE = {20, 50, 100, 200, 500, 1000};
    /* access modifiers changed from: private */
    public CleanerPhotoPickBaseAdapter mAdapter;
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            if (ScreenshotPhotoPickFragment.this.mIsFirstLoadFinish && ScreenshotPhotoPickFragment.this.mAdapter.getCount() > 0) {
                ScreenshotPhotoPickFragment.this.mIsFirstLoadFinish = false;
                ScreenshotPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(true);
            }
            ScreenshotPhotoPickFragment.this.onItemSelectedChanged();
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
            long[] checkedItemIds = ScreenshotPhotoPickFragment.this.mGridViewWrapper.getCheckedItemIds();
            if (checkedItemIds != null && checkedItemIds.length > 0) {
                MediaAndAlbumOperations.delete(ScreenshotPhotoPickFragment.this.mActivity, "ScreenshotPhotoPickFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
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
                        if (ScreenshotPhotoPickFragment.this.mActivity != null) {
                            ToastUtils.makeText((Context) ScreenshotPhotoPickFragment.this.mActivity, (CharSequence) ScreenshotPhotoPickFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                            if (i > 0) {
                                SoundUtils.playSoundForOperation(ScreenshotPhotoPickFragment.this.mActivity, 0);
                            }
                            ScreenshotPhotoPickFragment.this.mScanner.removeItems(jArr);
                            ScreenshotPhotoPickFragment.this.mScanResultIds = ScreenshotPhotoPickFragment.this.mScanner.getScanResultIds();
                            ScreenshotPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(false);
                            if (ScreenshotPhotoPickFragment.this.mScanResultIds.length <= 0) {
                                ScreenshotPhotoPickFragment.this.mActivity.finish();
                            }
                            HashMap hashMap = new HashMap();
                            hashMap.put("deleteCount", GallerySamplingStatHelper.formatValueStage((float) i, ScreenshotPhotoPickFragment.DELETE_COUNT_STAGE));
                            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_screenshot_used", hashMap);
                        }
                    }
                }, -1, "", 2, 46, checkedItemIds);
            }
        }
    };
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mGridViewWrapper;
    /* access modifiers changed from: private */
    public boolean mIsFirstLoadFinish = true;
    private SimpleMultiChoiceModeListener mMultiChoiceModeListener = new SimpleMultiChoiceModeListener() {
        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            ScreenshotPhotoPickFragment.this.onItemSelectedChanged();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            ScreenshotPhotoPickFragment.this.onItemSelectedChanged();
        }
    };
    /* access modifiers changed from: private */
    public long[] mScanResultIds;
    /* access modifiers changed from: private */
    public ScreenshotScanner mScanner;
    private Button mSelectButton;
    private OnClickListener mSelectListener = new OnClickListener() {
        public void onClick(View view) {
            boolean z = !ScreenshotPhotoPickFragment.this.mGridViewWrapper.isAllItemsChecked();
            ScreenshotPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(z);
            if (!z) {
                GallerySamplingStatHelper.recordCountEvent("cleaner", "screenshot_select_all_cancel");
            }
        }
    };

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

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.screenshot_photo_pick_layout;
    }

    public String getPageName() {
        return "cleaner_screenshot_photo_pick";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", MiscUtil.arrayToList(this.mScanResultIds))});
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
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbScreenshotColumnsLand);
        } else {
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbScreenshotColumnsPortrait);
        }
    }

    /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v23, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 61
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
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        this.mActivity.getActionBar().setTitle(R.string.cleaner_screen_shot_title);
        this.mAdapter = new CleanerPhotoPickBaseAdapter(this.mActivity);
        this.mAdapter.setCurrentSortBy(SortBy.DATE);
        this.mAdapter.setAlbumType(AlbumType.SCREENSHOT);
        this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
        this.mGridViewWrapper = new EditableListViewWrapperDeprecated(this.mAlbumDetailGridView);
        this.mGridViewWrapper.setAdapter(this.mAdapter);
        this.mGridViewWrapper.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mGridViewWrapper.setEmptyView(this.mEmptyView);
        this.mGridViewWrapper.setMultiChoiceModeListener(this.mMultiChoiceModeListener);
        this.mGridViewWrapper.disableScaleImageViewAniWhenInActionMode();
        this.mGridViewWrapper.startChoiceMode();
        this.mDeleteButton = (Button) onInflateView.findViewById(R.id.delete);
        this.mDeleteButton.setOnClickListener(this.mDeleteButtonClickListener);
        this.mSelectButton = (Button) this.mActivity.getActionBar().getCustomView().findViewById(R.id.do_select);
        MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mSelectButton, 0);
        this.mSelectButton.setOnClickListener(this.mSelectListener);
        this.mScanner = (ScreenshotScanner) ScannerManager.getInstance().getScanner(1);
        this.mScanResultIds = this.mScanner.getScanResultIds();
        return onInflateView;
    }
}

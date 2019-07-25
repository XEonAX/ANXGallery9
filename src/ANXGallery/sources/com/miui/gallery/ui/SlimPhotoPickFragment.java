package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.Intent;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.activity.PhotoSlimActivity;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter.AlbumType;
import com.miui.gallery.adapter.CleanerPhotoPickBaseAdapter;
import com.miui.gallery.cleaner.ScannerManager;
import com.miui.gallery.cleaner.slim.SlimController;
import com.miui.gallery.cleaner.slim.SlimScanner;
import com.miui.gallery.preference.GalleryPreferences.PhotoSlim;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.SimpleMultiChoiceModeListener;
import java.util.HashMap;
import miui.gallery.support.MiuiSdkCompat;

public class SlimPhotoPickFragment extends PhotoListFragmentBase {
    public static final int[] SLIM_COUNT_STAGE = {20, 50, 100, 200, 500, 1000};
    /* access modifiers changed from: private */
    public CleanerPhotoPickBaseAdapter mAdapter;
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            if (SlimPhotoPickFragment.this.mIsFirstLoadFinish && SlimPhotoPickFragment.this.mAdapter.getCount() > 0) {
                SlimPhotoPickFragment.this.mIsFirstLoadFinish = false;
                SlimPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(true);
            }
            SlimPhotoPickFragment.this.onItemSelectedChanged();
        }
    };
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mGridViewWrapper;
    /* access modifiers changed from: private */
    public boolean mIsFirstLoadFinish = true;
    private SimpleMultiChoiceModeListener mMultiChoiceModeListener = new SimpleMultiChoiceModeListener() {
        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            SlimPhotoPickFragment.this.onItemSelectedChanged();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            SlimPhotoPickFragment.this.onItemSelectedChanged();
        }
    };
    private long[] mScanResultIds;
    private Button mSelectButton;
    private OnClickListener mSelectListener = new OnClickListener() {
        public void onClick(View view) {
            boolean z = !SlimPhotoPickFragment.this.mGridViewWrapper.isAllItemsChecked();
            SlimPhotoPickFragment.this.mGridViewWrapper.setAllItemsCheckState(z);
            if (!z) {
                GallerySamplingStatHelper.recordCountEvent("cleaner", "slim_select_all_cancel");
            }
        }
    };
    /* access modifiers changed from: private */
    public Dialog mSlimDescriptionDialog;
    private Button mStartSlimButton;
    private OnClickListener mStartSlimListener = new OnClickListener() {
        public void onClick(View view) {
            if (DocumentProviderUtils.needRequestExternalSDCardPermission(SlimPhotoPickFragment.this.getActivity())) {
                DocumentProviderUtils.startExtSDCardPermissionActivityForResult(SlimPhotoPickFragment.this.getActivity());
                return;
            }
            long[] checkedItemIds = SlimPhotoPickFragment.this.mGridViewWrapper.getCheckedItemIds();
            SlimController.getInstance().start(checkedItemIds);
            SlimPhotoPickFragment.this.getActivity().startActivity(new Intent(SlimPhotoPickFragment.this.getActivity(), PhotoSlimActivity.class));
            HashMap hashMap = new HashMap();
            hashMap.put("slimCount", GallerySamplingStatHelper.formatValueStage((float) checkedItemIds.length, SlimPhotoPickFragment.SLIM_COUNT_STAGE));
            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_slim_used", hashMap);
            SlimPhotoPickFragment.this.finish();
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
            this.mStartSlimButton.setEnabled(this.mGridViewWrapper.getCheckedItemCount() > 0);
            this.mSelectButton.setVisibility(0);
            MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mSelectButton, this.mGridViewWrapper.isAllItemsChecked());
            return;
        }
        this.mStartSlimButton.setEnabled(false);
        this.mSelectButton.setVisibility(8);
    }

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.slim_photo_pick_layout;
    }

    public String getPageName() {
        return "cleaner_slim_photo_pick";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return String.format("%s AND %s IN (%s)", new Object[]{SlimScanner.SYNCED_SLIM_SCAN_SELECTION, "_id", TextUtils.join(",", MiscUtil.arrayToList(this.mScanResultIds))});
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build();
    }

    /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 25
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
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (PhotoSlim.isFirstUsePhotoSlim()) {
            View inflate = LayoutInflater.from(this.mActivity).inflate(R.layout.photo_slim_description_dialog, null, false);
            this.mSlimDescriptionDialog = new Dialog(this.mActivity);
            this.mSlimDescriptionDialog.setContentView(inflate);
            ((Button) inflate.findViewById(R.id.button)).setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    SlimPhotoPickFragment.this.mSlimDescriptionDialog.dismiss();
                }
            });
            Window window = this.mSlimDescriptionDialog.getWindow();
            window.setGravity(80);
            window.setLayout(-1, -2);
            this.mSlimDescriptionDialog.show();
            PhotoSlim.setIsFirstUsePhotoSlim(Boolean.valueOf(false));
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mSlimDescriptionDialog != null && this.mSlimDescriptionDialog.isShowing()) {
            this.mSlimDescriptionDialog.dismiss();
        }
    }

    /* JADX WARNING: type inference failed for: r4v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r5v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 58
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
        this.mActivity.getActionBar().setTitle(R.string.cleaner_slim_title);
        View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        this.mStartSlimButton = (Button) onInflateView.findViewById(R.id.start);
        this.mStartSlimButton.setOnClickListener(this.mStartSlimListener);
        this.mSelectButton = (Button) this.mActivity.getActionBar().getCustomView().findViewById(R.id.do_select);
        MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mSelectButton, 0);
        this.mSelectButton.setOnClickListener(this.mSelectListener);
        this.mAdapter = new CleanerPhotoPickBaseAdapter(this.mActivity);
        this.mAdapter.setClickToPhotoPageEnable(false);
        this.mAdapter.setCurrentSortBy(SortBy.DATE);
        this.mAdapter.setAlbumType(AlbumType.NORMAL);
        this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
        this.mGridViewWrapper = new EditableListViewWrapperDeprecated(this.mAlbumDetailGridView);
        this.mGridViewWrapper.setAdapter(this.mAdapter);
        this.mGridViewWrapper.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mGridViewWrapper.setMultiChoiceModeListener(this.mMultiChoiceModeListener);
        this.mGridViewWrapper.disableScaleImageViewAniWhenInActionMode();
        this.mGridViewWrapper.startChoiceMode();
        this.mScanResultIds = ((SlimScanner) ScannerManager.getInstance().getScanner(0)).getScanResultIds();
        return onInflateView;
    }
}

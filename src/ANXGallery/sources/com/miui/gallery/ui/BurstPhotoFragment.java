package com.miui.gallery.ui;

import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.ContentProviderOperation;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore.Files;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.internal.WindowCompat;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.BurstPhotoPageAdapter;
import com.miui.gallery.adapter.PhotoPageAdapter;
import com.miui.gallery.adapter.PhotoPageAdapter.ChoiceMode;
import com.miui.gallery.adapter.PhotoPageAdapter.MultiChoiceModeListener;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.ui.BurstPhotoPreviewFragment.OnExitListener;
import com.miui.gallery.ui.BurstPhotoPreviewFragment.OnScrollToPositionListener;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.DeletionTask.Param;
import com.miui.gallery.ui.ProcessTask.OnCompleteListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.slip.VerticalSlipLayout;
import com.miui.gallery.widget.slip.VerticalSlipLayout.OnSlipListener;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import miui.app.AlertDialog.Builder;

public class BurstPhotoFragment extends PhotoPageFragmentBase {
    private BurstChoiceModeManager mBurstChoiceManager;

    private class BurstChoiceModeManager implements MultiChoiceModeListener, OnSlipListener {
        protected ChoiceMode mBurstChoiceMode;
        private PhotoChoiceTitle mPhotoChoiceTitle;
        private VerticalSlipLayout mSlipLayout;

        BurstChoiceModeManager() {
            this.mSlipLayout = (VerticalSlipLayout) BurstPhotoFragment.this.getView().findViewById(R.id.slip_layout);
            this.mSlipLayout.setOnSlipListener(this);
            this.mPhotoChoiceTitle = (PhotoChoiceTitle) BurstPhotoFragment.this.getView().findViewById(R.id.photo_choice_title);
            this.mPhotoChoiceTitle.getTitle().setText(null);
            setUpPreviewFragment();
        }

        /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 21
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
        public void saveBurstItems(final boolean z) {
            if (DocumentProviderUtils.needRequestExternalSDCardPermission(BurstPhotoFragment.this.getActivity())) {
                DocumentProviderUtils.startExtSDCardPermissionActivityForResult(BurstPhotoFragment.this.getActivity());
                return;
            }
            ProcessTask processTask = new ProcessTask(new ProcessCallback<Void, Boolean>() {
                public Boolean doProcess(Void[] voidArr) {
                    String str;
                    String str2;
                    int count = BurstPhotoFragment.this.mAdapter.getCount();
                    List selectItems = BurstChoiceModeManager.this.mBurstChoiceMode.getSelectItems();
                    long[] jArr = new long[(count - selectItems.size())];
                    try {
                        ArrayList arrayList = new ArrayList();
                        ArrayList arrayList2 = new ArrayList();
                        Uri contentUri = Files.getContentUri("external");
                        int i = 0;
                        for (int i2 = count - 1; i2 >= 0; i2--) {
                            BaseDataItem dataItem = BurstPhotoFragment.this.mAdapter.getDataItem(i2);
                            String str3 = null;
                            if (!TextUtils.isEmpty(dataItem.getOriginalPath())) {
                                str2 = dataItem.getOriginalPath();
                                str = "localFile";
                            } else if (!TextUtils.isEmpty(dataItem.getThumnailPath())) {
                                str2 = dataItem.getThumnailPath();
                                str = "thumbnailFile";
                            } else {
                                str2 = null;
                                str = null;
                            }
                            if (!z) {
                                if (!selectItems.contains(Integer.valueOf(i2))) {
                                    if (FileUtils.isFileExist(str2)) {
                                        arrayList2.add(ContentProviderOperation.newDelete(contentUri).withSelection("_data=?", new String[]{str2}).build());
                                    }
                                    jArr[i] = dataItem.getKey();
                                    i++;
                                }
                            }
                            if (str2 != null && str2.contains("_BURST")) {
                                str3 = str2.replace("_BURST", "_");
                            }
                            if (FileUtils.isFileExist(str2) && !TextUtils.isEmpty(str3)) {
                                if (FileUtils.move(new File(str2), new File(str3))) {
                                    MediaStoreUtils.update(MediaStoreUtils.getFileMediaUri(str2), str3);
                                }
                            }
                            ContentValues contentValues = new ContentValues();
                            if (str3 != null) {
                                contentValues.put(str, str3);
                            }
                            contentValues.put("title", dataItem.getTitle().replace("_BURST", "_"));
                            arrayList.add(ContentProviderOperation.newUpdate(Cloud.CLOUD_URI).withValues(contentValues).withSelection("_id=?", new String[]{String.valueOf(dataItem.getKey())}).build());
                            String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(7);
                            GalleryUtils.safeExec(String.format("update %s set %s=coalesce(replace(%s, '%s', '') || '%s', '%s'), %s = replace(%s,'%s', '_') where %s=%s", new Object[]{"cloud", "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, "fileName", "fileName", "_BURST", "_id", Long.valueOf(dataItem.getKey())}));
                        }
                        if (!arrayList.isEmpty()) {
                            BurstPhotoFragment.this.mActivity.getContentResolver().applyBatch("com.miui.gallery.cloud.provider", arrayList);
                        }
                        if (!arrayList2.isEmpty()) {
                            BurstPhotoFragment.this.mActivity.getContentResolver().applyBatch("media", arrayList2);
                        }
                    } catch (Exception e) {
                        Log.e("BurstPhotoFragment", "save burst failed", (Object) e);
                    }
                    if (jArr.length == 0) {
                        return Boolean.valueOf(true);
                    }
                    DeletionTask deletionTask = new DeletionTask();
                    deletionTask.setOnDeletionCompleteListener(new OnDeletionCompleteListener() {
                        public void onDeleted(int i, long[] jArr) {
                            BurstPhotoFragment.this.onSaveBurstItemsCompleted();
                        }
                    });
                    Executor executor = AsyncTask.THREAD_POOL_EXECUTOR;
                    Param param = new Param(jArr, 2, -1, "", 49);
                    deletionTask.executeOnExecutor(executor, new Param[]{param});
                    return Boolean.valueOf(false);
                }
            });
            processTask.setCompleteListener(new OnCompleteListener<Boolean>() {
                public void onCompleteProcess(Boolean bool) {
                    if (bool.booleanValue()) {
                        BurstPhotoFragment.this.onSaveBurstItemsCompleted();
                    }
                }
            });
            processTask.showProgress(BurstPhotoFragment.this.mActivity, BurstPhotoFragment.this.getString(R.string.burst_save_processing));
            processTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        }

        private void setPhotoChoiceTitleVisible(boolean z) {
            int i = z ? 0 : 4;
            if (i != this.mPhotoChoiceTitle.getVisibility()) {
                this.mPhotoChoiceTitle.setVisibility(i);
            }
        }

        public void discard() {
            setPhotoChoiceTitleVisible(false);
            this.mBurstChoiceMode.finish();
            BurstPhotoFragment.this.finish();
        }

        public final void onAllItemsCheckedStateChanged(boolean z) {
        }

        public void onDataSetLoaded(BaseDataSet baseDataSet) {
            BurstPhotoPreviewFragment burstPhotoPreviewFragment = (BurstPhotoPreviewFragment) BurstPhotoFragment.this.getChildFragmentManager().findFragmentByTag("BurstPhotoPreviewFragment");
            if (burstPhotoPreviewFragment != null) {
                burstPhotoPreviewFragment.setDataSet(baseDataSet);
            }
            updateSelectMode();
        }

        public void onItemChanged(int i) {
            Fragment findFragmentByTag = BurstPhotoFragment.this.getChildFragmentManager().findFragmentByTag("BurstPhotoPreviewFragment");
            if (findFragmentByTag != null) {
                ((BurstPhotoPreviewFragment) findFragmentByTag).scrollToPosition(i);
            }
        }

        public final void onItemCheckedStateChanged(int i, long j, boolean z) {
            updateSelectMode();
            Fragment findFragmentByTag = BurstPhotoFragment.this.getChildFragmentManager().findFragmentByTag("BurstPhotoPreviewFragment");
            if (findFragmentByTag != null) {
                ((BurstPhotoPreviewFragment) findFragmentByTag).setCheckedItem(i, z);
            }
        }

        public void onSlipEnd(boolean z) {
            if (z) {
                setPhotoChoiceTitleVisible(true);
                BurstPhotoFragment.this.mPager.setCurrentItem(0);
                this.mSlipLayout.setDraggable(false);
                this.mBurstChoiceMode.setChecked(0, BurstPhotoFragment.this.mAdapter.getDataItem(0).getKey(), true);
            }
        }

        public void onSlipStart() {
            this.mBurstChoiceMode = BurstPhotoFragment.this.mAdapter.startActionMode(this);
            setPhotoChoiceTitleVisible(true);
        }

        public void onSlipStateChanged(int i) {
        }

        public void onSlipping(float f) {
        }

        public void setSlipped(boolean z) {
            this.mSlipLayout.setSlipped(z);
        }

        /* JADX WARNING: type inference failed for: r0v2, types: [android.app.Fragment] */
        /* JADX WARNING: type inference failed for: r0v3 */
        /* JADX WARNING: type inference failed for: r1v6, types: [android.app.Fragment, com.miui.gallery.ui.BurstPhotoPreviewFragment] */
        /* JADX WARNING: type inference failed for: r0v8 */
        /* access modifiers changed from: protected */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v6, types: [android.app.Fragment, com.miui.gallery.ui.BurstPhotoPreviewFragment]
  assigns: [com.miui.gallery.ui.BurstPhotoPreviewFragment]
  uses: [android.app.Fragment, ?[OBJECT, ARRAY]]
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
        public void setUpPreviewFragment() {
            ? findFragmentByTag = BurstPhotoFragment.this.getChildFragmentManager().findFragmentByTag("BurstPhotoPreviewFragment");
            if (findFragmentByTag == 0) {
                FragmentTransaction beginTransaction = BurstPhotoFragment.this.getChildFragmentManager().beginTransaction();
                ? burstPhotoPreviewFragment = new BurstPhotoPreviewFragment();
                beginTransaction.add(R.id.photo_detail_preview, burstPhotoPreviewFragment, "BurstPhotoPreviewFragment");
                beginTransaction.commitAllowingStateLoss();
                findFragmentByTag = burstPhotoPreviewFragment;
            }
            BurstPhotoPreviewFragment burstPhotoPreviewFragment2 = (BurstPhotoPreviewFragment) findFragmentByTag;
            burstPhotoPreviewFragment2.setDataSet(BurstPhotoFragment.this.mAdapter.getDataSet());
            burstPhotoPreviewFragment2.setOnItemScrolledListener(new OnScrollToPositionListener() {
                public void onScrollToPosition(int i) {
                    BurstPhotoFragment.this.mPager.setCurrentItem(i, false);
                }
            });
            burstPhotoPreviewFragment2.setOnExitListener(new OnExitListener() {
                public void onDiscard() {
                    BurstChoiceModeManager.this.discard();
                }

                public void onSave() {
                    BurstChoiceModeManager.this.showSaveDialog();
                }
            });
        }

        /* JADX WARNING: type inference failed for: r3v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 29
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
        public void showSaveDialog() {
            final List selectItems = this.mBurstChoiceMode.getSelectItems();
            if (MiscUtil.isValid(selectItems)) {
                new Builder(BurstPhotoFragment.this.mActivity).setSingleChoiceItems(new String[]{BurstPhotoFragment.this.getString(R.string.burst_save_all), BurstPhotoFragment.this.getResources().getQuantityString(R.plurals.burst_save_selected, selectItems.size(), new Object[]{Integer.valueOf(selectItems.size())}), BurstPhotoFragment.this.getString(17039360)}, -1, new OnClickListener() {
                    /* JADX WARNING: type inference failed for: r7v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 41
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
                    /* JADX WARNING: Unknown variable types count: 1 */
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                        switch (i) {
                            case 0:
                                BurstChoiceModeManager.this.saveBurstItems(true);
                                return;
                            case 1:
                                new Builder(BurstPhotoFragment.this.mActivity).setCancelable(true).setTitle(BurstPhotoFragment.this.getString(R.string.burst_save_confirm_dialog_title)).setMessage(BurstPhotoFragment.this.getResources().getQuantityString(R.plurals.burst_save_confirm_dialog_message, selectItems.size(), new Object[]{Integer.valueOf(selectItems.size())})).setPositiveButton(17039370, new OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        BurstChoiceModeManager.this.saveBurstItems(false);
                                    }
                                }).setNegativeButton(17039360, null).create().show();
                                return;
                            case 2:
                                dialogInterface.cancel();
                                return;
                            default:
                                StringBuilder sb = new StringBuilder();
                                sb.append("unknown item clicked: ");
                                sb.append(i);
                                throw new IllegalStateException(sb.toString());
                        }
                    }
                }).create().show();
            }
        }

        /* access modifiers changed from: protected */
        public void updateSelectMode() {
            if (this.mBurstChoiceMode != null) {
                List selectItems = this.mBurstChoiceMode.getSelectItems();
                this.mPhotoChoiceTitle.getTitle().setText(BurstPhotoFragment.this.getString(R.string.burst_save_choice_title, new Object[]{Integer.valueOf(selectItems == null ? 0 : selectItems.size()), Integer.valueOf(BurstPhotoFragment.this.mAdapter.getCount())}));
            }
        }
    }

    private void configViewLayout(View view) {
        Resources resources = getResources();
        VerticalSlipLayout verticalSlipLayout = (VerticalSlipLayout) view.findViewById(R.id.slip_layout);
        PhotoChoiceTitle photoChoiceTitle = (PhotoChoiceTitle) view.findViewById(R.id.photo_choice_title);
        photoChoiceTitle.getExitButton().setVisibility(8);
        View findViewById = view.findViewById(R.id.photo_detail_preview);
        int max = Math.max(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        int min = Math.min(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.burst_title_height);
        int dimensionPixelSize2 = resources.getDimensionPixelSize(R.dimen.burst_choice_height);
        int i = (max - dimensionPixelSize) - dimensionPixelSize2;
        photoChoiceTitle.getLayoutParams().height = dimensionPixelSize;
        findViewById.getLayoutParams().height = dimensionPixelSize2;
        verticalSlipLayout.setFixedSideSlipDistance(dimensionPixelSize);
        int dimensionPixelSize3 = resources.getDimensionPixelSize(R.dimen.photo_slip_horizontal_margin);
        float f = 1.0f - ((((float) dimensionPixelSize3) * 2.0f) / ((float) min));
        float dimensionPixelSize4 = (((float) resources.getDimensionPixelSize(R.dimen.viewpager_slip_page_margin)) * 1.0f) / ((float) resources.getDimensionPixelSize(R.dimen.viewpager_page_margin));
        this.mPager.setHeightSlipRatio((((float) i) * 1.0f) / ((float) max));
        this.mPager.setWidthSlipRatio(f);
        this.mPager.setMarginSlipRatio(dimensionPixelSize4);
    }

    public static BurstPhotoFragment newInstance(Uri uri, Bundle bundle) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        if (uri != null) {
            bundle.putString("photo_uri", uri.toString());
        }
        BurstPhotoFragment burstPhotoFragment = new BurstPhotoFragment();
        burstPhotoFragment.setArguments(bundle);
        return burstPhotoFragment;
    }

    /* access modifiers changed from: private */
    public void onSaveBurstItemsCompleted() {
        if (this.mActivity != null) {
            this.mActivity.setResult(-1, null);
            this.mActivity.finish();
        }
    }

    /* access modifiers changed from: protected */
    public void delayDoAfterTransit() {
        this.mBurstChoiceManager = new BurstChoiceModeManager();
        this.mBurstChoiceManager.setSlipped(false);
    }

    /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 4
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
    public View getLayout(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        return LayoutInflater.from(this.mActivity).inflate(R.layout.burst_photo_page, viewGroup, false);
    }

    public String getPageName() {
        return "burst";
    }

    /* access modifiers changed from: protected */
    public PhotoPageAdapter getPhotoAdapter() {
        BurstPhotoPageAdapter burstPhotoPageAdapter = new BurstPhotoPageAdapter(getInitCount(), getImageLoadParams(), getEnterViewInfo(getArguments().getInt("photo_init_position", 0)), this, getPhotoPageInteractionListener());
        return burstPhotoPageAdapter;
    }

    /* access modifiers changed from: protected */
    public String getTAG() {
        return "BurstPhotoFragment";
    }

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 2131820713;
    }

    public boolean onBackPressed() {
        if (this.mBurstChoiceManager != null) {
            this.mBurstChoiceManager.discard();
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onDataSetLoaded(BaseDataSet baseDataSet, boolean z) {
        super.onDataSetLoaded(baseDataSet, z);
        if (this.mBurstChoiceManager != null) {
            this.mBurstChoiceManager.onDataSetLoaded(baseDataSet);
        }
    }

    /* access modifiers changed from: protected */
    public void onItemChanged(int i) {
        if (this.mBurstChoiceManager != null) {
            this.mBurstChoiceManager.onItemChanged(i);
        }
    }

    public void onResume() {
        super.onResume();
        onContentChanged();
    }

    /* access modifiers changed from: protected */
    public void onViewInflated(View view) {
        super.onViewInflated(view);
        configViewLayout(view);
        WindowCompat.setCutoutModeShortEdges(this.mActivity.getWindow());
    }
}

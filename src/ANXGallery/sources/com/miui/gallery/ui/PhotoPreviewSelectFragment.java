package com.miui.gallery.ui;

import android.app.ActionBar.LayoutParams;
import android.app.Fragment;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.widget.slip.VerticalSlipLayout;
import com.miui.privacy.LockSettingsHelper;
import java.util.List;
import miui.gallery.support.MiuiSdkCompat;

public class PhotoPreviewSelectFragment extends PhotoPageFragmentBase {
    private ChoiceManager mChoiceManager;

    private class ChoiceManager extends ChoiceManagerBase implements OnClickListener {
        private Button mCancelBtn;
        private Button mSelectAllBtn;
        private TextView mTitleView;

        ChoiceManager() {
            super();
            initTopBar();
            setUpChooserFragment(0, true);
            this.mChoiceMode = PhotoPreviewSelectFragment.this.mAdapter.startActionMode(this);
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v13, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v15, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 35
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
        /* JADX WARNING: Unknown variable types count: 3 */
        private void initTopBar() {
            View inflate = LayoutInflater.from(PhotoPreviewSelectFragment.this.mActivity).inflate(R.layout.custom_select_mode_title, null);
            this.mCancelBtn = (Button) inflate.findViewById(R.id.select_mode_button1);
            this.mTitleView = (TextView) inflate.findViewById(R.id.select_mode_title);
            this.mSelectAllBtn = (Button) inflate.findViewById(R.id.select_mode_button2);
            this.mCancelBtn.setOnClickListener(this);
            this.mSelectAllBtn.setOnClickListener(this);
            MiuiSdkCompat.setEditActionModeButton(PhotoPreviewSelectFragment.this.mActivity, this.mCancelBtn, 3);
            MiuiSdkCompat.setEditActionModeButton(PhotoPreviewSelectFragment.this.mActivity, this.mSelectAllBtn, 0);
            PhotoPreviewSelectFragment.this.mActivity.getActionBar().setDisplayOptions(16);
            PhotoPreviewSelectFragment.this.mActivity.getActionBar().setCustomView(inflate, new LayoutParams(-1, -1, 19));
        }

        /* access modifiers changed from: protected */
        public TextView getChoiceTitle() {
            return this.mTitleView;
        }

        /* access modifiers changed from: protected */
        public int getContainerId() {
            return R.id.child_container;
        }

        public void initSelected(BaseDataSet baseDataSet) {
            long[] longArray = PhotoPreviewSelectFragment.this.getArguments().getLongArray("photo_preview_selected_ids");
            int[] intArray = PhotoPreviewSelectFragment.this.getArguments().getIntArray("photo_preview_selected_positions");
            if (!(longArray == null || intArray == null || baseDataSet == null)) {
                if (longArray.length == intArray.length) {
                    BaseDataItem baseDataItem = new BaseDataItem();
                    for (int i = 0; i < longArray.length; i++) {
                        long j = longArray[i];
                        baseDataItem.setKey(j);
                        int indexOfItem = baseDataSet.getIndexOfItem(baseDataItem, intArray[i]);
                        if (indexOfItem != -1) {
                            this.mChoiceMode.appendCheck(indexOfItem, j);
                        }
                    }
                    this.mChoiceMode.finishInit();
                } else {
                    throw new IllegalArgumentException("ids and positions not match");
                }
            }
            PhotoPreviewSelectFragment.this.getArguments().remove("photo_preview_selected_ids");
            PhotoPreviewSelectFragment.this.getArguments().remove("photo_preview_selected_positions");
        }

        public void onClick(View view) {
            switch (view.getId()) {
                case R.id.select_mode_button1 /*2131296919*/:
                    PhotoPreviewSelectFragment.this.finish();
                    break;
                case R.id.select_mode_button2 /*2131296920*/:
                    break;
                default:
                    return;
            }
            if (this.mChoiceMode.getSelectItems().size() < this.mChoiceMode.getCount()) {
                this.mChoiceMode.chooseAll();
            } else {
                this.mChoiceMode.unChooseAll();
            }
        }

        /* access modifiers changed from: protected */
        public void onShared() {
            super.onShared();
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: protected */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
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
        public void updateSelectMode() {
            int size = this.mChoiceMode.getSelectItems().size();
            MiuiSdkCompat.setEditActionModeButton(PhotoPreviewSelectFragment.this.mActivity, this.mSelectAllBtn, (size <= 0 || size != this.mChoiceMode.getCount()) ? 0 : 1);
            super.updateSelectMode();
        }
    }

    public static PhotoPreviewSelectFragment newInstance(Uri uri, Bundle bundle) {
        if (uri != null) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putString("photo_uri", uri.toString());
            PhotoPreviewSelectFragment photoPreviewSelectFragment = new PhotoPreviewSelectFragment();
            photoPreviewSelectFragment.setArguments(bundle);
            return photoPreviewSelectFragment;
        }
        throw new IllegalArgumentException("uri is null");
    }

    /* access modifiers changed from: protected */
    public View getLayout(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        return layoutInflater.inflate(R.layout.photo_preview_select_layout, viewGroup, false);
    }

    public String getPageName() {
        return "PhotoPreviewSelectFragment";
    }

    public String getTAG() {
        return "PhotoPreviewSelectFragment";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mChoiceManager = new ChoiceManager();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 27) {
            if (i2 == -1 || this.mActivity == null || this.mActivity.isFinishing()) {
                this.mNeedConfirmPassWord = false;
            } else {
                this.mActivity.finish();
            }
        }
        super.onActivityResult(i, i2, intent);
    }

    /* access modifiers changed from: protected */
    public void onDataSetLoaded(BaseDataSet baseDataSet, boolean z) {
        super.onDataSetLoaded(baseDataSet, z);
        if (z) {
            long currentTimeMillis = System.currentTimeMillis();
            this.mChoiceManager.initSelected(baseDataSet);
            Log.d("PhotoPreviewSelectFragment", "initialize selection costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
        String string = getArguments().getString("assistant_target_package");
        String string2 = getArguments().getString("assistant_target_class");
        int size = this.mChoiceManager.mChoiceMode.getSelectItems().size();
        if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string2) && size > 0) {
            Intent intent = new Intent();
            this.mChoiceManager.configTargetIntentBySelected(size, intent);
            intent.setComponent(new ComponentName(string, string2));
            List queryIntentActivities = this.mActivity.getPackageManager().queryIntentActivities(intent, 65536);
            if (MiscUtil.isValid(queryIntentActivities) && queryIntentActivities.size() == 1) {
                this.mChoiceManager.onIntentSelected(intent);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 10
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
    public void onItemSettled(int i) {
        super.onItemSettled(i);
        BaseDataItem dataItem = this.mAdapter.getDataItem(i);
        if (dataItem != null) {
            TalkBackUtil.requestAnnouncementEvent(this.mPager, dataItem.getContentDescription(this.mActivity));
        }
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.ui.PhotoPreviewSelectFragment, android.app.Fragment, com.miui.gallery.ui.PhotoPageFragmentBase] */
    public void onResume() {
        super.onResume();
        if (isNeedConfirmPassWord(this.mAdapter.getDataItem(this.mPager.getCurrentItem()))) {
            this.mNeedConfirmPassWord = false;
            LockSettingsHelper.startAuthenticatePasswordActivity((Fragment) this, 27);
        }
    }

    /* access modifiers changed from: protected */
    public void onShared() {
        super.onShared();
        this.mChoiceManager.onShared();
    }

    public void onStop() {
        super.onStop();
        this.mNeedConfirmPassWord = true;
    }

    /* access modifiers changed from: protected */
    public void onViewInflated(View view) {
        super.onViewInflated(view);
        ((VerticalSlipLayout) view.findViewById(R.id.slip_layout)).setDraggable(false);
    }
}

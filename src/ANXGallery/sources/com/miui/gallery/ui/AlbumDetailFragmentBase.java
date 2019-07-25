package com.miui.gallery.ui;

import android.accounts.Account;
import android.app.AlertDialog;
import android.app.Dialog;
import android.arch.lifecycle.DefaultLifecycleObserver;
import android.arch.lifecycle.DefaultLifecycleObserver.CC;
import android.arch.lifecycle.Lifecycle.State;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.ProcessLifecycleOwner;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.google.common.collect.Lists;
import com.miui.account.AccountHelper;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.picker.PickGalleryActivity;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.share.Path;
import com.miui.gallery.share.UIHelper;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.CopyOrMoveDialog.OnOperationSelectedListener;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import miui.app.AlertDialog.Builder;

public abstract class AlbumDetailFragmentBase extends PhotoListFragmentBase implements DefaultLifecycleObserver {
    private static final String SELECTION_ONLY_LOCAL;
    protected EditableListViewWrapperDeprecated mAlbumDetailGridViewWrapper;
    protected String mAlbumLocalPath;
    private MultiChoiceModeListener mChoiceModeListener = new MultiChoiceModeListener() {
        private MenuItem mAddToAlbum;
        private MenuItem mCreativity;
        private MenuItem mDelete;
        /* access modifiers changed from: private */
        public ActionMode mMode;
        private MenuItem mRemoveSecret;
        private MenuItem mSend;

        private boolean isMenuItemVisible(MenuItem menuItem) {
            return menuItem != null && menuItem.isVisible();
        }

        private void updateMenuState() {
            if (AlbumDetailFragmentBase.this.mAlbumDetailGridViewWrapper.getCheckedItemCount() < 1) {
                if (isMenuItemVisible(this.mDelete)) {
                    this.mDelete.setEnabled(false);
                }
                if (isMenuItemVisible(this.mAddToAlbum)) {
                    this.mAddToAlbum.setEnabled(false);
                }
                if (isMenuItemVisible(this.mCreativity)) {
                    this.mCreativity.setEnabled(false);
                }
                if (isMenuItemVisible(this.mRemoveSecret)) {
                    this.mRemoveSecret.setEnabled(false);
                }
                if (isMenuItemVisible(this.mSend)) {
                    this.mSend.setEnabled(false);
                    return;
                }
                return;
            }
            if (isMenuItemVisible(this.mDelete)) {
                this.mDelete.setEnabled(true);
            }
            if (isMenuItemVisible(this.mAddToAlbum)) {
                this.mAddToAlbum.setEnabled(true);
            }
            if (isMenuItemVisible(this.mCreativity)) {
                this.mCreativity.setEnabled(true);
            }
            if (isMenuItemVisible(this.mRemoveSecret)) {
                this.mRemoveSecret.setEnabled(true);
            }
            if (isMenuItemVisible(this.mSend)) {
                this.mSend.setEnabled(true);
            }
        }

        /* JADX WARNING: type inference failed for: r10v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r10v7, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r10v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 37
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
        public boolean onActionItemClicked(final ActionMode actionMode, MenuItem menuItem) {
            switch (menuItem.getItemId()) {
                case R.id.action_produce /*2131296279*/:
                    MediaAndAlbumOperations.doProduceCreation(AlbumDetailFragmentBase.this.mActivity, new OnCompleteListener() {
                        public void onComplete(long[] jArr) {
                            List checkedItems = AlbumDetailFragmentBase.this.mAlbumDetailGridViewWrapper.getCheckedItems();
                            int i = 0;
                            for (int i2 = 0; i2 < checkedItems.size(); i2++) {
                                if (ImageFeatureCacheManager.getInstance().isBestImage(((CheckedItem) checkedItems.get(i2)).getId(), false, false, null)) {
                                    i++;
                                }
                            }
                            HashMap hashMap = new HashMap();
                            hashMap.put("count", Integer.valueOf(checkedItems.size()));
                            hashMap.put("best_image_count", Integer.valueOf(i));
                            GallerySamplingStatHelper.recordCountEvent("album_detail", "produce", hashMap);
                            actionMode.finish();
                        }
                    }, AlbumDetailFragmentBase.this.mAlbumDetailGridViewWrapper.getCheckedItems());
                    break;
                case R.id.action_send /*2131296285*/:
                    AlbumDetailFragmentBase.this.onSend(null, null);
                    break;
                case R.id.add_to_album /*2131296294*/:
                    MediaAndAlbumOperations.addToAlbum(AlbumDetailFragmentBase.this.mActivity, new OnAddAlbumListener() {
                        public void onComplete(long[] jArr, boolean z) {
                            AnonymousClass8.this.mMode.finish();
                            GallerySamplingStatHelper.recordCountEvent("album_detail", "add_to_album");
                        }
                    }, 0, !AlbumDetailFragmentBase.this.isVirtualAlbum(), AlbumDetailFragmentBase.this.canAddSecret(), AlbumDetailFragmentBase.this.mAlbumDetailGridViewWrapper.isCheckedItemContainVideo(), MiscUtil.ListToArray(AlbumDetailFragmentBase.this.getBurstCheckedItemIds()));
                    break;
                case R.id.delete /*2131296454*/:
                    AlbumDetailFragmentBase.this.doDelete(actionMode);
                    break;
                case R.id.remove_secret /*2131296864*/:
                    MediaAndAlbumOperations.removeFromSecretAlbum(AlbumDetailFragmentBase.this.mActivity, new OnCompleteListener() {
                        public void onComplete(long[] jArr) {
                            actionMode.finish();
                            GallerySamplingStatHelper.recordCountEvent("album_detail", "remove_from_secret");
                        }
                    }, MiscUtil.ListToArray(AlbumDetailFragmentBase.this.getBurstCheckedItemIds()));
                    break;
                default:
                    return false;
            }
            return true;
        }

        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            updateMenuState();
        }

        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            this.mMode = actionMode;
            if (AlbumDetailFragmentBase.this.isSecretAlbum()) {
                actionMode.getMenuInflater().inflate(R.menu.secret_page_menu, menu);
                this.mRemoveSecret = menu.findItem(R.id.remove_secret);
            } else {
                actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(AlbumDetailFragmentBase.this.mActivity) ? R.menu.v15_home_page_menu : R.menu.home_page_menu, menu);
                this.mAddToAlbum = menu.findItem(R.id.add_to_album);
                this.mCreativity = menu.findItem(R.id.action_produce);
            }
            this.mDelete = menu.findItem(R.id.delete);
            if (this.mCreativity != null) {
                this.mCreativity.setVisible(!AlbumDetailFragmentBase.this.isVideoAlbum());
            }
            if (this.mDelete != null) {
                this.mDelete.setVisible(true);
            }
            this.mSend = menu.findItem(R.id.action_send);
            GallerySamplingStatHelper.recordCountEvent("album_detail", "action_mode_create");
            AlbumDetailFragmentBase.this.onEnterActionMode();
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            updateMenuState();
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return false;
        }
    };
    protected int mDailyAlbumDate;
    private Dialog mDialog;
    /* access modifiers changed from: private */
    public boolean mEnableAutoUploadPending;
    protected boolean mIsDailyAlbum;
    protected boolean mIsFavoritesAlbum;
    protected boolean mIsLocalAlbum;
    protected boolean mIsOtherShareAlbum;
    protected boolean mIsPanoAlbum;
    protected boolean mIsScreenshotAlbum;
    private boolean mIsShareAlbum;
    protected String mScreenshotAppName;
    /* access modifiers changed from: private */
    public boolean mSharePending;
    private VoiceAssistantReceiver mVoiceAssistantReceiver;

    private static class AlbumScanTask implements Job<Void> {
        private final long mAlbumId;
        private final String mAlbumLocalPath;

        public AlbumScanTask(String str, long j) {
            this.mAlbumLocalPath = str;
            this.mAlbumId = j;
        }

        public Void run(JobContext jobContext) {
            Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
            String[] absolutePath = StorageUtils.getAbsolutePath(sGetAndroidContext, this.mAlbumLocalPath);
            if (absolutePath != null && absolutePath.length > 0) {
                MediaScannerUtil.scanDirectories(sGetAndroidContext, Lists.newArrayList((E[]) absolutePath), 3, false);
            }
            if (this.mAlbumId > 0) {
                MediaScannerUtil.cleanupByAlbumId(sGetAndroidContext, 4, Lists.newArrayList((E[]) new String[]{String.valueOf(this.mAlbumId)}));
            }
            return null;
        }
    }

    private class VoiceAssistantReceiver extends BroadcastReceiver {
        private VoiceAssistantReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (AlbumDetailFragmentBase.this.mAlbumDetailGridViewWrapper.isInActionMode()) {
                AlbumDetailFragmentBase.this.onSend(intent.getStringExtra("assistant_target_package"), intent.getStringExtra("assistant_target_class"));
            }
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(" AND ");
        sb.append(Cloud.ALIAS_LOCAL_MEDIA);
        SELECTION_ONLY_LOCAL = sb.toString();
    }

    /* access modifiers changed from: private */
    public boolean canAddSecret() {
        return !isOthersShareAlbum();
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    private void doAddPhotos(final long[] jArr) {
        if (isOthersShareAlbum()) {
            Log.d("AlbumDetailFragmentBase", "Is other shared album, do copy operation for default");
            CopyMoveDialogFragment.show(this.mActivity, this.mAlbumId, jArr, 0, false, null);
            recordCopyMoveAction(false);
        } else if (hasOtherShareMedia(jArr)) {
            Log.d("AlbumDetailFragmentBase", "Contains other's share media, do copy operation for default");
            CopyMoveDialogFragment.show(this.mActivity, this.mAlbumId, jArr, 0, false, null);
            recordCopyMoveAction(false);
        } else {
            CopyOrMoveDialog copyOrMoveDialog = new CopyOrMoveDialog();
            copyOrMoveDialog.setOnOperationSelectedListener(new OnOperationSelectedListener() {
                /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
                /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 20
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
                public void onOperationSelected(int i) {
                    switch (i) {
                        case 1:
                            CopyMoveDialogFragment.show(AlbumDetailFragmentBase.this.mActivity, AlbumDetailFragmentBase.this.mAlbumId, jArr, 0, false, null);
                            AlbumDetailFragmentBase.this.recordCopyMoveAction(false);
                            return;
                        case 2:
                            return;
                        default:
                            CopyMoveDialogFragment.show(AlbumDetailFragmentBase.this.mActivity, AlbumDetailFragmentBase.this.mAlbumId, jArr, 0, true, null);
                            AlbumDetailFragmentBase.this.recordCopyMoveAction(true);
                            return;
                    }
                }
            });
            copyOrMoveDialog.showAllowingStateLoss(getFragmentManager(), "CopyOrMoveDialog");
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 72
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
    public void doDelete(final ActionMode actionMode) {
        long[] jArr;
        Map map;
        boolean z = false;
        if (isOthersShareAlbum()) {
            SparseBooleanArray checkedItemPositions = this.mAlbumDetailGridViewWrapper.getCheckedItemPositions();
            jArr = null;
            if (checkedItemPositions == null || checkedItemPositions.size() <= 0) {
                map = null;
            } else {
                map = null;
                for (int i = 0; i < checkedItemPositions.size(); i++) {
                    if (checkedItemPositions.valueAt(i)) {
                        int keyAt = checkedItemPositions.keyAt(i);
                        if (map == null) {
                            map = new HashMap();
                        }
                        for (Long put : getAdapter().getBurstItemKeys(keyAt)) {
                            map.put(put, getCreatorIdByPosition(keyAt));
                        }
                    }
                }
            }
            if (map != null) {
                ArrayList ownerSharedImageIds = ShareMediaManager.getOwnerSharedImageIds(map);
                if (ownerSharedImageIds != null && ownerSharedImageIds.size() > 0) {
                    jArr = new long[ownerSharedImageIds.size()];
                    for (int i2 = 0; i2 < ownerSharedImageIds.size(); i2++) {
                        jArr[i2] = ((Long) ownerSharedImageIds.get(i2)).longValue();
                    }
                }
            }
            if (checkedItemPositions != null && checkedItemPositions.size() > 0 && (jArr == null || jArr.length < checkedItemPositions.size())) {
                z = true;
            }
        } else {
            jArr = MiscUtil.ListToArray(getBurstCheckedItemIds());
        }
        long[] jArr2 = jArr;
        if (jArr2 == null || jArr2.length <= 0) {
            if (z) {
                ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.delete_other_shared_images));
            }
            actionMode.finish();
            return;
        }
        MediaAndAlbumOperations.delete(this.mActivity, "AlbumDetailFragmentBaseDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
            /* JADX WARNING: type inference failed for: r7v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: type inference failed for: r7v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 26
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
            public void onDeleted(int i, long[] jArr) {
                if (AlbumDetailFragmentBase.this.mActivity != null) {
                    ToastUtils.makeText((Context) AlbumDetailFragmentBase.this.mActivity, (CharSequence) AlbumDetailFragmentBase.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                    if (i > 0) {
                        SoundUtils.playSoundForOperation(AlbumDetailFragmentBase.this.mActivity, 0);
                    }
                    actionMode.finish();
                    HashMap hashMap = new HashMap();
                    hashMap.put("count", Integer.valueOf(i));
                    GallerySamplingStatHelper.recordCountEvent("album_detail", "delete_photo", hashMap);
                }
            }
        }, this.mAlbumId, this.mAlbumName, getDupType(), 23, jArr2);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 17
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
    private void doShare() {
        UIHelper.showAlbumShareInfo(this.mActivity, new Path(this.mIsOtherShareAlbum ? ShareAlbumManager.getOriginalAlbumId(this.mAlbumId) : this.mAlbumId, this.mIsOtherShareAlbum, getAdapter().isBabyAlbum()), this.mIsOtherShareAlbum ? 6 : 0);
    }

    /* access modifiers changed from: private */
    public ArrayList<Long> getBurstCheckedItemIds() {
        SparseBooleanArray checkedItemPositions = this.mAlbumDetailGridViewWrapper.getCheckedItemPositions();
        ArrayList<Long> arrayList = new ArrayList<>();
        for (int i = 0; i < checkedItemPositions.size(); i++) {
            int keyAt = checkedItemPositions.keyAt(i);
            if (checkedItemPositions.get(keyAt)) {
                arrayList.addAll(getAdapter().getBurstItemKeys(keyAt));
            }
        }
        return arrayList;
    }

    private static boolean hasOtherShareMedia(long[] jArr) {
        for (long isOtherShareMediaId : jArr) {
            if (ShareMediaManager.isOtherShareMediaId(isOtherShareMediaId)) {
                return true;
            }
        }
        return false;
    }

    private boolean isOnlyShowLocal() {
        return LocalMode.isOnlyShowLocalPhoto();
    }

    /* access modifiers changed from: private */
    public void onSend(String str, String str2) {
        SparseBooleanArray checkedItemPositions = this.mAlbumDetailGridViewWrapper.getCheckedItemPositions();
        ArrayList arrayList = new ArrayList(checkedItemPositions.size());
        ArrayList arrayList2 = new ArrayList(checkedItemPositions.size());
        int i = 0;
        int i2 = Integer.MAX_VALUE;
        for (int i3 = 0; i3 < checkedItemPositions.size(); i3++) {
            int keyAt = checkedItemPositions.keyAt(i3);
            if (checkedItemPositions.get(keyAt)) {
                arrayList.add(Integer.valueOf(keyAt));
                arrayList2.add(Long.valueOf(getAdapter().getItemKey(keyAt)));
                if (keyAt < i2) {
                    i2 = keyAt;
                }
            }
        }
        if (arrayList.size() != 0) {
            int[] iArr = new int[arrayList.size()];
            long[] jArr = new long[arrayList2.size()];
            for (int i4 = 0; i4 < arrayList.size(); i4++) {
                iArr[i4] = ((Integer) arrayList.get(i4)).intValue();
                jArr[i4] = ((Long) arrayList2.get(i4)).longValue();
            }
            if (i2 != Integer.MAX_VALUE) {
                i = i2;
            }
            ImageLoadParams imageLoadParams = new ImageLoadParams(getAdapter().getItemKey(i), getAdapter().getLocalPath(i), ThumbConfig.get().sMicroTargetSize, getAdapter().getItemDecodeRectF(i), i, getAdapter().getMimeType(i), getAdapter().getItemSecretKey(i), getAdapter().getFileLength(i));
            IntentUtil.gotoPreviewSelectPage(this, getUri(), i, getAdapter().getCount(), getSelection(), getSelectionArgs(), getCurrentSortOrder(), imageLoadParams, jArr, iArr, str, str2);
            this.mAlbumDetailGridViewWrapper.stopActionMode();
            HashMap hashMap = new HashMap();
            hashMap.put("count", Integer.valueOf(checkedItemPositions.size()));
            GallerySamplingStatHelper.recordCountEvent("album_detail", "send", hashMap);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    private void pickPhotos() {
        Intent intent = new Intent(this.mActivity, PickGalleryActivity.class);
        intent.putExtra("pick-upper-bound", -1);
        intent.putExtra("pick-need-id", true);
        startActivityForResult(intent, 7);
    }

    /* access modifiers changed from: private */
    public void recordCopyMoveAction(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("move", String.valueOf(z));
        hashMap.put("from", getClass().getSimpleName());
        GallerySamplingStatHelper.recordCountEvent("organize_photos", "move_or_copy", hashMap);
    }

    private void scanAlbumFolderIfNeeded() {
        if (!this.mIsOtherShareAlbum && !isVirtualAlbum() && this.mAlbumLocalPath != null) {
            ThreadManager.getMiscPool().submit(new AlbumScanTask(this.mAlbumLocalPath, this.mAlbumId));
        }
    }

    private void showAlbumShareInfo() {
        if (needEnableAutoUpload()) {
            showDialog(R.string.auto_upload_before_share_title, R.string.auto_upload_before_share_message, 17039370, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    AlbumDetailFragmentBase.this.onEnableAutoUpload(true);
                }
            });
        } else {
            doShare();
        }
    }

    private void updateConfiguration(Configuration configuration) {
        int i = 1;
        if (configuration.orientation == 2) {
            if (this.mIsScreenshotAlbum) {
                i = ThumbConfig.get().sMicroThumbScreenshotColumnsLand;
                this.mAlbumDetailGridView.setVerticalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_screenshots_spacing));
                this.mAlbumDetailGridView.setHorizontalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_screenshots_spacing));
            } else if (this.mIsPanoAlbum) {
                ThumbConfig.get().getClass();
                this.mAlbumDetailGridView.setVerticalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_pano_vertical_spacing));
            } else {
                i = ThumbConfig.get().sMicroThumbColumnsLand;
            }
        } else if (this.mIsScreenshotAlbum) {
            i = ThumbConfig.get().sMicroThumbScreenshotColumnsPortrait;
            this.mAlbumDetailGridView.setVerticalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_screenshots_spacing));
            this.mAlbumDetailGridView.setHorizontalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_screenshots_spacing));
        } else if (this.mIsPanoAlbum) {
            ThumbConfig.get().getClass();
            this.mAlbumDetailGridView.setVerticalSpacing(getResources().getDimensionPixelSize(R.dimen.micro_thumb_pano_vertical_spacing));
        } else {
            i = ThumbConfig.get().sMicroThumbColumnsPortrait;
        }
        this.mAlbumDetailGridView.setNumColumns(i);
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 19
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
    /* JADX WARNING: Unknown variable types count: 3 */
    public void consumePendingEvent() {
        if (this.mEnableAutoUploadPending) {
            if (!SyncUtil.existXiaomiAccount(this.mActivity)) {
                ToastUtils.makeText((Context) this.mActivity, (int) R.string.xiaomi_account_not_exists_toast);
            } else if (!ContentResolver.getMasterSyncAutomatically()) {
                ToastUtils.makeText((Context) this.mActivity, (int) R.string.sync_diabled_toast);
            } else if (doChangeAutoUpload(true) && this.mSharePending) {
                doShare();
            }
        }
        this.mEnableAutoUploadPending = false;
        this.mSharePending = false;
    }

    /* access modifiers changed from: protected */
    public void disableAutoUpload() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.disable_auto_upload_tip, (int) R.string.disable_auto_upload_title, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                AlbumDetailFragmentBase.this.doChangeAutoUpload(false);
            }
        }, (OnClickListener) null);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r6v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 5 */
    public boolean doChangeAutoUpload(boolean z) {
        if (z || !this.mIsShareAlbum) {
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(this.mActivity);
            if (xiaomiAccount == null) {
                return false;
            }
            if (z && !ContentResolver.getSyncAutomatically(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
                if (!SyncUtil.setSyncAutomatically(this.mActivity, true)) {
                    return false;
                }
                getAdapter().updateGalleryCloudSyncableState();
            }
            MediaAndAlbumOperations.doChangeAutoUpload(this.mActivity, this.mAlbumId, z);
            ToastUtils.makeTextLong((Context) this.mActivity, z ? R.string.auto_upload_enable_toast_long_press_menu : R.string.auto_upload_disable_toast_long_press_menu);
            return true;
        }
        ToastUtils.makeText((Context) this.mActivity, (int) R.string.share_album_needs_auto_upload_tip);
        return false;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    public void doChangeShowInOtherAlbums(boolean z) {
        MediaAndAlbumOperations.doChangeShowInOtherAlbums(this.mActivity, this.mAlbumId, z);
        ToastUtils.makeTextLong((Context) getActivity(), z ? R.string.show_in_other_albums_enable_toast_long_press_menu : R.string.show_in_other_albums_disable_toast_long_press_menu);
    }

    /* access modifiers changed from: protected */
    public void enableAutoUpload() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.enable_auto_upload_tip, (int) R.string.enable_auto_upload_title, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                AlbumDetailFragmentBase.this.onEnableAutoUpload(false);
            }
        }, (OnClickListener) null);
    }

    /* access modifiers changed from: protected */
    public abstract String getCreatorIdByPosition(int i);

    /* access modifiers changed from: protected */
    public int getDupType() {
        if (isVideoAlbum() || isPanoAlbum() || isDailyAlbum() || isFavoritesAlbum()) {
            return 3;
        }
        return getUri().getBooleanQueryParameter("remove_duplicate_items", false) ? 2 : 0;
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        if (isOthersShareAlbum()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        if (isVideoAlbum()) {
            sb.append("serverType = ? AND ");
            sb.append("alias_hidden = ? AND ");
            sb.append("localGroupId != ?");
        } else if (isPanoAlbum()) {
            sb.append("title LIKE ? AND ");
            sb.append("alias_hidden = ?");
        } else if (isDailyAlbum()) {
            sb.append("alias_create_date = ? AND ");
            sb.append("alias_hidden = ? AND ");
            sb.append("localGroupId != ?");
        } else if (isFavoritesAlbum()) {
            sb.append("alias_is_favorite = ? AND ");
            sb.append("alias_hidden = ? AND ");
            sb.append("localGroupId != ?");
        } else if (this.mIsScreenshotAlbum) {
            if (!TextUtils.isEmpty(this.mScreenshotAppName)) {
                sb.append("location");
                sb.append(" = ? AND ");
                sb.append("title");
                sb.append(" like '");
                sb.append("Screenshot");
                sb.append("%' AND ");
            }
            sb.append("localGroupId = ?");
        } else {
            sb.append("localGroupId = ?");
        }
        if (isOnlyShowLocal() && !isSecretAlbum()) {
            sb.append(SELECTION_ONLY_LOCAL);
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        if (isVideoAlbum()) {
            return new String[]{String.valueOf(2), String.valueOf(0), String.valueOf(-1000)};
        } else if (isPanoAlbum()) {
            return new String[]{"PANO_.*", String.valueOf(0)};
        } else if (isOthersShareAlbum()) {
            return null;
        } else {
            if (isDailyAlbum()) {
                return new String[]{String.valueOf(this.mDailyAlbumDate), String.valueOf(0), String.valueOf(-1000)};
            } else if (isFavoritesAlbum()) {
                return new String[]{String.valueOf(1), String.valueOf(0), String.valueOf(-1000)};
            } else if (!this.mIsScreenshotAlbum || TextUtils.isEmpty(this.mScreenshotAppName)) {
                return new String[]{String.valueOf(this.mAlbumId)};
            } else {
                return new String[]{this.mScreenshotAppName, String.valueOf(this.mAlbumId)};
            }
        }
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return getUri(SortBy.NONE);
    }

    /* access modifiers changed from: protected */
    public Uri getUri(SortBy sortBy) {
        if (isOthersShareAlbum()) {
            return ContentUris.withAppendedId(Media.URI_OTHER_ALBUM_MEDIA, this.mAlbumId);
        }
        Uri build = Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(isVirtualAlbum())).build();
        if (sortBy == SortBy.DATE && !isSecretAlbum() && !isDailyAlbum()) {
            build = build.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build();
        }
        return build;
    }

    public boolean isDailyAlbum() {
        return this.mIsDailyAlbum;
    }

    /* access modifiers changed from: protected */
    public boolean isFavoritesAlbum() {
        return this.mAlbumId == 2147483642;
    }

    /* access modifiers changed from: protected */
    public boolean isOthersShareAlbum() {
        return this.mIsOtherShareAlbum;
    }

    /* access modifiers changed from: protected */
    public boolean isPanoAlbum() {
        return this.mAlbumId == 2147483645;
    }

    /* access modifiers changed from: protected */
    public boolean isSecretAlbum() {
        return this.mAlbumId == -1000;
    }

    /* access modifiers changed from: protected */
    public boolean isVideoAlbum() {
        return this.mAlbumId == 2147483647L;
    }

    /* access modifiers changed from: protected */
    public boolean isVirtualAlbum() {
        return isVideoAlbum() || isPanoAlbum() || isSecretAlbum() || isDailyAlbum() || isFavoritesAlbum();
    }

    /* access modifiers changed from: protected */
    public void moveToOtherAlbums() {
        new Builder(getActivity()).setTitle(R.string.operation_move_to_other_albums).setMessage(R.string.move_to_other_albums_tip).setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                AlbumDetailFragmentBase.this.doChangeShowInOtherAlbums(true);
            }
        }).setNegativeButton(17039360, null).show();
    }

    /* access modifiers changed from: protected */
    public abstract boolean needEnableAutoUpload();

    public void onActivityResult(int i, int i2, Intent intent) {
        switch (i) {
            case 6:
                if (i2 == -1) {
                    finish();
                    break;
                }
                break;
            case 7:
                if (i2 == -1 && intent != null) {
                    ArrayList arrayList = (ArrayList) intent.getSerializableExtra("pick-result-data");
                    if (arrayList != null && !arrayList.isEmpty()) {
                        long[] jArr = new long[arrayList.size()];
                        for (int i3 = 0; i3 < arrayList.size(); i3++) {
                            jArr[i3] = ((Long) arrayList.get(i3)).longValue();
                        }
                        doAddPhotos(jArr);
                        break;
                    } else {
                        return;
                    }
                }
                break;
            default:
                super.onActivityResult(i, i2, intent);
                break;
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration(configuration);
        this.mAlbumDetailGridView.setSelection(this.mAlbumDetailGridView.getFirstVisiblePosition());
    }

    public /* synthetic */ void onCreate(LifecycleOwner lifecycleOwner) {
        CC.$default$onCreate(this, lifecycleOwner);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mAlbumLocalPath = this.mActivity.getIntent().getStringExtra("album_local_path");
        ProcessLifecycleOwner.get().getLifecycle().addObserver(this);
        scanAlbumFolderIfNeeded();
    }

    public void onDestroy() {
        ProcessLifecycleOwner.get().getLifecycle().removeObserver(this);
        super.onDestroy();
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
    }

    public /* synthetic */ void onDestroy(LifecycleOwner lifecycleOwner) {
        CC.$default$onDestroy(this, lifecycleOwner);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 27
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
    public void onEnableAutoUpload(final boolean z) {
        if (!SyncUtil.existXiaomiAccount(this.mActivity)) {
            Bundle bundle = new Bundle();
            bundle.putSerializable("cloud_guide_source", CloudGuideSource.AUTOBACKUP);
            bundle.putLong("autobackup_album_id", this.mAlbumId);
            IntentUtil.guideToLoginXiaomiAccount((Context) this.mActivity, bundle);
            this.mEnableAutoUploadPending = true;
            this.mSharePending = z;
        } else if (!ContentResolver.getMasterSyncAutomatically()) {
            showDialog(R.string.to_enable_sync_dialog_title, R.string.to_enable_sync_dialog_message, R.string.to_enable_sync_dialog_positive_button_text, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    AlbumDetailFragmentBase.this.mActivity.startActivity(new Intent("com.xiaomi.action.MICLOUD_MAIN"));
                    AlbumDetailFragmentBase.this.mEnableAutoUploadPending = true;
                    AlbumDetailFragmentBase.this.mSharePending = z;
                }
            });
        } else if (doChangeAutoUpload(true) && z) {
            doShare();
        }
    }

    /* access modifiers changed from: protected */
    public abstract void onEnterActionMode();

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        Intent intent = this.mActivity.getIntent();
        this.mAlbumName = intent.getStringExtra("album_name");
        this.mAlbumId = intent.getLongExtra("album_id", -1);
        this.mIsOtherShareAlbum = intent.getBooleanExtra("other_share_album", false);
        this.mIsLocalAlbum = intent.getBooleanExtra("is_local_album", false);
        this.mIsScreenshotAlbum = intent.getBooleanExtra("screenshot_album", false);
        this.mScreenshotAppName = intent.getStringExtra("screenshot_app_name");
        this.mIsShareAlbum = this.mIsOtherShareAlbum || intent.getBooleanExtra("owner_share_album", false);
        this.mIsPanoAlbum = intent.getBooleanExtra("pano_album", false);
        this.mIsDailyAlbum = intent.getBooleanExtra("daily_album", false);
        if (this.mIsDailyAlbum) {
            this.mDailyAlbumDate = intent.getIntExtra("daily_album_date", -1);
            if (this.mDailyAlbumDate <= 0) {
                finish();
            }
        }
        this.mIsFavoritesAlbum = intent.getBooleanExtra("favorites_album", false);
        this.mAlbumDetailGridViewWrapper = new EditableListViewWrapperDeprecated(this.mAlbumDetailGridView);
        this.mAlbumDetailGridViewWrapper.setEmptyView(this.mEmptyView);
        if (this.mIsScreenshotAlbum || this.mIsPanoAlbum) {
            this.mAlbumDetailGridViewWrapper.disableScaleImageViewAniWhenInActionMode();
        }
        this.mEmptyView.setVisibility(8);
        this.mAlbumDetailGridViewWrapper.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mAlbumDetailGridViewWrapper.setChoiceMode(3);
        this.mAlbumDetailGridViewWrapper.setMultiChoiceModeListener(this.mChoiceModeListener);
        updateConfiguration(getResources().getConfiguration());
        return onInflateView;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        int itemId = menuItem.getItemId();
        if (itemId == R.id.menu_add_photos) {
            pickPhotos();
            return true;
        } else if (itemId != R.id.menu_share) {
            return super.onOptionsItemSelected(menuItem);
        } else {
            showAlbumShareInfo();
            return true;
        }
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    public void onPause() {
        super.onPause();
        if (this.mVoiceAssistantReceiver != null) {
            LocalBroadcastManager.getInstance(this.mActivity).unregisterReceiver(this.mVoiceAssistantReceiver);
            this.mVoiceAssistantReceiver = null;
        }
    }

    public /* synthetic */ void onPause(LifecycleOwner lifecycleOwner) {
        CC.$default$onPause(this, lifecycleOwner);
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 14
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
    public void onResume() {
        super.onResume();
        consumePendingEvent();
        if (this.mVoiceAssistantReceiver == null) {
            this.mVoiceAssistantReceiver = new VoiceAssistantReceiver();
            LocalBroadcastManager.getInstance(this.mActivity).registerReceiver(this.mVoiceAssistantReceiver, new IntentFilter("com.miui.gallery.action.VOICE_ASSISTANT_SELECT_SHARE"));
        }
    }

    public void onResume(LifecycleOwner lifecycleOwner) {
        if (lifecycleOwner == ProcessLifecycleOwner.get() && getLifecycle().getCurrentState().isAtLeast(State.STARTED)) {
            Log.d("AlbumDetailFragmentBase", "onProcessResumed");
            scanAlbumFolderIfNeeded();
        }
    }

    public /* synthetic */ void onStart(LifecycleOwner lifecycleOwner) {
        CC.$default$onStart(this, lifecycleOwner);
    }

    public /* synthetic */ void onStop(LifecycleOwner lifecycleOwner) {
        CC.$default$onStop(this, lifecycleOwner);
    }

    /* access modifiers changed from: protected */
    public void removeFromOtherAlbums() {
        new Builder(getActivity()).setTitle(R.string.operation_remove_from_other_albums).setMessage(R.string.remove_from_other_albums_tip).setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                AlbumDetailFragmentBase.this.doChangeShowInOtherAlbums(false);
            }
        }).setNegativeButton(17039360, null).show();
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
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
    public void showDialog(int i, int i2, int i3, OnClickListener onClickListener) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
        this.mDialog = new AlertDialog.Builder(this.mActivity).setTitle(i).setMessage(i2).setPositiveButton(i3, onClickListener).setNegativeButton(17039360, null).create();
        this.mDialog.show();
    }
}

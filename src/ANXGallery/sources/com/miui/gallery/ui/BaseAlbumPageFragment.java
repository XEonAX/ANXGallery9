package com.miui.gallery.ui;

import android.accounts.Account;
import android.app.DialogFragment;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import android.view.View;
import com.miui.account.AccountHelper;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumPageAdapter;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy;
import com.miui.gallery.loader.AlbumConvertCallback;
import com.miui.gallery.loader.CursorConvertCallback;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.Album.AlbumType;
import com.miui.gallery.model.AlbumList;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.share.Path;
import com.miui.gallery.share.UIHelper;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.DeletionTask.Param;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView.RecyclerContextMenuInfo;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.HashMap;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public abstract class BaseAlbumPageFragment extends BaseFragment {
    protected CursorConvertCallback<AlbumList> mAlbumConvertCallback = new AlbumConvertCallback();
    protected AlbumPageAdapter mAlbumPageAdapter;
    /* access modifiers changed from: private */
    public OnDeletionCompleteListener mCompleteListener = new OnDeletionCompleteListener() {
        public void onDeleted(int i, long[] jArr) {
            if (BaseAlbumPageFragment.this.getActivity() != null) {
                if (i >= 0) {
                    ToastUtils.makeText((Context) BaseAlbumPageFragment.this.getActivity(), (CharSequence) BaseAlbumPageFragment.this.getActivity().getString(R.string.delete_album_success));
                    SoundUtils.playSoundForOperation(BaseAlbumPageFragment.this.getActivity(), 0);
                } else {
                    ToastUtils.makeText((Context) BaseAlbumPageFragment.this.getActivity(), (CharSequence) BaseAlbumPageFragment.this.getActivity().getString(R.string.delete_album_failed));
                }
            }
        }
    };
    protected GalleryRecyclerView mRecyclerView;
    protected Album mSelectedAlbum;

    /* access modifiers changed from: private */
    public void doChangeShowInOtherAlbums(boolean z) {
        MediaAndAlbumOperations.doChangeShowInOtherAlbums(getActivity(), this.mSelectedAlbum.getAlbumId(), z);
        ToastUtils.makeTextLong((Context) getActivity(), z ? R.string.show_in_other_albums_enable_toast_long_press_menu : R.string.show_in_other_albums_disable_toast_long_press_menu);
    }

    private void doChangeShowInPhotosTab(boolean z) {
        MediaAndAlbumOperations.doChangeShowInPhotosTab(getActivity(), this.mSelectedAlbum.getAlbumId(), z);
    }

    private void doDelete(String str) {
        int count = this.mSelectedAlbum.getCount();
        boolean existXiaomiAccount = SyncUtil.existXiaomiAccount(getActivity());
        final boolean z = existXiaomiAccount && this.mAlbumPageAdapter.isAutoUploadedAlbum(this.mSelectedAlbum.getAttributes(), this.mSelectedAlbum.getServerId(), this.mSelectedAlbum.getAlbumId()) && LocalMode.isOnlyShowLocalPhoto();
        Resources resources = getActivity().getResources();
        Object[] objArr = new Object[3];
        objArr[0] = (!existXiaomiAccount || z) ? "" : getString(R.string.delete_from_all_devices_and_cloud);
        objArr[1] = str;
        objArr[2] = count > 0 ? getResources().getQuantityString(R.plurals.album_item_msg_format, count, new Object[]{Integer.valueOf(count)}) : "";
        String string = resources.getString(R.string.delete_album_msg_format, objArr);
        Builder builder = new Builder(getActivity());
        if (z) {
            builder.setCheckBox(false, getString(R.string.delete_from_cloud));
        }
        builder.setTitle(R.string.delete).setMessage(string).setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                Param param = new Param(new long[]{BaseAlbumPageFragment.this.mSelectedAlbum.getAlbumId()}, (!z || ((AlertDialog) dialogInterface).isChecked()) ? 0 : 1, 22);
                DeletionTask deletionTask = new DeletionTask();
                deletionTask.setOnDeletionCompleteListener(BaseAlbumPageFragment.this.mCompleteListener);
                deletionTask.showProgress(BaseAlbumPageFragment.this.getActivity());
                deletionTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Param[]{param});
            }
        }).setNegativeButton(17039360, null).show();
    }

    private void doForceTop(boolean z) {
        MediaAndAlbumOperations.doForceTop(getActivity(), this.mSelectedAlbum.getAlbumId(), z);
    }

    private void doHideOrUnhide(boolean z) {
        MediaAndAlbumOperations.doHideOrUnhide(getActivity(), this.mSelectedAlbum.getAlbumId(), z);
    }

    private void doRename() {
        AlbumRenameDialogFragment.newInstance(this.mSelectedAlbum.getAlbumId(), this.mSelectedAlbum.getAlbumName(), null).showAllowingStateLoss(getFragmentManager(), "AlbumRenameDialogFragment");
    }

    private boolean isManualRenameRestricted(String str) {
        boolean z = false;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        AlbumsStrategy.Album albumByPath = CloudControlStrategyHelper.getAlbumByPath(StorageUtils.ensureCommonRelativePath(str));
        if (!(albumByPath == null || albumByPath.getAttributes() == null || !albumByPath.getAttributes().isManualRenameRestricted())) {
            z = true;
        }
        return z;
    }

    private void moveToOtherAlbums() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.move_to_other_albums_tip, (int) R.string.operation_move_to_other_albums, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                BaseAlbumPageFragment.this.doChangeShowInOtherAlbums(true);
            }
        }, (OnClickListener) null);
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [android.app.Fragment, com.miui.gallery.ui.BaseAlbumPageFragment] */
    /* access modifiers changed from: private */
    public void onEnableAutoUpload(boolean z) {
        Bundle bundle = new Bundle();
        if (z) {
            bundle.putInt("check_login_and_sync", 2);
        } else {
            bundle.putInt("check_login_and_sync", 1);
        }
        bundle.putSerializable("cloud_guide_source", CloudGuideSource.AUTOBACKUP);
        bundle.putLong("autobackup_album_id", this.mSelectedAlbum.getAlbumId());
        LoginAndSyncCheckFragment.checkLoginAndSyncState(this, bundle);
    }

    private void removeFromOtherAlbums() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.remove_from_other_albums_tip, (int) R.string.operation_remove_from_other_albums, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                BaseAlbumPageFragment.this.doChangeShowInOtherAlbums(false);
            }
        }, (OnClickListener) null);
    }

    private void showAlbumShareInfo() {
        if (!this.mAlbumPageAdapter.isAutoUploadedAlbum(this.mSelectedAlbum.getAttributes(), this.mSelectedAlbum.getServerId(), this.mSelectedAlbum.getAlbumId())) {
            ConfirmDialog.showConfirmDialog(getFragmentManager(), getResources().getString(R.string.auto_upload_before_share_title), getResources().getString(R.string.auto_upload_before_share_message), getResources().getString(17039360), getResources().getString(17039370), new ConfirmDialogInterface() {
                public void onCancel(DialogFragment dialogFragment) {
                }

                public void onConfirm(DialogFragment dialogFragment) {
                    BaseAlbumPageFragment.this.onEnableAutoUpload(true);
                }
            });
        } else {
            share();
        }
    }

    private void statAlbumOperation(Album album, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_PATH, album.getLocalPath());
        GallerySamplingStatHelper.recordCountEvent("album", str, hashMap);
    }

    /* access modifiers changed from: protected */
    public void disableAutoUpload() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.disable_auto_upload_tip, (int) R.string.disable_auto_upload_title, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                BaseAlbumPageFragment.this.doChangeAutoUpload(false);
            }
        }, (OnClickListener) null);
    }

    /* access modifiers changed from: protected */
    public boolean doChangeAutoUpload(boolean z) {
        if (z || !this.mAlbumPageAdapter.isShareAlbum(this.mSelectedAlbum.getAlbumId())) {
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(getActivity());
            if (xiaomiAccount == null) {
                return false;
            }
            if (z && !ContentResolver.getSyncAutomatically(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
                if (!SyncUtil.setSyncAutomatically(getActivity(), true)) {
                    return false;
                }
                this.mAlbumPageAdapter.updateGalleryCloudSyncableState();
            }
            MediaAndAlbumOperations.doChangeAutoUpload(getActivity(), this.mSelectedAlbum.getAlbumId(), z);
            ToastUtils.makeTextLong((Context) getActivity(), z ? R.string.auto_upload_enable_toast_long_press_menu : R.string.auto_upload_disable_toast_long_press_menu);
            return true;
        }
        ToastUtils.makeText((Context) getActivity(), (int) R.string.share_album_needs_auto_upload_tip);
        return false;
    }

    /* access modifiers changed from: protected */
    public void enableAutoUpload() {
        DialogUtil.showInfoDialog((Context) getActivity(), (int) R.string.enable_auto_upload_tip, (int) R.string.enable_auto_upload_title, 17039370, 17039360, (OnClickListener) new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                BaseAlbumPageFragment.this.onEnableAutoUpload(false);
            }
        }, (OnClickListener) null);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 != -1 || i != 29) {
            return;
        }
        if (this.mSelectedAlbum == null) {
            Log.w("BaseAlbumPageFragment", "The selected album entity is null!");
            return;
        }
        int intExtra = intent.getIntExtra("check_login_and_sync", -1);
        if (intExtra == 1) {
            doChangeAutoUpload(true);
        } else if (intExtra == 2 && doChangeAutoUpload(true)) {
            share();
        }
    }

    public boolean onContextItemSelected(MenuItem menuItem) {
        if (menuItem == null) {
            return false;
        }
        switch (menuItem.getItemId()) {
            case R.id.delete /*2131296454*/:
                doDelete(this.mSelectedAlbum.getLocalizedAlbumName());
                statAlbumOperation(this.mSelectedAlbum, "delete_album");
                break;
            case R.id.disable_auto_upload /*2131296473*/:
                disableAutoUpload();
                statAlbumOperation(this.mSelectedAlbum, "auto_upload_disable");
                break;
            case R.id.disable_show_in_photos_tab /*2131296474*/:
                doChangeShowInPhotosTab(false);
                statAlbumOperation(this.mSelectedAlbum, "show_in_home_disable");
                break;
            case R.id.enable_auto_upload /*2131296510*/:
                enableAutoUpload();
                statAlbumOperation(this.mSelectedAlbum, "auto_upload_enable");
                break;
            case R.id.enable_show_in_photos_tab /*2131296512*/:
                doChangeShowInPhotosTab(true);
                statAlbumOperation(this.mSelectedAlbum, "show_in_home_enable");
                break;
            case R.id.force_top /*2131296573*/:
                doForceTop(true);
                statAlbumOperation(this.mSelectedAlbum, "force_top");
                break;
            case R.id.hide /*2131296606*/:
                doHideOrUnhide(true);
                statAlbumOperation(this.mSelectedAlbum, "hide_album");
                break;
            case R.id.move_to_other_albums /*2131296739*/:
                moveToOtherAlbums();
                statAlbumOperation(this.mSelectedAlbum, "show_in_others_enable");
                break;
            case R.id.remove_from_other_albums /*2131296863*/:
                removeFromOtherAlbums();
                statAlbumOperation(this.mSelectedAlbum, "show_in_others_disable");
                break;
            case R.id.rename /*2131296866*/:
                doRename();
                statAlbumOperation(this.mSelectedAlbum, "rename_album");
                break;
            case R.id.share /*2131296928*/:
                showAlbumShareInfo();
                statAlbumOperation(this.mSelectedAlbum, "share_album");
                break;
            case R.id.unforce_top /*2131297051*/:
                doForceTop(false);
                statAlbumOperation(this.mSelectedAlbum, "unforce_top");
                break;
            case R.id.unhide /*2131297052*/:
                doHideOrUnhide(false);
                statAlbumOperation(this.mSelectedAlbum, "unhide_album");
                break;
            default:
                return false;
        }
        return true;
    }

    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenuInfo contextMenuInfo) {
        if (contextMenuInfo != null) {
            setContextMenuItems(contextMenu, ((RecyclerContextMenuInfo) contextMenuInfo).position);
        }
    }

    public void onStart() {
        super.onStart();
        this.mAlbumPageAdapter.updateGalleryCloudSyncableState();
        if (this.mRecyclerView != null) {
            registerForContextMenu(this.mRecyclerView);
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mRecyclerView != null) {
            unregisterForContextMenu(this.mRecyclerView);
        }
    }

    /* JADX WARNING: type inference failed for: r3v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 113
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
    public void setContextMenuItems(ContextMenu contextMenu, int i) {
        ContextMenu contextMenu2 = contextMenu;
        int i2 = i;
        Album item = this.mAlbumPageAdapter.getItem(i2);
        if (item == null) {
            Log.e("BaseAlbumPageFragment", "album entity should not be null!!!");
        } else if (item.getAlbumType() != AlbumType.OTHER_ALBUMS) {
            this.mSelectedAlbum = item;
            this.mActivity.getMenuInflater().inflate(R.menu.album_list_menu, contextMenu2);
            contextMenu2.setHeaderTitle(this.mSelectedAlbum.getLocalizedAlbumName());
            MenuItem findItem = contextMenu2.findItem(R.id.force_top);
            MenuItem findItem2 = contextMenu2.findItem(R.id.unforce_top);
            MenuItem findItem3 = contextMenu2.findItem(R.id.delete);
            MenuItem findItem4 = contextMenu2.findItem(R.id.share);
            MenuItem findItem5 = contextMenu2.findItem(R.id.remove_from_other_albums);
            MenuItem findItem6 = contextMenu2.findItem(R.id.move_to_other_albums);
            MenuItem findItem7 = contextMenu2.findItem(R.id.enable_auto_upload);
            MenuItem findItem8 = contextMenu2.findItem(R.id.disable_auto_upload);
            MenuItem findItem9 = contextMenu2.findItem(R.id.enable_show_in_photos_tab);
            MenuItem findItem10 = contextMenu2.findItem(R.id.disable_show_in_photos_tab);
            MenuItem findItem11 = contextMenu2.findItem(R.id.hide);
            MenuItem findItem12 = contextMenu2.findItem(R.id.unhide);
            MenuItem findItem13 = contextMenu2.findItem(R.id.rename);
            MenuItem menuItem = findItem6;
            if (this.mAlbumPageAdapter.isForceTypeTime(i2)) {
                findItem2.setVisible(true);
            } else {
                findItem.setVisible(true);
            }
            boolean isGalleryCloudSyncable = SyncUtil.isGalleryCloudSyncable(this.mActivity);
            if (this.mAlbumPageAdapter.isSystemAlbum(i2)) {
                if (this.mAlbumPageAdapter.isScreenshotsAlbum(i2)) {
                    if (isGalleryCloudSyncable) {
                        if (this.mAlbumPageAdapter.isAutoUploadedAlbum(i2)) {
                            findItem8.setVisible(true);
                        } else {
                            findItem7.setVisible(true);
                        }
                    }
                    if (this.mAlbumPageAdapter.isShowedPhotosTabAlbum(i2)) {
                        findItem10.setVisible(true);
                    } else {
                        findItem9.setVisible(true);
                    }
                }
            } else if (this.mAlbumPageAdapter.isOtherShareAlbum(i2)) {
                if (ApplicationHelper.supportShare()) {
                    findItem4.setVisible(true);
                }
                if (this.mAlbumPageAdapter.isHiddenAlbum(i2)) {
                    findItem12.setVisible(true);
                } else {
                    findItem11.setVisible(true);
                }
            } else if (!this.mAlbumPageAdapter.albumUnwriteable(i2)) {
                findItem3.setVisible(true);
                if (ApplicationHelper.supportShare()) {
                    findItem4.setVisible(true);
                }
                if (!this.mAlbumPageAdapter.isBabyAlbum(i2)) {
                    if (isGalleryCloudSyncable) {
                        if (this.mAlbumPageAdapter.isAutoUploadedAlbum(i2)) {
                            findItem8.setVisible(true);
                        } else {
                            findItem7.setVisible(true);
                        }
                    }
                    if (this.mAlbumPageAdapter.isHiddenAlbum(i2)) {
                        findItem12.setVisible(true);
                    } else {
                        findItem11.setVisible(true);
                    }
                    findItem13.setVisible(!isManualRenameRestricted(this.mSelectedAlbum.getLocalPath()));
                }
                if (this.mAlbumPageAdapter.isOtherAlbum(i2)) {
                    findItem5.setVisible(true);
                } else {
                    menuItem.setVisible(true);
                }
                if (this.mAlbumPageAdapter.isShowedPhotosTabAlbum(i2)) {
                    findItem10.setVisible(true);
                } else {
                    findItem9.setVisible(true);
                }
            } else if (this.mAlbumPageAdapter.isHiddenAlbum(i2)) {
                findItem12.setVisible(true);
            } else {
                findItem11.setVisible(true);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void share() {
        boolean isOtherShareAlbumId = ShareAlbumManager.isOtherShareAlbumId(this.mSelectedAlbum.getAlbumId());
        long albumId = this.mSelectedAlbum.getAlbumId();
        if (isOtherShareAlbumId) {
            albumId = ShareAlbumManager.getOriginalAlbumId(albumId);
        }
        UIHelper.showAlbumShareInfo(getActivity(), new Path(albumId, isOtherShareAlbumId, !TextUtils.isEmpty(this.mSelectedAlbum.getBabyInfo())), isOtherShareAlbumId ? 6 : 0);
    }
}

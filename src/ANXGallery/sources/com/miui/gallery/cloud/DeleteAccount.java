package com.miui.gallery.cloud;

import android.accounts.Account;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.os.AsyncTask;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.CloudControlRequestHelper;
import com.miui.gallery.push.GalleryPushManager;
import com.miui.gallery.util.DeleteDataUtil;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;

public class DeleteAccount {
    private static boolean sNeedDeleteAfterSync = false;
    private static int sWipeDataStrategyAfterSync = 2;

    public interface DeleteAccountListener {
        void onFinish();
    }

    private static class DeleteAccountTask extends AsyncTask<Void, Integer, Void> {
        private Activity mActivity;
        private ProgressDialog mDialog;
        private DeleteAccountListener mListener;
        private int mWipeDataStrategy;

        public DeleteAccountTask(Activity activity, int i, DeleteAccountListener deleteAccountListener) {
            this.mActivity = activity;
            this.mWipeDataStrategy = i;
            this.mListener = deleteAccountListener;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            DeleteAccount.executeDeleteAccount(this.mWipeDataStrategy);
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mDialog != null) {
                this.mDialog.dismiss();
                this.mDialog = null;
            }
            if (this.mListener != null) {
                this.mListener.onFinish();
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            if (this.mActivity != null) {
                this.mDialog = GalleryUtils.showProgressDialog(this.mActivity, R.string.initializing_cloud, R.string.initializing_cloud, 0, false);
            }
        }
    }

    public static void deleteAccountAfterSyncIfNeeded() {
        if (sNeedDeleteAfterSync) {
            executeDeleteAccount(sWipeDataStrategyAfterSync);
            sNeedDeleteAfterSync = false;
        }
    }

    public static void deleteAccountInTask(Activity activity, Account account, int i, DeleteAccountListener deleteAccountListener) {
        if (ContentResolver.isSyncActive(account, "com.miui.gallery.cloud.provider")) {
            sNeedDeleteAfterSync = true;
            sWipeDataStrategyAfterSync = i;
            SyncLog.d("DeleteAccount", "cancel sync...");
            ContentResolver.cancelSync(account, "com.miui.gallery.cloud.provider");
        }
        new DeleteAccountTask(activity, i, deleteAccountListener).execute(new Void[0]);
    }

    public static boolean executeDeleteAccount(int i) {
        GalleryPushManager.getInstance().onDeleteAccount(GalleryApp.sGetAndroidContext());
        AlbumShareOperations.resetAccountInfo();
        SyncLog.d("DeleteAccount", "reset AlbumShareOperations when account is deleted");
        DeleteRecorder.onDeleteAccount();
        GallerySyncAdapterImpl.resetAccountInfo(null, null);
        boolean delete = DeleteDataUtil.delete(GalleryApp.sGetAndroidContext(), i);
        SyncLog.d("DeleteAccount", "delete data result %s", (Object) Boolean.valueOf(delete));
        new CloudControlRequestHelper(GalleryApp.sGetAndroidContext()).execRequestSync();
        StringBuilder sb = new StringBuilder();
        sb.append("finish deleting account, strategy=");
        sb.append(i);
        sb.append(", result=");
        sb.append(delete);
        SyncLog.i("DeleteAccount", sb.toString());
        return delete;
    }
}

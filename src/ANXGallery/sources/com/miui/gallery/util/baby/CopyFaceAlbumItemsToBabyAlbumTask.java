package com.miui.gallery.util.baby;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.miui.gallery.R;
import com.miui.gallery.cloud.SpaceFullHandler;
import com.miui.gallery.model.SendToCloudFolderItem;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.share.Path;
import com.miui.gallery.share.UIHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ToastUtils;

public class CopyFaceAlbumItemsToBabyAlbumTask extends ProgressDialogTask {
    private Activity mActivity;
    private final SendToCloudFolderItem mFolderItem;
    private ProgressEndListener mListener;
    private int mProgress;
    private Cursor mSourceItems;

    public interface ProgressEndListener {
        void onProgressEnd(int i);
    }

    public CopyFaceAlbumItemsToBabyAlbumTask(Activity activity, Cursor cursor, SendToCloudFolderItem sendToCloudFolderItem, int i) {
        super(activity, cursor.getCount(), i, 0, false, true);
        this.mSourceItems = cursor;
        this.mFolderItem = sendToCloudFolderItem;
        this.mActivity = activity;
    }

    private int handleOneFile(ContentValues contentValues) {
        int i = SpaceFullHandler.isOwnerSpaceFull() ? 2 : 0;
        return i != 0 ? i : FaceManager.localCopyFaceImages2BabyAlbum(contentValues, this.mFolderItem.isShareAlbum()) ^ true ? 1 : 0;
    }

    public static CopyFaceAlbumItemsToBabyAlbumTask instance(Activity activity, Cursor cursor, SendToCloudFolderItem sendToCloudFolderItem, int i, int i2) {
        return new CopyFaceAlbumItemsToBabyAlbumTask(activity, cursor, sendToCloudFolderItem, i2);
    }

    public /* bridge */ /* synthetic */ void dismissDialog() {
        super.dismissDialog();
    }

    /* access modifiers changed from: protected */
    public Void doInBackground(Void... voidArr) {
        this.mProgress = 0;
        Cursor cursor = this.mSourceItems;
        if (cursor == null) {
            return null;
        }
        while (cursor.moveToNext()) {
            if (handleOneFile(FaceManager.changeCursorData2ContentValuesOfCloudTable(cursor, this.mFolderItem.getLocalGroupId())) == 0) {
                this.mProgress++;
                if (isDialogShowing()) {
                    publishProgress(new Integer[]{Integer.valueOf(this.mProgress)});
                }
                if (isCancelled()) {
                    break;
                }
            }
        }
        MiscUtil.closeSilently(cursor);
        return null;
    }

    /* access modifiers changed from: protected */
    public void onCancelled() {
        super.onCancelled();
        if (this.mListener != null) {
            this.mListener.onProgressEnd(this.mProgress);
        }
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(Void voidR) {
        super.onPostExecute(voidR);
        if (this.mListener != null) {
            this.mListener.onProgressEnd(this.mProgress);
            return;
        }
        ToastUtils.makeTextLong((Context) this.mActivity, (CharSequence) this.mActivity.getString(R.string.begin_share, new Object[]{this.mFolderItem.getFolderName()}));
        UIHelper.showAlbumShareInfo(this.mActivity, new Path(Long.parseLong(this.mFolderItem.getLocalGroupId()), false, true), 0);
        this.mActivity.finish();
    }

    public void setProgressFinishListener(ProgressEndListener progressEndListener) {
        this.mListener = progressEndListener;
    }
}

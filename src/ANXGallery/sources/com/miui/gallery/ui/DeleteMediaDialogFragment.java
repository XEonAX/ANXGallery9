package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Configuration;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.preference.GalleryPreferences.Delete;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.AlbumManager;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.DeletionTask.Param;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.util.ArrayList;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class DeleteMediaDialogFragment extends GalleryDialogFragment {
    private static final int[] TYPE_BURST_RESOURCE_MATRIX = {R.plurals.delete_burst_photo_from_local, R.plurals.delete_burst_photo_from_this_album_and_cloud_msg, R.plurals.delete_burst_photo_from_all_devices_and_cloud_msg};
    private static final int[][] TYPE_RESOURCE_MATRIX = {new int[]{R.plurals.delete_photo_from_local, R.plurals.delete_video_from_local, R.plurals.delete_media_from_local}, new int[]{R.plurals.delete_photo_from_this_album_and_cloud_msg, R.plurals.delete_video_from_this_album_and_cloud_msg, R.plurals.delete_media_from_this_album_and_cloud_msg}, new int[]{R.plurals.delete_photo_from_all_devices_and_cloud_msg, R.plurals.delete_video_from_all_devices_and_cloud_msg, R.plurals.delete_media_from_all_devices_and_cloud_msg}};
    private OnDeletionCompleteListener mDeletionFinishListener;
    private boolean mExistXiaomiAccount;
    private boolean mIsFirstDelete;
    /* access modifiers changed from: private */
    public Param mParam;

    class CheckBoxInfo {
        final boolean defaultValue;
        final String message;
        final int type;

        public CheckBoxInfo(int i) {
            this.type = i;
            this.message = genMessage(i);
            this.defaultValue = genDefaultValue(i);
        }

        private boolean genDefaultValue(int i) {
            return i != 1 ? false : false;
        }

        private String genMessage(int i) {
            return i != 1 ? "" : DeleteMediaDialogFragment.this.getActivity().getString(R.string.delete_from_cloud);
        }
    }

    private class DialogInfo {
        CheckBoxInfo checkBoxInfo;
        String message;

        private DialogInfo() {
        }
    }

    private class FirstDeleteDialog extends Dialog implements OnClickListener {
        private int mCurOrientation = 1;
        private View mDeleteTipIcon;
        private View mDeleteTitle;
        private Button mNegativeBtn;
        private OnClickListener mNegativeListener;
        private int mNegativeRes;
        private Button mPositiveBtn;
        private OnClickListener mPositiveListener;
        private int mPositiveRes;
        private TextView mSubTitle;
        private int mSubTitleRes;
        private TextView mTipOne;
        private String mTipOneText;
        private int mTipOneVisibility = 0;
        private TextView mTipThree;
        private String mTipThreeText;
        private int mTipThreeVisibility = 0;
        private TextView mTipTwo;
        private String mTipTwoText;
        private int mTipTwoVisibility = 0;

        public FirstDeleteDialog(Context context) {
            super(context);
        }

        private void setText(TextView textView, int i) {
            if (i > 0) {
                textView.setText(i);
            }
        }

        private void setText(TextView textView, String str) {
            if (!TextUtils.isEmpty(str)) {
                textView.setText(str);
            }
        }

        public void changeOrientation(int i) {
            this.mCurOrientation = i;
            if (this.mDeleteTitle == null) {
                return;
            }
            if (i == 2) {
                this.mDeleteTipIcon.setVisibility(8);
                this.mDeleteTitle.setVisibility(0);
            } else if (i == 1) {
                this.mDeleteTipIcon.setVisibility(0);
                this.mDeleteTitle.setVisibility(8);
            }
        }

        public void onClick(View view) {
            int id = view.getId();
            if (id == R.id.negative_btn) {
                if (this.mNegativeListener != null) {
                    this.mNegativeListener.onClick(view);
                }
                dismiss();
            } else if (id == R.id.positive_btn) {
                if (this.mPositiveListener != null) {
                    this.mPositiveListener.onClick(view);
                }
                dismiss();
            }
        }

        /* access modifiers changed from: protected */
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            setContentView(R.layout.first_delete);
            this.mDeleteTipIcon = findViewById(R.id.delete_tip_icon);
            this.mDeleteTitle = findViewById(R.id.delete_title);
            this.mSubTitle = (TextView) findViewById(R.id.delete_sub_title);
            this.mTipOne = (TextView) findViewById(R.id.delete_from_devices);
            this.mTipTwo = (TextView) findViewById(R.id.delete_from_web);
            this.mTipThree = (TextView) findViewById(R.id.delete_from_homepage_album);
            this.mPositiveBtn = (Button) findViewById(R.id.positive_btn);
            this.mNegativeBtn = (Button) findViewById(R.id.negative_btn);
            setText(this.mSubTitle, this.mSubTitleRes);
            setText((TextView) this.mPositiveBtn, this.mPositiveRes);
            setText((TextView) this.mNegativeBtn, this.mNegativeRes);
            this.mTipOne.setVisibility(this.mTipOneVisibility);
            this.mTipTwo.setVisibility(this.mTipTwoVisibility);
            this.mTipThree.setVisibility(this.mTipThreeVisibility);
            setText(this.mTipOne, this.mTipOneText);
            setText(this.mTipTwo, this.mTipTwoText);
            setText(this.mTipThree, this.mTipThreeText);
            this.mPositiveBtn.setOnClickListener(this);
            this.mNegativeBtn.setOnClickListener(this);
            Window window = getWindow();
            LayoutParams attributes = window.getAttributes();
            attributes.gravity = 80;
            attributes.width = -1;
            attributes.height = -2;
            window.setAttributes(attributes);
            changeOrientation(this.mCurOrientation);
        }

        public FirstDeleteDialog setNegativeButton(int i, OnClickListener onClickListener) {
            if (this.mNegativeBtn == null) {
                this.mNegativeRes = i;
            } else {
                this.mNegativeBtn.setText(i);
            }
            this.mNegativeListener = onClickListener;
            return this;
        }

        public FirstDeleteDialog setPositiveButton(int i, OnClickListener onClickListener) {
            if (this.mPositiveBtn == null) {
                this.mPositiveRes = i;
            } else {
                this.mPositiveBtn.setText(i);
            }
            this.mPositiveListener = onClickListener;
            return this;
        }

        public FirstDeleteDialog setSubTitle(int i) {
            if (this.mSubTitle == null) {
                this.mSubTitleRes = i;
            } else {
                this.mSubTitle.setText(this.mSubTitleRes);
            }
            return this;
        }

        public FirstDeleteDialog setTipText(int i, String str) {
            switch (i) {
                case 0:
                    if (this.mTipOne != null) {
                        this.mTipOne.setText(str);
                        break;
                    } else {
                        this.mTipOneText = str;
                        break;
                    }
                case 1:
                    if (this.mTipTwo != null) {
                        this.mTipTwo.setText(str);
                        break;
                    } else {
                        this.mTipTwoText = str;
                        break;
                    }
                case 2:
                    if (this.mTipThree != null) {
                        this.mTipThree.setText(str);
                        break;
                    } else {
                        this.mTipThreeText = str;
                        break;
                    }
            }
            return this;
        }

        public FirstDeleteDialog setTipVisibility(int i, boolean z) {
            int i2 = z ? 0 : 8;
            switch (i) {
                case 0:
                    if (this.mTipOne != null) {
                        this.mTipOne.setVisibility(i2);
                        break;
                    } else {
                        this.mTipOneVisibility = i2;
                        break;
                    }
                case 1:
                    if (this.mTipTwo != null) {
                        this.mTipTwo.setVisibility(i2);
                        break;
                    } else {
                        this.mTipTwoVisibility = i2;
                        break;
                    }
                case 2:
                    if (this.mTipThree != null) {
                        this.mTipThree.setVisibility(i2);
                        break;
                    } else {
                        this.mTipThreeVisibility = i2;
                        break;
                    }
            }
            return this;
        }
    }

    /* access modifiers changed from: private */
    public void doDelete() {
        DeletionTask deletionTask = new DeletionTask();
        deletionTask.setOnDeletionCompleteListener(this.mDeletionFinishListener);
        deletionTask.showProgress(getActivity());
        deletionTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Param[]{this.mParam});
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x004f  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0076  */
    private DialogInfo genDialogInfo() {
        DialogInfo dialogInfo = new DialogInfo();
        int i = 2;
        if (this.mExistXiaomiAccount) {
            if (!isOperateHomePage(this.mParam) && isOperateAlbum(this.mParam)) {
                if (isLocalMode(this.mParam.mAlbumId)) {
                    dialogInfo.checkBoxInfo = new CheckBoxInfo(1);
                } else if (isAlbumSyncable(this.mParam)) {
                    if (this.mParam.mDupType != 3) {
                        i = 1;
                    }
                }
            }
            int queryType = queryType(this.mParam);
            if (!this.mParam.mIsBurstItems) {
                dialogInfo.message = getActivity().getResources().getQuantityString(getBurstMessageRes(i), this.mParam.getItemsCount(), new Object[]{Integer.valueOf(this.mParam.getItemsCount())});
            } else {
                dialogInfo.message = getActivity().getResources().getQuantityString(getMessageRes(i, queryType), this.mParam.getItemsCount(), new Object[]{Integer.valueOf(this.mParam.getItemsCount())});
            }
            return dialogInfo;
        }
        i = 0;
        int queryType2 = queryType(this.mParam);
        if (!this.mParam.mIsBurstItems) {
        }
        return dialogInfo;
    }

    private int getBurstMessageRes(int i) {
        return TYPE_BURST_RESOURCE_MATRIX[i];
    }

    private int getCloudVideoCount(Param param) {
        long[] jArr;
        int i;
        long currentTimeMillis = System.currentTimeMillis();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (long j : param.mIds) {
            if (ShareMediaManager.isOtherShareMediaId(j)) {
                arrayList.add(Long.valueOf(j));
            } else {
                arrayList2.add(Long.valueOf(j));
            }
        }
        if (arrayList.size() > 0) {
            Cursor query = getActivity().getContentResolver().query(ShareImage.SHARE_URI, new String[]{"1073741823+_id"}, String.format("serverType=? AND 1073741823+_id IN (%s)", new Object[]{TextUtils.join(",", arrayList)}), new String[]{String.valueOf(2)}, null);
            if (query != null) {
                try {
                    i = query.getCount() + 0;
                } catch (Throwable th) {
                    if (query != null) {
                        query.close();
                    }
                    throw th;
                }
            } else {
                i = 0;
            }
            if (query != null) {
                query.close();
            }
        } else {
            i = 0;
        }
        if (arrayList2.size() > 0) {
            Cursor query2 = getActivity().getContentResolver().query(Media.URI, new String[]{"_id"}, String.format("serverType=? AND _id IN (%s)", new Object[]{TextUtils.join(",", arrayList2)}), new String[]{String.valueOf(2)}, null);
            if (query2 != null) {
                try {
                    i += query2.getCount();
                } catch (Throwable th2) {
                    if (query2 != null) {
                        query2.close();
                    }
                    throw th2;
                }
            }
            if (query2 != null) {
                query2.close();
            }
        }
        Log.d("DeleteMediaDialogFragment", "query video count cost %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return i;
    }

    private int getMessageRes(int i, int i2) {
        return TYPE_RESOURCE_MATRIX[i][i2];
    }

    private boolean isAlbumSyncable(Param param) {
        boolean z = true;
        if (ShareAlbumManager.isOtherShareAlbumId(param.mAlbumId) || AlbumManager.isVirtualAlbum(param.mAlbumId)) {
            return true;
        }
        if (param.mAlbumId > 0) {
            Cursor cursor = null;
            try {
                Cursor query = getActivity().getContentResolver().query(Cloud.CLOUD_URI, new String[]{"attributes"}, "_id=?", new String[]{String.valueOf(param.mAlbumId)}, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            if ((((long) query.getInt(0)) & 1) == 0) {
                                z = false;
                            }
                            MiscUtil.closeSilently(query);
                            return z;
                        }
                    } catch (Throwable th) {
                        Throwable th2 = th;
                        cursor = query;
                        th = th2;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                }
                MiscUtil.closeSilently(query);
            } catch (Throwable th3) {
                th = th3;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }
        return false;
    }

    private static boolean isLocalMode(long j) {
        return LocalMode.isOnlyShowLocalPhoto() && j != -1000;
    }

    private boolean isOperateAlbum(Param param) {
        return !isOperateHomePage(param) && (param.mAlbumId > 0 || param.mAlbumId == -1000);
    }

    private boolean isOperateHomePage(Param param) {
        return param.mDupType == 1;
    }

    public static DeleteMediaDialogFragment newInstance(Param param) {
        DeleteMediaDialogFragment deleteMediaDialogFragment = new DeleteMediaDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putSerializable("delete_params", param);
        deleteMediaDialogFragment.setArguments(bundle);
        return deleteMediaDialogFragment;
    }

    private int queryType(Param param) {
        int i;
        int itemsCount = param.getItemsCount();
        if (itemsCount > 200) {
            return 2;
        }
        if (param.mDeleteBy == 0) {
            i = getCloudVideoCount(param) + 0;
        } else if (param.mDeleteBy == 1) {
            int i2 = 0;
            for (String mimeType : param.mPaths) {
                if (FileMimeUtil.isVideoFromMimeType(FileMimeUtil.getMimeType(mimeType))) {
                    i2++;
                }
            }
            i = i2;
        } else {
            i = 0;
        }
        if (i == itemsCount) {
            return 1;
        }
        return i == 0 ? 0 : 2;
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.mIsFirstDelete) {
            ((FirstDeleteDialog) getDialog()).changeOrientation(configuration.orientation);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mParam = (Param) getArguments().getSerializable("delete_params");
        this.mExistXiaomiAccount = SyncUtil.existXiaomiAccount(getActivity());
        if (this.mExistXiaomiAccount) {
            if (isOperateHomePage(this.mParam)) {
                if (Delete.isFirstDeleteFromHomePage()) {
                    this.mIsFirstDelete = true;
                    FirstDeleteDialog subTitle = new FirstDeleteDialog(getActivity()).setPositiveButton(R.string.delete, new OnClickListener() {
                        public void onClick(View view) {
                            DeleteMediaDialogFragment.this.doDelete();
                        }
                    }).setNegativeButton(17039360, null).setSubTitle(R.string.delete_in_home_page);
                    subTitle.changeOrientation(getResources().getConfiguration().orientation);
                    return subTitle;
                }
            } else if (isOperateAlbum(this.mParam) && !isLocalMode(this.mParam.mAlbumId) && Delete.isFirstDeleteFromAlbum()) {
                this.mIsFirstDelete = true;
                FirstDeleteDialog tipVisibility = new FirstDeleteDialog(getActivity()).setPositiveButton(R.string.delete, new OnClickListener() {
                    public void onClick(View view) {
                        DeleteMediaDialogFragment.this.doDelete();
                    }
                }).setNegativeButton(17039360, null).setSubTitle(R.string.delete_in_album).setTipVisibility(2, false);
                if (!TextUtils.isEmpty(this.mParam.mAlbumName)) {
                    tipVisibility.setTipText(0, getString(R.string.delete_from_devices_album));
                }
                tipVisibility.changeOrientation(getResources().getConfiguration().orientation);
                return tipVisibility;
            }
        }
        final DialogInfo genDialogInfo = genDialogInfo();
        Builder builder = new Builder(getActivity());
        if (genDialogInfo.checkBoxInfo != null) {
            builder.setCheckBox(genDialogInfo.checkBoxInfo.defaultValue, genDialogInfo.checkBoxInfo.message);
        }
        return builder.setPositiveButton(R.string.delete, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                DeleteMediaDialogFragment.this.mParam.mDeleteOptions = 0;
                if (genDialogInfo.checkBoxInfo != null) {
                    AlertDialog alertDialog = (AlertDialog) dialogInterface;
                    if (genDialogInfo.checkBoxInfo.type == 1 && !alertDialog.isChecked()) {
                        DeleteMediaDialogFragment.this.mParam.mDeleteOptions = 1;
                    }
                }
                DeleteMediaDialogFragment.this.doDelete();
            }
        }).setNegativeButton(17039360, null).setTitle(getString(R.string.delete)).setMessage(genDialogInfo.message).create();
    }

    public void setOnDeletionCompleteListener(OnDeletionCompleteListener onDeletionCompleteListener) {
        this.mDeletionFinishListener = onDeletionCompleteListener;
    }
}

package com.miui.gallery.ui;

import android.accounts.Account;
import android.app.Activity;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.preference.GalleryPreferences.Secret;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.util.CheckDownloadOriginHelper;
import com.miui.gallery.util.CheckDownloadOriginHelper.CheckDownloadOriginListener;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.miui.privacy.LockSettingsHelper;
import java.util.ArrayList;
import miui.app.ProgressDialog;

public class AddRemoveSecretDialogFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public long mAlbumId;
    /* access modifiers changed from: private */
    public boolean mHasVideo;
    /* access modifiers changed from: private */
    public OnCompleteListener mListener;
    /* access modifiers changed from: private */
    public long[] mMediaIds;
    /* access modifiers changed from: private */
    public ArrayList<Uri> mMediaUris;
    /* access modifiers changed from: private */
    public int mOperationType;
    /* access modifiers changed from: private */
    public ProgressDialog mProgressDialog;

    class AddRemoveTask extends AsyncTask<Void, Void, long[]> {
        AddRemoveTask() {
        }

        private long[] addOrRemove() {
            Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
            if (AddRemoveSecretDialogFragment.this.mOperationType == 1) {
                return AddRemoveSecretDialogFragment.this.mMediaIds == null ? CloudUtils.addToSecret(sGetAndroidContext, AddRemoveSecretDialogFragment.this.mMediaUris) : CloudUtils.addToSecret(sGetAndroidContext, AddRemoveSecretDialogFragment.this.mMediaIds);
            }
            if (AddRemoveSecretDialogFragment.this.mOperationType == 2) {
                return CloudUtils.removeFromSecret(sGetAndroidContext, AddRemoveSecretDialogFragment.this.mAlbumId, AddRemoveSecretDialogFragment.this.mMediaIds);
            }
            return null;
        }

        private String getAddFailTip(Resources resources, int i, int i2, int i3) {
            if (i == -107) {
                return resources.getString(R.string.secret_reason_video_not_support);
            }
            String failReason = getFailReason(resources, i, i3);
            if (i2 > 1) {
                return resources.getQuantityString(R.plurals.add_to_secret_failed_with_reason_and_count, i3, new Object[]{failReason, Integer.valueOf(i3)});
            }
            return resources.getString(R.string.add_to_secret_failed_with_reason, new Object[]{failReason});
        }

        private String getFailReason(Resources resources, int i, int i2) {
            if (i == -111) {
                return resources.getQuantityString(R.plurals.fail_reason_processing_file, i2);
            }
            switch (i) {
                case -108:
                    return resources.getString(R.string.secret_reason_too_large);
                case -107:
                    return resources.getString(R.string.secret_reason_type_not_support);
                case -106:
                    return resources.getString(R.string.secret_reason_space_full);
                default:
                    return resources.getString(R.string.secret_reason_unknow_reasons);
            }
        }

        /* JADX WARNING: Code restructure failed: missing block: B:44:0x00ae, code lost:
            if (r13 > 0) goto L_0x00b0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:80:0x0148, code lost:
            if (r13 <= 0) goto L_0x0156;
         */
        private Pair<Boolean, String> outputResult(long[] jArr) {
            boolean z;
            String string;
            long j;
            String addFailTip;
            long[] jArr2 = jArr;
            String str = null;
            int i = 0;
            if (AddRemoveSecretDialogFragment.this.getActivity() == null) {
                return new Pair<>(Boolean.valueOf(false), null);
            }
            Resources resources = AddRemoveSecretDialogFragment.this.getActivity().getResources();
            if (AddRemoveSecretDialogFragment.this.mOperationType != 1) {
                if (AddRemoveSecretDialogFragment.this.mOperationType == 2) {
                    if (jArr2 == null || jArr2.length < 1) {
                        str = resources.getString(R.string.remove_from_secret_fail);
                    } else {
                        String str2 = "";
                        int length = jArr2.length;
                        int i2 = 0;
                        int i3 = 0;
                        int i4 = 0;
                        int i5 = 0;
                        int i6 = 0;
                        while (i2 < length) {
                            long j2 = jArr2[i2];
                            if (j2 > 0) {
                                i4++;
                                j = -103;
                            } else {
                                j = -103;
                                if (j2 != -103) {
                                    if (j2 != -104) {
                                        i3++;
                                        if (i5 == 0) {
                                            i5 = (int) j2;
                                        }
                                    }
                                }
                                i6++;
                            }
                            i2++;
                            long j3 = j;
                        }
                        if (i3 > 0) {
                            str2 = getFailReason(resources, i5, i3);
                        }
                        if (jArr2.length > 1) {
                            string = i3 != 0 ? resources.getQuantityString(R.plurals.remove_from_secret_failed_with_reason_and_count, i3, new Object[]{str2, Integer.valueOf(i3)}) : resources.getString(R.string.remove_from_secret_successful);
                        } else if (i4 == 1) {
                            string = resources.getString(R.string.remove_from_secret_successful);
                        } else if (i6 == 1) {
                            string = resources.getString(R.string.add_to_album_exist);
                        } else {
                            str = resources.getString(R.string.remove_from_secret_failed_with_reason, new Object[]{str2});
                        }
                        str = string;
                    }
                }
                z = false;
                return new Pair<>(Boolean.valueOf(z), str);
            } else if (jArr2 == null || jArr2.length < 1) {
                str = AddRemoveSecretDialogFragment.this.getString(R.string.add_to_secret_fail);
                z = false;
                return new Pair<>(Boolean.valueOf(z), str);
            } else {
                int i7 = 0;
                int i8 = 0;
                int i9 = 0;
                for (long j4 : jArr2) {
                    if (j4 > 0) {
                        i7++;
                    } else if (j4 == -103 || j4 == -104) {
                        i9++;
                    } else {
                        i8++;
                        if (i == 0) {
                            i = (int) j4;
                        }
                    }
                }
                int length2 = jArr2.length;
                int i10 = R.string.first_time_add_video_to_secret_tips;
                if (length2 > 1) {
                    if (i8 != 0) {
                        addFailTip = getAddFailTip(resources, i, jArr2.length, i8);
                    } else {
                        if (!AddRemoveSecretDialogFragment.this.mHasVideo || !Secret.isFirstAddSecretVideo()) {
                            i10 = R.string.add_to_secret_successful;
                        }
                        addFailTip = resources.getString(i10);
                    }
                } else if (i7 == 1) {
                    if (!AddRemoveSecretDialogFragment.this.mHasVideo || !Secret.isFirstAddSecretVideo()) {
                        i10 = R.string.add_to_secret_successful;
                    }
                    addFailTip = resources.getString(i10);
                } else {
                    addFailTip = i9 == 1 ? resources.getString(R.string.add_to_secret_exist) : getAddFailTip(resources, i, jArr2.length, i8);
                }
                str = addFailTip;
            }
            z = true;
            return new Pair<>(Boolean.valueOf(z), str);
        }

        /* access modifiers changed from: protected */
        public long[] doInBackground(Void... voidArr) {
            return addOrRemove();
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(long[] jArr) {
            String string;
            if (AddRemoveSecretDialogFragment.this.mListener != null) {
                AddRemoveSecretDialogFragment.this.mListener.onComplete(jArr);
            }
            if (AddRemoveSecretDialogFragment.this.getActivity() != null) {
                Pair outputResult = outputResult(jArr);
                String str = (String) outputResult.second;
                int i = 1;
                if (!((Boolean) outputResult.first).booleanValue() || AddRemoveSecretDialogFragment.this.mOperationType != 1) {
                    i = 0;
                } else if (Secret.isFirstAddSecret()) {
                    if (!AddRemoveSecretDialogFragment.this.mHasVideo || !Secret.isFirstAddSecretVideo()) {
                        i = 0;
                    } else {
                        String string2 = AddRemoveSecretDialogFragment.this.getString(R.string.first_time_add_video_to_secret_tips);
                        Secret.setFirstAddSecretVideo(false);
                        str = string2;
                    }
                    JumpDialogFragment.enterPrivateAlbum(AddRemoveSecretDialogFragment.this.getActivity());
                } else {
                    if (!TextUtils.isEmpty(str)) {
                        string = String.format("%s%s%s", new Object[]{str, AddRemoveSecretDialogFragment.this.getString(R.string.name_split), AddRemoveSecretDialogFragment.this.getString(R.string.alert_secret_album_message_lower_case)});
                    } else {
                        string = AddRemoveSecretDialogFragment.this.getString(R.string.alert_secret_album_message);
                    }
                    str = string;
                    if (AddRemoveSecretDialogFragment.this.mHasVideo && Secret.isFirstAddSecretVideo()) {
                        Secret.setFirstAddSecretVideo(false);
                    }
                }
                if (str != null) {
                    ToastUtils.makeText((Context) AddRemoveSecretDialogFragment.this.getActivity(), (CharSequence) str, i);
                }
                AddRemoveSecretDialogFragment.this.dismissAllowingStateLoss();
            }
        }
    }

    public static void add(Activity activity, OnCompleteListener onCompleteListener, boolean z, ArrayList<Uri> arrayList) {
        AddRemoveSecretDialogFragment addRemoveSecretDialogFragment = new AddRemoveSecretDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("arg_operation_type", 1);
        bundle.putParcelableArrayList("arg_media_uris", arrayList);
        bundle.putBoolean("arg_has_video", z);
        addRemoveSecretDialogFragment.setArguments(bundle);
        addRemoveSecretDialogFragment.setOnCompleteListener(onCompleteListener);
        addRemoveSecretDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "AddRemoveSecretDialogFragment");
    }

    public static void add(Activity activity, OnCompleteListener onCompleteListener, boolean z, long... jArr) {
        AddRemoveSecretDialogFragment addRemoveSecretDialogFragment = new AddRemoveSecretDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("arg_operation_type", 1);
        bundle.putLongArray("arg_media_ids", jArr);
        bundle.putBoolean("arg_has_video", z);
        addRemoveSecretDialogFragment.setArguments(bundle);
        addRemoveSecretDialogFragment.setOnCompleteListener(onCompleteListener);
        addRemoveSecretDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "AddRemoveSecretDialogFragment");
    }

    private void addOrRemoveSecret() {
        Bundle bundle = new Bundle();
        bundle.putBoolean("key_check_gallery_sync", true);
        bundle.putSerializable("cloud_guide_source", CloudGuideSource.SECRET);
        LoginAndSyncCheckFragment.checkLoginAndSyncState(this, bundle);
    }

    private void checkPrivateGalleryEnabled() {
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(getActivity());
        if (xiaomiAccount != null && (ContentResolver.getSyncAutomatically(xiaomiAccount, "com.miui.gallery.cloud.provider") || SyncUtil.setSyncAutomatically(getActivity(), true))) {
            if (!new LockSettingsHelper(getActivity()).isPrivacyPasswordEnabled()) {
                Secret.setIsFirstAddSecret(true);
                Secret.setFirstAddSecretVideo(true);
                LockSettingsHelper.startSetPrivacyPasswordActivity(this, 28);
            } else {
                doAddOrRemoveSecret();
            }
        }
    }

    private void doAddOrRemoveSecret() {
        if (this.mOperationType != 2 || this.mMediaIds == null) {
            startAddOrRemoveSecretTask();
            return;
        }
        CheckDownloadOriginHelper checkDownloadOriginHelper = new CheckDownloadOriginHelper(getActivity(), getFragmentManager(), this.mAlbumId, this.mMediaIds);
        checkDownloadOriginHelper.setListener(new CheckDownloadOriginListener() {
            public void onCanceled() {
                if (AddRemoveSecretDialogFragment.this.mListener != null) {
                    AddRemoveSecretDialogFragment.this.mListener.onComplete(null);
                }
                AddRemoveSecretDialogFragment.this.dismissAllowingStateLoss();
            }

            public void onComplete() {
                AddRemoveSecretDialogFragment.this.startAddOrRemoveSecretTask();
            }

            public void onStartDownload() {
                AddRemoveSecretDialogFragment.this.mProgressDialog.hide();
            }
        });
        checkDownloadOriginHelper.start();
    }

    public static void remove(Activity activity, OnCompleteListener onCompleteListener, long j, long... jArr) {
        AddRemoveSecretDialogFragment addRemoveSecretDialogFragment = new AddRemoveSecretDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("arg_operation_type", 2);
        bundle.putLongArray("arg_media_ids", jArr);
        bundle.putLong("arg_album_id", j);
        addRemoveSecretDialogFragment.setArguments(bundle);
        addRemoveSecretDialogFragment.setOnCompleteListener(onCompleteListener);
        addRemoveSecretDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "AddRemoveSecretDialogFragment");
    }

    /* access modifiers changed from: private */
    public void startAddOrRemoveSecretTask() {
        this.mProgressDialog.show();
        new AddRemoveTask().executeOnExecutor(AddRemoveTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        addOrRemoveSecret();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1) {
            switch (i) {
                case 28:
                    doAddOrRemoveSecret();
                    return;
                case 29:
                    checkPrivateGalleryEnabled();
                    return;
                default:
                    return;
            }
        } else {
            if (this.mListener != null) {
                this.mListener.onComplete(null);
            }
            dismissAllowingStateLoss();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mOperationType = getArguments().getInt("arg_operation_type");
        if (this.mOperationType == 1) {
            this.mMediaIds = getArguments().getLongArray("arg_media_ids");
            this.mMediaUris = getArguments().getParcelableArrayList("arg_media_uris");
            if (this.mMediaIds == null && this.mMediaUris == null) {
                throw new IllegalArgumentException("ids or uris can't be null");
            }
            this.mHasVideo = getArguments().getBoolean("arg_has_video", false);
        } else if (this.mOperationType == 2) {
            this.mAlbumId = getArguments().getLong("arg_album_id");
            if (this.mAlbumId > 0) {
                this.mMediaIds = getArguments().getLongArray("arg_media_ids");
                if (this.mMediaIds == null) {
                    throw new IllegalArgumentException("ids can't be null");
                }
            } else {
                throw new IllegalArgumentException("albumId must > 0");
            }
        } else {
            throw new IllegalArgumentException("unsupport operation");
        }
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mProgressDialog = ProgressDialog.show(getActivity(), "", getActivity().getString(R.string.adding_to_album), true, false);
        return this.mProgressDialog;
    }

    public void setOnCompleteListener(OnCompleteListener onCompleteListener) {
        this.mListener = onCompleteListener;
    }
}

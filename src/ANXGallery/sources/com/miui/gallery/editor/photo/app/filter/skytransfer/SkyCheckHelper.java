package com.miui.gallery.editor.photo.app.filter.skytransfer;

import android.app.Activity;
import android.app.DialogFragment;
import android.os.Build;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;

public class SkyCheckHelper {
    private static SkyCheckHelper sInstance = new SkyCheckHelper();
    private static boolean sIsSkyLibAvailable;
    private static boolean sIsSkyResAvailable;
    private static final String[] sSkyWhiteList = {"raphael", "raphaelin", "davinci", "davinciin", "pyxis"};
    private SkyDownloadStateListener mChildDownloadStateListener = new SkyDownloadStateListener() {
        private boolean isLibFinish;
        private boolean isResFinish;

        public void onDownloadStart(int i) {
            if (i == 1) {
                SkyCheckHelper.this.refreshDownloadStart();
                this.isLibFinish = false;
                return;
            }
            this.isResFinish = false;
        }

        public void onDownloading(int i, int i2) {
            if (i == 1) {
                SkyCheckHelper.this.refreshDownloading(i2);
            }
        }

        public void onFinish(int i, boolean z, int i2) {
            if (i == 2) {
                this.isResFinish = true;
            }
            if (i == 1) {
                this.isLibFinish = true;
            }
            if (this.isResFinish && this.isLibFinish) {
                SkyCheckHelper.this.refreshDownloadResult(z, i2);
            }
        }
    };
    private SkyDownloadStateListener mDownloadStateListener;
    private boolean mIsDownloading;
    private SkyDownloadStateListener mStubStateListener = new SkyDownloadStateListener() {
        public void onDownloadStart(int i) {
            SkyCheckHelper.this.refreshDownloadStart();
        }

        public void onDownloading(int i, int i2) {
            SkyCheckHelper.this.refreshDownloading(i2);
        }

        public void onFinish(int i, boolean z, int i2) {
            SkyCheckHelper.this.refreshDownloadResult(z, i2);
        }
    };

    public static SkyCheckHelper getInstance() {
        return sInstance;
    }

    public static boolean isSkyAvailable() {
        boolean z = false;
        if (!isSkyEnable()) {
            return false;
        }
        if (!sIsSkyLibAvailable) {
            sIsSkyLibAvailable = SkyLibraryLoaderHelper.getInstance().getLoaderState() == 0;
        }
        if (!sIsSkyResAvailable) {
            sIsSkyResAvailable = SkyResourceDownloadHelper.getInstance().isResourceDownloaded();
        }
        if (sIsSkyLibAvailable && sIsSkyResAvailable) {
            z = true;
        }
        return z;
    }

    public static boolean isSkyEnable() {
        for (String equals : sSkyWhiteList) {
            if (equals.equals(Build.DEVICE)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: private */
    public void refreshDownloadResult(boolean z, int i) {
        this.mIsDownloading = false;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onFinish(0, z, i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("refreshDownloadResult");
        sb.append(z);
        Log.d("SkyCheckHelper", sb.toString());
    }

    /* access modifiers changed from: private */
    public void refreshDownloadStart() {
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloadStart(0);
        }
    }

    /* access modifiers changed from: private */
    public void refreshDownloading(int i) {
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloading(0, i);
        }
    }

    /* access modifiers changed from: private */
    public void startDownload(boolean z) {
        if (isSkyAvailable()) {
            refreshDownloadResult(true, 0);
            return;
        }
        this.mIsDownloading = true;
        if (!sIsSkyResAvailable && !sIsSkyLibAvailable) {
            SkyLibraryLoaderHelper.getInstance().setDownloadStateListener(this.mChildDownloadStateListener);
            SkyLibraryLoaderHelper.getInstance().startDownload(z);
            SkyResourceDownloadHelper.getInstance().setDownloadStateListener(this.mChildDownloadStateListener);
            SkyResourceDownloadHelper.getInstance().startDownload(z);
        } else if (!sIsSkyLibAvailable) {
            SkyLibraryLoaderHelper.getInstance().setDownloadStateListener(this.mStubStateListener);
            SkyLibraryLoaderHelper.getInstance().startDownload(z);
        } else if (!sIsSkyResAvailable) {
            SkyResourceDownloadHelper.getInstance().setDownloadStateListener(this.mStubStateListener);
            SkyResourceDownloadHelper.getInstance().startDownload(z);
        }
    }

    public void setDownloadStateListener(SkyDownloadStateListener skyDownloadStateListener) {
        this.mDownloadStateListener = skyDownloadStateListener;
    }

    public void startDownloadWithCheck(Activity activity) {
        if (!this.mIsDownloading) {
            if (!NetworkUtils.isNetworkConnected()) {
                ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.filter_sky_download_failed);
                Log.d("SkyCheckHelper", "download sdk no network");
                refreshDownloadResult(false, -1);
            } else if (NetworkUtils.isActiveNetworkMetered()) {
                AnonymousClass1 r7 = new ConfirmDialogInterface() {
                    public void onCancel(DialogFragment dialogFragment) {
                        SkyCheckHelper.this.refreshDownloadResult(false, -1);
                    }

                    public void onConfirm(DialogFragment dialogFragment) {
                        SkyCheckHelper.this.startDownload(true);
                    }
                };
                ConfirmDialog.showConfirmDialog(activity.getFragmentManager(), activity.getResources().getString(R.string.filter_sky_download_sdk_without_wifi_title), String.format(activity.getResources().getString(R.string.filter_sky_download_sdk_without_wifi_msg), new Object[]{Integer.valueOf(22)}), activity.getResources().getString(R.string.base_btn_cancel), activity.getResources().getString(R.string.base_btn_download), r7);
            } else {
                startDownload(false);
            }
        }
    }

    public void startDownloadWithWifi() {
        if (NetworkUtils.isNetworkConnected() && !NetworkUtils.isActiveNetworkMetered()) {
            startDownload(false);
        }
    }
}

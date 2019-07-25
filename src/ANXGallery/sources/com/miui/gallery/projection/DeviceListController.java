package com.miui.gallery.projection;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import miui.R;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;
import miui.app.ProgressDialog;

public class DeviceListController implements OnClickListener {
    public static String MOBILE_NAME;
    private int mActiveDeviceIndex = -1;
    private Activity mActivity;
    /* access modifiers changed from: private */
    public DeviceSelectorAdapter mDeviceAdapter;
    private ArrayList<String> mDeviceList = new ArrayList<>();
    /* access modifiers changed from: private */
    public AlertDialog mDeviceListDialog;
    /* access modifiers changed from: private */
    public AlertDialog mDeviceNotFoundDialog;
    /* access modifiers changed from: private */
    public ProgressDialog mDeviceScanDialog;
    private OnItemClickListener mItemClickListener;
    /* access modifiers changed from: private */
    public AtomicBoolean mNeedShowDeviceList = new AtomicBoolean(false);
    /* access modifiers changed from: private */
    public Runnable mScanTimeoutRunnable = new Runnable() {
        public void run() {
            DeviceListController.this.dismissSafely(DeviceListController.this.mDeviceScanDialog);
            if (!DeviceListController.this.hasAirkanDevice()) {
                DeviceListController.this.showDeviceNotFoundDialog();
            }
        }
    };

    private static class DeviceSelectorAdapter extends BaseAdapter {
        private ArrayList<String> mDeviceList;
        private LayoutInflater mLayoutInflater;

        public DeviceSelectorAdapter(Context context, ArrayList<String> arrayList) {
            this.mDeviceList = arrayList;
            this.mLayoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        }

        public int getCount() {
            if (this.mDeviceList != null) {
                return this.mDeviceList.size();
            }
            return 0;
        }

        public String getItem(int i) {
            if (this.mDeviceList == null || i >= this.mDeviceList.size()) {
                return null;
            }
            return (String) this.mDeviceList.get(i);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = this.mLayoutInflater.inflate(R.layout.select_dialog_singlechoice, viewGroup, false);
            }
            ((TextView) view.findViewById(16908308)).setText(getItem(i));
            return view;
        }
    }

    public interface OnItemClickListener {
        void onItemClicked(String str);
    }

    public DeviceListController(Activity activity) {
        this.mActivity = activity;
        MOBILE_NAME = activity.getString(com.miui.gallery.R.string.projection_local_mobile);
    }

    private boolean activityAlive() {
        return this.mActivity != null && !this.mActivity.isDestroyed() && !this.mActivity.isFinishing();
    }

    /* access modifiers changed from: private */
    public void dismissSafely(Dialog dialog) {
        if (dialog != null && dialog.isShowing()) {
            dialog.dismiss();
        }
    }

    private void invalidate() {
        ThreadManager.getMainHandler().removeCallbacks(this.mScanTimeoutRunnable);
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                if (DeviceListController.this.mDeviceAdapter != null) {
                    DeviceListController.this.mDeviceAdapter.notifyDataSetChanged();
                }
                if (!DeviceListController.this.mNeedShowDeviceList.get()) {
                    return;
                }
                if (DeviceListController.this.hasAirkanDevice()) {
                    DeviceListController.this.dismissSafely(DeviceListController.this.mDeviceScanDialog);
                    DeviceListController.this.dismissSafely(DeviceListController.this.mDeviceNotFoundDialog);
                    DeviceListController.this.showDeviceListDialog();
                    return;
                }
                DeviceListController.this.dismissSafely(DeviceListController.this.mDeviceListDialog);
                if (DeviceListController.this.mDeviceNotFoundDialog == null || !DeviceListController.this.mDeviceNotFoundDialog.isShowing()) {
                    DeviceListController.this.showDeviceNotFoundDialog();
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public boolean isActive() {
        return this.mActiveDeviceIndex != -1;
    }

    /* access modifiers changed from: private */
    public void showDeviceListDialog() {
        if (activityAlive()) {
            AlertDialog alertDialog = this.mDeviceListDialog;
            int i = com.miui.gallery.R.string.projection_cancel;
            if (alertDialog == null) {
                if (this.mDeviceAdapter == null) {
                    this.mDeviceAdapter = new DeviceSelectorAdapter(this.mActivity, this.mDeviceList);
                }
                Builder onCancelListener = new Builder(this.mActivity).setTitle(com.miui.gallery.R.string.projection_multi_title).setSingleChoiceItems(this.mDeviceAdapter, this.mActiveDeviceIndex, this).setOnCancelListener(new OnCancelListener() {
                    public void onCancel(DialogInterface dialogInterface) {
                        DeviceListController.this.mNeedShowDeviceList.set(false);
                    }
                });
                if (isActive()) {
                    i = com.miui.gallery.R.string.projection_stop;
                }
                this.mDeviceListDialog = onCancelListener.setNegativeButton(i, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (DeviceListController.this.isActive()) {
                            DeviceListController.this.switchTo(-1);
                        }
                    }
                }).create();
            } else {
                Button button = this.mDeviceListDialog.getButton(-2);
                if (isActive()) {
                    i = com.miui.gallery.R.string.projection_stop;
                }
                button.setText(i);
            }
            if (!this.mDeviceListDialog.isShowing()) {
                this.mDeviceListDialog.show();
            }
            ListView listView = this.mDeviceListDialog.getListView();
            listView.setItemChecked(this.mActiveDeviceIndex, true);
            listView.setSelection(this.mActiveDeviceIndex);
        }
    }

    /* access modifiers changed from: private */
    public void showDeviceNotFoundDialog() {
        if (activityAlive()) {
            if (this.mDeviceNotFoundDialog == null) {
                this.mDeviceNotFoundDialog = new Builder(this.mActivity).setTitle(com.miui.gallery.R.string.cast_devices_unavailable_title).setMessage(com.miui.gallery.R.string.cast_devices_unavailable_desc).setCancelable(true).setPositiveButton(com.miui.gallery.R.string.have_known, null).setOnDismissListener(new OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        DeviceListController.this.mNeedShowDeviceList.set(false);
                    }
                }).create();
            }
            this.mDeviceNotFoundDialog.show();
        }
    }

    private void showScanDialog() {
        if (activityAlive()) {
            if (this.mDeviceScanDialog == null) {
                this.mDeviceScanDialog = new ProgressDialog(this.mActivity);
                this.mDeviceScanDialog.setIndeterminate(true);
                this.mDeviceScanDialog.setMessage(this.mActivity.getString(com.miui.gallery.R.string.searching_cast_devices));
                this.mDeviceScanDialog.setCancelable(true);
                this.mDeviceScanDialog.setCanceledOnTouchOutside(false);
                this.mDeviceScanDialog.setOnCancelListener(new OnCancelListener() {
                    public void onCancel(DialogInterface dialogInterface) {
                        ThreadManager.getMainHandler().removeCallbacks(DeviceListController.this.mScanTimeoutRunnable);
                        DeviceListController.this.mNeedShowDeviceList.set(false);
                    }
                });
            }
            this.mDeviceScanDialog.show();
            ThreadManager.getMainHandler().removeCallbacks(this.mScanTimeoutRunnable);
            ThreadManager.getMainHandler().postDelayed(this.mScanTimeoutRunnable, 5000);
        }
    }

    /* access modifiers changed from: private */
    public synchronized void switchTo(int i) {
        if (this.mItemClickListener != null) {
            if (i >= this.mDeviceList.size()) {
                dismissSafely(this.mDeviceListDialog);
            } else if (this.mActiveDeviceIndex == i) {
                dismissSafely(this.mDeviceListDialog);
            } else {
                this.mActiveDeviceIndex = i;
                this.mItemClickListener.onItemClicked(this.mActiveDeviceIndex == -1 ? MOBILE_NAME : (String) this.mDeviceList.get(this.mActiveDeviceIndex));
            }
        }
    }

    public synchronized void addNewDevice(String str, boolean z) {
        ThreadManager.getMainHandler().removeCallbacks(this.mScanTimeoutRunnable);
        if (!this.mDeviceList.contains(str)) {
            this.mDeviceList.add(str);
            if (this.mDeviceScanDialog != null && this.mDeviceScanDialog.isShowing()) {
                this.mDeviceScanDialog.dismiss();
            }
            if (z) {
                this.mActiveDeviceIndex = this.mDeviceList.size() - 1;
            }
            invalidate();
        }
    }

    public synchronized void dismiss() {
        ThreadManager.getMainHandler().removeCallbacks(this.mScanTimeoutRunnable);
        this.mNeedShowDeviceList.set(false);
        dismissSafely(this.mDeviceScanDialog);
        dismissSafely(this.mDeviceListDialog);
        dismissSafely(this.mDeviceNotFoundDialog);
    }

    public synchronized boolean hasAirkanDevice() {
        return this.mDeviceList.size() > 0;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        switchTo(i);
    }

    public synchronized boolean refreshDevices(ArrayList<String> arrayList, String str) {
        boolean z;
        boolean[] zArr = new boolean[arrayList.size()];
        for (int i = 0; i < arrayList.size(); i++) {
            zArr[i] = false;
        }
        int i2 = 0;
        while (true) {
            boolean z2 = true;
            if (i2 >= this.mDeviceList.size()) {
                break;
            }
            String str2 = (String) this.mDeviceList.get(i2);
            int i3 = 0;
            while (true) {
                if (i3 >= arrayList.size()) {
                    break;
                } else if (TextUtils.equals(str2, (CharSequence) arrayList.get(i3))) {
                    zArr[i3] = true;
                    z2 = false;
                    break;
                } else {
                    i3++;
                }
            }
            if (z2) {
                removeDevice(str2);
            }
            i2++;
        }
        z = false;
        for (int i4 = 0; i4 < arrayList.size(); i4++) {
            if (!zArr[i4]) {
                boolean equals = TextUtils.equals((CharSequence) arrayList.get(i4), str);
                addNewDevice((String) arrayList.get(i4), equals);
                if (equals) {
                    z = true;
                }
            }
        }
        if (str != null) {
            int indexOf = this.mDeviceList.indexOf(str);
            if (!(indexOf == -1 || this.mActiveDeviceIndex == indexOf)) {
                this.mActiveDeviceIndex = indexOf;
            }
        } else if (isActive()) {
            this.mActiveDeviceIndex = -1;
            z = true;
        }
        return z;
    }

    public void removeActive() {
        if (this.mActiveDeviceIndex != -1) {
            Log.v("grap_device_bar", "~~~~remove the active for device");
            this.mActiveDeviceIndex = -1;
        }
    }

    public synchronized boolean removeDevice(String str) {
        boolean z;
        int size = this.mDeviceList.size();
        z = false;
        int i = 0;
        while (true) {
            if (i >= size) {
                break;
            } else if (((String) this.mDeviceList.get(i)).equals(str)) {
                this.mDeviceList.remove(str);
                if (this.mActiveDeviceIndex == i) {
                    this.mActiveDeviceIndex = -1;
                    z = true;
                }
                invalidate();
            } else {
                i++;
            }
        }
        return z;
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mItemClickListener = onItemClickListener;
    }

    public synchronized void show() {
        dismiss();
        this.mNeedShowDeviceList.set(true);
        if (!MiscUtil.isValid(this.mDeviceList)) {
            if (!ConnectController.getInstance().isOpen()) {
                ConnectController.getInstance().open();
            }
            showScanDialog();
        } else {
            showDeviceListDialog();
        }
    }
}

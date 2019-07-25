package com.miui.gallery.discovery;

import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.preference.GalleryPreferences.PhotoPrint;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.PrintInstallHelper;
import com.miui.gallery.util.PrintInstallHelper.InstallStateListener;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class PrintSilentInstallTask extends PendingTask {
    /* access modifiers changed from: private */
    public CountDownLatch mSyncExecuteLock = new CountDownLatch(1);

    public PrintSilentInstallTask(int i) {
        super(i);
    }

    public static boolean isPrintSilentInstallEnable() {
        return isPrintSilentInstallEnable(CloudControlStrategyHelper.getPrintPackageName());
    }

    private static boolean isPrintSilentInstallEnable(String str) {
        return PrintInstallHelper.getInstance().isPhotoPrintEnable() && isSilentInstallTimesEnable() && !MiscUtil.isPackageInstalled(str);
    }

    private static boolean isSilentInstallTimesEnable() {
        return PhotoPrint.getSilentInstallTimes() < 3;
    }

    public static void setSilentInstallTimesDisable() {
        if (isSilentInstallTimesEnable()) {
            PhotoPrint.setSilentInstallTimes(3);
        }
    }

    public int getNetworkType() {
        return 1;
    }

    public Object parseData(byte[] bArr) throws Exception {
        return new Object();
    }

    public boolean process(Object obj) throws Exception {
        String printPackageName = CloudControlStrategyHelper.getPrintPackageName();
        if (isPrintSilentInstallEnable(printPackageName)) {
            PhotoPrint.increaseSilentInstallTimes();
            if (PrintInstallHelper.getInstance().installPrintPackage(true, printPackageName, new InstallStateListener() {
                public void onFinish(boolean z, int i, int i2) {
                    if (z || i2 == 3) {
                        PrintSilentInstallTask.setSilentInstallTimesDisable();
                    }
                    PrintSilentInstallTask.this.mSyncExecuteLock.countDown();
                    StringBuilder sb = new StringBuilder();
                    sb.append("onFinish");
                    sb.append(i);
                    sb.append(i2);
                    Log.d("sdfa", sb.toString());
                    PrintInstallHelper.getInstance().removeInstallStateListener(this);
                }

                public void onInstallLimited() {
                    PrintSilentInstallTask.this.mSyncExecuteLock.countDown();
                    PrintInstallHelper.getInstance().removeInstallStateListener(this);
                }

                public void onInstalling() {
                }
            })) {
                Log.d("PrintSilentInstallTask", "start silent install print package");
                try {
                    this.mSyncExecuteLock.await(5, TimeUnit.MINUTES);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    public boolean requireCharging() {
        return true;
    }

    public boolean requireDeviceIdle() {
        return true;
    }

    public byte[] wrapData(Object obj) throws Exception {
        return new byte[0];
    }
}

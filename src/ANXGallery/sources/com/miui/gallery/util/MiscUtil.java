package com.miui.gallery.util;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Process;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Base64;
import android.view.Display;
import android.view.View;
import android.view.Window;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.os.Device;
import com.miui.telephony.TelephonyHelper;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import miui.net.ConnectivityHelper;

public class MiscUtil extends BaseMiscUtil {
    private static String sHashedDeviceId;

    public static long[] ListToArray(List<Long> list) {
        if (!isValid(list)) {
            return null;
        }
        int size = list.size();
        long[] jArr = new long[size];
        for (int i = 0; i < size; i++) {
            Long l = (Long) list.get(i);
            jArr[i] = l == null ? 0 : l.longValue();
        }
        return jArr;
    }

    public static List<Long> arrayToList(long[] jArr) {
        ArrayList arrayList = new ArrayList(jArr.length);
        for (long valueOf : jArr) {
            arrayList.add(Long.valueOf(valueOf));
        }
        return arrayList;
    }

    public static boolean checkNavigationBarShow(Context context, Window window) {
        Display defaultDisplay = window.getWindowManager().getDefaultDisplay();
        Point point = new Point();
        defaultDisplay.getRealSize(point);
        View decorView = window.getDecorView();
        if (2 == context.getResources().getConfiguration().orientation) {
            if (point.x == decorView.findViewById(16908290).getWidth()) {
                return false;
            }
        } else {
            Rect rect = new Rect();
            decorView.getWindowVisibleDisplayFrame(rect);
            if (rect.bottom == point.y) {
                return false;
            }
        }
        return true;
    }

    public static String[] copyStringArray(String[] strArr) {
        if (strArr == null || strArr.length <= 0) {
            return null;
        }
        String[] strArr2 = new String[strArr.length];
        System.arraycopy(strArr, 0, strArr2, 0, strArr.length);
        return strArr2;
    }

    public static int dip2px(Context context, float f) {
        return (int) ((f * context.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public static void enlargeTouchArea(View view, View view2, float f) {
        view.setTouchDelegate(new ScalableTouchDelegate(f, view, view2));
    }

    public static int getAppVersionCode() {
        return getAppVersionCode("com.miui.gallery");
    }

    public static int getAppVersionCode(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return GalleryApp.sGetAndroidContext().getPackageManager().getPackageInfo(str, 16384).versionCode;
            } catch (NameNotFoundException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public static String getCurrentDate() {
        return new SimpleDateFormat("yyyy:MM:dd HH:mm:ss").format(new Date(System.currentTimeMillis()));
    }

    public static int getDefaultSplitActionBarHeight(Context context) {
        return context.getResources().getDimensionPixelSize(R.dimen.action_button_default_height);
    }

    public static String getDeviceId() {
        return TelephonyHelper.getDeviceId();
    }

    public static int getDimensionPixelOffset(Resources resources, String str, String str2, String str3) {
        int identifier = resources.getIdentifier(str, str2, str3);
        if (identifier > 0) {
            return resources.getDimensionPixelSize(identifier);
        }
        return 0;
    }

    public static String getHashedDeviceId() {
        if (TextUtils.isEmpty(sHashedDeviceId)) {
            sHashedDeviceId = selectHashedId();
        }
        return sHashedDeviceId;
    }

    public static String getSimOperator() {
        return ((TelephonyManager) GalleryApp.sGetAndroidContext().getSystemService("phone")).getSimOperator();
    }

    public static int getStatusBarHeight(Context context) {
        return getDimensionPixelOffset(context.getResources(), "status_bar_height", "dimen", "android");
    }

    private static String hashDeviceInfo(String str) {
        if (str == null) {
            return null;
        }
        try {
            return Base64.encodeToString(MessageDigest.getInstance("SHA1").digest(str.getBytes()), 8).substring(0, 16);
        } catch (NoSuchAlgorithmException unused) {
            throw new IllegalStateException("failed to init SHA1 digest");
        }
    }

    public static boolean isAppProcessInForeground(Context context) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        boolean z = false;
        if (isValid(runningAppProcesses)) {
            int myPid = Process.myPid();
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (runningAppProcessInfo.pid == myPid) {
                    if (runningAppProcessInfo.importance == 100) {
                        z = true;
                    }
                    return z;
                }
            }
        }
        return false;
    }

    public static boolean isIntentSupported(Intent intent) {
        if (intent == null) {
            return false;
        }
        return !GalleryApp.sGetAndroidContext().getPackageManager().queryIntentActivities(intent, 0).isEmpty();
    }

    public static boolean isKeyGuardLocked(Context context) {
        KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService("keyguard");
        return keyguardManager != null && keyguardManager.isKeyguardLocked();
    }

    public static boolean isNightMode(Context context) {
        return context != null && (context.getResources().getConfiguration().uiMode & 48) == 32;
    }

    public static boolean isPackageInstalled(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setPackage(str);
        return isIntentSupported(intent);
    }

    public static boolean isServiceSupported(Intent intent) {
        if (intent == null) {
            return false;
        }
        return !GalleryApp.sGetAndroidContext().getPackageManager().queryIntentServices(intent, 0).isEmpty();
    }

    public static long[] listToArray(List<Long> list) {
        if (list == null) {
            return null;
        }
        long[] jArr = new long[list.size()];
        for (int i = 0; i < list.size(); i++) {
            jArr[i] = ((Long) list.get(i)).longValue();
        }
        return jArr;
    }

    private static String selectHashedId() {
        return Device.IS_TABLET ? ConnectivityHelper.getInstance().getMacAddress() : hashDeviceInfo(TelephonyHelper.getDeviceId());
    }

    public static String serverType2Text(int i) {
        switch (i) {
            case -1:
                return "invalid";
            case 0:
                return "group";
            case 1:
                return "image";
            case 2:
                return "video";
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("unknown:");
                sb.append(i);
                return sb.toString();
        }
    }

    public static void setRecyclerViewScrollToBottomListener(RecyclerView recyclerView, final Runnable runnable) {
        if (recyclerView != null && runnable != null) {
            recyclerView.addOnScrollListener(new OnScrollListener() {
                public void onScrolled(RecyclerView recyclerView, int i, int i2) {
                    View childAt = recyclerView.getChildAt(recyclerView.getChildCount() - 1);
                    if (childAt != null) {
                        Adapter adapter = recyclerView.getAdapter();
                        int itemCount = adapter == null ? 0 : adapter.getItemCount();
                        LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                        if (layoutParams != null && layoutParams.getViewAdapterPosition() == itemCount - 1) {
                            runnable.run();
                        }
                    }
                }
            });
        }
    }
}

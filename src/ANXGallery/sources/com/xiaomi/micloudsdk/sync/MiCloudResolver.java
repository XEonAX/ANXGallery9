package com.xiaomi.micloudsdk.sync;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SyncAdapterType;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.micloudsdk.sync.utils.SyncContentUtils;
import java.util.ArrayList;
import java.util.List;

public class MiCloudResolver {
    private static void assertAccount(Account account) {
        if (account == null || !"com.xiaomi".equals(account.type)) {
            throw new IllegalArgumentException("illegal account");
        }
    }

    private static void assertAuthority(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("illegal authority: empty");
        } else if (!getAuthorityList().contains(str)) {
            StringBuilder sb = new StringBuilder();
            sb.append("illegal authority: not registered authority: ");
            sb.append(str);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    private static void assertContext(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("context is null");
        }
    }

    private static void assertTime(long j) {
        if (j < 0) {
            throw new IllegalArgumentException("illegal time");
        }
    }

    public static void cancelSync(Context context, Account account, String str) {
        assertContext(context);
        assertAccount(account);
        assertAuthority(str);
        StringBuilder sb = new StringBuilder();
        sb.append("cancelSync: authority: ");
        sb.append(str);
        Log.d("MiCloudResolver", sb.toString());
        ContentResolver.cancelSync(account, str);
        sendCancelCommand(context, str);
    }

    public static List<String> getAuthorityList() {
        SyncAdapterType[] syncAdapterTypes;
        ArrayList arrayList = new ArrayList();
        for (SyncAdapterType syncAdapterType : ContentResolver.getSyncAdapterTypes()) {
            if ("com.xiaomi".equals(syncAdapterType.accountType)) {
                arrayList.add(syncAdapterType.authority);
            }
        }
        return arrayList;
    }

    public static long getResumeTime(Context context, String str) {
        assertContext(context);
        assertAuthority(str);
        StringBuilder sb = new StringBuilder();
        sb.append("getResumeTime: authority: ");
        sb.append(str);
        Log.d("MiCloudResolver", sb.toString());
        boolean isPauseExceptAuthority = SyncContentUtils.isPauseExceptAuthority(context, str);
        long loadResumeTime = SyncContentUtils.loadResumeTime(context, str);
        if (isPauseExceptAuthority) {
            return loadResumeTime;
        }
        long loadResumeTime2 = SyncContentUtils.loadResumeTime(context, "_all");
        if (loadResumeTime2 < loadResumeTime) {
            loadResumeTime2 = loadResumeTime;
        }
        return loadResumeTime2;
    }

    public static boolean isSyncPausing(Context context, Account account, String str) {
        assertContext(context);
        assertAccount(account);
        assertAuthority(str);
        StringBuilder sb = new StringBuilder();
        sb.append("isSyncPausing: authority: ");
        sb.append(str);
        Log.d("MiCloudResolver", sb.toString());
        return System.currentTimeMillis() <= getResumeTime(context, str);
    }

    public static void pauseSync(Context context, Account account, String str, long j) {
        assertContext(context);
        assertAccount(account);
        assertAuthority(str);
        assertTime(j);
        StringBuilder sb = new StringBuilder();
        sb.append("pauseSync: authority: ");
        sb.append(str);
        sb.append(", time: ");
        sb.append(j);
        Log.d("MiCloudResolver", sb.toString());
        cancelSync(context, account, str);
        SyncContentUtils.savePauseTime(context, str, j);
        tryToStartResumeService(context);
    }

    public static void requestSync(Context context, Account account, String str) {
        assertContext(context);
        assertAccount(account);
        assertAuthority(str);
        StringBuilder sb = new StringBuilder();
        sb.append("requestSync: authority: ");
        sb.append(str);
        Log.d("MiCloudResolver", sb.toString());
        if (isSyncPausing(context, account, str)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("requestSync: authority: ");
            sb2.append(str);
            sb2.append("is paused. request sync fail");
            Log.e("MiCloudResolver", sb2.toString());
        }
        ContentResolver.requestSync(account, str, new Bundle());
    }

    public static void resumeSync(Context context, Account account, String str) {
        assertContext(context);
        assertAccount(account);
        assertAuthority(str);
        StringBuilder sb = new StringBuilder();
        sb.append("resumeSync: authority: ");
        sb.append(str);
        Log.d("MiCloudResolver", sb.toString());
        SyncContentUtils.insertPauseExceptAuthority(context, str);
        SyncContentUtils.savePauseTime(context, str, 0);
        requestSync(context, account, str);
        tryToStartResumeService(context);
    }

    private static void sendCancelCommand(Context context, String str) {
        SyncCommandServiceBase.sendCommandService(context, str, "value_command_cancel_sync");
    }

    private static void tryToStartResumeService(Context context) {
        Intent intent = new Intent("com.xiaomi.action.SYNC_RESUME");
        intent.setPackage("com.miui.cloudservice");
        intent.putExtra("extra_operation", "alarm");
        if (context.getPackageManager().resolveService(intent, 32) != null) {
            context.startService(intent);
        }
    }
}

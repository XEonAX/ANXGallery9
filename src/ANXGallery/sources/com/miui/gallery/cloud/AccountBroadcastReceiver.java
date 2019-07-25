package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.request.HostManager;
import com.miui.gallery.util.BackgroundServiceHelper;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

public class AccountBroadcastReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        SyncLog.d("AccountBroadcastReceiver", "onReceive broadcast");
        String action = intent.getAction();
        if ("android.accounts.LOGIN_ACCOUNTS_PRE_CHANGED".equals(action)) {
            Account account = (Account) intent.getParcelableExtra("extra_account");
            if (account == null || ApplicationHelper.getIntentProvider().getXiaomiAccountType().equals(account.type)) {
                GalleryCloudUtils.resetAccountCache();
                if (account != null) {
                    HostManager.clearCookies();
                    boolean z = true;
                    if (intent.getIntExtra("extra_update_type", -1) == 1) {
                        Bundle bundleExtra = intent.getBundleExtra("extra_bundle");
                        if (bundleExtra != null && bundleExtra.containsKey("extra_wipe_data")) {
                            z = bundleExtra.getBoolean("extra_wipe_data", true);
                        }
                        Intent intent2 = new Intent(context, AccountChangeService.class);
                        intent2.setAction("delete_account");
                        intent2.putExtra("extra_account", account);
                        intent2.putExtra("extra_wipe_data", z);
                        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent2);
                    }
                }
            }
        } else if ("android.accounts.LOGIN_ACCOUNTS_POST_CHANGED".equals(action)) {
            Account account2 = (Account) intent.getParcelableExtra("extra_account");
            if (account2 != null && ApplicationHelper.getIntentProvider().getXiaomiAccountType().equals(account2.type) && 2 == intent.getIntExtra("extra_update_type", -1)) {
                Intent intent3 = new Intent(context, AccountChangeService.class);
                intent3.setAction("add_account");
                intent3.putExtra("extra_account", account2);
                BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent3);
            }
        }
    }
}

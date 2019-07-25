package com.miui.gallery.cloud;

import android.accounts.Account;
import android.app.Notification;
import android.content.Intent;
import com.miui.gallery.service.IntentServiceBase;
import com.miui.gallery.util.NotificationHelper;

public class AccountChangeService extends IntentServiceBase {
    /* access modifiers changed from: protected */
    public Notification getNotification() {
        return NotificationHelper.getEmptyNotification(getApplicationContext());
    }

    /* access modifiers changed from: protected */
    public int getNotificationId() {
        return 10;
    }

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        super.onHandleIntent(intent);
        String action = intent.getAction();
        if ("delete_account".equals(action)) {
            Account account = (Account) intent.getParcelableExtra("extra_account");
            int i = 1;
            if (intent.getBooleanExtra("extra_wipe_data", true)) {
                i = 2;
            }
            DeleteAccount.deleteAccountInTask(null, account, i, null);
        } else if ("add_account".equals(action)) {
            AddAccount.onAddAccount(this, (Account) intent.getParcelableExtra("extra_account"));
        }
    }
}

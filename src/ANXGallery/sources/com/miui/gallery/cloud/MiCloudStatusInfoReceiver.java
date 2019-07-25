package com.miui.gallery.cloud;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.miui.account.AccountHelper;
import miui.cloud.sync.MiCloudStatusInfo;
import miui.cloud.sync.MiCloudStatusInfo.QuotaInfo;

public class MiCloudStatusInfoReceiver extends BroadcastReceiver {
    public static void handleSpaceFull(Context context, Account account) {
        String userData = ((AccountManager) context.getSystemService("account")).getUserData(account, "extra_micloud_status_info_quota");
        if (!TextUtils.isEmpty(userData)) {
            MiCloudStatusInfo miCloudStatusInfo = new MiCloudStatusInfo(account.name);
            miCloudStatusInfo.parseQuotaString(userData);
            QuotaInfo quotaInfo = miCloudStatusInfo.getQuotaInfo();
            if (quotaInfo != null && quotaInfo.getTotal() - quotaInfo.getUsed() >= 20971520) {
                SpaceFullHandler.removeOwnerSpaceFull();
            }
        }
    }

    private void handleSpaceFullIfNeeded(Context context) {
        if (SpaceFullHandler.isOwnerSpaceFull()) {
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
            if (xiaomiAccount != null) {
                handleSpaceFull(context, xiaomiAccount);
            }
        }
    }

    public void onReceive(Context context, Intent intent) {
        if ("com.xiaomi.action.MICLOUD_STATUS_INFO_CHANGED".equals(intent.getAction())) {
            handleSpaceFullIfNeeded(context);
        }
    }
}

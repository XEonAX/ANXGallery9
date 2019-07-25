package com.miui.gallery.push;

import android.accounts.Account;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Process;
import android.text.TextUtils;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.preference.GalleryPreferences.SampleStatistic;
import com.miui.gallery.push.messagehandler.MessageHandler;
import com.miui.gallery.util.Encode;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.PrintInstallHelper;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.os.Rom;
import com.xiaomi.mipush.sdk.MiPushClient;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class GalleryPushManager {

    private static class SingletonHolder {
        static final GalleryPushManager INSTANCE = new GalleryPushManager();
    }

    private GalleryPushManager() {
    }

    private String getAccountTopic(Account account) {
        String str = account == null ? null : account.name;
        if (!TextUtils.isEmpty(str)) {
            return String.format(Locale.US, "%s_%s", new Object[]{"xiaomi_account", str.substring(account.name.length() - 1)});
        }
        return String.format(Locale.US, "%s_%s", new Object[]{"xiaomi_account_sample", Long.valueOf(Math.abs(SampleStatistic.getUniqId()) % 10)});
    }

    public static GalleryPushManager getInstance() {
        return SingletonHolder.INSTANCE;
    }

    private String getMiuiVersionTopic() {
        if (Rom.IS_STABLE) {
            return "miui_version_stable";
        }
        if (Rom.IS_ALPHA) {
            return "miui_version_alpha";
        }
        if (Rom.IS_DEV) {
            return "miui_version_dev";
        }
        return null;
    }

    private String getPrintTopic() {
        if (PrintInstallHelper.getInstance().isPhotoPrintEnable()) {
            return "photo_print";
        }
        return null;
    }

    private String getStoryTopic() {
        if (ImageFeatureManager.isStoryGenerateEnable()) {
            return "gallery_story";
        }
        return null;
    }

    private void setUserAccount(Context context, String str, boolean z) {
        String SHA1Encode = !TextUtils.isEmpty(str) ? Encode.SHA1Encode(str.getBytes()) : null;
        List<String> allUserAccount = MiPushClient.getAllUserAccount(context);
        if (MiscUtil.isValid(allUserAccount)) {
            for (String str2 : allUserAccount) {
                if (!TextUtils.isEmpty(str2) && !TextUtils.equals(str2, SHA1Encode) && z) {
                    MiPushClient.unsetUserAccount(context, str2, null);
                }
            }
        }
        if (SHA1Encode != null) {
            MiPushClient.setUserAccount(context, SHA1Encode, null);
        }
    }

    private boolean shouldInit(Context context) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses != null) {
            String packageName = context.getPackageName();
            int myPid = Process.myPid();
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (runningAppProcessInfo.pid == myPid && packageName.equals(runningAppProcessInfo.processName)) {
                    return true;
                }
            }
        }
        return false;
    }

    private void subscribeTopics(Context context, boolean z, String... strArr) {
        if (context != null) {
            List<String> allTopic = MiPushClient.getAllTopic(context);
            if (strArr == null || strArr.length == 0) {
                if (z && MiscUtil.isValid(allTopic)) {
                    for (String unsubscribe : allTopic) {
                        MiPushClient.unsubscribe(context, unsubscribe, null);
                    }
                }
                return;
            }
            ArrayList arrayList = new ArrayList(Arrays.asList(strArr));
            if (MiscUtil.isValid(allTopic)) {
                for (String str : allTopic) {
                    if (!arrayList.contains(str) && z) {
                        MiPushClient.unsubscribe(context, str, null);
                    }
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                MiPushClient.subscribe(context, (String) it.next(), null);
            }
        }
    }

    private void unregisterPush(Context context) {
        if (shouldInit(context)) {
            MiPushClient.unregisterPush(context);
        }
    }

    private void unsubscribeAccountTopic(Context context) {
        List<String> allTopic = MiPushClient.getAllTopic(context);
        if (MiscUtil.isValid(allTopic)) {
            for (String str : allTopic) {
                if (str != null && str.startsWith("xiaomi_account")) {
                    MiPushClient.unsubscribe(context, str, null);
                }
            }
        }
    }

    public void onAddAccount(Context context, Account account) {
        if (context != null) {
            if (account == null || TextUtils.isEmpty(account.name)) {
                setUserAccount(context, null, true);
            } else {
                setUserAccount(context, account.name, true);
            }
            for (MessageHandler onAddAccount : MessageHandlerFactory.getAllMessageHandlers()) {
                onAddAccount.onAddAccount();
            }
        }
    }

    public void onDeleteAccount(Context context) {
        if (context != null) {
            setUserAccount(context, null, true);
            for (MessageHandler onDeleteAccount : MessageHandlerFactory.getAllMessageHandlers()) {
                onDeleteAccount.onDeleteAccount();
            }
            unsubscribeAccountTopic(context);
            subscribeTopics(context, false, getAccountTopic(null));
        }
    }

    public void registerPush(Context context) {
        if (!PrivacyAgreementUtils.isGalleryAgreementEnable(context)) {
            Log.w("GalleryPushManager", "Register push failed: privacy agreement disabled");
            unregisterPush(context);
            return;
        }
        if (AgreementsUtils.isNetworkingAgreementAccepted() && shouldInit(context)) {
            MiPushClient.registerPush(context, "2882303761517492012", "5601749292012");
        }
    }

    public void setUserAccountAndTopics(Context context) {
        if (context != null) {
            Account account = AccountCache.getAccount();
            if (account == null || TextUtils.isEmpty(account.name)) {
                setUserAccount(context, null, true);
            } else {
                setUserAccount(context, account.name, true);
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add("cloud_control");
            String printTopic = getPrintTopic();
            if (!TextUtils.isEmpty(printTopic)) {
                arrayList.add(printTopic);
            }
            String storyTopic = getStoryTopic();
            if (!TextUtils.isEmpty(storyTopic)) {
                arrayList.add(storyTopic);
            }
            String miuiVersionTopic = getMiuiVersionTopic();
            if (!TextUtils.isEmpty(miuiVersionTopic)) {
                arrayList.add(miuiVersionTopic);
            }
            arrayList.add(getAccountTopic(account));
            subscribeTopics(context, true, (String[]) arrayList.toArray(new String[arrayList.size()]));
        }
    }
}

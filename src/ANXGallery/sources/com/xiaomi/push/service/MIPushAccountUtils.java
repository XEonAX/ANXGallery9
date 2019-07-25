package com.xiaomi.push.service;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.android.Region;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.BuildSettings;
import com.xiaomi.channel.commonutils.network.HttpResponse;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.smack.ConnectionConfiguration;
import java.io.IOException;
import java.util.TreeMap;
import org.json.JSONException;
import org.json.JSONObject;

public class MIPushAccountUtils {
    private static PushAccountChangeListener accountChangeListener;
    private static MIPushAccount sAccount;

    public interface PushAccountChangeListener {
        void onChange();
    }

    public static void clearAccount(Context context) {
        context.getSharedPreferences("mipush_account", 0).edit().clear().commit();
        sAccount = null;
        notifyAccountChange();
    }

    public static String getAccountURL(Context context) {
        String region = AppRegionStorage.getInstance(context).getRegion();
        String str = "/pass/v2/register";
        if (BuildSettings.IsOneBoxBuild()) {
            StringBuilder sb = new StringBuilder();
            sb.append("http://");
            sb.append(ConnectionConfiguration.XMPP_SERVER_HOST_ONEBOX);
            sb.append(":9085");
            sb.append(str);
            return sb.toString();
        } else if (Region.China.name().equals(region)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("https://cn.register.xmpush.xiaomi.com");
            sb2.append(str);
            return sb2.toString();
        } else if (Region.Global.name().equals(region)) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("https://register.xmpush.global.xiaomi.com");
            sb3.append(str);
            return sb3.toString();
        } else if (Region.Europe.name().equals(region)) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append("https://fr.register.xmpush.global.xiaomi.com");
            sb4.append(str);
            return sb4.toString();
        } else if (Region.Russia.name().equals(region)) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("https://ru.register.xmpush.global.xiaomi.com");
            sb5.append(str);
            return sb5.toString();
        } else if (Region.India.name().equals(region)) {
            StringBuilder sb6 = new StringBuilder();
            sb6.append("https://idmb.register.xmpush.global.xiaomi.com");
            sb6.append(str);
            return sb6.toString();
        } else {
            StringBuilder sb7 = new StringBuilder();
            sb7.append("https://");
            sb7.append(BuildSettings.IsSandBoxBuild() ? "sandbox.xmpush.xiaomi.com" : "register.xmpush.xiaomi.com");
            sb7.append(str);
            return sb7.toString();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00ae, code lost:
        return null;
     */
    public static synchronized MIPushAccount getMIPushAccount(Context context) {
        synchronized (MIPushAccountUtils.class) {
            if (sAccount != null) {
                MIPushAccount mIPushAccount = sAccount;
                return mIPushAccount;
            }
            SharedPreferences sharedPreferences = context.getSharedPreferences("mipush_account", 0);
            String string = sharedPreferences.getString(nexExportFormat.TAG_FORMAT_UUID, null);
            String string2 = sharedPreferences.getString("token", null);
            String string3 = sharedPreferences.getString("security", null);
            String string4 = sharedPreferences.getString("app_id", null);
            String string5 = sharedPreferences.getString("app_token", null);
            String string6 = sharedPreferences.getString("package_name", null);
            String string7 = sharedPreferences.getString("device_id", null);
            int i = sharedPreferences.getInt("env_type", 1);
            if (!TextUtils.isEmpty(string7) && string7.startsWith("a-")) {
                string7 = DeviceInfo.getSimpleDeviceId(context);
                sharedPreferences.edit().putString("device_id", string7).commit();
            }
            if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string2) && !TextUtils.isEmpty(string3)) {
                String simpleDeviceId = DeviceInfo.getSimpleDeviceId(context);
                if ("com.xiaomi.xmsf".equals(context.getPackageName()) || TextUtils.isEmpty(simpleDeviceId) || TextUtils.isEmpty(string7) || string7.equals(simpleDeviceId)) {
                    MIPushAccount mIPushAccount2 = new MIPushAccount(string, string2, string3, string4, string5, string6, i);
                    sAccount = mIPushAccount2;
                    MIPushAccount mIPushAccount3 = sAccount;
                    return mIPushAccount3;
                }
                MyLog.e("erase the old account.");
                clearAccount(context);
                return null;
            }
        }
    }

    private static boolean isMIUIPush(Context context) {
        return context.getPackageName().equals("com.xiaomi.xmsf");
    }

    public static void notifyAccountChange() {
        if (accountChangeListener != null) {
            accountChangeListener.onChange();
        }
    }

    public static void persist(Context context, MIPushAccount mIPushAccount) {
        Editor edit = context.getSharedPreferences("mipush_account", 0).edit();
        edit.putString(nexExportFormat.TAG_FORMAT_UUID, mIPushAccount.account);
        edit.putString("security", mIPushAccount.security);
        edit.putString("token", mIPushAccount.token);
        edit.putString("app_id", mIPushAccount.appId);
        edit.putString("package_name", mIPushAccount.packageName);
        edit.putString("app_token", mIPushAccount.appToken);
        edit.putString("device_id", DeviceInfo.getSimpleDeviceId(context));
        edit.putInt("env_type", mIPushAccount.envType);
        edit.commit();
        notifyAccountChange();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0215, code lost:
        return null;
     */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0052 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0061 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x006c A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0075 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x007e A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x009f A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x00a6 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00cf A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0140 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x0153 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x0189 A[Catch:{ Exception -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x0193 A[Catch:{ Exception -> 0x0096 }] */
    public static synchronized MIPushAccount register(Context context, String str, String str2, String str3) throws IOException, JSONException {
        String str4;
        String virtDevId;
        String gaid;
        PackageInfo packageInfo;
        int spaceId;
        String macAddress;
        HttpResponse doHttpPost;
        String str5;
        synchronized (MIPushAccountUtils.class) {
            TreeMap treeMap = new TreeMap();
            treeMap.put("devid", DeviceInfo.getDeviceId(context, false));
            treeMap.put("devid1", DeviceInfo.getDeviceId1(context));
            if (sAccount != null && !TextUtils.isEmpty(sAccount.account)) {
                treeMap.put(nexExportFormat.TAG_FORMAT_UUID, sAccount.account);
                int lastIndexOf = sAccount.account.lastIndexOf("/");
                if (lastIndexOf != -1) {
                    str4 = sAccount.account.substring(lastIndexOf + 1);
                    virtDevId = DeviceInfo.getVirtDevId(context);
                    if (virtDevId != null) {
                        treeMap.put("vdevid", virtDevId);
                    }
                    gaid = DeviceInfo.getGaid(context);
                    if (!TextUtils.isEmpty(gaid)) {
                        treeMap.put("gaid", gaid);
                    }
                    if (isMIUIPush(context)) {
                        str2 = "1000271";
                    }
                    String str6 = str2;
                    if (isMIUIPush(context)) {
                        str3 = "420100086271";
                    }
                    String str7 = str3;
                    if (isMIUIPush(context)) {
                        str = "com.xiaomi.xmsf";
                    }
                    String str8 = str;
                    treeMap.put("appid", str6);
                    treeMap.put("apptoken", str7);
                    packageInfo = context.getPackageManager().getPackageInfo(str8, 16384);
                    treeMap.put("appversion", packageInfo == null ? String.valueOf(packageInfo.versionCode) : MovieStatUtils.DOWNLOAD_SUCCESS);
                    treeMap.put("sdkversion", Integer.toString(30619));
                    treeMap.put("packagename", str8);
                    treeMap.put("model", Build.MODEL);
                    treeMap.put("board", Build.BOARD);
                    if (!MIUIUtils.isGlobalRegion()) {
                        String str9 = "";
                        String blockingGetIMEI = DeviceInfo.blockingGetIMEI(context);
                        if (!TextUtils.isEmpty(blockingGetIMEI)) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(str9);
                            sb.append(XMStringUtils.getMd5Digest(blockingGetIMEI));
                            str9 = sb.toString();
                        }
                        String blockingGetSubIMEISMd5 = DeviceInfo.blockingGetSubIMEISMd5(context);
                        if (!TextUtils.isEmpty(str9) && !TextUtils.isEmpty(blockingGetSubIMEISMd5)) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(str9);
                            sb2.append(",");
                            sb2.append(blockingGetSubIMEISMd5);
                            str9 = sb2.toString();
                        }
                        if (!TextUtils.isEmpty(str9)) {
                            treeMap.put("imei_md5", str9);
                        }
                    }
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(VERSION.RELEASE);
                    sb3.append("-");
                    sb3.append(VERSION.INCREMENTAL);
                    treeMap.put("os", sb3.toString());
                    spaceId = DeviceInfo.getSpaceId();
                    if (spaceId >= 0) {
                        treeMap.put("space_id", Integer.toString(spaceId));
                    }
                    macAddress = DeviceInfo.getMacAddress(context);
                    if (!TextUtils.isEmpty(macAddress)) {
                        treeMap.put("mac_address", XMStringUtils.getMd5Digest(macAddress));
                    }
                    treeMap.put("android_id", DeviceInfo.getAndroidId(context));
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append(Build.BRAND);
                    sb4.append("");
                    treeMap.put("brand", sb4.toString());
                    doHttpPost = Network.doHttpPost(context, getAccountURL(context), treeMap);
                    str5 = "";
                    if (doHttpPost != null) {
                        str5 = doHttpPost.getResponseString();
                    }
                    if (!TextUtils.isEmpty(str5)) {
                        JSONObject jSONObject = new JSONObject(str5);
                        if (jSONObject.getInt("code") == 0) {
                            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                            String string = jSONObject2.getString("ssecurity");
                            String string2 = jSONObject2.getString("token");
                            String string3 = jSONObject2.getString("userId");
                            if (TextUtils.isEmpty(str4)) {
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("an");
                                sb5.append(XMStringUtils.generateRandomString(6));
                                str4 = sb5.toString();
                            }
                            StringBuilder sb6 = new StringBuilder();
                            sb6.append(string3);
                            sb6.append("@xiaomi.com/");
                            sb6.append(str4);
                            MIPushAccount mIPushAccount = new MIPushAccount(sb6.toString(), string2, string, str6, str7, str8, BuildSettings.getEnvType());
                            persist(context, mIPushAccount);
                            DeviceInfo.updateVirtDevId(context, jSONObject2.optString("vdevid"));
                            sAccount = mIPushAccount;
                            return mIPushAccount;
                        }
                        MIPushClientManager.notifyRegisterError(context, jSONObject.getInt("code"), jSONObject.optString("description"));
                        MyLog.w(str5);
                    }
                }
            }
            str4 = null;
            virtDevId = DeviceInfo.getVirtDevId(context);
            if (virtDevId != null) {
            }
            gaid = DeviceInfo.getGaid(context);
            if (!TextUtils.isEmpty(gaid)) {
            }
            if (isMIUIPush(context)) {
            }
            String str62 = str2;
            if (isMIUIPush(context)) {
            }
            String str72 = str3;
            if (isMIUIPush(context)) {
            }
            String str82 = str;
            treeMap.put("appid", str62);
            treeMap.put("apptoken", str72);
            try {
                packageInfo = context.getPackageManager().getPackageInfo(str82, 16384);
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                packageInfo = null;
            }
            treeMap.put("appversion", packageInfo == null ? String.valueOf(packageInfo.versionCode) : MovieStatUtils.DOWNLOAD_SUCCESS);
            treeMap.put("sdkversion", Integer.toString(30619));
            treeMap.put("packagename", str82);
            treeMap.put("model", Build.MODEL);
            treeMap.put("board", Build.BOARD);
            if (!MIUIUtils.isGlobalRegion()) {
            }
            StringBuilder sb32 = new StringBuilder();
            sb32.append(VERSION.RELEASE);
            sb32.append("-");
            sb32.append(VERSION.INCREMENTAL);
            treeMap.put("os", sb32.toString());
            spaceId = DeviceInfo.getSpaceId();
            if (spaceId >= 0) {
            }
            macAddress = DeviceInfo.getMacAddress(context);
            if (!TextUtils.isEmpty(macAddress)) {
            }
            treeMap.put("android_id", DeviceInfo.getAndroidId(context));
            StringBuilder sb42 = new StringBuilder();
            sb42.append(Build.BRAND);
            sb42.append("");
            treeMap.put("brand", sb42.toString());
            doHttpPost = Network.doHttpPost(context, getAccountURL(context), treeMap);
            str5 = "";
            if (doHttpPost != null) {
            }
            if (!TextUtils.isEmpty(str5)) {
            }
        }
    }

    public static void setAccountChangeListener(PushAccountChangeListener pushAccountChangeListener) {
        accountChangeListener = pushAccountChangeListener;
    }
}

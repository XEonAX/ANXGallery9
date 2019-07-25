package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class AppInfoHolder {
    private static volatile AppInfoHolder sInstance;
    String appRegRequestId;
    private Context mContext;
    private Map<String, ClientInfoData> mHybridAppInfoCache;
    private ClientInfoData mInfoData;

    public static class ClientInfoData {
        public String appID;
        public String appRegion;
        public String appToken;
        public String deviceId;
        public int envType = 1;
        public boolean isPaused = false;
        public boolean isValid = true;
        private Context mContext;
        public String regID;
        public String regResource;
        public String regSecret;
        public String versionName;

        public ClientInfoData(Context context) {
            this.mContext = context;
        }

        private String getVersionName() {
            return AppInfoUtils.getVersionName(this.mContext, this.mContext.getPackageName());
        }

        public static String toString(ClientInfoData clientInfoData) {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("appId", clientInfoData.appID);
                jSONObject.put("appToken", clientInfoData.appToken);
                jSONObject.put("regId", clientInfoData.regID);
                jSONObject.put("regSec", clientInfoData.regSecret);
                jSONObject.put("devId", clientInfoData.deviceId);
                jSONObject.put("vName", clientInfoData.versionName);
                jSONObject.put("valid", clientInfoData.isValid);
                jSONObject.put("paused", clientInfoData.isPaused);
                jSONObject.put("envType", clientInfoData.envType);
                jSONObject.put("regResource", clientInfoData.regResource);
                return jSONObject.toString();
            } catch (Throwable th) {
                MyLog.e(th);
                return null;
            }
        }

        public void clear() {
            AppInfoHolder.getSharedPreferences(this.mContext).edit().clear().commit();
            this.appID = null;
            this.appToken = null;
            this.regID = null;
            this.regSecret = null;
            this.deviceId = null;
            this.versionName = null;
            this.isValid = false;
            this.isPaused = false;
            this.appRegion = null;
            this.envType = 1;
        }

        public void invalidate() {
            this.isValid = false;
            AppInfoHolder.getSharedPreferences(this.mContext).edit().putBoolean("valid", this.isValid).commit();
        }

        public boolean isVaild() {
            return isVaild(this.appID, this.appToken);
        }

        public boolean isVaild(String str, String str2) {
            return TextUtils.equals(this.appID, str) && TextUtils.equals(this.appToken, str2) && !TextUtils.isEmpty(this.regID) && !TextUtils.isEmpty(this.regSecret) && (TextUtils.equals(this.deviceId, DeviceInfo.getInstanceId(this.mContext)) || TextUtils.equals(this.deviceId, DeviceInfo.getSimpleDeviceId(this.mContext)));
        }

        public void setEnvType(int i) {
            this.envType = i;
        }

        public void setHybridRegIdAndSecret(String str, String str2) {
            this.regID = str;
            this.regSecret = str2;
            this.deviceId = DeviceInfo.getInstanceId(this.mContext);
            this.versionName = getVersionName();
            this.isValid = true;
        }

        public void setIdAndToken(String str, String str2, String str3) {
            this.appID = str;
            this.appToken = str2;
            this.regResource = str3;
            Editor edit = AppInfoHolder.getSharedPreferences(this.mContext).edit();
            edit.putString("appId", this.appID);
            edit.putString("appToken", str2);
            edit.putString("regResource", str3);
            edit.commit();
        }

        public void setPaused(boolean z) {
            this.isPaused = z;
        }

        public void setRegIdAndSecret(String str, String str2, String str3) {
            this.regID = str;
            this.regSecret = str2;
            this.deviceId = DeviceInfo.getInstanceId(this.mContext);
            this.versionName = getVersionName();
            this.isValid = true;
            this.appRegion = str3;
            Editor edit = AppInfoHolder.getSharedPreferences(this.mContext).edit();
            edit.putString("regId", str);
            edit.putString("regSec", str2);
            edit.putString("devId", this.deviceId);
            edit.putString("vName", getVersionName());
            edit.putBoolean("valid", true);
            edit.putString("appRegion", str3);
            edit.commit();
        }
    }

    private AppInfoHolder(Context context) {
        this.mContext = context;
        init();
    }

    public static AppInfoHolder getInstance(Context context) {
        if (sInstance == null) {
            synchronized (AppInfoHolder.class) {
                if (sInstance == null) {
                    sInstance = new AppInfoHolder(context);
                }
            }
        }
        return sInstance;
    }

    public static SharedPreferences getSharedPreferences(Context context) {
        return context.getSharedPreferences("mipush", 0);
    }

    private void init() {
        this.mInfoData = new ClientInfoData(this.mContext);
        this.mHybridAppInfoCache = new HashMap();
        SharedPreferences sharedPreferences = getSharedPreferences(this.mContext);
        this.mInfoData.appID = sharedPreferences.getString("appId", null);
        this.mInfoData.appToken = sharedPreferences.getString("appToken", null);
        this.mInfoData.regID = sharedPreferences.getString("regId", null);
        this.mInfoData.regSecret = sharedPreferences.getString("regSec", null);
        this.mInfoData.deviceId = sharedPreferences.getString("devId", null);
        if (!TextUtils.isEmpty(this.mInfoData.deviceId) && this.mInfoData.deviceId.startsWith("a-")) {
            this.mInfoData.deviceId = DeviceInfo.getInstanceId(this.mContext);
            sharedPreferences.edit().putString("devId", this.mInfoData.deviceId).commit();
        }
        this.mInfoData.versionName = sharedPreferences.getString("vName", null);
        this.mInfoData.isValid = sharedPreferences.getBoolean("valid", true);
        this.mInfoData.isPaused = sharedPreferences.getBoolean("paused", false);
        this.mInfoData.envType = sharedPreferences.getInt("envType", 1);
        this.mInfoData.regResource = sharedPreferences.getString("regResource", null);
        this.mInfoData.appRegion = sharedPreferences.getString("appRegion", null);
    }

    public boolean appRegistered() {
        return this.mInfoData.isVaild();
    }

    public boolean appRegistered(String str, String str2) {
        return this.mInfoData.isVaild(str, str2);
    }

    public boolean checkAppInfo() {
        if (this.mInfoData.isVaild()) {
            return true;
        }
        MyLog.w("Don't send message before initialization succeeded!");
        return false;
    }

    public boolean checkVersionNameChanged() {
        return !TextUtils.equals(AppInfoUtils.getVersionName(this.mContext, this.mContext.getPackageName()), this.mInfoData.versionName);
    }

    public void clear() {
        this.mInfoData.clear();
    }

    public String getAppID() {
        return this.mInfoData.appID;
    }

    public String getAppToken() {
        return this.mInfoData.appToken;
    }

    public int getEnvType() {
        return this.mInfoData.envType;
    }

    public String getRegID() {
        return this.mInfoData.regID;
    }

    public String getRegResource() {
        return this.mInfoData.regResource;
    }

    public String getRegSecret() {
        return this.mInfoData.regSecret;
    }

    public void invalidate() {
        this.mInfoData.invalidate();
    }

    public boolean invalidated() {
        return !this.mInfoData.isValid;
    }

    public boolean isPaused() {
        return this.mInfoData.isPaused;
    }

    public void putAppIDAndToken(String str, String str2, String str3) {
        this.mInfoData.setIdAndToken(str, str2, str3);
    }

    public void putRegIDAndSecret(String str, String str2, String str3) {
        this.mInfoData.setRegIdAndSecret(str, str2, str3);
    }

    public void saveHybridAppInfo(String str, ClientInfoData clientInfoData) {
        this.mHybridAppInfoCache.put(str, clientInfoData);
        String clientInfoData2 = ClientInfoData.toString(clientInfoData);
        StringBuilder sb = new StringBuilder();
        sb.append("hybrid_app_info_");
        sb.append(str);
        getSharedPreferences(this.mContext).edit().putString(sb.toString(), clientInfoData2).commit();
    }

    public void setEnvType(int i) {
        this.mInfoData.setEnvType(i);
        getSharedPreferences(this.mContext).edit().putInt("envType", i).commit();
    }

    public void setPaused(boolean z) {
        this.mInfoData.setPaused(z);
        getSharedPreferences(this.mContext).edit().putBoolean("paused", z).commit();
    }

    public void updateVersionName(String str) {
        Editor edit = getSharedPreferences(this.mContext).edit();
        edit.putString("vName", str);
        edit.commit();
        this.mInfoData.versionName = str;
    }
}

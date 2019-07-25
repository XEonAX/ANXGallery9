package com.xiaomi.micloudsdk.cloudinfo.utils;

import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.android.internal.SystemPropertiesCompat;
import java.util.Locale;
import miui.cloud.sync.MiCloudStatusInfo;
import miui.cloud.sync.MiCloudStatusInfo.ItemInfo;
import miui.cloud.sync.MiCloudStatusInfo.QuotaInfo;
import org.json.JSONArray;
import org.json.JSONObject;

public class CloudInfoUtils {
    private static String sUserAgent;

    private static String convertObsoleteLanguageCodeToNew(String str) {
        if (str == null) {
            return null;
        }
        return "iw".equals(str) ? "he" : "in".equals(str) ? "id" : "ji".equals(str) ? "yi" : str;
    }

    public static ItemInfo getItemInfo(MiCloudStatusInfo miCloudStatusInfo, JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        String optString = jSONObject.optString("Name");
        String optString2 = jSONObject.optString("LocalizedName");
        long optLong = jSONObject.optLong("Used");
        miCloudStatusInfo.getClass();
        ItemInfo itemInfo = new ItemInfo(optString, optString2, optLong);
        return itemInfo;
    }

    public static QuotaInfo getQuotaInfo(MiCloudStatusInfo miCloudStatusInfo, JSONObject jSONObject) {
        JSONObject jSONObject2 = jSONObject;
        long optLong = jSONObject2.optLong("Total");
        long optLong2 = jSONObject2.optLong("Used");
        String optString = jSONObject2.optString("Warn");
        String optString2 = jSONObject2.optString("YearlyPackageType");
        long optLong3 = jSONObject2.optLong("YearlyPackageSize");
        long optLong4 = jSONObject2.optLong("YearlyPackageCreateTime");
        long optLong5 = jSONObject2.optLong("YearlyPackageExpireTime");
        miCloudStatusInfo.getClass();
        QuotaInfo quotaInfo = new QuotaInfo(optLong, optLong2, optString, optString2, optLong3, optLong4, optLong5);
        JSONArray optJSONArray = jSONObject2.optJSONArray("ItemInfoList");
        if (optJSONArray != null) {
            for (int i = 0; i < optJSONArray.length(); i++) {
                ItemInfo itemInfo = getItemInfo(miCloudStatusInfo, optJSONArray.optJSONObject(i));
                if (itemInfo != null) {
                    quotaInfo.addItemInfo(itemInfo);
                }
            }
        }
        return quotaInfo;
    }

    public static String getUserAgent() {
        if (sUserAgent == null) {
            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(Build.MODEL);
            sb2.append("/");
            sb.append(sb2.toString());
            String str = SystemPropertiesCompat.get("ro.product.mod_device", "");
            if (!TextUtils.isEmpty(str)) {
                sb.append(str);
            } else {
                sb.append(Build.MODEL);
            }
            sb.append("; MIUI/");
            sb.append(VERSION.INCREMENTAL);
            sb.append(" E/");
            sb.append(SystemPropertiesCompat.get("ro.miui.ui.version.name", ""));
            sb.append(" B/");
            if (miui.os.Build.IS_ALPHA_BUILD) {
                sb.append("A");
            } else if (miui.os.Build.IS_DEVELOPMENT_VERSION) {
                sb.append("D");
            } else if (miui.os.Build.IS_STABLE_VERSION) {
                sb.append("S");
            } else {
                sb.append("null");
            }
            sb.append(" L/");
            Locale locale = Locale.getDefault();
            String language = locale.getLanguage();
            if (language != null) {
                sb.append(convertObsoleteLanguageCodeToNew(language));
                String country = locale.getCountry();
                if (country != null) {
                    sb.append("-");
                    sb.append(country.toUpperCase());
                }
            } else {
                sb.append("EN");
            }
            sb.append(" LO/");
            String region = miui.os.Build.getRegion();
            if (!TextUtils.isEmpty(region)) {
                sb.append(region.toUpperCase());
            } else {
                sb.append("null");
            }
            sUserAgent = sb.toString();
        }
        return sUserAgent;
    }
}

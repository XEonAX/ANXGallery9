package com.miui.gallery.preference;

import android.content.Intent;
import android.support.annotation.Keep;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.deprecated.BaseDeprecatedPreference;
import java.util.Random;

public class BaseGalleryPreferences {

    public static class Agreement {
        public static boolean isRequiredAgreementsAllowed() {
            return PreferenceHelper.getBoolean(PrefKeys.REQUIRED_AGREEMENTS_ALLOWED, false);
        }

        public static void setRequiredAgreementsAllowed(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.REQUIRED_AGREEMENTS_ALLOWED, z);
        }
    }

    public static class BaseDocumentProvider {
        public static String getExternalSDCardUri() {
            return getUri(StorageUtils.getSecondaryStoragePath());
        }

        public static String getUri(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.DOCUMENT_PROVIDER_URI_PREFIX);
            sb.append(str);
            return PreferenceHelper.getString(sb.toString(), null);
        }

        public static void setExternalSDCardUri(String str) {
            setUri(StorageUtils.getSecondaryStoragePath(), str);
        }

        public static void setUri(String str, String str2) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.DOCUMENT_PROVIDER_URI_PREFIX);
            sb.append(str);
            PreferenceHelper.putString(sb.toString(), str2);
        }
    }

    public static class CTA {
        private static boolean sAllowUseOnOfflineGlobal;
        private static boolean sCanConnectToNetworkTemp;

        public static boolean allowUseOnOfflineGlobal() {
            return sAllowUseOnOfflineGlobal;
        }

        public static boolean canConnectNetwork() {
            return PreferenceHelper.getBoolean(PrefKeys.CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, BaseDeprecatedPreference.sCanConnectNetworkByImpunity()) || sCanConnectToNetworkTemp;
        }

        public static boolean remindConnectNetworkEveryTime() {
            return PreferenceHelper.getBoolean(PrefKeys.CTA_IMPUNITY_DECLARATION_EVERY_TIME, true);
        }

        public static void setCanConnectNetwork(boolean z) {
            if (z) {
                sCanConnectToNetworkTemp = false;
                PreferenceHelper.putBoolean(PrefKeys.CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, true);
                PreferenceHelper.putBoolean(PrefKeys.CTA_IMPUNITY_DECLARATION_EVERY_TIME, false);
            } else {
                sCanConnectToNetworkTemp = true;
                PreferenceHelper.putBoolean(PrefKeys.CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, false);
            }
            LocalBroadcastManager.getInstance(StaticContext.sGetAndroidContext()).sendBroadcast(new Intent("com.miui.gallery.action.CTA_CHANGED"));
        }

        public static void setCanConnectToNetworkTemp(boolean z) {
            sCanConnectToNetworkTemp = z;
        }

        public static void setRemindConnectNetworkEveryTime(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.CTA_IMPUNITY_DECLARATION_EVERY_TIME, z);
            if (z) {
                PreferenceHelper.putBoolean(PrefKeys.CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, false);
            }
        }

        public static void setToAllowUseOnOfflineGlobal(boolean z) {
            sAllowUseOnOfflineGlobal = z;
        }
    }

    public static class Debug {
        public static boolean isPrintLog() {
            return MemoryPreferenceHelper.getBoolean(PrefKeys.DEBUG_PRINT_LOG, false);
        }

        public static void printLog(boolean z) {
            MemoryPreferenceHelper.putBoolean(PrefKeys.DEBUG_PRINT_LOG, z);
        }
    }

    public static class PermissionIntroduction {
        public static boolean isCtaPrivacyPermissionsAllowed(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.CTA_PRIVACY_PERMISSIONS_ALLOWED);
            sb.append(str);
            return PreferenceHelper.getBoolean(sb.toString(), false);
        }

        public static boolean isRuntimePermissionsIntroduced() {
            return PreferenceHelper.getBoolean(PrefKeys.RUNTIME_PERMISSIONS_INTRODUCED, false);
        }

        public static void setCtaPrivacyPermissionsAllowed(String str, boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.CTA_PRIVACY_PERMISSIONS_ALLOWED);
            sb.append(str);
            PreferenceHelper.putBoolean(sb.toString(), z);
        }

        public static void setRuntimePermissionsIntroduced(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.RUNTIME_PERMISSIONS_INTRODUCED, z);
        }
    }

    @Keep
    public interface PrefKeys {
        public static final String CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY = "can_connect_network";
        public static final String CTA_IMPUNITY_DECLARATION_EVERY_TIME = "impunity_declaration_every_time";
        public static final String CTA_PRIVACY_PERMISSIONS_ALLOWED = "cta_privacy_permissions_allowed";
        public static final String DEBUG_PRINT_LOG = "debug_print_log";
        public static final String DOCUMENT_PROVIDER_URI_PREFIX = "document_provider_uri_";
        public static final String REQUIRED_AGREEMENTS_ALLOWED = "required_agreements_allowed";
        public static final String RUNTIME_PERMISSIONS_INTRODUCED = "runtime_permissions_introduced";
        public static final String STAT_USER_INFO_FROM_SELF_SHOOT = "user_info_self_shoot";
        public static final String STAT_USER_UNIQ_ID = "user_uniq_id";
    }

    public static class SampleStatistic {
        public static long getUniqId() {
            long j = PreferenceHelper.getLong(PrefKeys.STAT_USER_UNIQ_ID, 0);
            if (j != 0) {
                return j;
            }
            long nextLong = new Random().nextLong();
            PreferenceHelper.putLong(PrefKeys.STAT_USER_UNIQ_ID, nextLong);
            return nextLong;
        }

        public static boolean hasUploadUserInfo() {
            return PreferenceHelper.getBoolean(PrefKeys.STAT_USER_INFO_FROM_SELF_SHOOT, false);
        }

        public static void setUploadedUserInfo(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.STAT_USER_INFO_FROM_SELF_SHOOT, z);
        }
    }
}

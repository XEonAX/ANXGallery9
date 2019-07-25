package miui.cloud.stat;

import android.content.ContentValues;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.miui.utils.SafeContentResolver;
import miui.cloud.util.SyncStateChangedHelper;

public class MiCloudStatUtil {
    public static void performSyncErrorStat(Context context, long j, Bundle bundle) {
        performSyncTimeConsumeStat(context, j, false);
        performSyncResultStat(context, bundle);
        performSyncPhoneStateStat(context, bundle);
    }

    public static void performSyncPhoneStateStat(Context context, Bundle bundle) {
        Log.d("MiCloudStatUtil", "performSyncPhoneState: ");
        if (!((Boolean) SyncStateChangedHelper.SYNC_SETTINGS_PROVIDER_INSTALLED.get(context)).booleanValue()) {
            Log.d("MiCloudStatUtil", "provider not available, skip");
            return;
        }
        ContentValues contentValues = new ContentValues();
        boolean z = bundle.getBoolean("micloud_force");
        boolean z2 = bundle.getBoolean("stat_key_sync_start");
        contentValues.put("micloud_force", Boolean.valueOf(z));
        contentValues.put("stat_key_sync_start", Boolean.valueOf(z2));
        SafeContentResolver.insert(context, SyncStateChangedHelper.OPEN_SYNC_PHONE_STATE, contentValues);
    }

    private static void performSyncResultStat(Context context, Bundle bundle) {
        Log.d("MiCloudStatUtil", "performSyncResultStat: ");
        if (!((Boolean) SyncStateChangedHelper.SYNC_SETTINGS_PROVIDER_INSTALLED.get(context)).booleanValue()) {
            Log.d("MiCloudStatUtil", "provider not available, skip");
            return;
        }
        boolean z = bundle.getBoolean("micloud_ignore_temperature");
        boolean z2 = bundle.getBoolean("micloud_ignore_wifi_settings");
        boolean z3 = bundle.getBoolean("micloud_ignore_battery_low");
        boolean z4 = bundle.getBoolean("micloud_force");
        boolean z5 = bundle.getBoolean("stat_key_sync_retry");
        String string = bundle.getString("stat_key_sync_reason");
        String string2 = bundle.getString("stat_key_sync_authority");
        boolean z6 = bundle.getBoolean("stat_key_sync_successful");
        ContentValues contentValues = new ContentValues();
        contentValues.put("micloud_ignore_temperature", Boolean.valueOf(z));
        contentValues.put("micloud_ignore_wifi_settings", Boolean.valueOf(z2));
        contentValues.put("micloud_ignore_battery_low", Boolean.valueOf(z3));
        contentValues.put("micloud_force", Boolean.valueOf(z4));
        contentValues.put("stat_key_sync_retry", Boolean.valueOf(z5));
        contentValues.put("stat_key_sync_reason", string);
        contentValues.put("stat_key_sync_successful", Boolean.valueOf(z6));
        contentValues.put("stat_key_sync_authority", string2);
        SafeContentResolver.insert(context, SyncStateChangedHelper.OPEN_SYNC_RESULT_URI, contentValues);
    }

    public static void performSyncSuccessStat(Context context, String str, long j, Bundle bundle) {
        wrapSuccessBundle(bundle, str);
        performSyncTimeConsumeStat(context, j, true);
        performSyncResultStat(context, bundle);
        performSyncPhoneStateStat(context, bundle);
    }

    private static void performSyncTimeConsumeStat(Context context, long j, boolean z) {
        Log.d("MiCloudStatUtil", "performSyncTimeConsumeStat: ");
        if (!((Boolean) SyncStateChangedHelper.SYNC_SETTINGS_PROVIDER_INSTALLED.get(context)).booleanValue()) {
            Log.d("MiCloudStatUtil", "provider not available, skip");
            return;
        }
        long currentTimeMillis = System.currentTimeMillis() - j;
        ContentValues contentValues = new ContentValues();
        contentValues.put("stat_key_sync_time_consume", Long.valueOf(currentTimeMillis));
        if (z) {
            contentValues.put("stat_key_sync_successful", Boolean.valueOf(true));
        } else {
            contentValues.put("stat_key_sync_successful", Boolean.valueOf(false));
        }
        SafeContentResolver.insert(context, SyncStateChangedHelper.OPEN_SYNC_TIME_CONSUME, contentValues);
    }

    public static void wrapErrorBundle(Bundle bundle, String str, String str2, boolean z) {
        bundle.putBoolean("stat_key_sync_start", false);
        bundle.putString("stat_key_sync_authority", str);
        bundle.putBoolean("stat_key_sync_successful", false);
        bundle.putString("stat_key_sync_reason", str2);
        bundle.putBoolean("stat_key_sync_retry", z);
    }

    private static void wrapSuccessBundle(Bundle bundle, String str) {
        bundle.putBoolean("stat_key_sync_start", false);
        bundle.putString("stat_key_sync_authority", str);
        bundle.putBoolean("stat_key_sync_successful", true);
        bundle.putBoolean("stat_key_sync_retry", false);
        bundle.putString("stat_key_sync_reason", "no_error");
    }
}

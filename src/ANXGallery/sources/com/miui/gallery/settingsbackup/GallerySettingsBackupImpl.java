package com.miui.gallery.settingsbackup;

import android.content.Context;
import com.miui.gallery.util.Log;
import com.miui.os.Rom;
import com.xiaomi.settingsdk.backup.ICloudBackup;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.SettingItem;
import org.json.JSONObject;

public class GallerySettingsBackupImpl implements ICloudBackup {
    private static JSONObject logJSON(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        if (Rom.IS_ALPHA || Rom.IS_DEV) {
            Log.d("GallerySettingsBackupImpl", jSONObject.toString());
        }
        return jSONObject;
    }

    public int getCurrentVersion(Context context) {
        return 1;
    }

    public void onBackupSettings(Context context, DataPackage dataPackage) {
        Log.d("GallerySettingsBackupImpl", "onBackupSettings start");
        dataPackage.addKeyJson("com.miui.gallery.settings", logJSON(GallerySettingsBackupHelper.backupToCloud(context)));
        Log.d("GallerySettingsBackupImpl", "onBackupSettings end");
    }

    public void onRestoreSettings(Context context, DataPackage dataPackage, int i) {
        Log.d("GallerySettingsBackupImpl", "onRestoreSettings start");
        if (dataPackage != null) {
            SettingItem settingItem = dataPackage.get("com.miui.gallery.settings");
            if (settingItem != null) {
                GallerySettingsBackupHelper.restoreFromCloud(context, logJSON((JSONObject) settingItem.getValue()));
            }
        }
        Log.d("GallerySettingsBackupImpl", "onRestoreSettings end");
    }
}

package com.miui.gallery.settingsbackup;

import android.content.Context;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.preference.PreferenceHelper;
import com.miui.gallery.util.Log;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public class GallerySettingsBackupHelper {
    public static final JSONObject backupToCloud(Context context) {
        JSONObject jSONObject = new JSONObject();
        List<String> autoBackupPrefKeys = GalleryPreferences.getAutoBackupPrefKeys();
        if (autoBackupPrefKeys != null) {
            try {
                for (String savePrefEntry : autoBackupPrefKeys) {
                    savePrefEntry(savePrefEntry, jSONObject);
                }
            } catch (JSONException e) {
                Log.e("GallerySettingsBackupHelper", (Throwable) e);
            }
        }
        return jSONObject;
    }

    public static final void restoreFromCloud(Context context, JSONObject jSONObject) {
        if (jSONObject != null) {
            List<String> autoBackupPrefKeys = GalleryPreferences.getAutoBackupPrefKeys();
            if (autoBackupPrefKeys != null) {
                for (String restorePrefEntry : autoBackupPrefKeys) {
                    restorePrefEntry(restorePrefEntry, jSONObject);
                }
            }
        }
    }

    private static void restorePrefEntry(String str, JSONObject jSONObject) {
        Object opt = jSONObject.opt(str);
        if (opt != null) {
            if (opt instanceof Boolean) {
                PreferenceHelper.putBoolean(str, ((Boolean) opt).booleanValue());
            } else if (opt instanceof Integer) {
                PreferenceHelper.putInt(str, ((Integer) opt).intValue());
            } else if (opt instanceof Float) {
                PreferenceHelper.putFloat(str, ((Float) opt).floatValue());
            } else if (opt instanceof Long) {
                PreferenceHelper.putLong(str, ((Long) opt).longValue());
            } else if (opt instanceof String) {
                PreferenceHelper.putString(str, (String) opt);
            }
        }
    }

    private static void savePrefEntry(String str, JSONObject jSONObject) throws JSONException {
        Object obj = PreferenceHelper.getAll().get(str);
        if (obj != null) {
            jSONObject.put(str, obj);
        }
    }
}

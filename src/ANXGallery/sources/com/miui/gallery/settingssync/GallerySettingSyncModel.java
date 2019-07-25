package com.miui.gallery.settingssync;

import android.text.TextUtils;
import com.miui.gallery.preference.GalleryPreferences.SettingsSync;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.Model;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.Repository;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.SyncableSetting;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GallerySettingSyncModel implements Model {
    private final Repository mRepository;

    public GallerySettingSyncModel(Repository repository) {
        this.mRepository = repository;
    }

    private JSONObject convertSettingToJSON(SyncableSetting syncableSetting) throws JSONException {
        Boolean isEnabled = syncableSetting.isEnabled();
        String value = syncableSetting.getValue();
        if (isEnabled == null && value == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("name", syncableSetting.getName());
        if (isEnabled != null) {
            jSONObject.put("enable", isEnabled);
        }
        if (value != null) {
            jSONObject.put("value", value);
        }
        return jSONObject;
    }

    private SyncableSetting findSettingByName(List<SyncableSetting> list, String str) {
        for (SyncableSetting syncableSetting : list) {
            if (str.endsWith(syncableSetting.getName())) {
                return syncableSetting;
            }
        }
        return null;
    }

    private void saveJSONToSetting(SyncableSetting syncableSetting, JSONObject jSONObject) throws JSONException {
        String str = null;
        Boolean valueOf = jSONObject.has("enable") ? Boolean.valueOf(jSONObject.getBoolean("enable")) : null;
        if (jSONObject.has("value")) {
            str = jSONObject.getString("value");
        }
        syncableSetting.writeValue(valueOf, str);
    }

    private void saveJSONToSettings(List<SyncableSetting> list, JSONArray jSONArray) throws JSONException {
        if (jSONArray != null && jSONArray.length() > 0) {
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String optString = jSONObject.optString("name");
                if (!TextUtils.isEmpty(optString)) {
                    SyncableSetting findSettingByName = findSettingByName(list, optString);
                    if (findSettingByName != null) {
                        saveJSONToSetting(findSettingByName, jSONObject);
                    }
                }
            }
        }
    }

    public JSONObject getUploadSettings() {
        List<SyncableSetting> syncableSettings = this.mRepository.getSyncableSettings();
        if (!MiscUtil.isValid(syncableSettings)) {
            Log.d("GallerySettingSyncModel", "No syncable settings found!");
            return null;
        }
        try {
            JSONArray jSONArray = null;
            JSONArray jSONArray2 = null;
            for (SyncableSetting syncableSetting : syncableSettings) {
                JSONObject convertSettingToJSON = convertSettingToJSON(syncableSetting);
                if (convertSettingToJSON != null) {
                    if (syncableSetting.isExport()) {
                        if (jSONArray == null) {
                            jSONArray = new JSONArray();
                        }
                        jSONArray.put(convertSettingToJSON);
                    } else {
                        if (jSONArray2 == null) {
                            jSONArray2 = new JSONArray();
                        }
                        jSONArray2.put(convertSettingToJSON);
                    }
                }
            }
            if (jSONArray == null && jSONArray2 == null) {
                return null;
            }
            JSONObject jSONObject = new JSONObject();
            if (jSONArray != null) {
                jSONObject.put("itemList", jSONArray);
            }
            if (jSONArray2 != null) {
                jSONObject.put("extraConfig", jSONArray2);
            }
            return jSONObject;
        } catch (JSONException e) {
            Log.e("GallerySettingSyncModel", "Failed form settings to JSONObject, %s", (Object) e);
            return null;
        }
    }

    public boolean isDirty() {
        return SettingsSync.isDirty() || !SettingsSync.isFirstUploadComplete();
    }

    public void markDirty(boolean z) {
        SettingsSync.markDirty(z);
        if (!z && !SettingsSync.isFirstUploadComplete()) {
            SettingsSync.setFirstUploadComplete();
            Log.d("GallerySettingSyncModel", "First setting upload complete");
        }
    }

    public boolean onDownloadSettings(JSONObject jSONObject) {
        if (jSONObject == null) {
            Log.w("GallerySettingSyncModel", "No download settings received!");
            return true;
        }
        List syncableSettings = this.mRepository.getSyncableSettings();
        if (!MiscUtil.isValid(syncableSettings)) {
            Log.d("GallerySettingSyncModel", "No syncable settings found!");
            return true;
        }
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("itemList");
            JSONArray optJSONArray2 = jSONObject.optJSONArray("extraConfig");
            saveJSONToSettings(syncableSettings, optJSONArray);
            saveJSONToSettings(syncableSettings, optJSONArray2);
            return true;
        } catch (JSONException e) {
            Log.e("GallerySettingSyncModel", "Failed save settings from JSONObject, %s", (Object) e);
            return false;
        }
    }
}

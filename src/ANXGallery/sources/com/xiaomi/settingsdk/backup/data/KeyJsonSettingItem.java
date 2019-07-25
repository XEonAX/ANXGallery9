package com.xiaomi.settingsdk.backup.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

public class KeyJsonSettingItem extends SettingItem<JSONObject> {
    public static final Creator<KeyJsonSettingItem> CREATOR = new Creator<KeyJsonSettingItem>() {
        public KeyJsonSettingItem createFromParcel(Parcel parcel) {
            KeyJsonSettingItem keyJsonSettingItem = new KeyJsonSettingItem();
            keyJsonSettingItem.fillFromParcel(parcel);
            return keyJsonSettingItem;
        }

        public KeyJsonSettingItem[] newArray(int i) {
            return new KeyJsonSettingItem[i];
        }
    };

    /* access modifiers changed from: protected */
    public JSONObject stringToValue(String str) {
        try {
            return new JSONObject(str);
        } catch (JSONException e) {
            Log.e("SettingsBackup", "JSONException occorred when stringToValue()", e);
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public String valueToString(JSONObject jSONObject) {
        return jSONObject.toString();
    }
}

package com.xiaomi.settingsdk.backup.data;

import android.os.Bundle;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;

public class DataPackage implements Parcelable {
    public static final Creator<DataPackage> CREATOR = new Creator<DataPackage>() {
        public DataPackage createFromParcel(Parcel parcel) {
            return DataPackage.parseDataPackageBundle(parcel.readBundle());
        }

        public DataPackage[] newArray(int i) {
            return new DataPackage[i];
        }
    };
    private final Map<String, SettingItem<?>> mDataItems = new HashMap();
    private final Map<String, ParcelFileDescriptor> mFileItems = new HashMap();

    private Bundle getDataPackageBundle() {
        Bundle bundle = new Bundle();
        for (Entry entry : this.mDataItems.entrySet()) {
            bundle.putParcelable((String) entry.getKey(), (SettingItem) entry.getValue());
        }
        for (Entry entry2 : this.mFileItems.entrySet()) {
            bundle.putParcelable((String) entry2.getKey(), (ParcelFileDescriptor) entry2.getValue());
        }
        return bundle;
    }

    /* access modifiers changed from: private */
    public static DataPackage parseDataPackageBundle(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        bundle.setClassLoader(SettingItem.class.getClassLoader());
        DataPackage dataPackage = new DataPackage();
        for (String str : bundle.keySet()) {
            Parcelable parcelable = bundle.getParcelable(str);
            if (parcelable instanceof SettingItem) {
                dataPackage.mDataItems.put(str, (SettingItem) parcelable);
            }
            if (parcelable instanceof ParcelFileDescriptor) {
                dataPackage.mFileItems.put(str, (ParcelFileDescriptor) parcelable);
            }
        }
        return dataPackage;
    }

    public void addKeyJson(String str, JSONObject jSONObject) {
        KeyJsonSettingItem keyJsonSettingItem = new KeyJsonSettingItem();
        keyJsonSettingItem.key = str;
        keyJsonSettingItem.setValue(jSONObject);
        this.mDataItems.put(str, keyJsonSettingItem);
    }

    public void appendToWrappedBundle(Bundle bundle) {
        bundle.putBundle("data_package", getDataPackageBundle());
    }

    public int describeContents() {
        return 0;
    }

    public SettingItem<?> get(String str) {
        return (SettingItem) this.mDataItems.get(str);
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeBundle(getDataPackageBundle());
    }
}

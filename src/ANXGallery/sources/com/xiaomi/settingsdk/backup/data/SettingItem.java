package com.xiaomi.settingsdk.backup.data;

import android.os.Parcel;
import android.os.Parcelable;

public abstract class SettingItem<T> implements Parcelable, Comparable<SettingItem<?>> {
    public String key;
    private T value;

    public int compareTo(SettingItem<?> settingItem) {
        if (settingItem == null) {
            return 1;
        }
        if (this.key != null || settingItem.key == null) {
            return this.key.compareTo(settingItem.key);
        }
        return -1;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void fillFromParcel(Parcel parcel) {
        String readString = parcel.readString();
        String readString2 = parcel.readString();
        this.key = readString;
        setValue(stringToValue(readString2));
    }

    public T getValue() {
        return this.value;
    }

    public void setValue(T t) {
        this.value = t;
    }

    /* access modifiers changed from: protected */
    public abstract T stringToValue(String str);

    /* access modifiers changed from: protected */
    public abstract String valueToString(T t);

    public void writeToParcel(Parcel parcel, int i) {
        String valueToString = valueToString(getValue());
        parcel.writeString(this.key);
        parcel.writeString(valueToString);
    }
}

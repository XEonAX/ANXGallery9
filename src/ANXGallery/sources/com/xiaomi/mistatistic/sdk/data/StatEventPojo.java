package com.xiaomi.mistatistic.sdk.data;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class StatEventPojo implements Parcelable {
    public static final Creator<StatEventPojo> CREATOR = new Creator<StatEventPojo>() {
        /* renamed from: a */
        public StatEventPojo createFromParcel(Parcel parcel) {
            StatEventPojo statEventPojo = new StatEventPojo();
            statEventPojo.mCategory = parcel.readString();
            statEventPojo.mTimeStamp = parcel.readLong();
            statEventPojo.mKey = parcel.readString();
            statEventPojo.mType = parcel.readString();
            statEventPojo.mValue = parcel.readString();
            statEventPojo.mExtra = parcel.readString();
            statEventPojo.mAnonymous = parcel.readInt();
            return statEventPojo;
        }

        /* renamed from: a */
        public StatEventPojo[] newArray(int i) {
            return new StatEventPojo[i];
        }
    };
    public int mAnonymous;
    public String mCategory;
    public String mExtra;
    public String mKey;
    public long mTimeStamp;
    public String mType;
    public String mValue;

    public long a() {
        return 6 + ((long) this.mCategory.getBytes().length) + ((long) this.mKey.getBytes().length) + ((long) this.mType.getBytes().length) + ((long) this.mValue.getBytes().length) + ((long) this.mExtra.getBytes().length);
    }

    public int describeContents() {
        return 0;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Event [");
        sb.append("category=");
        sb.append(this.mCategory);
        sb.append(",");
        sb.append("key=");
        sb.append(this.mKey);
        sb.append(",");
        sb.append("value=");
        sb.append(this.mValue);
        sb.append(",params=");
        sb.append(this.mExtra);
        sb.append(",anonymous=");
        sb.append(this.mAnonymous);
        sb.append("]");
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mCategory);
        parcel.writeLong(this.mTimeStamp);
        parcel.writeString(this.mKey);
        parcel.writeString(this.mType);
        parcel.writeString(this.mValue);
        parcel.writeString(this.mExtra);
        parcel.writeInt(this.mAnonymous);
    }
}

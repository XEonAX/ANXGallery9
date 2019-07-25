package com.miui.gallery.cloud.baby;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.Calendar;
import java.util.TimeZone;
import org.json.JSONException;
import org.json.JSONObject;

public final class BabyInfo implements Parcelable {
    public static final Creator<BabyInfo> CREATOR = new Creator<BabyInfo>() {
        public BabyInfo createFromParcel(Parcel parcel) {
            String readString = parcel.readString();
            String readString2 = parcel.readString();
            String readString3 = parcel.readString();
            String readString4 = parcel.readString();
            String readString5 = parcel.readString();
            String readString6 = parcel.readString();
            boolean z = true;
            if (parcel.readInt() != 1) {
                z = false;
            }
            BabyInfo babyInfo = new BabyInfo(readString, readString2, readString3, readString4, readString5, readString6, z, parcel.readInt());
            return babyInfo;
        }

        public BabyInfo[] newArray(int i) {
            return new BabyInfo[i];
        }
    };
    private static final int[] sDaysInMon = {31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30};
    public boolean mAutoupdate;
    public String mBirthday;
    public int mLocalFlag;
    public String mNickName;
    public String mPeopleId;
    public String mRelation;
    public String mRelationText;
    public String mSex;

    public BabyInfo(String str, String str2, String str3, String str4, String str5, String str6, boolean z, int i) {
        this.mNickName = str;
        this.mBirthday = str2;
        this.mSex = str3;
        this.mRelation = str4;
        this.mRelationText = str5;
        this.mPeopleId = str6;
        this.mAutoupdate = z;
        this.mLocalFlag = i;
    }

    public static BabyInfo fromJSON(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                BabyInfo babyInfo = new BabyInfo(jSONObject.optString(BabyAlbumUtils.BABY_ALBUM_NAME), jSONObject.optString(BabyAlbumUtils.BABY_ALBUM_BIRTHDAY), jSONObject.optString(BabyAlbumUtils.BABY_GENDER), jSONObject.optString(BabyAlbumUtils.BABY_RELATION), jSONObject.optString(BabyAlbumUtils.BABY_RELATION_TEXT), jSONObject.optString(BabyAlbumUtils.BABY_PEOPLE_ID), jSONObject.optBoolean(BabyAlbumUtils.BABY_AUTO_UPDATE), jSONObject.optInt("localFlag"));
                return babyInfo;
            } catch (JSONException e) {
                Log.e("BabyInfo", "failed to parse baby info", (Object) e);
            }
        }
        return null;
    }

    public static int[] getAge(long j, int i, int i2, int i3) {
        int i4;
        int[] currentYearMonthDay = getCurrentYearMonthDay(j);
        int i5 = currentYearMonthDay[0];
        int i6 = currentYearMonthDay[1];
        int i7 = currentYearMonthDay[2];
        int i8 = i7 - i3;
        int i9 = -1;
        if (i8 < 0) {
            int i10 = i6 - 1;
            i8 = (i7 + sDaysInMon[(i10 + 12) % 12]) - i3;
            if (i5 % 4 == 0 && i10 == 2) {
                i8++;
            }
            i4 = -1;
        } else {
            i4 = 0;
        }
        int i11 = i4 + (i6 - i2);
        if (i11 < 0) {
            i11 += 12;
        } else {
            i9 = 0;
        }
        return new int[]{i9 + (i5 - i), i11, i8};
    }

    private static int[] getCurrentYearMonthDay(long j) {
        Calendar instance = Calendar.getInstance(TimeZone.getDefault());
        instance.setTimeInMillis(j);
        return new int[]{instance.get(1), instance.get(2) + 1, instance.get(5)};
    }

    public static int[] splitBirthDay(BabyInfo babyInfo) {
        if (babyInfo != null && !TextUtils.isEmpty(babyInfo.mBirthday)) {
            String[] split = babyInfo.mBirthday.split("-");
            if (split == null || split.length != 3) {
                StringBuilder sb = new StringBuilder();
                sb.append("illegal birthday: ");
                sb.append(babyInfo.mBirthday);
                Log.e("BabyInfo", sb.toString());
            } else {
                String str = split[0];
                String str2 = split[1];
                String str3 = split[2];
                try {
                    return new int[]{Integer.valueOf(str).intValue(), Integer.valueOf(str2).intValue(), Integer.valueOf(str3).intValue()};
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("illegal birthday: ");
                    sb2.append(babyInfo.mBirthday);
                    Log.e("BabyInfo", sb2.toString());
                }
            }
        }
        return null;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BabyInfo)) {
            return false;
        }
        BabyInfo babyInfo = (BabyInfo) obj;
        if (!TextUtils.equals(this.mNickName, babyInfo.mNickName) || !TextUtils.equals(this.mBirthday, babyInfo.mBirthday) || !TextUtils.equals(this.mSex, babyInfo.mSex) || !TextUtils.equals(this.mRelation, babyInfo.mRelation) || !TextUtils.equals(this.mRelationText, babyInfo.mRelationText) || !TextUtils.equals(this.mPeopleId, babyInfo.mPeopleId) || this.mAutoupdate != babyInfo.mAutoupdate || this.mLocalFlag != babyInfo.mLocalFlag) {
            z = false;
        }
        return z;
    }

    public String toJSON() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_ALBUM_NAME);
        sb.append("':");
        sb.append("'");
        sb.append(this.mNickName);
        sb.append("',");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_GENDER);
        sb.append("':");
        sb.append("'");
        sb.append(this.mSex);
        sb.append("',");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_RELATION);
        sb.append("':");
        sb.append("'");
        sb.append(this.mRelation);
        sb.append("',");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_RELATION_TEXT);
        sb.append("':");
        sb.append("'");
        sb.append(this.mRelationText);
        sb.append("',");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_ALBUM_BIRTHDAY);
        sb.append("':");
        sb.append("'");
        sb.append(this.mBirthday);
        sb.append("',");
        if (!TextUtils.isEmpty(this.mPeopleId)) {
            sb.append("'");
            sb.append(BabyAlbumUtils.BABY_PEOPLE_ID);
            sb.append("':");
            sb.append("'");
            sb.append(this.mPeopleId);
            sb.append("',");
        }
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_AUTO_UPDATE);
        sb.append("':");
        sb.append(this.mAutoupdate);
        sb.append(",");
        sb.append("'");
        sb.append("localFlag");
        sb.append("':");
        sb.append(this.mLocalFlag);
        sb.append(",");
        sb.append("'");
        sb.append(nexExportFormat.TAG_FORMAT_TYPE);
        sb.append("':");
        sb.append("'");
        sb.append(BabyAlbumUtils.BABY_BABY);
        sb.append("'}");
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mNickName);
        parcel.writeString(this.mBirthday);
        parcel.writeString(this.mSex);
        parcel.writeString(this.mRelation);
        parcel.writeString(this.mRelationText);
        parcel.writeString(this.mPeopleId);
        parcel.writeInt(this.mAutoupdate ? 1 : 0);
        parcel.writeInt(this.mLocalFlag);
    }
}

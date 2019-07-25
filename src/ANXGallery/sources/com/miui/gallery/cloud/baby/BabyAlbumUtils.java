package com.miui.gallery.cloud.baby;

import android.content.Context;
import android.database.DatabaseUtils;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.util.GalleryUtils;

public class BabyAlbumUtils {
    public static String BABY_ALBUM_BIRTHDAY = "birthday";
    public static String BABY_ALBUM_NAME = "name";
    public static String BABY_AUTO_UPDATE = "autoUpdate";
    public static String BABY_BABY = "baby";
    public static String BABY_BABY_ALBUM_LOCAL_ID = "babyAlbumLocalId";
    public static String BABY_FACE_ALBUM_LOCAL_ID = "faceAlbumLocalId";
    public static String BABY_GENDER = "gender";
    public static String BABY_MALE = "male";
    public static String BABY_PEOPLE_ID = "peopleId";
    public static String BABY_RELATION = "relation";
    public static String BABY_RELATION_TEXT = "relationText";

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a A[RETURN] */
    public static boolean isBabyAlbumForThisServerId(Context context, String str, boolean z) {
        if (!z) {
            DBCloud groupItemByColumnnameAndValue = CloudUtils.getGroupItemByColumnnameAndValue(context, "serverId", str, false);
            return groupItemByColumnnameAndValue != null && !TextUtils.isEmpty(groupItemByColumnnameAndValue.getBabyInfoJson());
        }
        DBShareAlbum groupItemByColumnnameAndValueFromShare = CloudUtils.getGroupItemByColumnnameAndValueFromShare(context, "serverId", str);
        if (groupItemByColumnnameAndValueFromShare != null && !TextUtils.isEmpty(groupItemByColumnnameAndValueFromShare.getBabyInfoJson())) {
            return true;
        }
    }

    public static void saveBabyInfo(String str, BabyInfo babyInfo, boolean z) {
        if (z) {
            saveShareAlbumBabyInfo(str, babyInfo);
        } else {
            saveOwnerAlbumBabyInfo(str, babyInfo);
        }
    }

    private static void saveBabyInfoJson(String str, BabyInfo babyInfo, String str2, int i, String str3, String str4, String str5, String str6) {
        String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(i);
        String str7 = "update %s set %s=%s, %s='%s', %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s=%s";
        Object[] objArr = new Object[12];
        objArr[0] = str6;
        objArr[1] = str2;
        objArr[2] = babyInfo == null ? "" : DatabaseUtils.sqlEscapeString(babyInfo.toJSON());
        objArr[3] = str3;
        objArr[4] = babyInfo == null ? "" : babyInfo.mPeopleId;
        objArr[5] = str4;
        objArr[6] = str4;
        objArr[7] = transformToEditedColumnsElement;
        objArr[8] = transformToEditedColumnsElement;
        objArr[9] = transformToEditedColumnsElement;
        objArr[10] = str5;
        objArr[11] = str;
        GalleryUtils.safeExec(String.format(str7, objArr));
    }

    public static void saveOwnerAlbumBabyInfo(String str, BabyInfo babyInfo) {
        saveBabyInfoJson(str, babyInfo, "babyInfoJson", 63, "peopleId", "editedColumns", "_id", "cloud");
    }

    public static void saveShareAlbumBabyInfo(String str, BabyInfo babyInfo) {
        saveBabyInfoJson(str, babyInfo, "babyInfoJson", 25, "peopleId", "editedColumns", "_id", "shareAlbum");
    }
}

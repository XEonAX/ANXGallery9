package com.miui.gallery.cloud;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Locale;

public class CloudTableUtils {
    public static final String IS_VALID_GROUP = String.format(Locale.US, "(%s = %d AND (%s = %d OR %s = %d OR (%s = %d AND %s = \"%s\")))", new Object[]{"serverType", Integer.valueOf(0), "localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(10), "localFlag", Integer.valueOf(0), "serverStatus", "custom"});
    private static final ArrayList<Long> sIdsForGroupWithoutRecord = new ArrayList<>();
    public static final String sItemIsNotGroup = String.format(Locale.US, "(%s = %d OR %s = %d)", new Object[]{"serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2)});
    public static String sPhotoLocalFlag_Create_ForceCreate_Move_Copy = String.format(Locale.US, "(%s = %d OR %s = %d OR %s = %d OR %s = %d)", new Object[]{"localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(5), "localFlag", Integer.valueOf(6), "localFlag", Integer.valueOf(9)});
    public static final String sPhotoLocalFlag_Synced = String.format(Locale.US, "(%s = %d AND %s = \"%s\")", new Object[]{"localFlag", Integer.valueOf(0), "serverStatus", "custom"});
    private static final ArrayList<Long> sSystemAlbumGroupIds = new ArrayList<>();

    static {
        sSystemAlbumGroupIds.add(Long.valueOf(1));
        sSystemAlbumGroupIds.add(Long.valueOf(2));
        sSystemAlbumGroupIds.add(Long.valueOf(3));
        sSystemAlbumGroupIds.add(Long.valueOf(4));
        sSystemAlbumGroupIds.add(Long.valueOf(1000));
        sSystemAlbumGroupIds.add(Long.valueOf(1001));
        sIdsForGroupWithoutRecord.add(Long.valueOf(3));
        sIdsForGroupWithoutRecord.add(Long.valueOf(4));
        sIdsForGroupWithoutRecord.add(Long.valueOf(1000));
        sIdsForGroupWithoutRecord.add(Long.valueOf(1001));
    }

    public static long getCloudIdForGroupWithoutRecord(long j) {
        if (isGroupWithoutRecord(j)) {
            return j * -1;
        }
        return 0;
    }

    public static long getServerIdForGroupWithoutRecord(long j) {
        if (isGroupWithoutRecordByCloudId(j)) {
            return j * -1;
        }
        return 0;
    }

    public static boolean isCameraGroup(String str) {
        return String.valueOf(1).equals(str);
    }

    public static final boolean isGroupWithoutRecord(long j) {
        return sIdsForGroupWithoutRecord.contains(Long.valueOf(j));
    }

    public static final boolean isGroupWithoutRecordByCloudId(long j) {
        return sIdsForGroupWithoutRecord.contains(Long.valueOf(j * -1));
    }

    public static boolean isScreenshotGroup(String str) {
        return String.valueOf(2).equals(str);
    }

    public static boolean isSecretAlbum(String str, String str2) {
        long j = !TextUtils.isEmpty(str) ? Long.parseLong(str) : !TextUtils.isEmpty(str2) ? getServerIdForGroupWithoutRecord(Long.parseLong(str2)) : 0;
        return j == 1000;
    }

    public static boolean isSystemAlbum(long j) {
        return sSystemAlbumGroupIds.contains(Long.valueOf(j));
    }

    public static String sGetWhereClauseAll(String str, String str2, int i) {
        return String.format(Locale.US, "( (%s) AND ((%s AND (+%s = %s AND %s)) OR (%s AND (%s = %s AND %s))) )", new Object[]{sItemIsNotGroup, sPhotoLocalFlag_Synced, "groupId", str2, String.format(Locale.US, "(%d = %d OR %d = %d)", new Object[]{Integer.valueOf(0), Integer.valueOf(i), Integer.valueOf(10), Integer.valueOf(i)}), sPhotoLocalFlag_Create_ForceCreate_Move_Copy, "localGroupId", str, String.format(Locale.US, "(%d = %d OR %d = %d OR %d = %d)", new Object[]{Integer.valueOf(0), Integer.valueOf(i), Integer.valueOf(8), Integer.valueOf(i), Integer.valueOf(10), Integer.valueOf(i)})});
    }
}

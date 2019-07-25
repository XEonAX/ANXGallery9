package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.card.SyncTagUtil;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

public class GalleryCloudSyncTagUtils {
    private static HashMap<String, String> sColumnNameToPushNameMap = new HashMap<>();
    public static HashMap<Integer, SyncTagConstant> sSyncTagConstantsMap = new HashMap<>();
    private static final Object sSyncTagLock = new Object();

    public static class SyncTagConstant {
        public final String columnName;
        public final int initValue;
        public final String jsonTagInput;
        public final String jsonTagOutput;
        public final String pushName;
        public final boolean shouldCheckInit;
        public final boolean shouldInsertCloudSetting;
        public final String syncInfoColumnName;
        public final Uri uri;

        public SyncTagConstant(String str, String str2, String str3, String str4, int i, boolean z, boolean z2, Uri uri2, String str5) {
            this.columnName = str;
            this.jsonTagInput = str2;
            this.jsonTagOutput = str3;
            this.pushName = str4;
            this.initValue = i;
            this.shouldInsertCloudSetting = z;
            this.shouldCheckInit = z2;
            this.syncInfoColumnName = str5;
            this.uri = uri2;
        }

        public boolean hasSyncInfo() {
            return this.syncInfoColumnName != null;
        }
    }

    public static class SyncTagItem {
        public long currentValue;
        public long serverValue;
        public boolean shouldSync = true;
        public final int syncTagType;

        public SyncTagItem(int i) {
            this.syncTagType = i;
        }
    }

    static {
        sColumnNameToPushNameMap.put("syncTag", "micloud.gallery.sync");
        sColumnNameToPushNameMap.put("shareSyncTagAlbumList", "micloud.gallery.albumlist.sync");
        sColumnNameToPushNameMap.put("shareSyncTagAlbumInfo", "micloud.gallery.albuminfo.sync");
        sColumnNameToPushNameMap.put("ownerSyncTagUserList", "micloud.gallery.sharerlist.sync");
        sColumnNameToPushNameMap.put("shareSyncTagImageList", "micloud.gallery.imagelist.sync");
        sColumnNameToPushNameMap.put("faceWatermark", "gallery-facerecognition");
        HashMap<Integer, SyncTagConstant> hashMap = sSyncTagConstantsMap;
        Integer valueOf = Integer.valueOf(1);
        SyncTagConstant syncTagConstant = new SyncTagConstant("syncTag", "syncTag", "syncTag", "micloud.gallery.sync", 0, true, false, GalleryCloudUtils.CLOUD_SETTING_URI, "syncInfo");
        hashMap.put(valueOf, syncTagConstant);
        HashMap<Integer, SyncTagConstant> hashMap2 = sSyncTagConstantsMap;
        Integer valueOf2 = Integer.valueOf(2);
        SyncTagConstant syncTagConstant2 = new SyncTagConstant("ownerSyncTagUserList", "mySharerListsTag", "sharerlist", "micloud.gallery.sharerlist.sync", 0, true, false, GalleryCloudUtils.CLOUD_SETTING_URI, "shareSyncInfo");
        hashMap2.put(valueOf2, syncTagConstant2);
        HashMap<Integer, SyncTagConstant> hashMap3 = sSyncTagConstantsMap;
        Integer valueOf3 = Integer.valueOf(3);
        SyncTagConstant syncTagConstant3 = new SyncTagConstant("shareSyncTagAlbumList", "albumListTag", "albumlist", "micloud.gallery.albumlist.sync", 0, true, true, GalleryCloudUtils.CLOUD_SETTING_URI, "shareSyncInfo");
        hashMap3.put(valueOf3, syncTagConstant3);
        HashMap<Integer, SyncTagConstant> hashMap4 = sSyncTagConstantsMap;
        Integer valueOf4 = Integer.valueOf(4);
        SyncTagConstant syncTagConstant4 = new SyncTagConstant("shareSyncTagAlbumInfo", "albumInfoTag", "albuminfo", "micloud.gallery.albuminfo.sync", 0, true, true, GalleryCloudUtils.CLOUD_SETTING_URI, "shareSyncInfo");
        hashMap4.put(valueOf4, syncTagConstant4);
        HashMap<Integer, SyncTagConstant> hashMap5 = sSyncTagConstantsMap;
        Integer valueOf5 = Integer.valueOf(5);
        SyncTagConstant syncTagConstant5 = new SyncTagConstant("shareSyncTagImageList", "imageListTag", "imagelist", "micloud.gallery.imagelist.sync", 0, true, true, GalleryCloudUtils.CLOUD_SETTING_URI, "shareSyncInfo");
        hashMap5.put(valueOf5, syncTagConstant5);
        HashMap<Integer, SyncTagConstant> hashMap6 = sSyncTagConstantsMap;
        Integer valueOf6 = Integer.valueOf(8);
        SyncTagConstant syncTagConstant6 = new SyncTagConstant("albumImageTag", "syncTag", "syncTag", null, 0, false, false, GalleryCloudUtils.SHARE_ALBUM_URI, "syncInfo");
        hashMap6.put(valueOf6, syncTagConstant6);
        HashMap<Integer, SyncTagConstant> hashMap7 = sSyncTagConstantsMap;
        Integer valueOf7 = Integer.valueOf(9);
        SyncTagConstant syncTagConstant7 = new SyncTagConstant("albumUserTag", "updateTag", "syncTag", null, 0, false, false, GalleryCloudUtils.SHARE_ALBUM_URI, null);
        hashMap7.put(valueOf7, syncTagConstant7);
        HashMap<Integer, SyncTagConstant> hashMap8 = sSyncTagConstantsMap;
        Integer valueOf8 = Integer.valueOf(10);
        SyncTagConstant syncTagConstant8 = new SyncTagConstant("albumUserTag", "updateTag", "syncTag", null, 0, false, false, GalleryCloudUtils.CLOUD_URI, null);
        hashMap8.put(valueOf8, syncTagConstant8);
        HashMap<Integer, SyncTagConstant> hashMap9 = sSyncTagConstantsMap;
        Integer valueOf9 = Integer.valueOf(11);
        SyncTagConstant syncTagConstant9 = new SyncTagConstant("faceWatermark", null, null, "gallery-facerecognition", 0, false, false, GalleryCloudUtils.CLOUD_SETTING_URI, null);
        hashMap9.put(valueOf9, syncTagConstant9);
    }

    public static String getAccountSelections(Account account) {
        StringBuilder sb = new StringBuilder();
        sb.append("accountName = '");
        sb.append(account.name);
        sb.append("' and ");
        sb.append("accountType");
        sb.append(" = '");
        sb.append(account.type);
        sb.append("'");
        return sb.toString();
    }

    public static String getCardSyncInfo(Account account) {
        return SyncTagUtil.getCardSyncInfo(account);
    }

    public static long getCardSyncTag(Account account) {
        return SyncTagUtil.getCardSyncTag(account);
    }

    public static String getColumnName(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.columnName;
        }
        return null;
    }

    public static String getFaceSyncToken(Account account) {
        return (String) GalleryUtils.safeQuery(CloudUtils.getLimitUri(GalleryCloudUtils.CLOUD_SETTING_URI, 1), new String[]{"faceSyncToken"}, getAccountSelections(account), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                return (cursor == null || !cursor.moveToNext()) ? "" : cursor.getString(0);
            }
        });
    }

    public static int getInitSyncTagValue(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.initValue;
        }
        return 0;
    }

    public static String getJsonTagInput(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.jsonTagInput;
        }
        return null;
    }

    public static String getJsonTagOutput(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.jsonTagOutput;
        }
        return null;
    }

    public static String getSyncInfoColumnName(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.syncInfoColumnName;
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x006c A[SYNTHETIC, Splitter:B:22:0x006c] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0079 A[SYNTHETIC, Splitter:B:30:0x0079] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0080 A[Catch:{ all -> 0x0084 }] */
    public static ArrayList<SyncTagItem> getSyncTag(Context context, Account account, ArrayList<SyncTagItem> arrayList) {
        synchronized (sSyncTagLock) {
            Cursor cursor = null;
            try {
                Cursor cursor2 = getSyncTagCursorByAccount(context, account, arrayList);
                if (cursor2 != null) {
                    try {
                        if (cursor2.moveToNext()) {
                            for (int i = 0; i < arrayList.size(); i++) {
                                SyncTagItem syncTagItem = (SyncTagItem) arrayList.get(i);
                                syncTagItem.currentValue = Math.max(cursor2.getLong(i), (long) ((SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(((SyncTagItem) arrayList.get(i)).syncTagType))).initValue);
                            }
                            if (cursor2 != null) {
                                try {
                                    cursor2.close();
                                } catch (Throwable th) {
                                    throw th;
                                }
                            }
                        }
                    } catch (Exception e) {
                        e = e;
                        cursor = cursor2;
                        try {
                            e.printStackTrace();
                            if (cursor != null) {
                                cursor.close();
                            }
                            return arrayList;
                        } catch (Throwable th2) {
                            th = th2;
                            cursor2 = cursor;
                            if (cursor2 != null) {
                                cursor2.close();
                            }
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        if (cursor2 != null) {
                        }
                        throw th;
                    }
                }
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    SyncTagItem syncTagItem2 = (SyncTagItem) it.next();
                    syncTagItem2.currentValue = (long) ((SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(syncTagItem2.syncTagType))).initValue;
                }
                if (cursor2 != null) {
                }
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                if (cursor != null) {
                }
                return arrayList;
            }
        }
        return arrayList;
    }

    private static Cursor getSyncTagCursorByAccount(Context context, Account account, ArrayList<SyncTagItem> arrayList) {
        if (account != null) {
            return context.getContentResolver().query(GalleryCloudUtils.CLOUD_SETTING_URI, getSyncTagSelection(arrayList), getAccountSelections(account), null, null);
        }
        SyncLog.e("GalleryCloudSyncTagUtils", "account is null");
        return null;
    }

    public static String[] getSyncTagSelection(ArrayList<SyncTagItem> arrayList) {
        if (arrayList == null || arrayList.isEmpty()) {
            return new String[]{" * "};
        }
        String[] strArr = new String[arrayList.size()];
        for (int i = 0; i < arrayList.size(); i++) {
            strArr[i] = ((SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(((SyncTagItem) arrayList.get(i)).syncTagType))).columnName;
        }
        return strArr;
    }

    public static Uri getUri(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.uri;
        }
        return null;
    }

    public static boolean hasSyncInfo(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.hasSyncInfo();
        }
        return false;
    }

    public static void insertAccountToDB(Context context, Account account) {
        if (!TextUtils.isEmpty(account.name) && !TextUtils.isEmpty(account.type)) {
            synchronized (sSyncTagLock) {
                ContentValues contentValues = new ContentValues();
                for (SyncTagConstant syncTagConstant : sSyncTagConstantsMap.values()) {
                    if (syncTagConstant.shouldInsertCloudSetting) {
                        contentValues.put(syncTagConstant.columnName, Integer.valueOf(syncTagConstant.initValue));
                    }
                }
                internalUpdateAccount(context, account, contentValues, null);
            }
            SyncTagUtil.ensureAccount(account);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x003d  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0045  */
    private static void internalUpdateAccount(Context context, Account account, ContentValues contentValues, ArrayList<SyncTagItem> arrayList) {
        Cursor cursor;
        try {
            cursor = getSyncTagCursorByAccount(context, account, arrayList);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        if (arrayList != null) {
                            if (!arrayList.isEmpty()) {
                                GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_SETTING_URI, contentValues, null, null);
                                postUpdateSyncTag(context, contentValues);
                                if (cursor != null) {
                                    cursor.close();
                                }
                            }
                        }
                        if (cursor != null) {
                            cursor.close();
                        }
                        return;
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            contentValues.put("accountName", account.name);
            contentValues.put("accountType", account.type);
            GalleryUtils.safeInsert(GalleryCloudUtils.CLOUD_SETTING_URI, contentValues);
            postUpdateSyncTag(context, contentValues);
            if (cursor != null) {
            }
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static void postUpdateSyncTag(Context context, ContentValues contentValues) {
        for (Entry entry : contentValues.valueSet()) {
            String str = (String) sColumnNameToPushNameMap.get(entry.getKey());
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb = new StringBuilder();
                sb.append("pushName:");
                sb.append(str);
                sb.append(", pushData:");
                sb.append(entry.getValue());
                SyncLog.d("GalleryCloudSyncTagUtils", sb.toString());
            }
        }
    }

    public static void setCardSyncInfo(Account account, String str) {
        SyncTagUtil.setCardSyncInfo(account, str);
    }

    public static void setCardSyncTag(Account account, long j) {
        SyncTagUtil.setCardSyncTag(account, j);
    }

    public static void setFaceSyncToken(Account account, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("faceSyncToken", str);
        GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_SETTING_URI, contentValues, getAccountSelections(account), null);
    }

    public static void setFaceSyncWatermark(Account account, long j) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("faceWatermark", Long.valueOf(j));
        GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_SETTING_URI, contentValues, getAccountSelections(account), null);
    }

    public static boolean shouldSyncTagValue(int i) {
        SyncTagConstant syncTagConstant = (SyncTagConstant) sSyncTagConstantsMap.get(Integer.valueOf(i));
        if (syncTagConstant != null) {
            return syncTagConstant.shouldCheckInit;
        }
        return false;
    }
}

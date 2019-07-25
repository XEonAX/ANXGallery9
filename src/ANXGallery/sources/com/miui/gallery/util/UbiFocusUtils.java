package com.miui.gallery.util;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBOwnerSubUbiImage;
import com.miui.gallery.data.DBShareImage;
import com.miui.gallery.data.DBShareSubUbiImage;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

public class UbiFocusUtils {

    static class MainUbiQuery extends UbiQuery {
        MainUbiQuery(boolean z, String str, String str2) {
            if (!TextUtils.isEmpty(str) || !TextUtils.isEmpty(str2)) {
                String str3 = z ? "shareId" : "serverId";
                if (TextUtils.isEmpty(str)) {
                    this.queryString = "_id = ? ";
                    this.queryArgs = new String[]{str2};
                } else if (TextUtils.isEmpty(str2)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(str3);
                    sb.append(" = ? ");
                    this.queryString = sb.toString();
                    this.queryArgs = new String[]{str};
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(" ( ");
                    sb2.append(str3);
                    sb2.append(" = ? OR ");
                    sb2.append("_id");
                    sb2.append(" = ? ) ");
                    this.queryString = sb2.toString();
                    this.queryArgs = new String[]{str, str2};
                }
            }
        }
    }

    static class SubUbiQuery extends UbiQuery {
        SubUbiQuery(String str, String str2, String str3) {
            if (!TextUtils.isEmpty(str) || !TextUtils.isEmpty(str2)) {
                boolean z = !TextUtils.isEmpty(str3);
                if (TextUtils.isEmpty(str)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("ubiLocalId = ? ");
                    sb.append(z ? " AND ubiSubIndex = ? " : "");
                    this.queryString = sb.toString();
                    this.queryArgs = z ? new String[]{str2, str3} : new String[]{str2};
                } else if (TextUtils.isEmpty(str2)) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("ubiServerId = ? ");
                    sb2.append(z ? " AND ubiSubIndex = ? " : "");
                    this.queryString = sb2.toString();
                    this.queryArgs = z ? new String[]{str, str3} : new String[]{str};
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(" ( ubiServerId = ? OR ubiLocalId = ? ) ");
                    sb3.append(z ? " AND ubiSubIndex = ? " : "");
                    this.queryString = sb3.toString();
                    this.queryArgs = z ? new String[]{str, str2, str3} : new String[]{str, str2};
                }
            }
        }
    }

    static class UbiQuery {
        String[] queryArgs;
        String queryString;

        UbiQuery() {
        }

        public boolean isValid() {
            return !TextUtils.isEmpty(this.queryString) && this.queryArgs != null && this.queryArgs.length > 0;
        }
    }

    public static DBImage getMainDBImage(final boolean z, String str, String str2) {
        MainUbiQuery mainUbiQuery = new MainUbiQuery(z, str, str2);
        if (!mainUbiQuery.isValid()) {
            return null;
        }
        return (DBImage) GalleryUtils.safeQuery(z ? GalleryCloudUtils.SHARE_IMAGE_URI : GalleryCloudUtils.CLOUD_URI, CloudUtils.getProjectionAll(), mainUbiQuery.queryString, mainUbiQuery.queryArgs, (String) null, (QueryHandler<T>) new QueryHandler<DBImage>() {
            public DBImage handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToNext()) {
                    return null;
                }
                return z ? new DBShareImage(cursor) : new DBCloud(cursor);
            }
        });
    }

    public static int getSubUbiCount(boolean z, String str, String str2) {
        DBImage mainDBImage = getMainDBImage(z, str, str2);
        if (mainDBImage != null) {
            return mainDBImage.getSubUbiImageCount();
        }
        return 0;
    }

    private static DBImage getSubUbiImage(final boolean z, String str) {
        return (DBImage) GalleryUtils.safeQuery(z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, CloudUtils.getProjectionAll(), String.format(Locale.US, "%s=?", new Object[]{"fileName"}), new String[]{str}, (String) null, (QueryHandler<T>) new QueryHandler<DBImage>() {
            public DBImage handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return z ? new DBShareSubUbiImage(cursor) : new DBOwnerSubUbiImage(cursor);
            }
        });
    }

    public static DBImage getSubUbiImage(final boolean z, String str, String str2, int i) {
        SubUbiQuery subUbiQuery = new SubUbiQuery(str, str2, String.valueOf(i));
        if (!subUbiQuery.isValid()) {
            Log.e("UbiFocusUtils", "getSubUbiImage, subUbiQuery.isValid.");
            return null;
        }
        return (DBImage) GalleryUtils.safeQuery(z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, CloudUtils.getProjectionAll(), subUbiQuery.queryString, subUbiQuery.queryArgs, (String) null, (QueryHandler<T>) new QueryHandler<DBImage>() {
            public DBImage handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return z ? new DBShareSubUbiImage(cursor) : new DBOwnerSubUbiImage(cursor);
            }
        });
    }

    public static List<DBImage> getSubUbiImages(final boolean z, String str, String str2) {
        return (List) queryForSubUbiImages(z, str, str2, new QueryHandler<List<DBImage>>() {
            public List<DBImage> handle(Cursor cursor) {
                if (cursor == null) {
                    return null;
                }
                ArrayList newArrayList = Lists.newArrayList();
                while (cursor.moveToNext()) {
                    if (z) {
                        newArrayList.add(new DBShareSubUbiImage(cursor));
                    } else {
                        newArrayList.add(new DBOwnerSubUbiImage(cursor));
                    }
                }
                return newArrayList;
            }
        });
    }

    public static String getUbiServerIdByUbiLocalId(String str, boolean z) {
        return CloudUtils.getStringColumnValue(z ? GalleryCloudUtils.SHARE_IMAGE_URI : GalleryCloudUtils.CLOUD_URI, z ? "shareId" : "serverId", "_id", str);
    }

    public static void handleSubUbiImage(JSONObject jSONObject, boolean z, String str) throws JSONException {
        handleSubUbiImage(jSONObject, z, z ? jSONObject.getString("shareId") : jSONObject.getString("id"), str);
    }

    private static void handleSubUbiImage(JSONObject jSONObject, boolean z, String str, String str2) throws JSONException {
        if (jSONObject.optBoolean("isUbiImage")) {
            JSONObject optJSONObject = jSONObject.optJSONObject("ubiSubImageContentMap");
            int optInt = jSONObject.optInt("ubiSubImageCount");
            int optInt2 = jSONObject.optInt("ubiDefaultIndex");
            if (optJSONObject != null) {
                for (int i = 0; i <= optInt; i++) {
                    if (i != optInt2) {
                        JSONObject optJSONObject2 = optJSONObject.optJSONObject(String.valueOf(i));
                        if (optJSONObject2 != null) {
                            ContentValues contentValuesForAllAndThumbNull = CloudUtils.getContentValuesForAllAndThumbNull(optJSONObject2);
                            contentValuesForAllAndThumbNull.put("ubiServerId", str);
                            contentValuesForAllAndThumbNull.put("ubiSubIndex", Integer.valueOf(i));
                            if (!TextUtils.isEmpty(str2)) {
                                contentValuesForAllAndThumbNull.put("ubiLocalId", str2);
                            }
                            if (jSONObject.has("groupId")) {
                                contentValuesForAllAndThumbNull.put("groupId", jSONObject.getString("groupId"));
                            }
                            if (z && jSONObject.has("shareId")) {
                                contentValuesForAllAndThumbNull.put("shareId", jSONObject.getString("shareId"));
                            }
                            synchronized ((z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI)) {
                                DBImage subUbiImage = getSubUbiImage(z, str, str2, i);
                                if (subUbiImage == null) {
                                    DBImage subUbiImage2 = getSubUbiImage(z, contentValuesForAllAndThumbNull.getAsString("fileName"));
                                    if (subUbiImage2 != null) {
                                        CloudUtils.renameAnItemInLocal(subUbiImage2, false);
                                    }
                                    safeInsertSubUbiImage(z, contentValuesForAllAndThumbNull);
                                } else {
                                    safeUpdateSubUbiImage(z, contentValuesForAllAndThumbNull, str, str2, i);
                                    CloudUtils.renameItemIfNeeded(subUbiImage, contentValuesForAllAndThumbNull, false);
                                }
                            }
                        } else {
                            continue;
                        }
                    }
                }
            }
        }
    }

    public static <T> T queryForSubUbiImages(boolean z, String str, String str2, QueryHandler<T> queryHandler) {
        SubUbiQuery subUbiQuery = new SubUbiQuery(str, str2, null);
        if (!subUbiQuery.isValid()) {
            return null;
        }
        return GalleryUtils.safeQuery(z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, CloudUtils.getProjectionAll(), subUbiQuery.queryString, subUbiQuery.queryArgs, (String) null, queryHandler);
    }

    public static void safeDeleteSubUbi(DBImage dBImage) {
        if (dBImage.isUbiFocus()) {
            SubUbiQuery subUbiQuery = new SubUbiQuery(dBImage.getRequestId(), dBImage.getId(), null);
            if (!subUbiQuery.isValid()) {
                Log.e("UbiFocusUtils", "safeDeleteSubUbiImage, subUbiQuery.isValid.");
            } else {
                GalleryUtils.safeDelete(dBImage.isShareItem() ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, subUbiQuery.queryString, subUbiQuery.queryArgs);
            }
        }
    }

    private static void safeInsertSubUbiImage(boolean z, ContentValues contentValues) {
        GalleryUtils.safeInsert(z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, contentValues);
    }

    private static void safeUpdateSubUbiImage(boolean z, ContentValues contentValues, String str, String str2, int i) {
        SubUbiQuery subUbiQuery = new SubUbiQuery(str, str2, String.valueOf(i));
        if (!subUbiQuery.isValid()) {
            Log.e("UbiFocusUtils", "safeUpdateSubUbiImage, subUbiQuery.isValid.");
        } else {
            GalleryUtils.safeUpdate(z ? GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI : GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, contentValues, subUbiQuery.queryString, subUbiQuery.queryArgs);
        }
    }
}

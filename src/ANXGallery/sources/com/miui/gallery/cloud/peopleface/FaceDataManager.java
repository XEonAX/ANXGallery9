package com.miui.gallery.cloud.peopleface;

import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.Cursor;
import android.net.Uri;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.UriUtil;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Locale;

public class FaceDataManager {
    public static final Uri BASE_URI = Uri.parse("content://com.miui.gallery.cloud.provider");
    public static final Uri FACE_TO_IMAGES_URI = BASE_URI.buildUpon().appendPath("faceToImages").build();
    public static final String IS_VALID_GROUP = String.format(Locale.US, "(%s = \"%s\" AND (%s = %d OR %s = %d OR %s = %d OR (%s = %d AND %s = \"%s\")) AND ( %s is null OR %s = '' OR %s = %s) AND (%s IS NULL OR %s != %d))", new Object[]{nexExportFormat.TAG_FORMAT_TYPE, "PEOPLE", "localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(10), "localFlag", Integer.valueOf(14), "localFlag", Integer.valueOf(0), "serverStatus", "normal", "groupId", "groupId", "groupId", "serverId", "visibilityType", "visibilityType", Integer.valueOf(2)});
    public static final Uri PEOPLE_FACE_DELAY_NOTIFY_URI = BASE_URI.buildUpon().appendPath("peopleFace").appendQueryParameter("delay_notify", "true").build();
    public static final Uri PEOPLE_FACE_JOIN_FACE_TO_IMAGES_JOIN_CLOUD_URI = BASE_URI.buildUpon().appendPath("peopleFaceJoinFaceToImagesJoinCloud").build();
    public static final Uri PEOPLE_FACE_JOIN_FACE_TO_IMAGES_URI = BASE_URI.buildUpon().appendPath("peopleFaceJoinFaceToImages").build();
    public static final Uri PEOPLE_FACE_URI = BASE_URI.buildUpon().appendPath("peopleFace").build();
    public static final Uri PEOPLE_RECOMMOND_URI = BASE_URI.buildUpon().appendPath("peopleRecommend").build();
    private static final String[] PROJECTION_BASIC_PEOPLE_INFO = {"serverId", nexExportFormat.TAG_FORMAT_TYPE, "groupId", "eTag"};
    private static final String itemIsGroup = String.format(Locale.US, "(%s = \"%s\")", new Object[]{nexExportFormat.TAG_FORMAT_TYPE, "PEOPLE"});
    public static final String itemIsNotGroup = String.format(Locale.US, "(%s.%s = \"%s\")", new Object[]{"peopleFace", nexExportFormat.TAG_FORMAT_TYPE, "FACE"});

    public static void appendId(StringBuffer stringBuffer, String str) {
        if (!TextUtils.isEmpty(str)) {
            if (stringBuffer.length() > 0) {
                stringBuffer.append(",");
            }
            stringBuffer.append("'");
            stringBuffer.append(str);
            stringBuffer.append("'");
        }
    }

    public static void changeChildrenOfPeopleA2PeopleB(String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("groupId", str2);
        safeUpdateFace(contentValues, "groupId = ?   and localFlag != ? ", new String[]{str, String.valueOf(2)});
    }

    public static ArrayList<PeopleFace> fillInPeopleInfo(LinkedList<PeopleFace> linkedList) {
        return fillInPeopleInfo(linkedList, 0);
    }

    private static ArrayList<PeopleFace> fillInPeopleInfo(final LinkedList<PeopleFace> linkedList, int i) {
        StringBuffer stringBuffer = new StringBuffer();
        StringBuffer stringBuffer2 = new StringBuffer();
        for (int i2 = 0; i2 < linkedList.size(); i2++) {
            appendId(stringBuffer, ((PeopleFace) linkedList.get(i2)).groupId);
            appendId(stringBuffer2, ((PeopleFace) linkedList.get(i2)).localGroupId);
        }
        final ArrayList<PeopleFace> newArrayList = Lists.newArrayList();
        if (((Boolean) GalleryUtils.safeQuery("peopleFace", CloudUtils.getProjectionAll(), getVisiblePeopleFaceSelection(stringBuffer.toString(), stringBuffer2.toString(), true), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Boolean>() {
            public Boolean handle(Cursor cursor) {
                boolean z = false;
                if (cursor != null) {
                    boolean z2 = false;
                    while (cursor.moveToNext()) {
                        Iterator it = linkedList.iterator();
                        while (it.hasNext()) {
                            PeopleFace peopleFace = (PeopleFace) it.next();
                            if (FaceDataManager.isFaceInGroup(peopleFace, cursor)) {
                                if (FaceDataManager.isPeopleMerged(cursor)) {
                                    peopleFace.localGroupId = cursor.getString(4);
                                    peopleFace.groupId = cursor.getString(3);
                                    peopleFace.relationType = cursor.getInt(19);
                                } else {
                                    peopleFace.peopleName = cursor.getString(15);
                                    peopleFace.localGroupId = cursor.getString(0);
                                    peopleFace.groupId = cursor.getString(1);
                                    peopleFace.relationType = cursor.getInt(19);
                                    it.remove();
                                    newArrayList.add(peopleFace);
                                }
                                z2 = true;
                            }
                        }
                    }
                    z = z2;
                }
                return Boolean.valueOf(z);
            }
        })).booleanValue() && !linkedList.isEmpty() && i < 4) {
            newArrayList.addAll(fillInPeopleInfo(linkedList, i + 1));
        }
        return newArrayList;
    }

    public static Cursor getFaceInFaceIds(String str, String str2) {
        try {
            return GalleryDBHelper.getInstance().query("peopleFace", CloudUtils.getProjectionAll(), getPeopleFaceSelection(str, str2, false), null, null, null, null, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static PeopleFace getGroupByPeopleName(Context context, String str) {
        return getGroupByPeopleName(context, str, -1);
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0062  */
    public static PeopleFace getGroupByPeopleName(Context context, String str, long j) {
        Cursor cursor = null;
        if (str == null) {
            return null;
        }
        try {
            ContentResolver contentResolver = context.getContentResolver();
            Uri peopleFaceLimitUri = getPeopleFaceLimitUri(1);
            String[] projectionAll = CloudUtils.getProjectionAll();
            StringBuilder sb = new StringBuilder();
            sb.append("%s = ? AND %s != ? AND ");
            sb.append(IS_VALID_GROUP);
            Cursor query = contentResolver.query(peopleFaceLimitUri, projectionAll, String.format(sb.toString(), new Object[]{"peopleName", "_id"}), new String[]{str, Long.toString(j)}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        PeopleFace peopleFace = new PeopleFace(query);
                        if (query != null) {
                            query.close();
                        }
                        return peopleFace;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x004a  */
    public static PeopleFace getGroupByServerId(Context context, String str) {
        Cursor cursor = null;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            Uri peopleFaceLimitUri = getPeopleFaceLimitUri(1);
            String[] projectionAll = CloudUtils.getProjectionAll();
            StringBuilder sb = new StringBuilder();
            sb.append("serverId = ? AND ");
            sb.append(IS_VALID_GROUP);
            Cursor query = contentResolver.query(peopleFaceLimitUri, projectionAll, sb.toString(), new String[]{str}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        PeopleFace peopleFace = new PeopleFace(query);
                        if (query != null) {
                            query.close();
                        }
                        return peopleFace;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r0v4 */
    /* JADX WARNING: type inference failed for: r0v6 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x004e  */
    /* JADX WARNING: Unknown variable types count: 1 */
    public static PeopleFace getItem(String str) {
        ? r0;
        PeopleFace peopleFace = 0;
        try {
            String[] strArr = PROJECTION_BASIC_PEOPLE_INFO;
            StringBuilder sb = new StringBuilder();
            sb.append("serverId = '");
            sb.append(str);
            sb.append("'");
            Cursor queryFaceTableToCursor = queryFaceTableToCursor(strArr, sb.toString(), null, null);
            if (queryFaceTableToCursor != 0) {
                try {
                    if (queryFaceTableToCursor.moveToNext()) {
                        PeopleFace peopleFace2 = new PeopleFace(queryFaceTableToCursor.getString(0), queryFaceTableToCursor.getString(1), queryFaceTableToCursor.getString(2), queryFaceTableToCursor.getLong(3));
                        peopleFace = peopleFace2;
                    }
                } catch (Throwable th) {
                    Throwable th2 = th;
                    r0 = queryFaceTableToCursor;
                    th = th2;
                    if (r0 != 0) {
                        r0.close();
                    }
                    throw th;
                }
            }
            if (queryFaceTableToCursor != 0) {
                queryFaceTableToCursor.close();
            }
            return peopleFace;
        } catch (Throwable th3) {
            th = th3;
            r0 = peopleFace;
            if (r0 != 0) {
            }
            throw th;
        }
    }

    public static Uri getPeopleFaceLimitUri(int i) {
        return UriUtil.appendLimit(PEOPLE_FACE_URI, i);
    }

    public static String getPeopleFaceSelection(String str, String str2, boolean z) {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("localFlag");
        stringBuffer.append("!=");
        stringBuffer.append(String.valueOf(2));
        stringBuffer.append(" AND ");
        stringBuffer.append("serverStatus");
        stringBuffer.append(" = '");
        stringBuffer.append(String.valueOf("normal"));
        stringBuffer.append("' AND (");
        stringBuffer.append("serverId");
        stringBuffer.append(" IN (");
        stringBuffer.append(str);
        stringBuffer.append(") OR ");
        stringBuffer.append("_id");
        stringBuffer.append(" IN (");
        stringBuffer.append(str2);
        stringBuffer.append(" )) AND ");
        stringBuffer.append(z ? itemIsGroup : itemIsNotGroup);
        return stringBuffer.toString();
    }

    public static String getVisiblePeopleFaceSelection(String str, String str2, boolean z) {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(getPeopleFaceSelection(str, str2, z));
        stringBuffer.append(" AND (");
        stringBuffer.append("visibilityType");
        stringBuffer.append(" IS NULL OR ");
        stringBuffer.append("visibilityType");
        stringBuffer.append("!=");
        stringBuffer.append(String.valueOf(2));
        stringBuffer.append(" )");
        return stringBuffer.toString();
    }

    public static boolean ifHaveBabyType(Context context) {
        return ((Boolean) SafeDBUtil.safeQuery(context, getPeopleFaceLimitUri(1), CloudUtils.getProjectionAll(), "not(peopleType is null ) ", (String[]) null, (String) null, (SafeDBUtil.QueryHandler<T>) new SafeDBUtil.QueryHandler<Boolean>() {
            public Boolean handle(Cursor cursor) {
                return (cursor == null || cursor.getCount() <= 0) ? Boolean.valueOf(false) : Boolean.valueOf(true);
            }
        })).booleanValue();
    }

    public static long insertOneGroupWithName2DB(String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("localFlag", Integer.valueOf(8));
        contentValues.put("peopleName", str);
        if (!TextUtils.isEmpty(str2)) {
            contentValues.put("peopleContactJsonInfo", str2);
        }
        contentValues.put(nexExportFormat.TAG_FORMAT_TYPE, "PEOPLE");
        contentValues.put("visibilityType", Integer.valueOf(1));
        return Long.parseLong(safeInsertFace(contentValues).getLastPathSegment());
    }

    /* access modifiers changed from: private */
    public static boolean isFaceInGroup(PeopleFace peopleFace, Cursor cursor) {
        return (!TextUtils.isEmpty(peopleFace.groupId) && peopleFace.groupId.equalsIgnoreCase(cursor.getString(1))) || (!TextUtils.isEmpty(peopleFace.localGroupId) && peopleFace.localGroupId.equalsIgnoreCase(cursor.getString(0)));
    }

    /* access modifiers changed from: private */
    public static boolean isPeopleMerged(Cursor cursor) {
        String string = cursor.getString(0);
        String string2 = cursor.getString(1);
        String string3 = cursor.getString(4);
        String string4 = cursor.getString(3);
        return (!TextUtils.isEmpty(string3) && !TextUtils.equals(string, string3)) || (!TextUtils.isEmpty(string4) && !TextUtils.equals(string2, string4));
    }

    public static void moveChildrenToAnotherGroup(String str, String str2, String str3, String str4) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("groupId", str4);
        contentValues.put("localGroupId", str3);
        safeUpdateFace(contentValues, String.format(Locale.US, " ( %s in (%s) or %s in (%s) ) and %s != %d", new Object[]{"groupId", str2, "localGroupId", str, "localFlag", Integer.valueOf(2)}), null);
    }

    public static Cursor queryFaceTableToCursor(String[] strArr, String str, String[] strArr2, String str2) {
        try {
            return GalleryDBHelper.getInstance().query("peopleFace", strArr, str, strArr2, null, null, str2, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Cursor queryPeopleRecommondTableToCursor(String[] strArr, String str, String[] strArr2, String str2) {
        try {
            return GalleryDBHelper.getInstance().query("peopleRecommend", strArr, str, strArr2, null, null, str2, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void safeIgnorePeopleByIds(ArrayList<Long> arrayList) {
        synchronized (PEOPLE_FACE_URI) {
            ArrayList arrayList2 = new ArrayList();
            ContentValues contentValues = new ContentValues();
            contentValues.put("visibilityType", Integer.valueOf(2));
            String format = String.format("%s in ( %s", new Object[]{"_id", GalleryUtils.concatAll(arrayList, ",")});
            StringBuilder sb = new StringBuilder();
            sb.append(format);
            sb.append(") AND ");
            sb.append("localFlag");
            sb.append(" = ");
            sb.append(8);
            arrayList2.add(ContentProviderOperation.newUpdate(PEOPLE_FACE_URI).withValues(contentValues).withSelection(sb.toString(), null).build());
            contentValues.put("localFlag", Integer.valueOf(13));
            StringBuilder sb2 = new StringBuilder();
            sb2.append(format);
            sb2.append(") AND ");
            sb2.append("localFlag");
            sb2.append(" != ");
            sb2.append(8);
            arrayList2.add(ContentProviderOperation.newUpdate(PEOPLE_FACE_URI).withValues(contentValues).withSelection(sb2.toString(), null).build());
            try {
                GalleryApp.sGetAndroidContext().getContentResolver().applyBatch("com.miui.gallery.cloud.provider", arrayList2);
            } catch (RemoteException e) {
                e.printStackTrace();
            } catch (OperationApplicationException e2) {
                e2.printStackTrace();
            }
        }
    }

    public static Uri safeInsertFace(ContentValues contentValues) {
        return safeInsertFace(contentValues, false);
    }

    public static Uri safeInsertFace(ContentValues contentValues, boolean z) {
        Uri uri;
        if (z) {
            try {
                uri = PEOPLE_FACE_DELAY_NOTIFY_URI;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else {
            uri = PEOPLE_FACE_URI;
        }
        return GalleryUtils.safeInsert(uri, contentValues);
    }

    public static Uri safeInsertFace2Image(ContentValues contentValues) {
        try {
            return GalleryUtils.safeInsert(FACE_TO_IMAGES_URI, contentValues);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Uri safeInsertPeopleRecommend(ContentValues contentValues) {
        try {
            return GalleryUtils.safeInsert(PEOPLE_RECOMMOND_URI, contentValues);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Cursor safeQueryFace2ImageByServerId(String str) {
        try {
            return GalleryDBHelper.getInstance().query("faceToImages", CloudUtils.getProjectionAll(), "imageServerId = ? ", new String[]{str}, null, null, null, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Cursor safeQueryPeopleRecommend(String[] strArr, String str, String[] strArr2) {
        try {
            return GalleryDBHelper.getInstance().query("peopleRecommend", strArr, str, strArr2, null, null, null, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static long safeUpdateFace(ContentValues contentValues, String str, String[] strArr) {
        return safeUpdateFace(contentValues, str, strArr, false);
    }

    public static long safeUpdateFace(ContentValues contentValues, String str, String[] strArr, boolean z) {
        Uri uri;
        if (z) {
            try {
                uri = PEOPLE_FACE_DELAY_NOTIFY_URI;
            } catch (Exception e) {
                e.printStackTrace();
                return -1;
            }
        } else {
            uri = PEOPLE_FACE_URI;
        }
        return (long) GalleryUtils.safeUpdate(uri, contentValues, str, strArr);
    }

    public static long safeUpdatePeopleRecommend(ContentValues contentValues, String str, String[] strArr) {
        try {
            return (long) GalleryUtils.safeUpdate(PEOPLE_RECOMMOND_URI, contentValues, str, strArr);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}

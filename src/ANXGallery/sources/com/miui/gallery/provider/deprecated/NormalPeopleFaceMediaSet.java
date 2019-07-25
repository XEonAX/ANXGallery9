package com.miui.gallery.provider.deprecated;

import android.app.Activity;
import android.content.ContentProviderOperation;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CreateGroupItem;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.cloud.peopleface.PeopleFace;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.model.PeopleContactInfo.Relation;
import com.miui.gallery.model.SendToCloudFolderItem;
import com.miui.gallery.preference.GalleryPreferences.Face;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceFolderItem;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceNewFolerItem;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.ConcatConverter;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.baby.CopyFaceAlbumItemsToBabyAlbumTask;
import com.miui.gallery.util.face.PeopleCursorHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class NormalPeopleFaceMediaSet implements Parcelable {
    public static final Creator<NormalPeopleFaceMediaSet> CREATOR = new Creator<NormalPeopleFaceMediaSet>() {
        public NormalPeopleFaceMediaSet createFromParcel(Parcel parcel) {
            return new NormalPeopleFaceMediaSet(parcel);
        }

        public NormalPeopleFaceMediaSet[] newArray(int i) {
            return new NormalPeopleFaceMediaSet[i];
        }
    };
    protected long mId;
    private String mName;
    protected String mServerId;

    public NormalPeopleFaceMediaSet(long j, String str, String str2) {
        this.mId = j;
        this.mServerId = str;
        this.mName = str2;
    }

    public NormalPeopleFaceMediaSet(Parcel parcel) {
        this.mId = parcel.readLong();
        this.mServerId = parcel.readString();
        this.mName = parcel.readString();
    }

    private static void closeCursor(Cursor cursor) {
        MiscUtil.closeSilently(cursor);
    }

    private void deleteLocalGroups(String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("localFlag", Integer.valueOf(2));
        FaceDataManager.safeUpdateFace(contentValues, "_id = ? ", new String[]{str});
    }

    public static void doMoveFacesToAnother(FaceFolderItem faceFolderItem, long[] jArr) {
        long j;
        if (faceFolderItem instanceof FaceNewFolerItem) {
            initialFaceNewFolerItem(faceFolderItem);
        }
        if (faceFolderItem == null) {
            ignoreFaces(jArr);
        } else {
            try {
                j = Long.parseLong(faceFolderItem.getId());
            } catch (NumberFormatException unused) {
                j = -1;
            }
            if (j != -1) {
                move2AnohterAlbum(jArr, j);
            }
        }
    }

    private static boolean doMoveToRelation(long[] jArr, String str, String str2) {
        ArrayList arrayList = new ArrayList();
        for (long j : jArr) {
            PeopleContactInfo queryContactInfoOfOnePerson = FaceManager.queryContactInfoOfOnePerson(j);
            if (queryContactInfoOfOnePerson == null) {
                queryContactInfoOfOnePerson = new PeopleContactInfo();
            } else if (PeopleContactInfo.getRelationValue(Relation.myself).equals(queryContactInfoOfOnePerson.relationWithMe)) {
                HashMap hashMap = new HashMap(1);
                hashMap.put("MoveToRelation", str);
                hashMap.put("MoveToRelationText", str2);
                GalleryStatHelper.recordCountEvent("people_mark", "move_people_from_myself", hashMap);
            }
            queryContactInfoOfOnePerson.relationWithMe = str;
            queryContactInfoOfOnePerson.relationWithMeText = str2;
            ContentValues contentValues = new ContentValues();
            String formatContactJson = queryContactInfoOfOnePerson.formatContactJson();
            if (!TextUtils.isEmpty(formatContactJson)) {
                contentValues.put("peopleContactJsonInfo", formatContactJson);
            }
            int relationType = PeopleContactInfo.getRelationType(queryContactInfoOfOnePerson.relationWithMe);
            if (PeopleContactInfo.isUserDefineRelation(relationType)) {
                contentValues.put("relationText", str2);
            }
            contentValues.put("relationType", Integer.valueOf(relationType));
            contentValues.put("localFlag", Integer.valueOf(10));
            arrayList.add(ContentProviderOperation.newUpdate(FaceDataManager.PEOPLE_FACE_URI).withValues(contentValues).withSelection("_id = ? ", new String[]{String.valueOf(j)}).build());
        }
        if (!arrayList.isEmpty()) {
            try {
                GalleryApp.sGetAndroidContext().getContentResolver().applyBatch("com.miui.gallery.cloud.provider", arrayList);
            } catch (RemoteException e) {
                e.printStackTrace();
            } catch (OperationApplicationException e2) {
                e2.printStackTrace();
            }
        }
        HashMap hashMap2 = new HashMap();
        hashMap2.put("relation", str);
        GallerySamplingStatHelper.recordCountEvent("people", "people_set_relation", hashMap2);
        return true;
    }

    private static String formatSelectionIn(long[] jArr) {
        StringBuffer stringBuffer = new StringBuffer();
        int length = jArr.length;
        for (int i = 0; i < length; i++) {
            stringBuffer.append(jArr[i]);
            if (i < length - 1) {
                stringBuffer.append(',');
            }
        }
        return stringBuffer.toString();
    }

    public static ArrayList<PeopleFace> getBrothers(String str) {
        long currentTimeMillis = System.currentTimeMillis();
        StringBuffer stringBuffer = new StringBuffer();
        Cursor safeQueryFace2ImageByServerId = FaceDataManager.safeQueryFace2ImageByServerId(str);
        if (safeQueryFace2ImageByServerId == null || safeQueryFace2ImageByServerId.getCount() == 0) {
            closeCursor(safeQueryFace2ImageByServerId);
            return null;
        }
        while (safeQueryFace2ImageByServerId.moveToNext()) {
            FaceDataManager.appendId(stringBuffer, safeQueryFace2ImageByServerId.getString(1));
        }
        closeCursor(safeQueryFace2ImageByServerId);
        ArrayList<PeopleFace> arrayList = new ArrayList<>();
        Cursor faceInFaceIds = FaceDataManager.getFaceInFaceIds(stringBuffer.toString(), "");
        if (faceInFaceIds == null || faceInFaceIds.getCount() <= 0) {
            closeCursor(faceInFaceIds);
        } else {
            ArrayList arrayList2 = new ArrayList();
            while (faceInFaceIds.moveToNext()) {
                arrayList2.add(new PeopleFace(faceInFaceIds));
            }
            closeCursor(faceInFaceIds);
            arrayList = FaceDataManager.fillInPeopleInfo(new LinkedList(arrayList2));
        }
        StringBuilder sb = new StringBuilder();
        sb.append("get brothers cost:");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        Log.i("PeopleFaceMediaSet", sb.toString());
        return arrayList;
    }

    public static void ignoreFaces(long[] jArr) {
        String formatSelectionIn = formatSelectionIn(jArr);
        if (!TextUtils.isEmpty(formatSelectionIn)) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("localFlag", Integer.valueOf(2));
            FaceDataManager.safeUpdateFace(contentValues, String.format(Locale.US, "%s IN (%s)", new Object[]{"_id", formatSelectionIn}), null);
        }
    }

    private static void initialFaceNewFolerItem(Object obj) {
        FaceNewFolerItem faceNewFolerItem = (FaceNewFolerItem) obj;
        if (!faceNewFolerItem.isCreatedInDb()) {
            PeopleFace groupByPeopleName = FaceDataManager.getGroupByPeopleName(GalleryApp.sGetAndroidContext(), faceNewFolerItem.getName());
            if (groupByPeopleName != null) {
                ContentValues contentValues = new ContentValues();
                String[] strArr = {groupByPeopleName._id};
                contentValues.put("visibilityType", Integer.valueOf(1));
                FaceDataManager.safeUpdateFace(contentValues, "_id = ? ", strArr);
                faceNewFolerItem.setId(groupByPeopleName._id);
            } else {
                faceNewFolerItem.setId(String.valueOf(FaceDataManager.insertOneGroupWithName2DB(faceNewFolerItem.getName(), faceNewFolerItem.getContactjson())));
            }
            faceNewFolerItem.setCreatedInDb();
        }
    }

    public static void merge(Context context, ArrayList<NormalPeopleFaceMediaSet> arrayList, String str) {
        NormalPeopleFaceMediaSet normalPeopleFaceMediaSet;
        if (!arrayList.isEmpty() && !TextUtils.isEmpty(str)) {
            synchronized (FaceDataManager.PEOPLE_FACE_URI) {
                if (arrayList.size() != 1) {
                    PeopleFace groupByPeopleName = FaceDataManager.getGroupByPeopleName(context, str);
                    if (groupByPeopleName == null || TextUtils.isEmpty(groupByPeopleName.serverId)) {
                        Iterator it = arrayList.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            normalPeopleFaceMediaSet = (NormalPeopleFaceMediaSet) it.next();
                            if (!TextUtils.isEmpty(normalPeopleFaceMediaSet.getServerId())) {
                                normalPeopleFaceMediaSet.rename(context, str, (PeopleContactInfo) null);
                                break;
                            }
                        }
                    }
                    normalPeopleFaceMediaSet = null;
                    if (normalPeopleFaceMediaSet == null) {
                        if (groupByPeopleName != null) {
                            normalPeopleFaceMediaSet = new NormalPeopleFaceMediaSet(Long.parseLong(groupByPeopleName._id), groupByPeopleName.serverId, str);
                        } else {
                            normalPeopleFaceMediaSet = (NormalPeopleFaceMediaSet) arrayList.get(0);
                            normalPeopleFaceMediaSet.rename(context, str, (PeopleContactInfo) null);
                        }
                    }
                    arrayList.remove(normalPeopleFaceMediaSet);
                    normalPeopleFaceMediaSet.mergeToThis(arrayList);
                } else if (!str.equalsIgnoreCase(((NormalPeopleFaceMediaSet) arrayList.get(0)).getName())) {
                    ((NormalPeopleFaceMediaSet) arrayList.get(0)).rename(context, str, (PeopleContactInfo) null);
                }
            }
        }
    }

    private long mergeGroupA2GroupB(PeopleFace peopleFace, PeopleFace peopleFace2) {
        String str;
        String str2 = peopleFace._id;
        if (TextUtils.isEmpty(peopleFace.serverId)) {
            str = "";
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("'");
            sb.append(peopleFace.serverId);
            sb.append("'");
            str = sb.toString();
        }
        return mergeGroups(str2, str, peopleFace2._id, peopleFace2.serverId);
    }

    private long mergeGroups(String str, String str2, String str3, String str4) {
        long j;
        ContentValues contentValues = new ContentValues();
        if (TextUtils.isEmpty(str2)) {
            contentValues.put("localFlag", Integer.valueOf(2));
            j = FaceDataManager.safeUpdateFace(contentValues, String.format(Locale.US, "%s in (%s)", new Object[]{"_id", str}), null);
        } else {
            contentValues.put("localFlag", Integer.valueOf(12));
            contentValues.put("localGroupId", str3);
            contentValues.put("groupId", str4);
            j = FaceDataManager.safeUpdateFace(contentValues, String.format(Locale.US, "%s in (%s) and %s != %s and %s != %d", new Object[]{"_id", str, "_id", str3, "localFlag", Integer.valueOf(2)}), null);
        }
        FaceDataManager.moveChildrenToAnotherGroup(str, str2, str3, str4);
        return j;
    }

    private void mergeToThis(ArrayList<NormalPeopleFaceMediaSet> arrayList) {
        String concatAll = GalleryUtils.concatAll(arrayList, ",", new ConcatConverter<NormalPeopleFaceMediaSet>() {
            public String convertToString(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
                String serverId = normalPeopleFaceMediaSet.getServerId();
                if (TextUtils.isEmpty(serverId) || TextUtils.equals(serverId, NormalPeopleFaceMediaSet.this.getServerId())) {
                    return "";
                }
                StringBuilder sb = new StringBuilder();
                sb.append("'");
                sb.append(normalPeopleFaceMediaSet.getBucketId());
                sb.append("'");
                return sb.toString();
            }
        });
        String concatAll2 = GalleryUtils.concatAll(arrayList, ",", new ConcatConverter<NormalPeopleFaceMediaSet>() {
            public String convertToString(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
                return TextUtils.isEmpty(normalPeopleFaceMediaSet.getServerId()) ? String.valueOf(normalPeopleFaceMediaSet.getBucketId()) : "";
            }
        });
        long mergeGroups = mergeGroups(concatAll, GalleryUtils.concatAll(arrayList, ",", new ConcatConverter<NormalPeopleFaceMediaSet>() {
            public String convertToString(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
                String serverId = normalPeopleFaceMediaSet.getServerId();
                if (TextUtils.isEmpty(serverId) || TextUtils.equals(serverId, NormalPeopleFaceMediaSet.this.getServerId())) {
                    return "";
                }
                StringBuilder sb = new StringBuilder();
                sb.append("'");
                sb.append(serverId);
                sb.append("'");
                return sb.toString();
            }
        }), String.valueOf(getBucketId()), getServerId());
        long mergeGroups2 = mergeGroups(concatAll2, "", String.valueOf(getBucketId()), getServerId());
        StringBuilder sb = new StringBuilder();
        sb.append("merge result: rowsAffectedSynced=");
        sb.append(mergeGroups);
        sb.append(", rowsAffectedNotSynced=");
        sb.append(mergeGroups2);
        Log.i("PeopleFaceMediaSet", sb.toString());
    }

    public static void move2AnohterAlbum(long[] jArr, long j) {
        String formatSelectionIn = formatSelectionIn(jArr);
        if (!TextUtils.isEmpty(formatSelectionIn)) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("localFlag", Integer.valueOf(5));
            contentValues.put("groupId", "");
            contentValues.put("localGroupId", Long.valueOf(j));
            FaceDataManager.safeUpdateFace(contentValues, String.format(Locale.US, "%s IN (%s)", new Object[]{"_id", formatSelectionIn}), null);
        }
    }

    private void moveFaceFromLocalA2B(String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("localFlag", Integer.valueOf(5));
        contentValues.put("localGroupId", str2);
        FaceDataManager.safeUpdateFace(contentValues, "localGroupId = ? and localFlag != ? ", new String[]{str, String.valueOf(2)});
    }

    /* JADX WARNING: type inference failed for: r3v0 */
    /* JADX WARNING: type inference failed for: r11v2, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r11v3, types: [java.lang.CharSequence] */
    /* JADX WARNING: type inference failed for: r11v4, types: [java.lang.Object] */
    /* JADX WARNING: type inference failed for: r11v7, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r11v8 */
    /* JADX WARNING: type inference failed for: r3v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r11v9 */
    /* JADX WARNING: type inference failed for: r11v10 */
    /* JADX WARNING: type inference failed for: r11v11, types: [java.io.Closeable, android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r11v12 */
    /* JADX WARNING: type inference failed for: r3v3 */
    /* JADX WARNING: type inference failed for: r11v13 */
    /* JADX WARNING: type inference failed for: r3v4 */
    /* JADX WARNING: type inference failed for: r3v5 */
    /* JADX WARNING: type inference failed for: r4v8, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v15 */
    /* JADX WARNING: type inference failed for: r11v14 */
    /* JADX WARNING: type inference failed for: r11v15 */
    /* JADX WARNING: type inference failed for: r11v16 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r11v8
  assigns: []
  uses: []
  mth insns count: 83
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ad A[Catch:{ Exception -> 0x00c7 }] */
    /* JADX WARNING: Unknown variable types count: 7 */
    public static boolean moveFaceToMyselfGroup(Context context, long j) {
        ? r11;
        ? r112;
        ? r113;
        ? r3;
        List queryPeopleIdOfRelation = FaceManager.queryPeopleIdOfRelation(context, Relation.myself.getRelationType());
        boolean z = false;
        if (queryPeopleIdOfRelation == null || !queryPeopleIdOfRelation.contains(Long.valueOf(j))) {
            String relationValue = PeopleContactInfo.getRelationValue(Relation.myself);
            doMoveToRelation(new long[]{j}, relationValue, relationValue);
        } else {
            queryPeopleIdOfRelation.remove(Long.valueOf(j));
        }
        if (queryPeopleIdOfRelation != null && !queryPeopleIdOfRelation.isEmpty()) {
            String relationValue2 = PeopleContactInfo.getRelationValue(Relation.unknown);
            doMoveToRelation(MiscUtil.listToArray(queryPeopleIdOfRelation), relationValue2, relationValue2);
        }
        try {
            String defaultNameForMyself = PeopleContactInfo.getDefaultNameForMyself(context);
            ? r32 = 0;
            try {
                ? query = context.getContentResolver().query(GalleryContract.PeopleFace.PERSONS_URI, PeopleCursorHelper.PROJECTION, null, null, null);
                if (query != 0) {
                    try {
                        if (query.moveToFirst()) {
                            do {
                                if (Long.valueOf(PeopleCursorHelper.getPeopleLocalId(query)).longValue() == j) {
                                    r32 = PeopleCursorHelper.getPeopleName(query);
                                } else if (defaultNameForMyself.equalsIgnoreCase(PeopleCursorHelper.getPeopleName(query))) {
                                    z = true;
                                }
                            } while (query.moveToNext());
                        }
                    } catch (Exception unused) {
                        r3 = query;
                        r113 = 0;
                        try {
                            Log.e("PeopleFaceMediaSet", "Failed to get people when moving face to myself group");
                            MiscUtil.closeSilently(r3);
                            r112 = r113;
                            HashMap hashMap = new HashMap(2);
                            String str = "PeopleOriginName";
                            if (TextUtils.isEmpty(r112)) {
                            }
                            hashMap.put(str, r112);
                            hashMap.put("MarkOtherPeopleWhenExistMe", String.valueOf(z));
                            GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_people_to_myself", hashMap);
                            return true;
                        } catch (Throwable th) {
                            th = th;
                            r11 = r3;
                            MiscUtil.closeSilently(r11);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        r11 = query;
                        MiscUtil.closeSilently(r11);
                        throw th;
                    }
                }
                MiscUtil.closeSilently(query);
                r112 = r32;
            } catch (Exception unused2) {
                r113 = 0;
                r3 = r32;
                Log.e("PeopleFaceMediaSet", "Failed to get people when moving face to myself group");
                MiscUtil.closeSilently(r3);
                r112 = r113;
                HashMap hashMap2 = new HashMap(2);
                String str2 = "PeopleOriginName";
                if (TextUtils.isEmpty(r112)) {
                }
                hashMap2.put(str2, r112);
                hashMap2.put("MarkOtherPeopleWhenExistMe", String.valueOf(z));
                GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_people_to_myself", hashMap2);
                return true;
            }
            HashMap hashMap22 = new HashMap(2);
            String str22 = "PeopleOriginName";
            if (TextUtils.isEmpty(r112)) {
                r112 = "NoName";
            }
            hashMap22.put(str22, r112);
            hashMap22.put("MarkOtherPeopleWhenExistMe", String.valueOf(z));
            GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_people_to_myself", hashMap22);
        } catch (Exception unused3) {
            Log.e("PeopleFaceMediaSet", "Error occurred when log event");
        }
        return true;
    }

    public static boolean moveFaceToRelationGroup(long[] jArr, String str, String str2) {
        if (PeopleContactInfo.getRelationType(str) != Relation.myself.getRelationType()) {
            return doMoveToRelation(jArr, str, str2);
        }
        if (jArr.length <= 1) {
            return moveFaceToMyselfGroup(GalleryApp.sGetAndroidContext(), jArr[0]);
        }
        Log.e("PeopleFaceMediaSet", "Moving more than one person to 'myself' is not allowed!");
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0041, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x009e, code lost:
        if (-1 == r10) goto L_0x00a3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00a0, code lost:
        setName(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00a3, code lost:
        return true;
     */
    private boolean rename(Context context, String str, boolean z, PeopleContactInfo peopleContactInfo) {
        PeopleFace peopleFace;
        long j;
        synchronized (FaceDataManager.PEOPLE_FACE_URI) {
            PeopleFace groupByPeopleName = FaceDataManager.getGroupByPeopleName(context, str, getBucketId());
            if (!TextUtils.isEmpty(getServerId())) {
                peopleFace = FaceDataManager.getGroupByServerId(context, getServerId());
            } else {
                peopleFace = FaceDataManager.getGroupByPeopleName(context, getName(), groupByPeopleName != null ? Long.parseLong(groupByPeopleName._id) : -1);
            }
            boolean z2 = false;
            if (groupByPeopleName == null) {
                if (-1 != renameOldGroup(peopleFace, str, peopleContactInfo)) {
                    setName(str);
                }
            } else if (TextUtils.isEmpty(peopleFace.serverId)) {
                moveFaceFromLocalA2B(peopleFace._id, groupByPeopleName._id);
                deleteLocalGroups(peopleFace._id);
                j = -1;
            } else if (TextUtils.isEmpty(groupByPeopleName.serverId)) {
                moveFaceFromLocalA2B(groupByPeopleName._id, peopleFace._id);
                deleteLocalGroups(groupByPeopleName._id);
                j = renameOldGroup(peopleFace, str);
            } else {
                if (Face.isFaceRecommendGroupHidden(peopleFace.serverId) && Face.isFaceRecommendGroupHidden(groupByPeopleName.serverId)) {
                    z2 = true;
                }
                if (z) {
                    j = mergeGroupA2GroupB(groupByPeopleName, peopleFace);
                    Face.setFaceRecommendGroupHidden(peopleFace.serverId, z2);
                    renameOldGroup(peopleFace, str);
                } else {
                    j = mergeGroupA2GroupB(peopleFace, groupByPeopleName);
                    Face.setFaceRecommendGroupHidden(groupByPeopleName.serverId, z2);
                }
            }
        }
    }

    private long renameOldGroup(PeopleFace peopleFace, String str) {
        return renameOldGroup(peopleFace, str, null);
    }

    private long renameOldGroup(PeopleFace peopleFace, String str, PeopleContactInfo peopleContactInfo) {
        ContentValues contentValues = new ContentValues();
        if (peopleFace == null) {
            return -1;
        }
        contentValues.put("peopleName", str);
        if (peopleContactInfo != null) {
            String formatContactJson = peopleContactInfo.formatContactJson();
            if (!TextUtils.isEmpty(formatContactJson)) {
                contentValues.put("peopleContactJsonInfo", formatContactJson);
            }
            if (!TextUtils.isEmpty(peopleContactInfo.relationWithMe)) {
                int relationType = PeopleContactInfo.getRelationType(peopleContactInfo.relationWithMe);
                if (relationType >= 0) {
                    contentValues.put("relationType", Integer.valueOf(relationType));
                }
                if (PeopleContactInfo.isUserDefineRelation(relationType)) {
                    contentValues.put("relationText", peopleContactInfo.relationWithMeText);
                }
            }
        }
        if (peopleFace.localFlag == 0) {
            contentValues.put("localFlag", Integer.valueOf(10));
        }
        return FaceDataManager.safeUpdateFace(contentValues, "_id = ? ", new String[]{peopleFace._id});
    }

    private void setName(String str) {
        this.mName = str;
    }

    public String createBabyAlbumAndAddItems(String str, BabyInfo babyInfo, Activity activity) {
        if (CloudUtils.getGroupByFileName(activity, str) != null) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(activity.getString(R.string.baby_suffix));
            str = sb.toString();
            ToastUtils.makeTextLong((Context) activity, (CharSequence) activity.getString(R.string.same_name_album_exist_and_toast, new Object[]{str}));
        }
        String str2 = str;
        String localCreateBabyGroup = CreateGroupItem.localCreateBabyGroup(GalleryApp.sGetAndroidContext(), str2);
        SendToCloudFolderItem sendToCloudFolderItem = new SendToCloudFolderItem(0, localCreateBabyGroup, false, str2, babyInfo);
        CopyFaceAlbumItemsToBabyAlbumTask.instance(activity, getAllImagesData(), sendToCloudFolderItem, 0, R.string.creating_baby_album).execute(new Void[0]);
        return localCreateBabyGroup;
    }

    public int describeContents() {
        return 0;
    }

    public Cursor getAllImagesData() {
        return FaceManager.queryAllImagesOfOnePerson(getServerId());
    }

    public long getBucketId() {
        return this.mId;
    }

    public String getName() {
        return this.mName;
    }

    public String getServerId() {
        return this.mServerId;
    }

    public boolean hasName() {
        return !TextUtils.isEmpty(this.mName);
    }

    public void mergeAnAlbumToThis(String str) {
        if (!TextUtils.equals(str, getServerId())) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("localFlag", Integer.valueOf(12));
            contentValues.put("groupId", getServerId());
            FaceDataManager.safeUpdateFace(contentValues, "serverId = ? and localFlag != ? ", new String[]{str, String.valueOf(2)});
            FaceDataManager.changeChildrenOfPeopleA2PeopleB(str, getServerId());
        }
    }

    public boolean rename(Context context, String str, PeopleContactInfo peopleContactInfo) {
        return rename(context, str, false, peopleContactInfo);
    }

    public boolean rename(Context context, String str, boolean z) {
        return rename(context, str, z, null);
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mId);
        parcel.writeString(this.mServerId);
        parcel.writeString(this.mName);
    }
}

package com.miui.gallery.provider.deprecated;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.util.face.FeedbackIgnoredPeople2Server;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class PeopleRecommendMediaSet {
    private static Object sLock = new Object();
    private HashMap<String, String> mGroupIdOfFaceMap = new HashMap<>();
    private HashMap<String, Boolean> mPeopleRecommondHistoryMap = new HashMap<>();
    private NormalPeopleFaceMediaSet mRecommendSourcePeople;

    public PeopleRecommendMediaSet(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
        this.mRecommendSourcePeople = normalPeopleFaceMediaSet;
    }

    public static void addSelectItemsToRecommendedMediaSet(ArrayList<String> arrayList, NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
        PeopleRecommendMediaSet peopleRecommendMediaSet = new PeopleRecommendMediaSet(normalPeopleFaceMediaSet);
        peopleRecommendMediaSet.refreshRecommendInfo();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            normalPeopleFaceMediaSet.mergeAnAlbumToThis((String) peopleRecommendMediaSet.mGroupIdOfFaceMap.get((String) it.next()));
        }
    }

    public static void feedbackIgnoredPeople2Server(ArrayList<String> arrayList, NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
        PeopleRecommendMediaSet peopleRecommendMediaSet = new PeopleRecommendMediaSet(normalPeopleFaceMediaSet);
        peopleRecommendMediaSet.refreshRecommendInfo();
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(peopleRecommendMediaSet.mGroupIdOfFaceMap.get((String) it.next()));
        }
        FeedbackIgnoredPeople2Server.startFeedbackIgnoredPeople2Server(normalPeopleFaceMediaSet.getServerId(), arrayList2);
    }

    private void fillMapGroupIdOfFace(String str) {
        try {
            JSONArray jSONArray = new JSONObject(str).getJSONObject("data").getJSONArray("recommendPeoples");
            if (jSONArray != null) {
                ArrayList queryAllPeopleAlbumServerIds = FaceManager.queryAllPeopleAlbumServerIds();
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject = jSONArray.getJSONObject(i).getJSONObject("coreFace");
                    Iterator keys = jSONObject.keys();
                    while (true) {
                        if (keys == null || !keys.hasNext()) {
                            break;
                        }
                        String str2 = (String) keys.next();
                        String string = jSONArray.getJSONObject(i).getString("peopleId");
                        if (jSONObject.getInt(str2) == 1 && queryAllPeopleAlbumServerIds.indexOf(string) != -1) {
                            this.mGroupIdOfFaceMap.put(str2, string);
                            break;
                        }
                    }
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void fillMapPeopleRecommondHistory(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                Iterator keys = jSONObject.keys();
                while (keys != null && keys.hasNext()) {
                    String str2 = (String) keys.next();
                    this.mPeopleRecommondHistoryMap.put(str2, Boolean.valueOf(jSONObject.getBoolean(str2)));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private ArrayList<String> getNeedRecommendPeopleFaceId() {
        ArrayList<String> arrayList = new ArrayList<>();
        for (String str : this.mGroupIdOfFaceMap.keySet()) {
            if (!this.mPeopleRecommondHistoryMap.containsKey(str)) {
                this.mPeopleRecommondHistoryMap.put(str, Boolean.valueOf(false));
                arrayList.add(str);
            } else if (!((Boolean) this.mPeopleRecommondHistoryMap.get(str)).booleanValue()) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    private static String hashMapToJson(HashMap hashMap) {
        String str = "{";
        for (Entry entry : hashMap.entrySet()) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("'");
            sb.append(entry.getKey());
            sb.append("':");
            String sb2 = sb.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append("'");
            sb3.append(entry.getValue());
            sb3.append("',");
            str = sb3.toString();
        }
        String substring = str.substring(0, str.lastIndexOf(","));
        StringBuilder sb4 = new StringBuilder();
        sb4.append(substring);
        sb4.append("}");
        return sb4.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x003a  */
    /* JADX WARNING: Removed duplicated region for block: B:22:? A[RETURN, SYNTHETIC] */
    private void queryTableOfPeopleRecommendInfo(String str) {
        Cursor cursor;
        Cursor cursor2 = null;
        try {
            cursor = FaceDataManager.queryPeopleRecommondTableToCursor(new String[]{" * "}, "peopleServerId = ? ", new String[]{str}, null);
            if (cursor != null) {
                try {
                    if (cursor.getCount() > 0) {
                        cursor.moveToNext();
                        fillMapGroupIdOfFace(cursor.getString(2));
                        fillMapPeopleRecommondHistory(cursor.getString(3));
                    }
                } catch (Exception unused) {
                    if (cursor == null) {
                    }
                    cursor.close();
                } catch (Throwable th) {
                    Throwable th2 = th;
                    cursor2 = cursor;
                    th = th2;
                    if (cursor2 != null) {
                    }
                    throw th;
                }
            }
            if (cursor == null) {
                return;
            }
        } catch (Exception unused2) {
            cursor = null;
            if (cursor == null) {
                return;
            }
            cursor.close();
        } catch (Throwable th3) {
            th = th3;
            if (cursor2 != null) {
                cursor2.close();
            }
            throw th;
        }
        cursor.close();
    }

    public static PeopleRecommendMediaSet refreshRecommendHistoryToTrue(ArrayList<String> arrayList, NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
        PeopleRecommendMediaSet peopleRecommendMediaSet = new PeopleRecommendMediaSet(normalPeopleFaceMediaSet);
        peopleRecommendMediaSet.refreshRecommendInfo();
        peopleRecommendMediaSet.refreshRecommendHistoryToTrue(arrayList);
        return peopleRecommendMediaSet;
    }

    private void saveHistoryToDB() {
        ContentValues contentValues = new ContentValues();
        contentValues.put("recommendHistoryJson", hashMapToJson(this.mPeopleRecommondHistoryMap));
        FaceDataManager.safeUpdatePeopleRecommend(contentValues, "peopleServerId = ?", new String[]{this.mRecommendSourcePeople.getServerId()});
    }

    public int getActualNeedRecommendPeopleFacePhotoNumber() {
        return FaceManager.queryCountOfPhotosOfOneRecommendAlbum(getServerIdsIn());
    }

    public String getServerIdsIn() {
        ArrayList needRecommendPeopleFaceId = getNeedRecommendPeopleFaceId();
        if (needRecommendPeopleFaceId.size() == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        Iterator it = needRecommendPeopleFaceId.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            if (sb.length() > 0) {
                sb.append(",");
            }
            sb.append("'");
            sb.append(str);
            sb.append("'");
        }
        return sb.toString();
    }

    public void refreshRecommendHistoryToTrue(ArrayList<String> arrayList) {
        synchronized (sLock) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                this.mPeopleRecommondHistoryMap.put((String) it.next(), Boolean.valueOf(true));
            }
            saveHistoryToDB();
        }
    }

    public void refreshRecommendInfo() {
        synchronized (sLock) {
            queryTableOfPeopleRecommendInfo(this.mRecommendSourcePeople.getServerId());
        }
    }
}

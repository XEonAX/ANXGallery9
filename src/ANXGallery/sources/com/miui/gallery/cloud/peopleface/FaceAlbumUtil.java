package com.miui.gallery.cloud.peopleface;

import android.content.ContentValues;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.model.PeopleContactInfo;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import org.json.JSONException;
import org.json.JSONObject;

public class FaceAlbumUtil {
    public static ContentValues getContentValuesForPeopleFace(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        ContentValues contentValues = new ContentValues();
        if (jSONObject.has("id")) {
            contentValues.put("serverId", jSONObject.getString("id"));
        }
        if (jSONObject.has("status")) {
            contentValues.put("serverStatus", jSONObject.getString("status"));
        }
        if (jSONObject.has(nexExportFormat.TAG_FORMAT_TYPE)) {
            contentValues.put(nexExportFormat.TAG_FORMAT_TYPE, jSONObject.getString(nexExportFormat.TAG_FORMAT_TYPE));
        }
        if (jSONObject.has("eTag")) {
            contentValues.put("eTag", jSONObject.getString("eTag"));
        }
        if (jSONObject.has("parentId")) {
            contentValues.put("groupId", jSONObject.getString("parentId"));
        }
        if (jSONObject.has("peopleContent")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("peopleContent");
            if (jSONObject2.getBoolean("isSetPeopleName")) {
                contentValues.put("peopleName", jSONObject2.getString("peopleName"));
                contentValues.put("visibilityType", Integer.valueOf(1));
            }
            if (jSONObject2.has("contact")) {
                String jSONObject3 = jSONObject2.getJSONObject("contact").toString();
                contentValues.put("peopleContactJsonInfo", jSONObject3);
                PeopleContactInfo fromJson = PeopleContactInfo.fromJson(jSONObject3);
                if (fromJson != null) {
                    contentValues.put("relationType", Integer.valueOf(PeopleContactInfo.getRelationType(fromJson.relationWithMe)));
                    if (fromJson.relationWithMeText != null) {
                        contentValues.put("relationText", fromJson.relationWithMeText);
                    }
                }
            }
            if (!jSONObject2.getBoolean("isVisible")) {
                contentValues.put("visibilityType", Integer.valueOf(2));
            }
            if (jSONObject2.has("peopleInfo")) {
                JSONObject jSONObject4 = jSONObject2.getJSONObject("peopleInfo");
                if (!jSONObject4.has("peopleType") || !BabyAlbumUtils.BABY_BABY.equalsIgnoreCase(jSONObject4.getString("peopleType"))) {
                    putPeopleTypeNoDefine(contentValues);
                } else if (!jSONObject4.has("gender")) {
                    contentValues.put("peopleType", Integer.valueOf(1));
                } else if (BabyAlbumUtils.BABY_MALE.equalsIgnoreCase(jSONObject4.getString("gender"))) {
                    contentValues.put("peopleType", Integer.valueOf(1));
                } else {
                    contentValues.put("peopleType", Integer.valueOf(2));
                }
            } else {
                putPeopleTypeNoDefine(contentValues);
            }
        }
        return contentValues;
    }

    public static String getPeopleName(JSONObject jSONObject) throws JSONException {
        if (jSONObject.has("peopleContent")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("peopleContent");
            if (jSONObject2.getBoolean("isSetPeopleName")) {
                return jSONObject2.getString("peopleName");
            }
        }
        return null;
    }

    private static void putPeopleTypeNoDefine(ContentValues contentValues) {
        contentValues.put("peopleType", Integer.valueOf(0));
    }
}

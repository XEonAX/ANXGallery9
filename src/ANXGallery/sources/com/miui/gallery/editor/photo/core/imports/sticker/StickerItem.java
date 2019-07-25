package com.miui.gallery.editor.photo.core.imports.sticker;

import com.miui.gallery.editor.photo.core.common.model.StickerData;
import com.miui.gallery.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

class StickerItem extends StickerData {
    String cateName;
    String content;
    long id;

    public StickerItem(short s, String str, long j, String str2, String str3, String str4) {
        super(s, str, str2);
        this.content = str3;
        this.id = j;
        this.cateName = str4;
    }

    static StickerItem fromJson(JSONObject jSONObject) throws JSONException {
        StickerItem stickerItem = new StickerItem((short) jSONObject.getInt("priority"), jSONObject.optString("name"), jSONObject.getLong("id"), jSONObject.getString("icon"), jSONObject.getString("content"), jSONObject.optString("cateName"));
        return stickerItem;
    }

    static JSONObject toJson(StickerItem stickerItem) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("priority", stickerItem.priority);
            jSONObject.put("name", stickerItem.name);
            jSONObject.put("id", stickerItem.id);
            jSONObject.put("icon", stickerItem.icon);
            jSONObject.put("content", stickerItem.content);
            jSONObject.put("cateName", stickerItem.cateName);
            return jSONObject;
        } catch (JSONException e) {
            Log.w("StickerItem", (Throwable) e);
            return null;
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StickerItem)) {
            return false;
        }
        if (((StickerItem) obj).id != this.id) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return (int) (this.id ^ (this.id >>> 32));
    }
}

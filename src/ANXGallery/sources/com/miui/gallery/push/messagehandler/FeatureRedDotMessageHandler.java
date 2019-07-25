package com.miui.gallery.push.messagehandler;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.preference.GalleryPreferences.FeatureRedDot;
import com.miui.gallery.push.GalleryPushMessage;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.Log;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import org.json.JSONObject;

public class FeatureRedDotMessageHandler extends MessageHandler {
    public void handleDirect(Context context, GalleryPushMessage galleryPushMessage) {
        if (context == null) {
            Log.d("FeatureRedDotMessageHandler", "context is null");
            return;
        }
        String data = galleryPushMessage.getData();
        if (data == null) {
            Log.e("FeatureRedDotMessageHandler", "message data is null");
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(galleryPushMessage.getData());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String optString = jSONObject.optString("start_time");
            String optString2 = jSONObject.optString("end_time");
            long time = TextUtils.isEmpty(optString) ? 0 : simpleDateFormat.parse(optString).getTime();
            long time2 = TextUtils.isEmpty(optString2) ? Long.MAX_VALUE : simpleDateFormat.parse(optString2).getTime();
            String optString3 = jSONObject.optString("feature_name");
            if (System.currentTimeMillis() <= time2 && !TextUtils.isEmpty(optString3)) {
                FeatureRedDot.setFeatureRedDotValidTime(optString3, time, time2);
                HashMap hashMap = new HashMap();
                hashMap.put("featureName", optString3);
                GalleryStatHelper.recordCountEvent("feature_red_dot", "push_red_dot_arrive", hashMap);
            }
        } catch (Exception e) {
            Log.e("FeatureRedDotMessageHandler", "fail to parse feature red dot data from %s", data, e);
        }
    }

    public void handlePull(Context context, GalleryPushMessage galleryPushMessage) {
    }
}

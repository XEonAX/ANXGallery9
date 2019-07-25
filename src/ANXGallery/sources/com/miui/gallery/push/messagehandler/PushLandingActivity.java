package com.miui.gallery.push.messagehandler;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.Log;
import java.util.HashMap;
import java.util.Locale;

public class PushLandingActivity extends Activity {
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent != null) {
            Intent intent2 = (Intent) intent.getParcelableExtra("notification_content_intent");
            int intExtra = intent.getIntExtra("notification_content_id", 0);
            if (intent2 != null) {
                try {
                    startActivity(intent2);
                } catch (Exception unused) {
                    Log.e("PushLandingActivity", "failed to start activity: %s", (Object) intent2.getData());
                }
                HashMap hashMap = new HashMap();
                hashMap.put("pushContent", String.format(Locale.US, "%d_%s", new Object[]{Integer.valueOf(intExtra), intent2.getDataString()}));
                GalleryStatHelper.recordCountEvent("push_notification", "notification_click", hashMap);
            } else {
                Log.e("PushLandingActivity", "empty content intent");
            }
        }
        finish();
    }
}

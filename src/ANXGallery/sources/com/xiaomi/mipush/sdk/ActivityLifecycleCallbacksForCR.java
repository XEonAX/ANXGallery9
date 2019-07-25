package com.xiaomi.mipush.sdk;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.xiaomi.push.service.clientReport.PushClientReportHelper;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import java.util.HashSet;
import java.util.Set;

@TargetApi(14)
public class ActivityLifecycleCallbacksForCR implements ActivityLifecycleCallbacks {
    private Set<String> mMsgIdSet = new HashSet();

    private static void attachApplication(Application application) {
        application.registerActivityLifecycleCallbacks(new ActivityLifecycleCallbacksForCR());
    }

    public static void forceAttachApplication(Context context) {
        attachApplication((Application) context.getApplicationContext());
    }

    public void onActivityCreated(Activity activity, Bundle bundle) {
    }

    public void onActivityDestroyed(Activity activity) {
    }

    public void onActivityPaused(Activity activity) {
    }

    public void onActivityResumed(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            String stringExtra = intent.getStringExtra("messageId");
            int intExtra = intent.getIntExtra("eventMessageType", -1);
            if (!TextUtils.isEmpty(stringExtra) && intExtra > 0 && !this.mMsgIdSet.contains(stringExtra)) {
                this.mMsgIdSet.add(stringExtra);
                if (intExtra == 3000) {
                    PushClientReportManager.getInstance(activity.getApplicationContext()).reportEvent(activity.getPackageName(), PushClientReportHelper.getInterfaceIdByType(intExtra), stringExtra, 3008, "App calls by business message is visiable");
                } else if (intExtra == 1000) {
                    PushClientReportManager.getInstance(activity.getApplicationContext()).reportEvent(activity.getPackageName(), PushClientReportHelper.getInterfaceIdByType(intExtra), stringExtra, 1008, "app calls by notification message is visiable");
                }
            }
        }
    }

    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    public void onActivityStarted(Activity activity) {
    }

    public void onActivityStopped(Activity activity) {
    }
}

package com.xiaomi.mipush.sdk;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.lang.ref.WeakReference;

public abstract class BaseService extends Service {
    private TimeoutHandler mHandler;

    public static class TimeoutHandler extends Handler {
        private WeakReference<BaseService> mWRService;

        public TimeoutHandler(WeakReference<BaseService> weakReference) {
            this.mWRService = weakReference;
        }

        public void handleMessage(Message message) {
            if (message.what == 1001 && this.mWRService != null) {
                BaseService baseService = (BaseService) this.mWRService.get();
                if (baseService != null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("TimeoutHandler");
                    sb.append(baseService.toString());
                    sb.append("  kill self");
                    MyLog.v(sb.toString());
                    if (!baseService.hasJob()) {
                        baseService.stopSelf();
                        return;
                    }
                    MyLog.v("TimeoutHandler has job");
                    sendEmptyMessageDelayed(1001, 1000);
                }
            }
        }

        public void reSendTimeoutMessage() {
            if (hasMessages(1001)) {
                removeMessages(1001);
            }
            sendEmptyMessageDelayed(1001, 1000);
        }
    }

    /* access modifiers changed from: protected */
    public abstract boolean hasJob();

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        if (this.mHandler == null) {
            this.mHandler = new TimeoutHandler(new WeakReference(this));
        }
        this.mHandler.reSendTimeoutMessage();
    }
}

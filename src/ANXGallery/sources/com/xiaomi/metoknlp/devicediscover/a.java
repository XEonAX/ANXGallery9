package com.xiaomi.metoknlp.devicediscover;

import android.os.Handler;
import android.os.Message;
import java.util.HashMap;

/* compiled from: DiscoverService */
class a extends Handler {
    final /* synthetic */ m a;

    a(m mVar) {
        this.a = mVar;
    }

    public void handleMessage(Message message) {
        synchronized (this.a.mLock) {
            int i = message.what;
            if (i != 3) {
                switch (i) {
                    case 0:
                        this.a.b((HashMap) message.obj);
                        break;
                    case 1:
                        this.a.mState = 0;
                        if (this.a.ad != null) {
                            this.a.ad.cancel(true);
                        }
                        this.a.Q();
                        break;
                }
            } else {
                if (message.obj != null) {
                    String str = (String) message.obj;
                    if (this.a.ab != null) {
                        this.a.ab.g(str);
                    }
                }
                this.a.Q();
            }
        }
    }
}

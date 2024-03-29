package com.xiaomi.metoknlp.devicediscover;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.HandlerThread;
import android.os.Message;
import com.xiaomi.metoknlp.MetokApplication;
import com.xiaomi.metoknlp.a;

/* compiled from: WifiCampStatistics */
public class f {
    private static final long H = (a.h() ? 30000 : 1800000);
    private static final Object mLock = new Object();
    private ConnectivityManager I;
    private o J;
    private b K;
    /* access modifiers changed from: private */
    public n L;
    private Context mContext;
    private HandlerThread mHandlerThread;
    private BroadcastReceiver mReceiver = new k(this);

    static {
        a.g();
    }

    public f(Context context) {
        this.mContext = context;
    }

    private boolean A() {
        if (!a.g().m()) {
            return true;
        }
        long n = a.g().n();
        if (n == Long.MAX_VALUE) {
            n = 172800000;
        }
        this.K.d();
        return this.K.getDuration() > n;
    }

    private boolean B() {
        long c = this.K.c();
        long l = a.g().l();
        if (l == Long.MAX_VALUE) {
            l = 172800000;
        }
        return System.currentTimeMillis() - c > l;
    }

    private void C() {
        this.J.a(this.K.a(), this.K.b(), this.K.getDuration());
    }

    private void D() {
        this.mContext.registerReceiver(this.mReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
    }

    private void E() {
        if (this.L.hasMessages(1)) {
            this.L.removeMessages(1);
        }
        if (this.L.hasMessages(2)) {
            this.L.removeMessages(2);
        }
        this.mContext.unregisterReceiver(this.mReceiver);
    }

    /* access modifiers changed from: private */
    public void a(boolean z) {
        NetworkInfo networkInfo = null;
        try {
            if (!(this.mContext == null || this.mContext.getPackageManager().checkPermission("android.permission.ACCESS_NETWORK_STATE", this.mContext.getPackageName()) != 0 || this.I == null)) {
                networkInfo = this.I.getActiveNetworkInfo();
            }
        } catch (Exception unused) {
        }
        if (this.K != null) {
            if (networkInfo == null || networkInfo.getType() != 1 || !networkInfo.isConnected()) {
                this.K.f();
            } else {
                String a = i.a(this.mContext, 1);
                if (this.K.a() == null || !this.K.a().equals(a)) {
                    this.K.a(a);
                }
                if (this.L.hasMessages(2)) {
                    this.L.removeMessages(2);
                }
                Message obtainMessage = this.L.obtainMessage(2);
                long j = H;
                obtainMessage.obj = Boolean.valueOf(z);
                if (z) {
                    this.L.sendMessage(obtainMessage);
                } else {
                    this.L.sendMessageDelayed(obtainMessage, j);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void b(boolean z) {
        if (!a.g().k()) {
            return;
        }
        if (z || (z() && B() && A())) {
            C();
            this.K.e();
            this.K.save();
        }
    }

    private int getFetchDeviceWay() {
        try {
            return ((MetokApplication) this.mContext).getFetchDeviceWay();
        } catch (Exception unused) {
            return 0;
        }
    }

    private boolean z() {
        long currentTimeMillis = System.currentTimeMillis();
        long b = this.K.b();
        long o = a.g().o();
        if (o == Long.MAX_VALUE) {
            o = H;
        }
        String a = this.K.a();
        return a != null && a.equals(i.a(this.mContext, 1)) && currentTimeMillis - b >= o;
    }

    public void F() {
        synchronized (mLock) {
            this.J = null;
        }
    }

    public void a(o oVar) {
        synchronized (mLock) {
            this.J = oVar;
        }
    }

    public void fecthDeviceImmediately() {
        a(true);
    }

    public void start() {
        this.K = new b(this.mContext);
        this.I = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        this.mHandlerThread = new HandlerThread("WifiCampStatics");
        this.mHandlerThread.start();
        this.L = new n(this, this.mHandlerThread.getLooper());
        if (getFetchDeviceWay() == 0) {
            D();
        }
    }

    public void stop() {
        if (getFetchDeviceWay() == 0) {
            E();
        }
        this.I = null;
        this.K.reset();
        if (this.mHandlerThread != null) {
            this.mHandlerThread.quitSafely();
            this.mHandlerThread = null;
        }
    }
}

package com.xiaomi.mistatistic.sdk.controller;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Iterator;

/* compiled from: AsyncJobDispatcher */
public class e {
    private static e a;
    private static e b;
    /* access modifiers changed from: private */
    public volatile Handler c;
    /* access modifiers changed from: private */
    public Looper d;
    /* access modifiers changed from: private */
    public ArrayList<a> e = new ArrayList<>();

    /* compiled from: AsyncJobDispatcher */
    public interface a {
        void execute();
    }

    /* compiled from: AsyncJobDispatcher */
    private class b extends HandlerThread {
        public b(String str) {
            super(str);
        }

        /* access modifiers changed from: protected */
        public void onLooperPrepared() {
            ArrayList arrayList;
            StringBuilder sb = new StringBuilder();
            sb.append(getName());
            sb.append(": onLooperPrepared");
            j.a("AJD", sb.toString());
            e.this.c = new Handler();
            e.this.d = getLooper();
            synchronized (e.this.e) {
                if (!e.this.e.isEmpty()) {
                    arrayList = (ArrayList) e.this.e.clone();
                    String valueOf = String.valueOf(e.this.e.size());
                    e.this.e.clear();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("mPendingJob(cnt=");
                    sb2.append(valueOf);
                    sb2.append(") not empty, clone a job list and clear original list");
                    j.a("AJD", sb2.toString());
                } else {
                    arrayList = null;
                }
            }
            if (arrayList != null) {
                j.a("AJD", "start execute the pending jobs ...");
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    try {
                        ((a) it.next()).execute();
                    } catch (Exception e) {
                        j.a("AJD", "error while executing job.", (Throwable) e);
                    }
                }
            }
            super.onLooperPrepared();
        }
    }

    private e(String str) {
        new b(str).start();
    }

    public static synchronized e a() {
        e eVar;
        synchronized (e.class) {
            if (a == null) {
                a = new e("local_job_dispatcher");
            }
            eVar = a;
        }
        return eVar;
    }

    public static synchronized e b() {
        e eVar;
        synchronized (e.class) {
            if (b == null) {
                b = new e("remote_job_dispatcher");
            }
            eVar = b;
        }
        return eVar;
    }

    public static Looper c() {
        Looper e2 = a().e();
        if (e2 == null) {
            try {
                Thread.sleep(5);
            } catch (InterruptedException e3) {
                j.a("AJD", "getLocalLooper exception", (Throwable) e3);
            }
            e2 = a().e();
        }
        return e2 != null ? e2 : Looper.getMainLooper();
    }

    public static Looper d() {
        Looper e2 = b().e();
        if (e2 == null) {
            try {
                Thread.sleep(5);
            } catch (InterruptedException e3) {
                j.a("AJD", "getRemoteLooper exception", (Throwable) e3);
            }
            e2 = b().e();
        }
        return e2 != null ? e2 : Looper.getMainLooper();
    }

    public void a(final a aVar) {
        if (this.c == null) {
            j.a("AJD", "mHander is null, add job to pending queue");
            synchronized (this.e) {
                this.e.add(aVar);
            }
            return;
        }
        synchronized (this.c) {
            this.c.post(new Runnable() {
                public void run() {
                    try {
                        aVar.execute();
                    } catch (Exception e) {
                        j.a("AJD", "error while executing job.", (Throwable) e);
                    }
                }
            });
        }
    }

    public void a(final a aVar, long j) {
        if (this.c != null) {
            synchronized (this.c) {
                this.c.postDelayed(new Runnable() {
                    public void run() {
                        try {
                            aVar.execute();
                        } catch (Exception e) {
                            j.a("AJD", "error while executing job.", (Throwable) e);
                        }
                    }
                }, j);
            }
            return;
        }
        j.a("AJD", "drop the job as handler is not ready.", (Throwable) null);
    }

    public Looper e() {
        if (this.d == null) {
            j.d("AJD", "getLooper return null!");
        }
        return this.d;
    }
}

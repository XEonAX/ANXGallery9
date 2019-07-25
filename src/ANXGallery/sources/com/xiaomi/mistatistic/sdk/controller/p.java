package com.xiaomi.mistatistic.sdk.controller;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.xiaomi.mistatistic.sdk.controller.e.a;
import com.xiaomi.mistatistic.sdk.data.i;
import com.xiaomi.mistatistic.sdk.data.j;
import com.xiaomi.mistatistic.sdk.data.l;
import com.xiaomi.mistatistic.sdk.data.m;
import java.util.ArrayList;
import java.util.List;

/* compiled from: SessionManager */
public class p {
    private static final List<i> a = new ArrayList();
    private static volatile p b = null;
    private static long c = 30000;
    private Handler d = new Handler(e.c()) {
        public void handleMessage(Message message) {
            if (message.what == 31415927) {
                Context a2 = d.a();
                long a3 = m.a(a2, "session_begin", 0);
                long a4 = m.a(a2, "last_deactivate", 0);
                String a5 = m.a(a2, "pv_path", "");
                if (a3 > 0 && a4 > a3) {
                    p.this.a(a2, a3, a4);
                }
                if (!TextUtils.isEmpty(a5)) {
                    p.this.a(a2, a5, a3);
                }
            }
        }
    };

    private p() {
    }

    public static p a() {
        if (b == null) {
            synchronized (p.class) {
                if (b == null) {
                    b = new p();
                }
            }
        }
        return b;
    }

    private void a(Context context, long j) {
        LocalEventRecorder.insertEvent(new m(j, 0));
    }

    /* access modifiers changed from: private */
    public void a(Context context, long j, long j2) {
        String c2 = l.c(context);
        if (TextUtils.isEmpty(c2)) {
            c2 = "NULL";
        }
        l lVar = new l(j, j2, c2);
        LocalEventRecorder.insertEvent(lVar);
        m.b(context, "session_begin", 0);
        m.b(context, "last_deactivate", 0);
    }

    /* access modifiers changed from: private */
    public void a(Context context, String str, long j) {
        if (!TextUtils.isEmpty(str)) {
            LocalEventRecorder.insertEvent(new j(str, m.a(context, "source_path", ""), j));
            m.b(context, "source_path", "");
            m.b(context, "pv_path", "");
        }
    }

    /* access modifiers changed from: private */
    public void b(String str) {
        int i;
        try {
            Context a2 = d.a();
            Long valueOf = Long.valueOf(System.currentTimeMillis());
            m.b(a2, "last_deactivate", valueOf.longValue());
            if (!a.isEmpty()) {
                if (!TextUtils.isEmpty(str)) {
                    int size = a.size() - 1;
                    while (true) {
                        if (size < 0) {
                            i = -1;
                            break;
                        } else if (TextUtils.equals(((i) a.get(size)).b(), str)) {
                            i = size;
                            break;
                        } else {
                            size--;
                        }
                    }
                } else {
                    i = a.size() - 1;
                }
                if (i >= 0) {
                    i iVar = (i) a.get(i);
                    String b2 = iVar.b();
                    long a3 = iVar.a();
                    long longValue = valueOf.longValue() - a3;
                    if (!TextUtils.isEmpty(b2) && a3 > 0 && longValue > 0) {
                        iVar.a(Long.valueOf(longValue));
                        LocalEventRecorder.insertEvent(iVar);
                        a.remove(i);
                    }
                }
            }
        } catch (Exception e) {
            j.a("processActDeativated exception: ", (Throwable) e);
        }
    }

    /* access modifiers changed from: private */
    public void b(String str, String str2) {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            Context a2 = d.a();
            long a3 = m.a(a2, "session_begin", 0);
            long a4 = m.a(a2, "last_deactivate", 0);
            String a5 = m.a(a2, "pv_path", "");
            if (a3 <= 0) {
                m.b(a2, "session_begin", currentTimeMillis);
                a(a2, currentTimeMillis);
            } else if (a4 <= 0) {
                m.b(a2, "session_begin", currentTimeMillis);
                a(a2, currentTimeMillis);
                if (!TextUtils.isEmpty(a5)) {
                    a(a2, a5, a3);
                    a5 = "";
                }
            }
            String str3 = a5;
            if (a4 > 0 && currentTimeMillis - a4 > c) {
                a(a2, a3, a4);
                if (!TextUtils.isEmpty(str3)) {
                    a(a2, str3, a3);
                    str3 = "";
                }
                m.b(a2, "session_begin", currentTimeMillis);
                a(a2, currentTimeMillis);
            }
            if (!str3.endsWith(str) || !TextUtils.isEmpty(str2)) {
                m.b(a2, "pv_path", c(str3, str));
                m.b(a2, "source_path", c(m.a(a2, "source_path", ""), str2));
            }
            a.add(new i(str, Long.valueOf(currentTimeMillis)));
        } catch (Exception e) {
            j.a("processActActivated exception: ", (Throwable) e);
        }
    }

    private String c(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return str2;
        }
        StringBuilder sb = new StringBuilder(str);
        sb.append(",");
        sb.append(str2);
        return sb.toString();
    }

    public void a(final String str) {
        if (!f.a(d.a()).b()) {
            j.c("Session manager V1 is disabled.");
            return;
        }
        e.a().a((a) new a() {
            public void execute() {
                p.this.b(str);
            }
        });
        this.d.sendEmptyMessageDelayed(31415927, c);
    }

    public void a(final String str, final String str2) {
        if (!f.a(d.a()).b()) {
            j.c("Session manager V1 is disabled.");
            return;
        }
        this.d.removeMessages(31415927);
        e.a().a((a) new a() {
            public void execute() {
                p.this.b(str, str2);
            }
        });
    }
}

package com.xiaomi.mistatistic.sdk;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import com.xiaomi.mistatistic.sdk.controller.d;
import com.xiaomi.mistatistic.sdk.controller.g;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.controller.l;
import com.xiaomi.mistatistic.sdk.controller.m;
import com.xiaomi.mistatistic.sdk.controller.r;
import com.xiaomi.mistatistic.sdk.controller.s;
import com.xiaomi.mistatistic.sdk.controller.t;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.io.StringWriter;
import java.lang.Thread.UncaughtExceptionHandler;
import java.util.ArrayList;
import java.util.TreeMap;

/* compiled from: MIStatsExceptionHandler */
public class b implements UncaughtExceptionHandler {
    private static int a = 1;
    private static boolean b;
    private final UncaughtExceptionHandler c;

    /* compiled from: MIStatsExceptionHandler */
    public static class a implements Serializable {
        public Throwable a;
        public String b;
        public String c;
        public String d;
        public String e;

        public a() {
            this.a = null;
            this.b = d.e();
            this.c = d.d();
            this.d = d.f();
            this.e = null;
        }

        public a(Throwable th) {
            this.a = th;
            this.b = d.e();
            this.c = d.d();
            this.d = d.f();
            this.e = String.valueOf(System.currentTimeMillis());
        }
    }

    public static void a(a aVar, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("uploadException, isManually:");
        sb.append(z);
        j.a("MEH", sb.toString());
        if (b) {
            if (aVar == null || aVar.a == null) {
                j.d("MEH", "the throwable is null.");
            } else if (aVar.a.getStackTrace() == null || aVar.a.getStackTrace().length == 0) {
                j.d("MEH", "There is no useful call stack.");
            } else {
                Context a2 = d.a();
                if (!BuildSetting.isUploadDebugLogEnable(a2)) {
                    j.d("MEH", "not allowed to upload debug or exception log");
                } else if (s.a().b(4)) {
                    StringWriter stringWriter = new StringWriter();
                    aVar.a.printStackTrace(new PrintWriter(stringWriter));
                    String obj = stringWriter.toString();
                    final TreeMap treeMap = new TreeMap();
                    final String str = BuildSetting.isTestNetworkEnabled() ? "http://test.data.mistat.xiaomi.srv/micrash" : "https://data.mistat.xiaomi.com/micrash";
                    t.a(a2, str, treeMap);
                    treeMap.put("device_uuid", g.a(a2));
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Android ");
                    sb2.append(VERSION.SDK_INT);
                    treeMap.put("device_os", sb2.toString());
                    treeMap.put("device_model", Build.MODEL);
                    treeMap.put("app_version", aVar.b);
                    treeMap.put("app_channel", aVar.c);
                    treeMap.put("app_start_time", aVar.d);
                    treeMap.put("app_crash_time", aVar.e);
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(aVar.a.getClass().getName());
                    sb3.append(":");
                    sb3.append(aVar.a.getMessage());
                    treeMap.put("crash_exception_type", sb3.toString());
                    treeMap.put("crash_exception_desc", aVar.a instanceof OutOfMemoryError ? "OutOfMemoryError" : obj);
                    treeMap.put("crash_callstack", obj);
                    if (z) {
                        treeMap.put("manual", "true");
                    }
                    r.b.execute(new Runnable() {
                        public void run() {
                            try {
                                l.a(str, treeMap, new com.xiaomi.mistatistic.sdk.controller.l.b() {
                                    public void a(String str) {
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("upload exception result: ");
                                        sb.append(str);
                                        j.a("MEH", sb.toString());
                                    }
                                });
                            } catch (Exception e) {
                                j.a("MEH", "Error to upload the exception ", (Throwable) e);
                            }
                        }
                    });
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040 A[SYNTHETIC, Splitter:B:20:0x0040] */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004f A[SYNTHETIC, Splitter:B:25:0x004f] */
    /* JADX WARNING: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
    private static void a(Throwable th) {
        ArrayList b2 = b();
        b2.add(new a(th));
        if (b2.size() > 5) {
            b2.remove(0);
        }
        ObjectOutputStream objectOutputStream = null;
        try {
            ObjectOutputStream objectOutputStream2 = new ObjectOutputStream(d.a().openFileOutput(".exceptiondetail", 0));
            try {
                objectOutputStream2.writeObject(b2);
            } catch (IOException e) {
                e = e;
                objectOutputStream = objectOutputStream2;
                try {
                    j.a("", (Throwable) e);
                    if (objectOutputStream == null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (objectOutputStream != null) {
                        try {
                            objectOutputStream.close();
                        } catch (IOException e2) {
                            j.a("MEH", "saveException exception", (Throwable) e2);
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                objectOutputStream = objectOutputStream2;
                if (objectOutputStream != null) {
                }
                throw th;
            }
            try {
                objectOutputStream2.close();
            } catch (IOException e3) {
                j.a("MEH", "saveException exception", (Throwable) e3);
            }
        } catch (IOException e4) {
            e = e4;
            j.a("", (Throwable) e);
            if (objectOutputStream == null) {
                objectOutputStream.close();
            }
        }
    }

    public static boolean a() {
        return b;
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x0055 A[SYNTHETIC, Splitter:B:27:0x0055] */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0064  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x006a A[SYNTHETIC, Splitter:B:36:0x006a] */
    public static ArrayList<a> b() {
        boolean z;
        ArrayList<a> arrayList = new ArrayList<>();
        ObjectInputStream objectInputStream = null;
        try {
            File filesDir = d.a().getFilesDir();
            if (filesDir != null) {
                File file = new File(filesDir, ".exceptiondetail");
                if (file.isFile()) {
                    ObjectInputStream objectInputStream2 = new ObjectInputStream(new FileInputStream(file));
                    try {
                        arrayList = (ArrayList) objectInputStream2.readObject();
                        objectInputStream = objectInputStream2;
                    } catch (Exception e) {
                        ObjectInputStream objectInputStream3 = objectInputStream2;
                        e = e;
                        objectInputStream = objectInputStream3;
                        try {
                            j.a("MEH", "loadException exception", (Throwable) e);
                            if (objectInputStream != null) {
                            }
                            z = true;
                            if (z) {
                            }
                            return arrayList;
                        } catch (Throwable th) {
                            th = th;
                            if (objectInputStream != null) {
                                try {
                                    objectInputStream.close();
                                } catch (IOException e2) {
                                    j.a("MEH", "loadException exception", (Throwable) e2);
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        objectInputStream = objectInputStream2;
                        if (objectInputStream != null) {
                        }
                        throw th;
                    }
                }
            }
            if (objectInputStream != null) {
                try {
                    objectInputStream.close();
                } catch (IOException e3) {
                    j.a("MEH", "loadException exception", (Throwable) e3);
                }
            }
            z = false;
        } catch (Exception e4) {
            e = e4;
            j.a("MEH", "loadException exception", (Throwable) e);
            if (objectInputStream != null) {
                try {
                    objectInputStream.close();
                } catch (IOException e5) {
                    j.a("MEH", "loadException exception", (Throwable) e5);
                }
            }
            z = true;
            if (z) {
            }
            return arrayList;
        }
        if (z) {
            c();
        }
        return arrayList;
    }

    public static void c() {
        new File(d.a().getFilesDir(), ".exceptiondetail").delete();
    }

    public static boolean d() {
        return a == 2;
    }

    public static boolean e() {
        return a != 1;
    }

    private boolean f() {
        Context a2 = d.a();
        if (System.currentTimeMillis() - m.a(a2, "crash_time", 0) > 300000) {
            m.b(a2, "crash_count", 1);
            m.b(a2, "crash_time", System.currentTimeMillis());
        } else {
            int a3 = m.a(a2, "crash_count", 0);
            if (a3 == 0) {
                m.b(a2, "crash_time", System.currentTimeMillis());
            }
            int i = a3 + 1;
            m.b(a2, "crash_count", i);
            if (i > 10) {
                return true;
            }
        }
        return false;
    }

    @SuppressLint({"NewApi"})
    public void uncaughtException(Thread thread, Throwable th) {
        j.a("MEH", "uncaughtException...");
        try {
            if (VERSION.SDK_INT >= 9) {
                StrictMode.setThreadPolicy(new Builder().build());
            }
            com.xiaomi.mistatistic.sdk.controller.asyncjobs.a.a();
            if (!d()) {
                a(th);
            } else if (!f()) {
                a(new a(th), false);
            } else {
                j.a("MEH", "crazy crash...");
            }
            if (this.c != null) {
                this.c.uncaughtException(thread, th);
            }
        } catch (Exception e) {
            j.a("MEH", "uncaughtException exception", (Throwable) e);
        }
    }
}

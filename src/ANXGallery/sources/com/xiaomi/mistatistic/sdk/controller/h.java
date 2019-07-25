package com.xiaomi.mistatistic.sdk.controller;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.IBinder;
import android.text.TextUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import com.xiaomi.mistatistic.sdk.a.C0006a;
import com.xiaomi.mistatistic.sdk.data.StatEventPojo;
import java.util.ArrayList;
import java.util.List;

/* compiled from: EventDAO */
public class h {
    public static boolean a = false;
    private static String b = "";
    private static volatile k c;
    private boolean d = false;
    /* access modifiers changed from: private */
    public com.xiaomi.mistatistic.sdk.a e = null;
    /* access modifiers changed from: private */
    public boolean f = false;
    private ServiceConnection g = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            h.this.f = true;
            h.this.e = C0006a.a(iBinder);
        }

        public void onServiceDisconnected(ComponentName componentName) {
            h.this.f = false;
            h.this.e = null;
        }
    };

    /* compiled from: EventDAO */
    private static class a {
        /* access modifiers changed from: private */
        public static final k a = new k(d.a());
    }

    private static StatEventPojo a(Cursor cursor) {
        StatEventPojo statEventPojo = new StatEventPojo();
        long j = cursor.getLong(2);
        String string = cursor.getString(4);
        String string2 = cursor.getString(5);
        String string3 = cursor.getString(1);
        String string4 = cursor.getString(3);
        String string5 = cursor.getString(6);
        int i = cursor.getInt(7);
        statEventPojo.mCategory = string3;
        statEventPojo.mKey = string4;
        statEventPojo.mValue = string;
        statEventPojo.mTimeStamp = j;
        statEventPojo.mType = string2;
        statEventPojo.mExtra = string5;
        statEventPojo.mAnonymous = i;
        return statEventPojo;
    }

    public static void a() {
        c = g();
    }

    public static boolean b() {
        return a;
    }

    private void f() {
        if (!this.f) {
            try {
                Context a2 = d.a();
                Intent intent = new Intent(a2, Class.forName(b));
                a2.startService(intent);
                if (this.e != null) {
                    j.b("DAO", "unbind service before bind it again!");
                    a2.unbindService(this.g);
                }
                a2.bindService(intent, this.g, 1);
            } catch (Exception e2) {
                j.a("DAO", "ensureServiceBinded exception", (Throwable) e2);
            }
        }
    }

    private static k g() {
        if (c == null) {
            c = a.a;
        }
        return c;
    }

    public int a(int i) {
        if (!a) {
            return b(i);
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        int a2 = this.e.a(i);
                        j.b("DAO", String.format("process getEventCount, result is: %d", new Object[]{Integer.valueOf(a2)}));
                        return a2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return 0;
        } catch (Exception e2) {
            j.a("DAO", "getEventCount", (Throwable) e2);
            return 0;
        }
    }

    public StatEventPojo a(String str, String str2) {
        if (!a) {
            return b(str, str2);
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        StatEventPojo a2 = this.e.a(str, str2);
                        StringBuilder sb = new StringBuilder();
                        sb.append("process query, result is: ");
                        sb.append(a2);
                        j.b("DAO", sb.toString());
                        return a2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return null;
        } catch (Exception e2) {
            j.a("DAO", "queryCustomEvent exception", (Throwable) e2);
            return null;
        }
    }

    public List<StatEventPojo> a(long j) {
        if (!a) {
            return b(j);
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        List<StatEventPojo> a2 = this.e.a(j);
                        String str = "DAO";
                        String str2 = "process getAll, result size is : %d";
                        Object[] objArr = new Object[1];
                        objArr[0] = Integer.valueOf(a2 == null ? 0 : a2.size());
                        j.b(str, String.format(str2, objArr));
                        return a2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return new ArrayList();
        } catch (Exception e2) {
            j.a("DAO", "getAllEventOrderByTimestampDescend exception", (Throwable) e2);
            return new ArrayList();
        }
    }

    public void a(long j, long j2, int i) {
        if (a) {
            try {
                Context a2 = d.a();
                Intent intent = new Intent(a2, Class.forName(b));
                intent.putExtra(nexExportFormat.TAG_FORMAT_TYPE, 5);
                intent.putExtra("startTime", j);
                intent.putExtra("endTime", j2);
                intent.putExtra("eventType", i);
                a2.startService(intent);
            } catch (Exception e2) {
                j.a("DAO", "deleteEventsByStartAndEndTS", (Throwable) e2);
            }
        } else {
            b(j, j2, i);
        }
    }

    public void a(StatEventPojo statEventPojo) {
        if (a) {
            try {
                Intent intent = new Intent(d.a(), Class.forName(b));
                intent.putExtra(nexExportFormat.TAG_FORMAT_TYPE, 1);
                intent.putExtra("StatEventPojo", statEventPojo);
                d.a().startService(intent);
            } catch (Exception e2) {
                j.a("DAO", "insertNewEvent exception", (Throwable) e2);
            }
        } else {
            b(statEventPojo);
        }
    }

    public void a(Boolean bool) {
        this.d = bool.booleanValue();
    }

    public void a(String str, String str2, String str3) {
        if (a) {
            try {
                Intent intent = new Intent(d.a(), Class.forName(b));
                intent.putExtra(nexExportFormat.TAG_FORMAT_TYPE, 2);
                intent.putExtra("key", str);
                intent.putExtra("category", str2);
                intent.putExtra("newValue", str3);
                d.a().startService(intent);
            } catch (Exception e2) {
                j.a("DAO", "updateEventByKeyAndCategory exception", (Throwable) e2);
            }
        } else {
            b(str, str2, str3);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0094, code lost:
        return r14;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x00a4, code lost:
        r14 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00bc, code lost:
        if (r2 != null) goto L_0x00be;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00be, code lost:
        r2.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00c2, code lost:
        r14 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00c6, code lost:
        if (c != null) goto L_0x00c8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00c8, code lost:
        c.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00cd, code lost:
        throw r14;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00cf, code lost:
        throw r14;
     */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [B:16:0x0087, B:32:0x00ab] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0097 A[Catch:{ all -> 0x00a4, all -> 0x00c2 }] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x009e A[Catch:{ all -> 0x00a4, all -> 0x00c2 }] */
    public int b(int i) {
        k kVar;
        Cursor query;
        synchronized (g()) {
            Cursor cursor = null;
            try {
                SQLiteDatabase readableDatabase = c.getReadableDatabase();
                if (i == 1) {
                    query = readableDatabase.query("mistat_event", new String[]{"count(*)"}, null, null, null, null, null);
                } else {
                    if (i == 2) {
                        String str = "mistat_event";
                        query = readableDatabase.query(str, new String[]{"count(*)"}, "category IN (?, ?, ?, ?, ?, ?, ?)", new String[]{String.valueOf("mistat_basic"), String.valueOf("mistat_pt"), String.valueOf("mistat_pv"), String.valueOf("mistat_session"), String.valueOf("mistat_pa"), String.valueOf("mistat_session_extra"), String.valueOf("mistat_monitor")}, null, null, null, null);
                    }
                    if (cursor != null || !cursor.moveToFirst()) {
                        if (cursor != null) {
                            cursor.close();
                        }
                        if (c != null) {
                            kVar = c;
                            kVar.close();
                        }
                    } else {
                        int i2 = cursor.getInt(0);
                        if (cursor != null) {
                            cursor.close();
                        }
                        if (c != null) {
                            c.close();
                        }
                    }
                }
                cursor = query;
                if (cursor != null) {
                }
                if (cursor != null) {
                }
                if (c != null) {
                }
            } catch (Exception e2) {
                j.a("DAO", "Error while getting count from DB", (Throwable) e2);
                if (cursor != null) {
                    cursor.close();
                }
                if (c != null) {
                    kVar = c;
                }
                return 0;
            }
        }
    }

    /* JADX WARNING: type inference failed for: r1v0 */
    /* JADX WARNING: type inference failed for: r1v1, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.xiaomi.mistatistic.sdk.data.StatEventPojo] */
    /* JADX WARNING: type inference failed for: r12v4, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* JADX WARNING: type inference failed for: r12v7 */
    /* JADX WARNING: type inference failed for: r1v4 */
    /* JADX WARNING: type inference failed for: r12v10, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r1v5 */
    /* JADX WARNING: type inference failed for: r13v8, types: [com.xiaomi.mistatistic.sdk.data.StatEventPojo] */
    /* JADX WARNING: type inference failed for: r1v6 */
    /* JADX WARNING: type inference failed for: r1v7 */
    /* JADX WARNING: type inference failed for: r12v13 */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x0059, code lost:
        r13 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x005a, code lost:
        r1 = r12;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x005d, code lost:
        r1.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0061, code lost:
        r12 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0067, code lost:
        c.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x006e, code lost:
        throw r12;
     */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [B:13:0x0033, B:23:0x0048] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], ?[OBJECT, ARRAY]]
  uses: [com.xiaomi.mistatistic.sdk.data.StatEventPojo, ?[int, boolean, OBJECT, ARRAY, byte, short, char], android.database.Cursor]
  mth insns count: 54
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x004d A[SYNTHETIC, Splitter:B:26:0x004d] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0054 A[Catch:{ all -> 0x0059, all -> 0x0061 }] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x005d A[Catch:{ all -> 0x0059, all -> 0x0061 }] */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0067 A[Catch:{ all -> 0x0059, all -> 0x0061 }] */
    /* JADX WARNING: Unknown variable types count: 4 */
    public StatEventPojo b(String str, String str2) {
        ? r1;
        ? r12;
        k kVar;
        synchronized (g()) {
            r1 = 0;
            try {
                ? query = c.getReadableDatabase().query("mistat_event", null, "category=? AND key=?", new String[]{str, str2}, null, null, null);
                if (query != 0) {
                    try {
                        if (query.moveToFirst()) {
                            r1 = a((Cursor) query);
                        }
                    } catch (Exception e2) {
                        e = e2;
                        r12 = query;
                        j.a("DAO", "queryCustomEvent exception", (Throwable) e);
                        if (r12 != 0) {
                            r12.close();
                        }
                        if (c != null) {
                            kVar = c;
                            kVar.close();
                            r1 = r1;
                        }
                        return r1;
                    }
                }
                if (query != 0) {
                    query.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                    r1 = r1;
                }
            } catch (Exception e3) {
                e = e3;
                r12 = 0;
                j.a("DAO", "queryCustomEvent exception", (Throwable) e);
                if (r12 != 0) {
                }
                if (c != null) {
                }
                return r1;
            } catch (Throwable th) {
                th = th;
                if (r1 != 0) {
                }
                if (c != null) {
                }
                throw th;
            }
        }
        return r1;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x00db, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x00e3, code lost:
        r0 = th;
     */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [B:46:0x00b1, B:58:0x00ca] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0099 A[SYNTHETIC, Splitter:B:39:0x0099] */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00b1 A[SYNTHETIC, Splitter:B:46:0x00b1] */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00b8 A[Catch:{ all -> 0x00db, all -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x00cf A[SYNTHETIC, Splitter:B:61:0x00cf] */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x00d6 A[Catch:{ all -> 0x00db, all -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00df A[Catch:{ all -> 0x00db, all -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00e9 A[Catch:{ all -> 0x00db, all -> 0x00e3 }] */
    public List<StatEventPojo> b(long j) {
        Cursor cursor;
        k kVar;
        ArrayList arrayList = new ArrayList();
        synchronized (g()) {
            Cursor cursor2 = null;
            try {
                SQLiteDatabase readableDatabase = c.getReadableDatabase();
                if (readableDatabase == null) {
                    try {
                        if (c != null) {
                            c.close();
                        }
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                } else {
                    cursor = readableDatabase.query("mistat_event", null, "ts < ? ", new String[]{String.valueOf(j)}, null, null, "ts DESC", String.valueOf(500));
                    if (cursor != null) {
                        try {
                            if (cursor.moveToLast()) {
                                long j2 = cursor.getLong(cursor.getColumnIndex("ts"));
                                cursor.close();
                                String str = "ts<? AND ts>=? AND anonymous=?";
                                String[] strArr = new String[3];
                                strArr[0] = String.valueOf(j);
                                strArr[1] = String.valueOf(j2);
                                try {
                                    strArr[2] = this.d ? String.valueOf(1) : String.valueOf(0);
                                    cursor2 = readableDatabase.query("mistat_event", null, str, strArr, null, null, "ts DESC");
                                    if (cursor2 != null) {
                                        try {
                                            if (cursor2.moveToFirst()) {
                                                do {
                                                    arrayList.add(a(cursor2));
                                                } while (cursor2.moveToNext());
                                            }
                                        } catch (Exception e2) {
                                            e = e2;
                                            j.a("DAO", "Error while reading data from DB", (Throwable) e);
                                            if (cursor2 != null) {
                                                cursor2.close();
                                            }
                                            if (c != null) {
                                                kVar = c;
                                                kVar.close();
                                            }
                                            return arrayList;
                                        }
                                    }
                                    if (cursor2 != null) {
                                        cursor2.close();
                                    }
                                    if (c != null) {
                                        kVar = c;
                                        kVar.close();
                                    }
                                } catch (Exception e3) {
                                    e = e3;
                                    cursor2 = cursor;
                                    j.a("DAO", "Error while reading data from DB", (Throwable) e);
                                    if (cursor2 != null) {
                                    }
                                    if (c != null) {
                                    }
                                    return arrayList;
                                } catch (Throwable th2) {
                                    th = th2;
                                    if (cursor != null) {
                                    }
                                    if (c != null) {
                                    }
                                    throw th;
                                }
                            }
                        } catch (Exception e4) {
                            e = e4;
                            cursor2 = cursor;
                            j.a("DAO", "Error while reading data from DB", (Throwable) e);
                            if (cursor2 != null) {
                            }
                            if (c != null) {
                            }
                            return arrayList;
                        } catch (Throwable th3) {
                            th = th3;
                            if (cursor != null) {
                            }
                            if (c != null) {
                            }
                            throw th;
                        }
                    }
                    cursor2 = cursor;
                    if (cursor2 != null) {
                    }
                    if (cursor2 != null) {
                    }
                    if (c != null) {
                    }
                }
            } catch (Exception e5) {
                e = e5;
                j.a("DAO", "Error while reading data from DB", (Throwable) e);
                if (cursor2 != null) {
                }
                if (c != null) {
                }
                return arrayList;
            } catch (Throwable th4) {
                th = th4;
                cursor = cursor2;
                if (cursor != null) {
                    cursor.close();
                }
                if (c != null) {
                    c.close();
                }
                throw th;
            }
        }
    }

    public void b(long j, long j2, int i) {
        k kVar;
        synchronized (g()) {
            try {
                j.a("DAO", "deleteEventsByStartAndEndTS, start:%d, end:%d", Long.valueOf(j), Long.valueOf(j2));
                SQLiteDatabase writableDatabase = c.getWritableDatabase();
                if (i == 1) {
                    String str = "mistat_event";
                    String str2 = "ts<=? AND ts>=? AND anonymous=?";
                    String[] strArr = new String[3];
                    strArr[0] = String.valueOf(j2);
                    strArr[1] = String.valueOf(j);
                    strArr[2] = this.d ? String.valueOf(1) : String.valueOf(0);
                    writableDatabase.delete(str, str2, strArr);
                } else if (i == 2) {
                    String str3 = "mistat_event";
                    String str4 = "ts<=? AND ts>=? AND category IN (?, ?, ?, ?, ?, ?, ?) AND anonymous=?";
                    String[] strArr2 = new String[10];
                    strArr2[0] = String.valueOf(j2);
                    strArr2[1] = String.valueOf(j);
                    strArr2[2] = String.valueOf("mistat_basic");
                    strArr2[3] = String.valueOf("mistat_pt");
                    strArr2[4] = String.valueOf("mistat_pv");
                    strArr2[5] = String.valueOf("mistat_session");
                    strArr2[6] = String.valueOf("mistat_pa");
                    strArr2[7] = String.valueOf("mistat_session_extra");
                    strArr2[8] = String.valueOf("mistat_monitor");
                    strArr2[9] = this.d ? String.valueOf(1) : String.valueOf(0);
                    writableDatabase.delete(str3, str4, strArr2);
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e2) {
                try {
                    j.a("DAO", "Error while deleting event by ts from DB", (Throwable) e2);
                    if (c != null) {
                        kVar = c;
                    }
                } catch (Throwable th) {
                    if (c != null) {
                        c.close();
                    }
                    throw th;
                }
            }
        }
    }

    public void b(StatEventPojo statEventPojo) {
        k kVar;
        ContentValues contentValues = new ContentValues();
        contentValues.put("category", statEventPojo.mCategory);
        contentValues.put("key", TextUtils.isEmpty(statEventPojo.mKey) ? "" : statEventPojo.mKey);
        contentValues.put("ts", Long.valueOf(statEventPojo.mTimeStamp));
        contentValues.put(nexExportFormat.TAG_FORMAT_TYPE, TextUtils.isEmpty(statEventPojo.mType) ? "" : statEventPojo.mType);
        contentValues.put("value", TextUtils.isEmpty(statEventPojo.mValue) ? "" : statEventPojo.mValue);
        contentValues.put("extra", TextUtils.isEmpty(statEventPojo.mExtra) ? "" : statEventPojo.mExtra);
        contentValues.put("anonymous", Integer.valueOf(statEventPojo.mAnonymous));
        synchronized (g()) {
            try {
                c.getWritableDatabase().insert("mistat_event", "", contentValues);
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e2) {
                try {
                    j.a("DAO", String.format("Error to insert data into DB, key= %s", new Object[]{statEventPojo.mKey}), (Throwable) e2);
                    if (c != null) {
                        kVar = c;
                    }
                } catch (Throwable th) {
                    if (c != null) {
                        c.close();
                    }
                    throw th;
                }
            }
        }
    }

    public void b(String str, String str2, String str3) {
        k kVar;
        ContentValues contentValues = new ContentValues();
        contentValues.put("value", str3);
        synchronized (g()) {
            try {
                c.getWritableDatabase().update("mistat_event", contentValues, "category=? AND key=?", new String[]{str2, str});
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e2) {
                String str4 = "DAO";
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Error to update data from DB, key=");
                    sb.append(str);
                    j.a(str4, sb.toString(), (Throwable) e2);
                    if (c != null) {
                        kVar = c;
                    }
                } catch (Throwable th) {
                    if (c != null) {
                        c.close();
                    }
                    throw th;
                }
            }
        }
    }

    public List<StatEventPojo> c(long j) {
        if (!a) {
            return d(j);
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        List<StatEventPojo> c2 = this.e.c(j);
                        String str = "DAO";
                        String str2 = "process getBasicEventsOrderByTsDescend, result size is : %d";
                        Object[] objArr = new Object[1];
                        objArr[0] = Integer.valueOf(c2 == null ? 0 : c2.size());
                        j.b(str, String.format(str2, objArr));
                        return c2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return new ArrayList();
        } catch (Exception e2) {
            j.a("DAO", "getBasicEventsOrderByTsDescend exception", (Throwable) e2);
            return new ArrayList();
        }
    }

    public boolean c() {
        if (!a) {
            return d();
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        boolean a2 = this.e.a();
                        j.b("DAO", String.format("process hasMonitorEvent , result is: %b", new Object[]{Boolean.valueOf(a2)}));
                        return a2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return false;
        } catch (Exception e2) {
            j.a("DAO", "hasMonitorEvent", (Throwable) e2);
            return false;
        }
    }

    public List<StatEventPojo> d(long j) {
        k kVar;
        ArrayList arrayList = new ArrayList();
        synchronized (g()) {
            Cursor cursor = null;
            try {
                SQLiteDatabase readableDatabase = c.getReadableDatabase();
                if (readableDatabase == null) {
                    cursor.close();
                    c.close();
                    return arrayList;
                }
                String str = "mistat_event";
                String str2 = "category IN (?, ?, ?, ?, ?, ?, ?) AND anonymous=?";
                String[] strArr = new String[8];
                strArr[0] = String.valueOf("mistat_basic");
                strArr[1] = String.valueOf("mistat_pt");
                strArr[2] = String.valueOf("mistat_pv");
                strArr[3] = String.valueOf("mistat_session");
                strArr[4] = String.valueOf("mistat_pa");
                strArr[5] = String.valueOf("mistat_session_extra");
                strArr[6] = String.valueOf("mistat_monitor");
                strArr[7] = this.d ? String.valueOf(1) : String.valueOf(0);
                Cursor query = readableDatabase.query(str, null, str2, strArr, null, null, "ts DESC", String.valueOf(500));
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            do {
                                arrayList.add(a(query));
                            } while (query.moveToNext());
                        }
                    } catch (Exception e2) {
                        Cursor cursor2 = query;
                        e = e2;
                        cursor = cursor2;
                        try {
                            j.a("DAO", "Error while getBasicEventsOrderByTsDescendImpl", (Throwable) e);
                            cursor.close();
                            kVar = c;
                            kVar.close();
                            return arrayList;
                        } catch (Throwable th) {
                            th = th;
                            cursor.close();
                            c.close();
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        cursor = query;
                        cursor.close();
                        c.close();
                        throw th;
                    }
                }
                query.close();
                kVar = c;
                kVar.close();
                return arrayList;
            } catch (Exception e3) {
                e = e3;
                j.a("DAO", "Error while getBasicEventsOrderByTsDescendImpl", (Throwable) e);
                cursor.close();
                kVar = c;
                kVar.close();
                return arrayList;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0036, code lost:
        return true;
     */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x005c A[SYNTHETIC, Splitter:B:34:0x005c] */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0063 A[Catch:{ Exception -> 0x003c, all -> 0x0037, all -> 0x006f }] */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x006b A[Catch:{ Exception -> 0x003c, all -> 0x0037, all -> 0x006f }] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0075 A[Catch:{ Exception -> 0x003c, all -> 0x0037, all -> 0x006f }] */
    public boolean d() {
        k kVar;
        synchronized (g()) {
            Cursor cursor = null;
            try {
                Cursor query = c.getReadableDatabase().query("mistat_event", null, "category=?", new String[]{"mistat_monitor"}, null, null, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            if (query != null) {
                                query.close();
                            }
                            if (c != null) {
                                c.close();
                            }
                        }
                    } catch (Exception e2) {
                        Cursor cursor2 = query;
                        e = e2;
                        cursor = cursor2;
                        try {
                            j.a("DAO", "hasMonitorEventImpl exception", (Throwable) e);
                            if (cursor != null) {
                            }
                            if (c != null) {
                            }
                            return false;
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                                cursor.close();
                            }
                            if (c != null) {
                                c.close();
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (query != null) {
                    query.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e3) {
                e = e3;
                j.a("DAO", "hasMonitorEventImpl exception", (Throwable) e);
                if (cursor != null) {
                    cursor.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
                return false;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
        return r0;
     */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0085 A[SYNTHETIC, Splitter:B:38:0x0085] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x008c A[Catch:{ all -> 0x0097 }] */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x0093 A[Catch:{ all -> 0x0097 }] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x009d A[Catch:{ all -> 0x0097 }] */
    public List<StatEventPojo> e(long j) {
        k kVar;
        ArrayList arrayList = new ArrayList();
        synchronized (g()) {
            Cursor cursor = null;
            try {
                SQLiteDatabase readableDatabase = c.getReadableDatabase();
                if (readableDatabase == null) {
                    try {
                        if (c != null) {
                            c.close();
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                } else {
                    Cursor query = readableDatabase.query("mistat_event", null, "ts <= ? AND category = ? OR category = ? OR category = ? OR category = ? OR category = ? ", new String[]{String.valueOf(j), "mistat_basic", "mistat_pa", "mistat_session", "mistat_pv", "mistat_pt"}, null, null, null, null);
                    if (query != null) {
                        try {
                            if (query.moveToFirst()) {
                                do {
                                    arrayList.add(a(query));
                                } while (query.moveToNext());
                            }
                        } catch (Exception e2) {
                            e = e2;
                            cursor = query;
                            try {
                                j.a("DAO", "getExpiredEvents", (Throwable) e);
                                if (cursor != null) {
                                }
                                if (c != null) {
                                }
                                return arrayList;
                            } catch (Throwable th2) {
                                th = th2;
                                if (cursor != null) {
                                }
                                if (c != null) {
                                }
                                throw th;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            cursor = query;
                            if (cursor != null) {
                                cursor.close();
                            }
                            if (c != null) {
                                c.close();
                            }
                            throw th;
                        }
                    }
                    if (query != null) {
                        query.close();
                    }
                    if (c != null) {
                        kVar = c;
                        kVar.close();
                    }
                }
            } catch (Exception e3) {
                e = e3;
                j.a("DAO", "getExpiredEvents", (Throwable) e);
                if (cursor != null) {
                    cursor.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
                return arrayList;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x0056 A[SYNTHETIC, Splitter:B:27:0x0056] */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x005d A[Catch:{ all -> 0x0068 }] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0064 A[Catch:{ all -> 0x0068 }] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x006e A[Catch:{ all -> 0x0068 }] */
    public boolean e() {
        boolean z;
        k kVar;
        synchronized (g()) {
            Cursor cursor = null;
            z = false;
            try {
                Cursor query = c.getReadableDatabase().query("mistat_event", null, "anonymous=?", new String[]{String.valueOf(1)}, null, null, "ts DESC", String.valueOf(500));
                if (query != null) {
                    try {
                        if (query.moveToLast()) {
                            z = true;
                        }
                    } catch (Exception e2) {
                        e = e2;
                        cursor = query;
                        try {
                            j.a("DAO", "Error while isExistAnonymousData from DB", (Throwable) e);
                            if (cursor != null) {
                            }
                            if (c != null) {
                            }
                            return z;
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                            }
                            if (c != null) {
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        cursor = query;
                        if (cursor != null) {
                            cursor.close();
                        }
                        if (c != null) {
                            c.close();
                        }
                        throw th;
                    }
                }
                if (query != null) {
                    try {
                        query.close();
                    } catch (Throwable th3) {
                        throw th3;
                    }
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e3) {
                e = e3;
                j.a("DAO", "Error while isExistAnonymousData from DB", (Throwable) e);
                if (cursor != null) {
                    cursor.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
                return z;
            }
        }
        return z;
    }

    public void f(long j) {
        if (a) {
            try {
                Intent intent = new Intent(d.a(), Class.forName(b));
                intent.putExtra(nexExportFormat.TAG_FORMAT_TYPE, 3);
                intent.putExtra("timeStamp", j);
                d.a().startService(intent);
            } catch (Exception e2) {
                j.a("DAO", "deleteExpiredEvents", (Throwable) e2);
            }
        } else {
            g(j);
        }
    }

    public void g(long j) {
        k kVar;
        synchronized (g()) {
            try {
                int delete = c.getWritableDatabase().delete("mistat_event", "ts <= ? AND category <> ? ", new String[]{String.valueOf(j), "mistat_monitor"});
                if (delete > 0) {
                    MiStatInterface.recordCalculateEvent("quality_monitor", "delete_old_events", (long) delete);
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e2) {
                try {
                    j.a("DAO", "Error while deleting out-of-date data from DB", (Throwable) e2);
                    if (c != null) {
                        kVar = c;
                    }
                } catch (Throwable th) {
                    if (c != null) {
                        c.close();
                    }
                    throw th;
                }
            }
        }
    }

    public boolean j(long j) {
        if (!a) {
            return k(j);
        }
        f();
        try {
            long currentTimeMillis = System.currentTimeMillis();
            do {
                if (this.f) {
                    if (this.e != null) {
                        boolean b2 = this.e.b(j);
                        j.b("DAO", String.format("process queryPaEventByTs , result is: %b", new Object[]{Boolean.valueOf(b2)}));
                        return b2;
                    }
                }
            } while (System.currentTimeMillis() - currentTimeMillis <= 1000);
            return false;
        } catch (Exception e2) {
            j.a("DAO", "queryPaEventByTs", (Throwable) e2);
            return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x003e, code lost:
        return true;
     */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0060 A[SYNTHETIC, Splitter:B:33:0x0060] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0067 A[Catch:{ Exception -> 0x0042, all -> 0x003f, all -> 0x0072 }] */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x006e A[Catch:{ Exception -> 0x0042, all -> 0x003f, all -> 0x0072 }] */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x0078 A[Catch:{ Exception -> 0x0042, all -> 0x003f, all -> 0x0072 }] */
    public boolean k(long j) {
        k kVar;
        synchronized (g()) {
            Cursor cursor = null;
            try {
                Cursor query = c.getReadableDatabase().query("mistat_event", null, "ts=? AND category=?", new String[]{String.valueOf(j), "mistat_pa"}, null, null, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            if (query != null) {
                                query.close();
                            }
                            if (c != null) {
                                c.close();
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        cursor = query;
                        try {
                            j.a("DAO", "queryPaEventByTsImpl exception", (Throwable) e);
                            if (cursor != null) {
                                cursor.close();
                            }
                            if (c != null) {
                                kVar = c;
                                kVar.close();
                            }
                            return false;
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                                cursor.close();
                            }
                            if (c != null) {
                                c.close();
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (query != null) {
                    query.close();
                }
                if (c != null) {
                    kVar = c;
                    kVar.close();
                }
            } catch (Exception e3) {
                e = e3;
                j.a("DAO", "queryPaEventByTsImpl exception", (Throwable) e);
                if (cursor != null) {
                }
                if (c != null) {
                }
                return false;
            }
        }
    }
}

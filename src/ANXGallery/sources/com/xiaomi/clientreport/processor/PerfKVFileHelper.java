package com.xiaomi.clientreport.processor;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.clientreport.data.BaseClientReport;
import com.xiaomi.clientreport.data.PerfClientReport;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PerfKVFileHelper {
    private static PerfClientReport buildPerfClientReport(PerfClientReport perfClientReport, String str) {
        if (perfClientReport == null) {
            return null;
        }
        long[] parseValueStr = parseValueStr(str);
        if (parseValueStr == null) {
            return null;
        }
        perfClientReport.perfCounts = parseValueStr[0];
        perfClientReport.perfLatencies = parseValueStr[1];
        return perfClientReport;
    }

    /* JADX WARNING: type inference failed for: r0v3 */
    /* JADX WARNING: type inference failed for: r3v0, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r2v0, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v4, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v0 */
    /* JADX WARNING: type inference failed for: r3v1 */
    /* JADX WARNING: type inference failed for: r2v1 */
    /* JADX WARNING: type inference failed for: r0v5 */
    /* JADX WARNING: type inference failed for: r4v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v2, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v6, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r2v3 */
    /* JADX WARNING: type inference failed for: r4v2 */
    /* JADX WARNING: type inference failed for: r2v4 */
    /* JADX WARNING: type inference failed for: r2v5 */
    /* JADX WARNING: type inference failed for: r3v3 */
    /* JADX WARNING: type inference failed for: r2v6 */
    /* JADX WARNING: type inference failed for: r2v9 */
    /* JADX WARNING: type inference failed for: r2v10 */
    /* JADX WARNING: type inference failed for: r2v11, types: [java.io.RandomAccessFile, java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v3 */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v8, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r4v4 */
    /* JADX WARNING: type inference failed for: r0v7 */
    /* JADX WARNING: type inference failed for: r4v5 */
    /* JADX WARNING: type inference failed for: r4v6, types: [java.io.Closeable, java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r0v13 */
    /* JADX WARNING: type inference failed for: r0v14 */
    /* JADX WARNING: type inference failed for: r0v15 */
    /* JADX WARNING: type inference failed for: r0v16 */
    /* JADX WARNING: type inference failed for: r0v17 */
    /* JADX WARNING: type inference failed for: r3v9 */
    /* JADX WARNING: type inference failed for: r2v12 */
    /* JADX WARNING: type inference failed for: r4v7 */
    /* JADX WARNING: type inference failed for: r2v13 */
    /* JADX WARNING: type inference failed for: r2v14 */
    /* JADX WARNING: type inference failed for: r2v15 */
    /* JADX WARNING: type inference failed for: r2v16 */
    /* JADX WARNING: type inference failed for: r2v17 */
    /* JADX WARNING: type inference failed for: r2v18 */
    /* JADX WARNING: type inference failed for: r2v19 */
    /* JADX WARNING: type inference failed for: r2v20 */
    /* JADX WARNING: type inference failed for: r3v10 */
    /* JADX WARNING: type inference failed for: r3v11 */
    /* JADX WARNING: type inference failed for: r4v8 */
    /* JADX WARNING: type inference failed for: r4v9 */
    /* JADX WARNING: type inference failed for: r4v10 */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x00d3, code lost:
        if (r1 == null) goto L_0x00d8;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1
  assigns: []
  uses: []
  mth insns count: 119
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
    /* JADX WARNING: Removed duplicated region for block: B:79:0x00f4  */
    /* JADX WARNING: Unknown variable types count: 18 */
    public static List<String> extractToDatas(Context context, String str) {
        ? r3;
        ? r2;
        File file;
        ? r0;
        ? r4;
        ? r32;
        ? r22;
        ? r42;
        ? r23;
        ? r02;
        ? r24;
        ? r25;
        ? r26;
        ? r27;
        ? randomAccessFile;
        ? lock;
        ? r43;
        ArrayList arrayList = new ArrayList();
        if (TextUtils.isEmpty(str) || !new File(str).exists()) {
            return arrayList;
        }
        ? r03 = 0;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(".lock");
            file = new File(sb.toString());
            try {
                IOUtils.createFileQuietly(file);
                randomAccessFile = new RandomAccessFile(file, "rw");
            } catch (Exception e) {
                e = e;
                r25 = 0;
                r42 = r24;
                r02 = r03;
                r23 = r24;
                try {
                    MyLog.e((Throwable) e);
                    try {
                        r02.release();
                    } catch (IOException e2) {
                        MyLog.e((Throwable) e2);
                    }
                    IOUtils.closeQuietly(r23);
                    IOUtils.closeQuietly(r42);
                } catch (Throwable th) {
                    th = th;
                    r32 = r02;
                    r4 = r42;
                    r22 = r23;
                    r0 = r4;
                    r3 = r32;
                    r2 = r22;
                    try {
                        r3.release();
                    } catch (IOException e3) {
                        MyLog.e((Throwable) e3);
                    }
                    IOUtils.closeQuietly(r2);
                    IOUtils.closeQuietly(r0);
                    if (file != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                r27 = 0;
                r3 = r26;
                r0 = r03;
                r2 = r26;
                r3.release();
                IOUtils.closeQuietly(r2);
                IOUtils.closeQuietly(r0);
                if (file != null) {
                }
                throw th;
            }
            try {
                lock = randomAccessFile.getChannel().lock();
            } catch (Exception e4) {
                e = e4;
                r42 = 0;
                r02 = r03;
                r23 = randomAccessFile;
                MyLog.e((Throwable) e);
                r02.release();
                IOUtils.closeQuietly(r23);
                IOUtils.closeQuietly(r42);
            } catch (Throwable th3) {
                th = th3;
                r3 = 0;
                r0 = r03;
                r2 = randomAccessFile;
                r3.release();
                IOUtils.closeQuietly(r2);
                IOUtils.closeQuietly(r0);
                if (file != null) {
                }
                throw th;
            }
            try {
                ? bufferedReader = new BufferedReader(new FileReader(str));
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine == null) {
                            break;
                        }
                        String[] split = readLine.split("%%%");
                        if (split.length >= 2 && !TextUtils.isEmpty(split[0]) && !TextUtils.isEmpty(split[1])) {
                            PerfClientReport buildPerfClientReport = buildPerfClientReport(spiltKeyForModel(split[0]), split[1]);
                            if (buildPerfClientReport != null) {
                                arrayList.add(buildPerfClientReport.toJsonString());
                            }
                        }
                    } catch (Exception e5) {
                        e = e5;
                        r43 = bufferedReader;
                        r02 = lock;
                        r23 = randomAccessFile;
                        r42 = r43;
                        MyLog.e((Throwable) e);
                        r02.release();
                        IOUtils.closeQuietly(r23);
                        IOUtils.closeQuietly(r42);
                    } catch (Throwable th4) {
                        th = th4;
                        r22 = randomAccessFile;
                        r32 = lock;
                        r4 = bufferedReader;
                        r0 = r4;
                        r3 = r32;
                        r2 = r22;
                        r3.release();
                        IOUtils.closeQuietly(r2);
                        IOUtils.closeQuietly(r0);
                        if (file != null) {
                        }
                        throw th;
                    }
                }
                if (lock != 0 && lock.isValid()) {
                    try {
                        lock.release();
                    } catch (IOException e6) {
                        MyLog.e((Throwable) e6);
                    }
                }
                IOUtils.closeQuietly(randomAccessFile);
                IOUtils.closeQuietly(bufferedReader);
            } catch (Exception e7) {
                e = e7;
                r43 = 0;
                r02 = lock;
                r23 = randomAccessFile;
                r42 = r43;
                MyLog.e((Throwable) e);
                r02.release();
                IOUtils.closeQuietly(r23);
                IOUtils.closeQuietly(r42);
            } catch (Throwable th5) {
                th = th5;
                r0 = r03;
                r2 = randomAccessFile;
                r3 = lock;
                r3.release();
                IOUtils.closeQuietly(r2);
                IOUtils.closeQuietly(r0);
                if (file != null) {
                }
                throw th;
            }
        } catch (Exception e8) {
            e = e8;
            file = null;
            r25 = 0;
            r42 = r24;
            r02 = r03;
            r23 = r24;
            MyLog.e((Throwable) e);
            if (r02 != 0 && r02.isValid()) {
                r02.release();
            }
            IOUtils.closeQuietly(r23);
            IOUtils.closeQuietly(r42);
        } catch (Throwable th6) {
            th = th6;
            file = null;
            r27 = 0;
            r3 = r26;
            r0 = r03;
            r2 = r26;
            if (r3 != 0 && r3.isValid()) {
                r3.release();
            }
            IOUtils.closeQuietly(r2);
            IOUtils.closeQuietly(r0);
            if (file != null) {
                file.delete();
            }
            throw th;
        }
        file.delete();
        return arrayList;
    }

    public static String generateKey(PerfClientReport perfClientReport) {
        StringBuilder sb = new StringBuilder();
        sb.append(perfClientReport.production);
        sb.append("#");
        sb.append(perfClientReport.clientInterfaceId);
        sb.append("#");
        sb.append(perfClientReport.reportType);
        sb.append("#");
        sb.append(perfClientReport.code);
        return sb.toString();
    }

    protected static long[] parseValueStr(String str) {
        long[] jArr = new long[2];
        try {
            String[] split = str.split("#");
            if (split.length >= 2) {
                jArr[0] = Long.parseLong(split[0].trim());
                jArr[1] = Long.parseLong(split[1].trim());
            }
            return jArr;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return null;
        }
    }

    public static void put(String str, BaseClientReport[] baseClientReportArr) {
        RandomAccessFile randomAccessFile;
        FileLock lock;
        if (baseClientReportArr != null && baseClientReportArr.length > 0 && !TextUtils.isEmpty(str)) {
            FileLock fileLock = null;
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(".lock");
                File file = new File(sb.toString());
                IOUtils.createFileQuietly(file);
                randomAccessFile = new RandomAccessFile(file, "rw");
                try {
                    lock = randomAccessFile.getChannel().lock();
                } catch (Throwable unused) {
                    try {
                        MyLog.v("failed to write perf to file ");
                        try {
                            fileLock.release();
                        } catch (IOException e) {
                            e = e;
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                    } catch (Throwable th) {
                        th = th;
                        try {
                            fileLock.release();
                        } catch (IOException e2) {
                            MyLog.e((Throwable) e2);
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                }
                try {
                    HashMap readFromFile = readFromFile(str);
                    for (PerfClientReport perfClientReport : baseClientReportArr) {
                        if (perfClientReport != null) {
                            String generateKey = generateKey(perfClientReport);
                            long j = perfClientReport.perfCounts;
                            long j2 = perfClientReport.perfLatencies;
                            if (!TextUtils.isEmpty(generateKey) && j > 0) {
                                if (j2 >= 0) {
                                    putInMemeory(readFromFile, generateKey, j, j2);
                                }
                            }
                        }
                    }
                    writeToFile(str, readFromFile);
                    if (lock != null && lock.isValid()) {
                        try {
                            lock.release();
                        } catch (IOException e3) {
                            e = e3;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileLock = lock;
                    fileLock.release();
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                randomAccessFile = null;
                if (fileLock != null && fileLock.isValid()) {
                    fileLock.release();
                }
                IOUtils.closeQuietly(randomAccessFile);
                throw th;
            }
            IOUtils.closeQuietly(randomAccessFile);
        }
        return;
        MyLog.e((Throwable) e);
        IOUtils.closeQuietly(randomAccessFile);
    }

    private static void putInMemeory(HashMap<String, String> hashMap, String str, long j, long j2) {
        String str2;
        String str3 = (String) hashMap.get(str);
        if (TextUtils.isEmpty(str3)) {
            StringBuilder sb = new StringBuilder();
            sb.append(j);
            sb.append("#");
            sb.append(j2);
            hashMap.put(str, sb.toString());
            return;
        }
        long[] parseValueStr = parseValueStr(str3);
        if (parseValueStr == null || parseValueStr[0] <= 0 || parseValueStr[1] < 0) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(j);
            sb2.append("#");
            sb2.append(j2);
            str2 = sb2.toString();
        } else {
            long j3 = j + parseValueStr[0];
            long j4 = j2 + parseValueStr[1];
            StringBuilder sb3 = new StringBuilder();
            sb3.append(j3);
            sb3.append("#");
            sb3.append(j4);
            str2 = sb3.toString();
        }
        hashMap.put(str, str2);
    }

    private static HashMap<String, String> readFromFile(String str) {
        HashMap<String, String> hashMap = new HashMap<>();
        if (TextUtils.isEmpty(str) || !new File(str).exists()) {
            return hashMap;
        }
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(str));
            while (true) {
                try {
                    String readLine = bufferedReader2.readLine();
                    if (readLine == null) {
                        break;
                    }
                    String[] split = readLine.split("%%%");
                    if (split.length >= 2 && !TextUtils.isEmpty(split[0]) && !TextUtils.isEmpty(split[1])) {
                        hashMap.put(split[0], split[1]);
                    }
                } catch (Exception e) {
                    e = e;
                    bufferedReader = bufferedReader2;
                    try {
                        MyLog.e((Throwable) e);
                        IOUtils.closeQuietly(bufferedReader);
                        return hashMap;
                    } catch (Throwable th) {
                        th = th;
                        bufferedReader2 = bufferedReader;
                        IOUtils.closeQuietly(bufferedReader2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    IOUtils.closeQuietly(bufferedReader2);
                    throw th;
                }
            }
            IOUtils.closeQuietly(bufferedReader2);
        } catch (Exception e2) {
            e = e2;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(bufferedReader);
            return hashMap;
        }
        return hashMap;
    }

    private static String[] spiltKey(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return str.split("#");
    }

    private static PerfClientReport spiltKeyForModel(String str) {
        PerfClientReport perfClientReport = null;
        try {
            String[] spiltKey = spiltKey(str);
            if (spiltKey == null || spiltKey.length < 4 || TextUtils.isEmpty(spiltKey[0]) || TextUtils.isEmpty(spiltKey[1]) || TextUtils.isEmpty(spiltKey[2]) || TextUtils.isEmpty(spiltKey[3])) {
                return null;
            }
            PerfClientReport blankInstance = PerfClientReport.getBlankInstance();
            try {
                blankInstance.production = Integer.parseInt(spiltKey[0]);
                blankInstance.clientInterfaceId = spiltKey[1];
                blankInstance.reportType = Integer.parseInt(spiltKey[2]);
                blankInstance.code = Integer.parseInt(spiltKey[3]);
                return blankInstance;
            } catch (Exception unused) {
                perfClientReport = blankInstance;
                MyLog.v("parse per key error");
                return perfClientReport;
            }
        } catch (Exception unused2) {
            MyLog.v("parse per key error");
            return perfClientReport;
        }
    }

    private static void writeToFile(String str, HashMap<String, String> hashMap) {
        BufferedWriter bufferedWriter;
        Exception e;
        if (!TextUtils.isEmpty(str) && hashMap != null && hashMap.size() != 0) {
            File file = new File(str);
            if (file.exists()) {
                file.delete();
            }
            try {
                bufferedWriter = new BufferedWriter(new FileWriter(file));
                try {
                    for (String str2 : hashMap.keySet()) {
                        String str3 = (String) hashMap.get(str2);
                        StringBuilder sb = new StringBuilder();
                        sb.append(str2);
                        sb.append("%%%");
                        sb.append(str3);
                        bufferedWriter.write(sb.toString());
                        bufferedWriter.newLine();
                    }
                } catch (Exception e2) {
                    e = e2;
                    try {
                        MyLog.e((Throwable) e);
                        IOUtils.closeQuietly(bufferedWriter);
                    } catch (Throwable th) {
                        th = th;
                        IOUtils.closeQuietly(bufferedWriter);
                        throw th;
                    }
                }
            } catch (Exception e3) {
                bufferedWriter = null;
                e = e3;
                MyLog.e((Throwable) e);
                IOUtils.closeQuietly(bufferedWriter);
            } catch (Throwable th2) {
                bufferedWriter = null;
                th = th2;
                IOUtils.closeQuietly(bufferedWriter);
                throw th;
            }
            IOUtils.closeQuietly(bufferedWriter);
        }
    }
}

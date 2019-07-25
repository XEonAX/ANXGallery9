package com.xiaomi.push.log;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.xiaomi.channel.commonutils.file.SDCardUtils;
import com.xiaomi.channel.commonutils.logger.LoggerInterface;
import com.xiaomi.channel.commonutils.misc.SerializedAsyncTaskProcessor;
import com.xiaomi.channel.commonutils.misc.SerializedAsyncTaskProcessor.SerializedAsyncTask;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class MIPushLog2File implements LoggerInterface {
    public static String MIPUSH_LOG_PATH = "/MiPushLog";
    private static final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss aaa");
    /* access modifiers changed from: private */
    public static List<Pair<String, Throwable>> logs = Collections.synchronizedList(new ArrayList());
    private static SerializedAsyncTaskProcessor mAsyncProcessor = new SerializedAsyncTaskProcessor(true);
    private String mSDCardRootPath = "";
    /* access modifiers changed from: private */
    public String mTag;
    private Context sAppContext;

    public MIPushLog2File(Context context) {
        this.sAppContext = context;
        if (context.getApplicationContext() != null) {
            this.sAppContext = context.getApplicationContext();
        }
        this.mTag = this.sAppContext.getPackageName();
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [java.io.BufferedWriter, java.lang.String] */
    /* JADX WARNING: type inference failed for: r3v0, types: [java.io.RandomAccessFile] */
    /* JADX WARNING: type inference failed for: r2v0, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r0v1, types: [java.io.BufferedWriter] */
    /* JADX WARNING: type inference failed for: r3v2, types: [java.io.RandomAccessFile] */
    /* JADX WARNING: type inference failed for: r2v4, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r0v7, types: [java.io.BufferedWriter] */
    /* JADX WARNING: type inference failed for: r2v6 */
    /* JADX WARNING: type inference failed for: r3v3 */
    /* JADX WARNING: type inference failed for: r2v7 */
    /* JADX WARNING: type inference failed for: r3v4 */
    /* JADX WARNING: type inference failed for: r3v9, types: [java.io.RandomAccessFile] */
    /* JADX WARNING: type inference failed for: r2v12 */
    /* JADX WARNING: type inference failed for: r2v13 */
    /* JADX WARNING: type inference failed for: r2v15, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r4v5, types: [java.io.BufferedWriter] */
    /* JADX WARNING: type inference failed for: r0v11 */
    /* JADX WARNING: type inference failed for: r0v12 */
    /* JADX WARNING: type inference failed for: r0v16 */
    /* JADX WARNING: type inference failed for: r0v17 */
    /* JADX WARNING: type inference failed for: r0v18 */
    /* JADX WARNING: type inference failed for: r0v19 */
    /* JADX WARNING: type inference failed for: r0v20 */
    /* JADX WARNING: type inference failed for: r3v11 */
    /* JADX WARNING: type inference failed for: r2v21 */
    /* JADX WARNING: type inference failed for: r0v21 */
    /* JADX WARNING: type inference failed for: r2v22 */
    /* JADX WARNING: type inference failed for: r2v23 */
    /* JADX WARNING: type inference failed for: r3v12 */
    /* JADX WARNING: type inference failed for: r3v13 */
    /* JADX WARNING: type inference failed for: r3v14 */
    /* JADX WARNING: type inference failed for: r3v15 */
    /* JADX WARNING: type inference failed for: r3v16 */
    /* JADX WARNING: type inference failed for: r2v24 */
    /* JADX WARNING: type inference failed for: r2v25 */
    /* JADX WARNING: type inference failed for: r2v26 */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [java.io.BufferedWriter, java.lang.String]
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY]]
  uses: [?[OBJECT, ARRAY], ?[int, boolean, OBJECT, ARRAY, byte, short, char], java.io.BufferedWriter, java.lang.String]
  mth insns count: 186
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
    /* JADX WARNING: Removed duplicated region for block: B:103:0x01b5 A[SYNTHETIC, Splitter:B:103:0x01b5] */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x0161 A[SYNTHETIC, Splitter:B:72:0x0161] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x0183 A[SYNTHETIC, Splitter:B:84:0x0183] */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0193 A[SYNTHETIC, Splitter:B:91:0x0193] */
    /* JADX WARNING: Unknown variable types count: 12 */
    public void writeLog2File() {
        ? r3;
        ? r2;
        ? r0;
        ? r32;
        ? r22;
        ? r02;
        ? r03 = 0;
        try {
            if (TextUtils.isEmpty(this.mSDCardRootPath)) {
                File externalFilesDir = this.sAppContext.getExternalFilesDir(r03);
                if (externalFilesDir != null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(externalFilesDir.getAbsolutePath());
                    sb.append("");
                    this.mSDCardRootPath = sb.toString();
                }
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.mSDCardRootPath);
            sb2.append(MIPUSH_LOG_PATH);
            File file = new File(sb2.toString());
            if ((!file.exists() || !file.isDirectory()) && !file.mkdirs()) {
                Log.w(this.mTag, "Create mipushlog directory fail.");
                return;
            }
            File file2 = new File(file, "log.lock");
            if (!file2.exists() || file2.isDirectory()) {
                file2.createNewFile();
            }
            ? randomAccessFile = new RandomAccessFile(file2, "rw");
            try {
                ? lock = randomAccessFile.getChannel().lock();
                try {
                    ? bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(file, "log1.txt"), true)));
                    while (!logs.isEmpty()) {
                        try {
                            Pair pair = (Pair) logs.remove(0);
                            String str = (String) pair.first;
                            if (pair.second != null) {
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append(str);
                                sb3.append("\n");
                                String sb4 = sb3.toString();
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append(sb4);
                                sb5.append(Log.getStackTraceString((Throwable) pair.second));
                                str = sb5.toString();
                            }
                            StringBuilder sb6 = new StringBuilder();
                            sb6.append(str);
                            sb6.append("\n");
                            bufferedWriter.write(sb6.toString());
                        } catch (Exception e) {
                            e = e;
                            r02 = bufferedWriter;
                            r32 = randomAccessFile;
                            r22 = lock;
                            try {
                                Log.e(this.mTag, "", e);
                                if (r02 != 0) {
                                }
                                try {
                                    r22.release();
                                } catch (IOException e2) {
                                    Log.e(this.mTag, "", e2);
                                }
                                if (r32 != 0) {
                                }
                            } catch (Throwable th) {
                                th = th;
                                r3 = r32;
                                r2 = r22;
                                r0 = r02;
                                if (r0 != 0) {
                                    try {
                                        r0.close();
                                    } catch (IOException e3) {
                                        Log.e(this.mTag, "", e3);
                                    }
                                }
                                if (r2 != 0 && r2.isValid()) {
                                    try {
                                        r2.release();
                                    } catch (IOException e4) {
                                        Log.e(this.mTag, "", e4);
                                    }
                                }
                                if (r3 != 0) {
                                    try {
                                        r3.close();
                                    } catch (IOException e5) {
                                        Log.e(this.mTag, "", e5);
                                    }
                                }
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            r0 = bufferedWriter;
                            r3 = randomAccessFile;
                            r2 = lock;
                            if (r0 != 0) {
                            }
                            r2.release();
                            if (r3 != 0) {
                            }
                            throw th;
                        }
                    }
                    bufferedWriter.flush();
                    bufferedWriter.close();
                    File file3 = new File(file, "log1.txt");
                    if (file3.length() >= 1048576) {
                        File file4 = new File(file, "log0.txt");
                        if (file4.exists() && file4.isFile()) {
                            file4.delete();
                        }
                        file3.renameTo(file4);
                    }
                    if (r03 != 0) {
                        try {
                            r03.close();
                        } catch (IOException e6) {
                            Log.e(this.mTag, "", e6);
                        }
                    }
                    if (lock != 0 && lock.isValid()) {
                        try {
                            lock.release();
                        } catch (IOException e7) {
                            Log.e(this.mTag, "", e7);
                        }
                    }
                } catch (Exception e8) {
                    e = e8;
                    r02 = r03;
                    r32 = randomAccessFile;
                    r22 = lock;
                    Log.e(this.mTag, "", e);
                    if (r02 != 0) {
                    }
                    r22.release();
                    if (r32 != 0) {
                    }
                }
                try {
                    randomAccessFile.close();
                } catch (IOException e9) {
                    Log.e(this.mTag, "", e9);
                }
            } catch (Exception e10) {
                e = e10;
                r22 = r03;
                r02 = r03;
                r32 = randomAccessFile;
                Log.e(this.mTag, "", e);
                if (r02 != 0) {
                    try {
                        r02.close();
                    } catch (IOException e11) {
                        Log.e(this.mTag, "", e11);
                    }
                }
                if (r22 != 0 && r22.isValid()) {
                    r22.release();
                }
                if (r32 != 0) {
                    r32.close();
                }
            } catch (Throwable th3) {
                th = th3;
                r2 = r03;
                r0 = r03;
                r3 = randomAccessFile;
                if (r0 != 0) {
                }
                r2.release();
                if (r3 != 0) {
                }
                throw th;
            }
        } catch (Exception e12) {
            e = e12;
            ? r23 = r03;
            r32 = r23;
            r02 = r03;
            r22 = r23;
            Log.e(this.mTag, "", e);
            if (r02 != 0) {
            }
            r22.release();
            if (r32 != 0) {
            }
        } catch (Throwable th4) {
            th = th4;
            ? r24 = r03;
            r3 = r24;
            r0 = r03;
            r2 = r24;
            if (r0 != 0) {
            }
            r2.release();
            if (r3 != 0) {
            }
            throw th;
        }
    }

    public final void log(String str) {
        log(str, null);
    }

    public final void log(String str, Throwable th) {
        logs.add(new Pair(String.format("%1$s %2$s %3$s ", new Object[]{dateFormatter.format(new Date()), this.mTag, str}), th));
        mAsyncProcessor.addNewTask(new SerializedAsyncTask() {
            public void process() {
                if (!MIPushLog2File.logs.isEmpty()) {
                    try {
                        if (!SDCardUtils.isSDCardUseful()) {
                            Log.w(MIPushLog2File.this.mTag, "SDCard is unavailable.");
                        } else {
                            MIPushLog2File.this.writeLog2File();
                        }
                    } catch (Exception e) {
                        Log.e(MIPushLog2File.this.mTag, "", e);
                    }
                }
            }
        });
    }
}

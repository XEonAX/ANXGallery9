package com.xiaomi.push.log;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import com.nexstreaming.nexeditorsdk.nexEngine;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.network.HostManager;
import com.xiaomi.push.service.ServiceConfig;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class LogFilter {
    private static String MIPUSH_LOG_PATH = "/MiPushLog";
    @SuppressLint({"SimpleDateFormat"})
    private final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private int mCurrentLen;
    private String mEndTime;
    private ArrayList<File> mFiles = new ArrayList<>();
    private String mFromTime;
    private int mMaxLen = nexEngine.ExportHEVCHighTierLevel6;
    private boolean mStartFound;

    LogFilter() {
    }

    private void doFilter(BufferedReader bufferedReader, BufferedWriter bufferedWriter, Pattern pattern) throws IOException {
        char[] cArr = new char[4096];
        int read = bufferedReader.read(cArr);
        boolean z = false;
        while (read != -1 && !z) {
            String str = new String(cArr, 0, read);
            Matcher matcher = pattern.matcher(str);
            int i = 0;
            int i2 = 0;
            while (true) {
                if (i >= read || !matcher.find(i)) {
                    break;
                }
                int start = matcher.start();
                String substring = str.substring(start, this.mFromTime.length() + start);
                if (this.mStartFound) {
                    if (substring.compareTo(this.mEndTime) > 0) {
                        read = start;
                        z = true;
                        break;
                    }
                } else if (substring.compareTo(this.mFromTime) >= 0) {
                    this.mStartFound = true;
                    i2 = start;
                }
                int indexOf = str.indexOf(10, start);
                i = indexOf != -1 ? start + indexOf : start + this.mFromTime.length();
            }
            if (this.mStartFound) {
                int i3 = read - i2;
                this.mCurrentLen += i3;
                if (z) {
                    bufferedWriter.write(cArr, i2, i3);
                    return;
                }
                bufferedWriter.write(cArr, i2, i3);
                if (this.mCurrentLen > this.mMaxLen) {
                    return;
                }
            }
            read = bufferedReader.read(cArr);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0 */
    /* JADX WARNING: type inference failed for: r2v0, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r1v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v0 */
    /* JADX WARNING: type inference failed for: r2v1 */
    /* JADX WARNING: type inference failed for: r1v2 */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* JADX WARNING: type inference failed for: r2v2 */
    /* JADX WARNING: type inference failed for: r4v2, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r1v4, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v3 */
    /* JADX WARNING: type inference failed for: r1v5 */
    /* JADX WARNING: type inference failed for: r4v4 */
    /* JADX WARNING: type inference failed for: r4v5 */
    /* JADX WARNING: type inference failed for: r1v6 */
    /* JADX WARNING: type inference failed for: r4v6 */
    /* JADX WARNING: type inference failed for: r2v5 */
    /* JADX WARNING: type inference failed for: r2v6, types: [java.io.BufferedWriter, java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v8 */
    /* JADX WARNING: type inference failed for: r1v7 */
    /* JADX WARNING: type inference failed for: r1v8 */
    /* JADX WARNING: type inference failed for: r4v9 */
    /* JADX WARNING: type inference failed for: r4v10 */
    /* JADX WARNING: type inference failed for: r1v9 */
    /* JADX WARNING: type inference failed for: r1v10 */
    /* JADX WARNING: type inference failed for: r4v11 */
    /* JADX WARNING: type inference failed for: r1v11 */
    /* JADX WARNING: type inference failed for: r1v12, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v12, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r1v13 */
    /* JADX WARNING: type inference failed for: r1v14 */
    /* JADX WARNING: type inference failed for: r1v15 */
    /* JADX WARNING: type inference failed for: r1v16 */
    /* JADX WARNING: type inference failed for: r1v17 */
    /* JADX WARNING: type inference failed for: r1v18 */
    /* JADX WARNING: type inference failed for: r1v19 */
    /* JADX WARNING: type inference failed for: r1v20 */
    /* JADX WARNING: type inference failed for: r1v21 */
    /* JADX WARNING: type inference failed for: r2v7 */
    /* JADX WARNING: type inference failed for: r4v13 */
    /* JADX WARNING: type inference failed for: r1v22 */
    /* JADX WARNING: type inference failed for: r4v14 */
    /* JADX WARNING: type inference failed for: r4v15 */
    /* JADX WARNING: type inference failed for: r1v23 */
    /* JADX WARNING: type inference failed for: r1v24 */
    /* JADX WARNING: type inference failed for: r2v8 */
    /* JADX WARNING: type inference failed for: r2v9 */
    /* JADX WARNING: type inference failed for: r4v16 */
    /* JADX WARNING: type inference failed for: r4v17 */
    /* JADX WARNING: type inference failed for: r1v25 */
    /* JADX WARNING: type inference failed for: r1v26 */
    /* JADX WARNING: type inference failed for: r1v27 */
    /* JADX WARNING: type inference failed for: r1v28 */
    /* JADX WARNING: type inference failed for: r1v29 */
    /* JADX WARNING: type inference failed for: r1v30 */
    /* JADX WARNING: type inference failed for: r1v31 */
    /* JADX WARNING: type inference failed for: r4v18 */
    /* JADX WARNING: type inference failed for: r4v19 */
    /* JADX WARNING: type inference failed for: r4v20 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1
  assigns: []
  uses: []
  mth insns count: 123
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 22 */
    private void filter2File(File file) {
        ? r2;
        ? r1;
        ? r4;
        ? r22;
        ? r12;
        ? r42;
        ? r13;
        ? r43;
        ? r14;
        ? r44;
        ? r15;
        ? r45;
        ? r16;
        ? r17;
        ? r46;
        ? r18;
        ? r19;
        ? r110;
        Pattern compile = Pattern.compile("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}");
        ? r111 = 0;
        try {
            r12 = r111;
            ? bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)));
            try {
                r17 = r111;
                r18 = r111;
                r19 = r111;
                StringBuilder sb = new StringBuilder();
                sb.append("model :");
                sb.append(Build.MODEL);
                sb.append("; os :");
                sb.append(VERSION.INCREMENTAL);
                sb.append("; uid :");
                sb.append(ServiceConfig.getDeviceUUID());
                sb.append("; lng :");
                sb.append(Locale.getDefault().toString());
                sb.append("; sdk :");
                sb.append(38);
                sb.append("; andver :");
                sb.append(VERSION.SDK_INT);
                sb.append("\n");
                bufferedWriter.write(sb.toString());
                this.mCurrentLen = 0;
                Iterator it = this.mFiles.iterator();
                ? r112 = r111;
                while (it.hasNext()) {
                    ? bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream((File) it.next())));
                    try {
                        doFilter(bufferedReader, bufferedWriter, compile);
                        bufferedReader.close();
                        r112 = bufferedReader;
                    } catch (FileNotFoundException e) {
                        e = e;
                        r45 = bufferedReader;
                        r16 = bufferedWriter;
                        r43 = r45;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("LOG: filter error = ");
                        sb2.append(e.getMessage());
                        MyLog.v(sb2.toString());
                        r42 = r43;
                        r13 = r14;
                        IOUtils.closeQuietly(r13);
                        IOUtils.closeQuietly(r42);
                    } catch (IOException e2) {
                        e = e2;
                        r46 = bufferedReader;
                        r14 = bufferedWriter;
                        r44 = r46;
                        r12 = r15;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("LOG: filter error = ");
                        sb3.append(e.getMessage());
                        MyLog.v(sb3.toString());
                        r42 = r44;
                        r13 = r15;
                        IOUtils.closeQuietly(r13);
                        IOUtils.closeQuietly(r42);
                    } catch (Throwable th) {
                        th = th;
                        r22 = bufferedWriter;
                        r4 = bufferedReader;
                        r1 = r4;
                        r2 = r22;
                        IOUtils.closeQuietly(r2);
                        IOUtils.closeQuietly(r1);
                        throw th;
                    }
                }
                r17 = r110;
                r18 = r110;
                r19 = r110;
                bufferedWriter.write(HostManager.getInstance().dump());
                r17 = r110;
                r18 = r110;
                r19 = r110;
                IOUtils.closeQuietly(bufferedWriter);
                IOUtils.closeQuietly(r110);
            } catch (FileNotFoundException e3) {
                e = e3;
                r45 = r17;
                r16 = bufferedWriter;
                r43 = r45;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("LOG: filter error = ");
                sb22.append(e.getMessage());
                MyLog.v(sb22.toString());
                r42 = r43;
                r13 = r14;
                IOUtils.closeQuietly(r13);
                IOUtils.closeQuietly(r42);
            } catch (IOException e4) {
                e = e4;
                r46 = r18;
                r14 = bufferedWriter;
                r44 = r46;
                r12 = r15;
                StringBuilder sb32 = new StringBuilder();
                sb32.append("LOG: filter error = ");
                sb32.append(e.getMessage());
                MyLog.v(sb32.toString());
                r42 = r44;
                r13 = r15;
                IOUtils.closeQuietly(r13);
                IOUtils.closeQuietly(r42);
            } catch (Throwable th2) {
                th = th2;
                r2 = bufferedWriter;
                r1 = r19;
                IOUtils.closeQuietly(r2);
                IOUtils.closeQuietly(r1);
                throw th;
            }
        } catch (FileNotFoundException e5) {
            e = e5;
            r43 = 0;
            r16 = r111;
            StringBuilder sb222 = new StringBuilder();
            sb222.append("LOG: filter error = ");
            sb222.append(e.getMessage());
            MyLog.v(sb222.toString());
            r42 = r43;
            r13 = r14;
            IOUtils.closeQuietly(r13);
            IOUtils.closeQuietly(r42);
        } catch (IOException e6) {
            e = e6;
            r44 = 0;
            r14 = r111;
            r12 = r15;
            StringBuilder sb322 = new StringBuilder();
            sb322.append("LOG: filter error = ");
            sb322.append(e.getMessage());
            MyLog.v(sb322.toString());
            r42 = r44;
            r13 = r15;
            IOUtils.closeQuietly(r13);
            IOUtils.closeQuietly(r42);
        } catch (Throwable th3) {
            th = th3;
            r22 = r12;
            r4 = r44;
            r1 = r4;
            r2 = r22;
            IOUtils.closeQuietly(r2);
            IOUtils.closeQuietly(r1);
            throw th;
        }
    }

    /* access modifiers changed from: 0000 */
    public LogFilter addFile(File file) {
        if (file.exists()) {
            this.mFiles.add(file);
        }
        return this;
    }

    /* access modifiers changed from: 0000 */
    public File filter(Context context, Date date, Date date2, File file) {
        File file2;
        if ("com.xiaomi.xmsf".equalsIgnoreCase(context.getPackageName())) {
            file2 = context.getFilesDir();
            addFile(new File(file2, "xmsf.log.1"));
            addFile(new File(file2, "xmsf.log"));
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(context.getExternalFilesDir(null));
            sb.append(MIPUSH_LOG_PATH);
            File file3 = new File(sb.toString());
            addFile(new File(file3, "log0.txt"));
            addFile(new File(file3, "log1.txt"));
            file2 = file3;
        }
        if (!file2.isDirectory()) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(date.getTime());
        sb2.append("-");
        sb2.append(date2.getTime());
        sb2.append(".zip");
        File file4 = new File(file, sb2.toString());
        if (file4.exists()) {
            return null;
        }
        setRange(date, date2);
        long currentTimeMillis = System.currentTimeMillis();
        File file5 = new File(file, "log.txt");
        filter2File(file5);
        StringBuilder sb3 = new StringBuilder();
        sb3.append("LOG: filter cost = ");
        sb3.append(System.currentTimeMillis() - currentTimeMillis);
        MyLog.v(sb3.toString());
        if (file5.exists()) {
            long currentTimeMillis2 = System.currentTimeMillis();
            IOUtils.zip(file4, file5);
            StringBuilder sb4 = new StringBuilder();
            sb4.append("LOG: zip cost = ");
            sb4.append(System.currentTimeMillis() - currentTimeMillis2);
            MyLog.v(sb4.toString());
            file5.delete();
            if (file4.exists()) {
                return file4;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public void setMaxLen(int i) {
        if (i != 0) {
            this.mMaxLen = i;
        }
    }

    /* access modifiers changed from: 0000 */
    public LogFilter setRange(Date date, Date date2) {
        if (date.after(date2)) {
            this.mFromTime = this.dateFormatter.format(date2);
            this.mEndTime = this.dateFormatter.format(date);
        } else {
            this.mFromTime = this.dateFormatter.format(date);
            this.mEndTime = this.dateFormatter.format(date2);
        }
        return this;
    }
}

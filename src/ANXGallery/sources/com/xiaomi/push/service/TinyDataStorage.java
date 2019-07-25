package com.xiaomi.push.service;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.DataCryptUtils;
import com.xiaomi.channel.commonutils.android.SharedPreferenceManager;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ByteUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.string.Base64Coder;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.Arrays;

public class TinyDataStorage {
    public static final Object mTinyDataLock4Thread = new Object();

    public static void cacheTinyData(final Context context, final ClientUploadDataItem clientUploadDataItem) {
        if (TinyDataHelper.shouldUpload(clientUploadDataItem.getPkgName())) {
            StringBuilder sb = new StringBuilder();
            sb.append("TinyData TinyDataStorage.cacheTinyData cache data to file begin item:");
            sb.append(clientUploadDataItem.getId());
            sb.append("  ts:");
            sb.append(System.currentTimeMillis());
            MyLog.w(sb.toString());
            ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
                /* JADX WARNING: Removed duplicated region for block: B:31:0x0054 A[SYNTHETIC, Splitter:B:31:0x0054] */
                public void run() {
                    RandomAccessFile randomAccessFile;
                    FileLock lock;
                    synchronized (TinyDataStorage.mTinyDataLock4Thread) {
                        FileLock fileLock = null;
                        try {
                            File file = new File(context.getFilesDir(), "tiny_data.lock");
                            IOUtils.createFileQuietly(file);
                            randomAccessFile = new RandomAccessFile(file, "rw");
                            try {
                                lock = randomAccessFile.getChannel().lock();
                            } catch (Exception e) {
                                e = e;
                                try {
                                    MyLog.e((Throwable) e);
                                    if (fileLock != null) {
                                    }
                                    IOUtils.closeQuietly(randomAccessFile);
                                } catch (Throwable th) {
                                    th = th;
                                    if (fileLock != null && fileLock.isValid()) {
                                        try {
                                            fileLock.release();
                                        } catch (IOException e2) {
                                            MyLog.e((Throwable) e2);
                                        }
                                    }
                                    IOUtils.closeQuietly(randomAccessFile);
                                    throw th;
                                }
                            }
                            try {
                                TinyDataStorage.writeTinyData2File(context, clientUploadDataItem);
                                if (lock != null) {
                                    try {
                                        if (lock.isValid()) {
                                            lock.release();
                                        }
                                    } catch (IOException e3) {
                                        MyLog.e((Throwable) e3);
                                    } catch (Throwable th2) {
                                        throw th2;
                                    }
                                }
                            } catch (Exception e4) {
                                FileLock fileLock2 = lock;
                                e = e4;
                                fileLock = fileLock2;
                                MyLog.e((Throwable) e);
                                if (fileLock != null) {
                                    if (fileLock.isValid()) {
                                        try {
                                            fileLock.release();
                                        } catch (IOException e5) {
                                            MyLog.e((Throwable) e5);
                                        }
                                    }
                                }
                                IOUtils.closeQuietly(randomAccessFile);
                            } catch (Throwable th3) {
                                FileLock fileLock3 = lock;
                                th = th3;
                                fileLock = fileLock3;
                                fileLock.release();
                                IOUtils.closeQuietly(randomAccessFile);
                                throw th;
                            }
                        } catch (Exception e6) {
                            e = e6;
                            randomAccessFile = null;
                            MyLog.e((Throwable) e);
                            if (fileLock != null) {
                            }
                            IOUtils.closeQuietly(randomAccessFile);
                        } catch (Throwable th4) {
                            th = th4;
                            randomAccessFile = null;
                            fileLock.release();
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                    }
                }
            });
        }
    }

    public static byte[] getTinyDataKeyWithDefault(Context context) {
        String stringValue = SharedPreferenceManager.getInstance(context).getStringValue("mipush", "td_key", "");
        if (TextUtils.isEmpty(stringValue)) {
            stringValue = XMStringUtils.generateRandomString(20);
            SharedPreferenceManager.getInstance(context).setStringnValue("mipush", "td_key", stringValue);
        }
        return parseKey(stringValue);
    }

    private static byte[] parseKey(String str) {
        byte[] copyOf = Arrays.copyOf(Base64Coder.decode(str), 16);
        copyOf[0] = 68;
        copyOf[15] = 84;
        return copyOf;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [byte[]] */
    /* JADX WARNING: type inference failed for: r0v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v2 */
    /* JADX WARNING: type inference failed for: r0v3, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v4 */
    /* JADX WARNING: type inference failed for: r0v5 */
    /* JADX WARNING: type inference failed for: r0v6 */
    /* JADX WARNING: type inference failed for: r0v7 */
    /* JADX WARNING: type inference failed for: r0v8 */
    /* JADX WARNING: type inference failed for: r6v11, types: [java.io.Closeable, java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r0v14 */
    /* JADX WARNING: type inference failed for: r0v16 */
    /* JADX WARNING: type inference failed for: r0v17 */
    /* JADX WARNING: type inference failed for: r0v23 */
    /* JADX WARNING: type inference failed for: r0v24 */
    /* JADX WARNING: type inference failed for: r0v25 */
    /* JADX WARNING: type inference failed for: r0v26 */
    /* JADX WARNING: type inference failed for: r0v27 */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2
  assigns: []
  uses: []
  mth insns count: 104
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
    /* JADX WARNING: Unknown variable types count: 8 */
    public static void writeTinyData2File(Context context, ClientUploadDataItem clientUploadDataItem) {
        ? r0;
        ? r02;
        ? r03;
        ? r04;
        ? r05;
        ? r06;
        ? tinyDataKeyWithDefault = getTinyDataKeyWithDefault(context);
        try {
            r02 = tinyDataKeyWithDefault;
            byte[] mipushEncrypt = DataCryptUtils.mipushEncrypt(tinyDataKeyWithDefault, XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadDataItem));
            if (mipushEncrypt != null) {
                if (mipushEncrypt.length >= 1) {
                    if (mipushEncrypt.length > 10240) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("TinyData write to cache file failed case too much data content item:");
                        sb.append(clientUploadDataItem.getId());
                        sb.append("  ts:");
                        sb.append(System.currentTimeMillis());
                        MyLog.w(sb.toString());
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(null);
                        return;
                    }
                    ? bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(new File(context.getFilesDir(), "tiny_data.data"), true));
                    try {
                        bufferedOutputStream.write(ByteUtils.parseInt(mipushEncrypt.length));
                        bufferedOutputStream.write(mipushEncrypt);
                        bufferedOutputStream.flush();
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("TinyData write to cache file success item:");
                        sb2.append(clientUploadDataItem.getId());
                        sb2.append("  ts:");
                        sb2.append(System.currentTimeMillis());
                        MyLog.w(sb2.toString());
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(bufferedOutputStream);
                    } catch (IOException e) {
                        Throwable th = e;
                        r05 = bufferedOutputStream;
                        e = th;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("TinyData write to cache file failed cause io exception item:");
                        sb3.append(clientUploadDataItem.getId());
                        MyLog.e(sb3.toString(), e);
                        r03 = r04;
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(r03);
                    } catch (Exception e2) {
                        Throwable th2 = e2;
                        tinyDataKeyWithDefault = bufferedOutputStream;
                        e = th2;
                        r02 = r06;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("TinyData write to cache file  failed item:");
                        sb4.append(clientUploadDataItem.getId());
                        MyLog.e(sb4.toString(), e);
                        r03 = r06;
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(r03);
                    } catch (Throwable th3) {
                        r0 = bufferedOutputStream;
                        th = th3;
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(r0);
                        throw th;
                    }
                }
            }
            StringBuilder sb5 = new StringBuilder();
            sb5.append("TinyData write to cache file failed case encryption fail item:");
            sb5.append(clientUploadDataItem.getId());
            sb5.append("  ts:");
            sb5.append(System.currentTimeMillis());
            MyLog.w(sb5.toString());
            IOUtils.closeQuietly(null);
            IOUtils.closeQuietly(null);
        } catch (IOException e3) {
            e = e3;
            r05 = 0;
            StringBuilder sb32 = new StringBuilder();
            sb32.append("TinyData write to cache file failed cause io exception item:");
            sb32.append(clientUploadDataItem.getId());
            MyLog.e(sb32.toString(), e);
            r03 = r04;
            IOUtils.closeQuietly(null);
            IOUtils.closeQuietly(r03);
        } catch (Exception e4) {
            e = e4;
            tinyDataKeyWithDefault = 0;
            r02 = r06;
            StringBuilder sb42 = new StringBuilder();
            sb42.append("TinyData write to cache file  failed item:");
            sb42.append(clientUploadDataItem.getId());
            MyLog.e(sb42.toString(), e);
            r03 = r06;
            IOUtils.closeQuietly(null);
            IOUtils.closeQuietly(r03);
        } catch (Throwable th4) {
            th = th4;
            r0 = r02;
            IOUtils.closeQuietly(null);
            IOUtils.closeQuietly(r0);
            throw th;
        }
    }
}

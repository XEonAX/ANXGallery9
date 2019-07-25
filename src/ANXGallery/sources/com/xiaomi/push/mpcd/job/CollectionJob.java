package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.misc.ByteUtils;
import com.xiaomi.channel.commonutils.misc.JobMutualExclusor;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.push.mpcd.CDActionProvider;
import com.xiaomi.push.mpcd.CDActionProviderHolder;
import com.xiaomi.push.mpcd.CDataHelper;
import com.xiaomi.push.mpcd.Constants;
import com.xiaomi.xmpush.thrift.ClientCollectionType;
import com.xiaomi.xmpush.thrift.DataCollectionItem;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;

public abstract class CollectionJob extends Job {
    protected Context context;
    protected int period;

    public CollectionJob(Context context2, int i) {
        this.period = i;
        this.context = context2;
    }

    public static void writeItemToFile(Context context2, DataCollectionItem dataCollectionItem) {
        CDActionProvider cDActionProvider = CDActionProviderHolder.getInstance().getCDActionProvider();
        String regSecret = cDActionProvider == null ? "" : cDActionProvider.getRegSecret();
        if (!TextUtils.isEmpty(regSecret) && !TextUtils.isEmpty(dataCollectionItem.getContent())) {
            writeItemToFile(context2, dataCollectionItem, regSecret);
        }
    }

    /* JADX WARNING: type inference failed for: r0v0 */
    /* JADX WARNING: type inference failed for: r1v0, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r0v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r6v3 */
    /* JADX WARNING: type inference failed for: r1v1 */
    /* JADX WARNING: type inference failed for: r0v2 */
    /* JADX WARNING: type inference failed for: r6v4, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v3, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r1v2 */
    /* JADX WARNING: type inference failed for: r6v5 */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* JADX WARNING: type inference failed for: r6v6 */
    /* JADX WARNING: type inference failed for: r1v5 */
    /* JADX WARNING: type inference failed for: r1v7, types: [java.nio.channels.FileLock] */
    /* JADX WARNING: type inference failed for: r6v7 */
    /* JADX WARNING: type inference failed for: r0v4 */
    /* JADX WARNING: type inference failed for: r6v8 */
    /* JADX WARNING: type inference failed for: r6v10, types: [java.io.Closeable, java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r0v7 */
    /* JADX WARNING: type inference failed for: r0v8 */
    /* JADX WARNING: type inference failed for: r0v9 */
    /* JADX WARNING: type inference failed for: r0v10 */
    /* JADX WARNING: type inference failed for: r0v11 */
    /* JADX WARNING: type inference failed for: r1v8 */
    /* JADX WARNING: type inference failed for: r6v11 */
    /* JADX WARNING: type inference failed for: r1v9 */
    /* JADX WARNING: type inference failed for: r1v10 */
    /* JADX WARNING: type inference failed for: r6v12 */
    /* JADX WARNING: type inference failed for: r6v13 */
    /* JADX WARNING: type inference failed for: r6v14 */
    /* JADX WARNING: Can't wrap try/catch for region: R(10:32|33|38|39|(0)|46|47|23|48|49) */
    /* JADX WARNING: Can't wrap try/catch for region: R(5:13|14|(3:16|17|(2:19|20))|21|22) */
    /* JADX WARNING: Can't wrap try/catch for region: R(7:50|51|52|(2:56|57)|59|60|61) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:21:0x005f */
    /* JADX WARNING: Missing exception handler attribute for start block: B:46:0x008b */
    /* JADX WARNING: Missing exception handler attribute for start block: B:59:0x00a2 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1
  assigns: []
  uses: []
  mth insns count: 86
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
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0082 A[SYNTHETIC, Splitter:B:41:0x0082] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:59:0x00a2=Splitter:B:59:0x00a2, B:46:0x008b=Splitter:B:46:0x008b, B:38:0x007d=Splitter:B:38:0x007d, B:21:0x005f=Splitter:B:21:0x005f} */
    /* JADX WARNING: Unknown variable types count: 10 */
    private static void writeItemToFile(Context context2, DataCollectionItem dataCollectionItem, String str) {
        RandomAccessFile randomAccessFile;
        ? r1;
        ? r0;
        ? r6;
        ? r12;
        ? r62;
        ? r02;
        ? lock;
        ? r63;
        byte[] encryptData = CDataHelper.encryptData(str, XmPushThriftSerializeUtils.convertThriftObjectToBytes(dataCollectionItem));
        if (encryptData != null && encryptData.length != 0) {
            synchronized (Constants.cDataLock4Thread) {
                ? r03 = 0;
                try {
                    File file = new File(context2.getExternalFilesDir(null), "push_cdata.lock");
                    IOUtils.createFileQuietly(file);
                    randomAccessFile = new RandomAccessFile(file, "rw");
                    try {
                        lock = randomAccessFile.getChannel().lock();
                    } catch (IOException e) {
                        e = e;
                        r62 = 0;
                        r02 = r03;
                        try {
                            e.printStackTrace();
                            if (r02 != 0) {
                            }
                            IOUtils.closeQuietly(r62);
                            IOUtils.closeQuietly(randomAccessFile);
                        } catch (Throwable th) {
                            th = th;
                            r12 = r02;
                            r6 = r62;
                            r0 = r6;
                            r1 = r12;
                            if (r1 != 0 && r1.isValid()) {
                                r1.release();
                            }
                            IOUtils.closeQuietly(r0);
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        r1 = 0;
                        r0 = r03;
                        r1.release();
                        IOUtils.closeQuietly(r0);
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                    try {
                        ? bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(new File(context2.getExternalFilesDir(null), "push_cdata.data"), true));
                        try {
                            bufferedOutputStream.write(ByteUtils.parseInt(encryptData.length));
                            bufferedOutputStream.write(encryptData);
                            bufferedOutputStream.flush();
                            if (lock != 0) {
                                if (lock.isValid()) {
                                    lock.release();
                                }
                            }
                            IOUtils.closeQuietly(bufferedOutputStream);
                        } catch (IOException e2) {
                            e = e2;
                            r63 = bufferedOutputStream;
                            r02 = lock;
                            r62 = r63;
                            e.printStackTrace();
                            if (r02 != 0) {
                            }
                            IOUtils.closeQuietly(r62);
                            IOUtils.closeQuietly(randomAccessFile);
                        } catch (Throwable th3) {
                            th = th3;
                            r12 = lock;
                            r6 = bufferedOutputStream;
                            r0 = r6;
                            r1 = r12;
                            r1.release();
                            IOUtils.closeQuietly(r0);
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                    } catch (IOException e3) {
                        e = e3;
                        r63 = 0;
                        r02 = lock;
                        r62 = r63;
                        e.printStackTrace();
                        if (r02 != 0) {
                            if (r02.isValid()) {
                                r02.release();
                            }
                        }
                        IOUtils.closeQuietly(r62);
                        IOUtils.closeQuietly(randomAccessFile);
                    } catch (Throwable th4) {
                        th = th4;
                        r0 = r03;
                        r1 = lock;
                        r1.release();
                        IOUtils.closeQuietly(r0);
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                } catch (IOException e4) {
                    e = e4;
                    r62 = 0;
                    randomAccessFile = null;
                    r02 = r03;
                    e.printStackTrace();
                    if (r02 != 0) {
                    }
                    IOUtils.closeQuietly(r62);
                    IOUtils.closeQuietly(randomAccessFile);
                } catch (Throwable th5) {
                    th = th5;
                    r1 = 0;
                    randomAccessFile = null;
                    r0 = r03;
                    r1.release();
                    IOUtils.closeQuietly(r0);
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
                IOUtils.closeQuietly(randomAccessFile);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkPeriodAndRecord() {
        return JobMutualExclusor.checkPeriodAndRecordWithFileLock(this.context, String.valueOf(getJobId()), (long) this.period);
    }

    /* access modifiers changed from: protected */
    public boolean checkPermission() {
        return true;
    }

    public abstract String collectInfo();

    public abstract ClientCollectionType getCollectionType();

    public void run() {
        if (checkPeriodAndRecord()) {
            CDActionProvider cDActionProvider = CDActionProviderHolder.getInstance().getCDActionProvider();
            String regSecret = cDActionProvider == null ? "" : cDActionProvider.getRegSecret();
            if (!TextUtils.isEmpty(regSecret) && checkPermission()) {
                String collectInfo = collectInfo();
                if (!TextUtils.isEmpty(collectInfo)) {
                    DataCollectionItem dataCollectionItem = new DataCollectionItem();
                    dataCollectionItem.setContent(collectInfo);
                    dataCollectionItem.setCollectedAt(System.currentTimeMillis());
                    dataCollectionItem.setCollectionType(getCollectionType());
                    writeItemToFile(this.context, dataCollectionItem, regSecret);
                }
            }
        }
    }
}

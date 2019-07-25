package com.xiaomi.tinyData;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import com.xiaomi.channel.commonutils.android.DataCryptUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ByteUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.service.TinyDataStorage;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.ArrayList;

public class TinyDataCacheReader {
    private static boolean mTinyDataJobIsRunning;

    static class TinyDataReadJob implements Runnable {
        private Context mContext;
        private TinyDataUploader mUploader;

        public TinyDataReadJob(Context context, TinyDataUploader tinyDataUploader) {
            this.mUploader = tinyDataUploader;
            this.mContext = context;
        }

        public void run() {
            TinyDataCacheReader.extractTinyData(this.mContext, this.mUploader);
        }
    }

    public static void addTinyDataCacheReadJob(Context context, TinyDataUploader tinyDataUploader) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new TinyDataReadJob(context, tinyDataUploader));
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00c5  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00cb  */
    public static void extractTinyData(Context context, TinyDataUploader tinyDataUploader) {
        RandomAccessFile randomAccessFile;
        FileLock fileLock;
        File file;
        if (!mTinyDataJobIsRunning) {
            mTinyDataJobIsRunning = true;
            File file2 = new File(context.getFilesDir(), "tiny_data.data");
            if (!file2.exists()) {
                MyLog.w("TinyData no ready file to get data.");
                return;
            }
            verifyFileDir(context);
            byte[] tinyDataKeyWithDefault = TinyDataStorage.getTinyDataKeyWithDefault(context);
            FileLock fileLock2 = null;
            try {
                File file3 = new File(context.getFilesDir(), "tiny_data.lock");
                IOUtils.createFileQuietly(file3);
                randomAccessFile = new RandomAccessFile(file3, "rw");
                try {
                    fileLock = randomAccessFile.getChannel().lock();
                } catch (Exception e) {
                    e = e;
                    try {
                        MyLog.e((Throwable) e);
                        if (fileLock2 != null && fileLock2.isValid()) {
                            try {
                                fileLock2.release();
                            } catch (IOException e2) {
                                e = e2;
                            }
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        StringBuilder sb = new StringBuilder();
                        sb.append(context.getFilesDir());
                        sb.append("/tdReadTemp");
                        sb.append("/");
                        sb.append("tiny_data.data");
                        file = new File(sb.toString());
                        if (!file.exists()) {
                        }
                    } catch (Throwable th) {
                        th = th;
                        fileLock = fileLock2;
                        if (fileLock != null && fileLock.isValid()) {
                            try {
                                fileLock.release();
                            } catch (IOException e3) {
                                MyLog.e((Throwable) e3);
                            }
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                }
                try {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(context.getFilesDir());
                    sb2.append("/tdReadTemp");
                    sb2.append("/");
                    sb2.append("tiny_data.data");
                    file2.renameTo(new File(sb2.toString()));
                    if (fileLock != null && fileLock.isValid()) {
                        try {
                            fileLock.release();
                        } catch (IOException e4) {
                            e = e4;
                        }
                    }
                } catch (Exception e5) {
                    e = e5;
                    fileLock2 = fileLock;
                    MyLog.e((Throwable) e);
                    fileLock2.release();
                    IOUtils.closeQuietly(randomAccessFile);
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(context.getFilesDir());
                    sb3.append("/tdReadTemp");
                    sb3.append("/");
                    sb3.append("tiny_data.data");
                    file = new File(sb3.toString());
                    if (!file.exists()) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileLock.release();
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
            } catch (Exception e6) {
                e = e6;
                randomAccessFile = null;
                MyLog.e((Throwable) e);
                fileLock2.release();
                IOUtils.closeQuietly(randomAccessFile);
                StringBuilder sb32 = new StringBuilder();
                sb32.append(context.getFilesDir());
                sb32.append("/tdReadTemp");
                sb32.append("/");
                sb32.append("tiny_data.data");
                file = new File(sb32.toString());
                if (!file.exists()) {
                }
            } catch (Throwable th3) {
                th = th3;
                fileLock = null;
                randomAccessFile = null;
                fileLock.release();
                IOUtils.closeQuietly(randomAccessFile);
                throw th;
            }
            IOUtils.closeQuietly(randomAccessFile);
            StringBuilder sb322 = new StringBuilder();
            sb322.append(context.getFilesDir());
            sb322.append("/tdReadTemp");
            sb322.append("/");
            sb322.append("tiny_data.data");
            file = new File(sb322.toString());
            if (!file.exists()) {
                MyLog.w("TinyData no ready file to get data.");
                return;
            }
            readTinyDataFromFile(context, tinyDataUploader, file, tinyDataKeyWithDefault);
            TinyDataCacheProcessor.setIsTinyDataExtracting(false);
            updateTinyDataUploadTimeStamp(context);
            mTinyDataJobIsRunning = false;
            return;
        }
        MyLog.w("TinyData extractTinyData is running");
        return;
        MyLog.e((Throwable) e);
        IOUtils.closeQuietly(randomAccessFile);
        StringBuilder sb3222 = new StringBuilder();
        sb3222.append(context.getFilesDir());
        sb3222.append("/tdReadTemp");
        sb3222.append("/");
        sb3222.append("tiny_data.data");
        file = new File(sb3222.toString());
        if (!file.exists()) {
        }
    }

    private static void readTinyDataFromFile(Context context, TinyDataUploader tinyDataUploader, File file, byte[] bArr) {
        int i;
        ArrayList arrayList = new ArrayList();
        byte[] bArr2 = new byte[4];
        BufferedInputStream bufferedInputStream = null;
        try {
            BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(file));
            loop0:
            while (true) {
                int i2 = 0;
                int i3 = 0;
                while (true) {
                    try {
                        int read = bufferedInputStream2.read(bArr2);
                        if (read == -1) {
                            break loop0;
                        } else if (read != 4) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("TinyData read from cache file failed cause lengthBuffer error. size:");
                            sb.append(read);
                            MyLog.e(sb.toString());
                            break loop0;
                        } else {
                            i = ByteUtils.toInt(bArr2);
                            if (i < 1) {
                                break loop0;
                            } else if (i > 10240) {
                                break loop0;
                            } else {
                                byte[] bArr3 = new byte[i];
                                int read2 = bufferedInputStream2.read(bArr3);
                                if (read2 != i) {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("TinyData read from cache file failed cause buffer size not equal length. size:");
                                    sb2.append(read2);
                                    sb2.append("__length:");
                                    sb2.append(i);
                                    MyLog.e(sb2.toString());
                                    break loop0;
                                }
                                byte[] mipushDecrypt = DataCryptUtils.mipushDecrypt(bArr, bArr3);
                                if (mipushDecrypt != null) {
                                    if (mipushDecrypt.length != 0) {
                                        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
                                        XmPushThriftSerializeUtils.convertByteArrayToThriftObject(clientUploadDataItem, mipushDecrypt);
                                        arrayList.add(clientUploadDataItem);
                                        i2++;
                                        i3 += mipushDecrypt.length;
                                        if (i2 >= 8 || i3 >= 10240) {
                                            StringBuilder sb3 = new StringBuilder();
                                            sb3.append("TinyData readTinyDataFromFile upload tiny data by part. items:");
                                            sb3.append(arrayList.size());
                                            sb3.append(" ts:");
                                            sb3.append(System.currentTimeMillis());
                                            MyLog.w(sb3.toString());
                                            TinyDataCacheUploader.uploadTinyData(context, tinyDataUploader, arrayList);
                                            arrayList = new ArrayList();
                                        }
                                    }
                                }
                                MyLog.e("TinyData read from cache file failed cause decrypt fail");
                            }
                        }
                    } catch (Exception e) {
                        e = e;
                        bufferedInputStream = bufferedInputStream2;
                        try {
                            MyLog.e((Throwable) e);
                            IOUtils.closeQuietly(bufferedInputStream);
                        } catch (Throwable th) {
                            th = th;
                            bufferedInputStream2 = bufferedInputStream;
                            IOUtils.closeQuietly(bufferedInputStream2);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        IOUtils.closeQuietly(bufferedInputStream2);
                        throw th;
                    }
                }
            }
            StringBuilder sb4 = new StringBuilder();
            sb4.append("TinyData read from cache file failed cause lengthBuffer < 1 || too big. length:");
            sb4.append(i);
            MyLog.e(sb4.toString());
            TinyDataCacheUploader.uploadTinyData(context, tinyDataUploader, arrayList);
            StringBuilder sb5 = new StringBuilder();
            sb5.append("TinyData readTinyDataFromFile upload tiny data at last. items:");
            sb5.append(arrayList.size());
            sb5.append(" ts:");
            sb5.append(System.currentTimeMillis());
            MyLog.w(sb5.toString());
            if (file != null && file.exists() && !file.delete()) {
                MyLog.w("TinyData delete reading temp file failed");
            }
            IOUtils.closeQuietly(bufferedInputStream2);
        } catch (Exception e2) {
            e = e2;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(bufferedInputStream);
        }
    }

    private static void updateTinyDataUploadTimeStamp(Context context) {
        Editor edit = context.getSharedPreferences("mipush_extra", 4).edit();
        edit.putLong("last_tiny_data_upload_timestamp", System.currentTimeMillis() / 1000);
        edit.commit();
    }

    private static void verifyFileDir(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append(context.getFilesDir());
        sb.append("/tdReadTemp");
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
    }
}

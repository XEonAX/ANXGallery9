package com.xiaomi.clientreport.processor;

import android.content.Context;
import android.text.TextUtils;
import android.util.Base64;
import com.xiaomi.channel.commonutils.android.DataCryptUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ByteUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.clientreport.data.BaseClientReport;
import com.xiaomi.clientreport.data.EventClientReport;
import com.xiaomi.clientreport.manager.ClientReportLogicManager;
import com.xiaomi.clientreport.util.ClientReportUtil;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class DefaultEventProcessor implements IEventProcessor {
    protected Context mContext;
    private HashMap<String, ArrayList<BaseClientReport>> mEventMap;

    public DefaultEventProcessor(Context context) {
        setContext(context);
    }

    public static String getFirstEventFileName(BaseClientReport baseClientReport) {
        return String.valueOf(baseClientReport.production);
    }

    private String getWriteFileName(BaseClientReport baseClientReport) {
        File externalFilesDir = this.mContext.getExternalFilesDir("event");
        String firstEventFileName = getFirstEventFileName(baseClientReport);
        String str = null;
        if (externalFilesDir == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(externalFilesDir.getAbsolutePath());
        sb.append(File.separator);
        sb.append(firstEventFileName);
        String sb2 = sb.toString();
        int i = 0;
        while (true) {
            if (i >= 100) {
                break;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append(i);
            String sb4 = sb3.toString();
            if (ClientReportUtil.isFileCanBeUse(this.mContext, sb4)) {
                str = sb4;
                break;
            }
            i++;
        }
        return str;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0065, code lost:
        com.xiaomi.channel.commonutils.logger.MyLog.e("eventData read from cache file failed cause lengthBuffer < 1 || lengthBuffer > 4K");
     */
    private List<String> readFile(String str) {
        ArrayList arrayList = new ArrayList();
        byte[] bArr = new byte[4];
        byte[] bArr2 = new byte[4];
        FileInputStream fileInputStream = null;
        try {
            FileInputStream fileInputStream2 = new FileInputStream(new File(str));
            while (true) {
                try {
                    int read = fileInputStream2.read(bArr);
                    if (read == -1) {
                        break;
                    } else if (read != 4) {
                        MyLog.e("eventData read from cache file failed because magicNumber error");
                        break;
                    } else if (ByteUtils.toInt(bArr) != -573785174) {
                        MyLog.e("eventData read from cache file failed because magicNumber error");
                        break;
                    } else {
                        int read2 = fileInputStream2.read(bArr2);
                        if (read2 == -1) {
                            break;
                        } else if (read2 != 4) {
                            MyLog.e("eventData read from cache file failed cause lengthBuffer error");
                            break;
                        } else {
                            int i = ByteUtils.toInt(bArr2);
                            if (i < 1) {
                                break;
                            } else if (i > 4096) {
                                break;
                            } else {
                                byte[] bArr3 = new byte[i];
                                if (fileInputStream2.read(bArr3) != i) {
                                    MyLog.e("eventData read from cache file failed cause buffer size not equal length");
                                    break;
                                }
                                arrayList.add(bytesToString(bArr3));
                            }
                        }
                    }
                } catch (Exception e) {
                    e = e;
                    fileInputStream = fileInputStream2;
                    try {
                        MyLog.e((Throwable) e);
                        IOUtils.closeQuietly(fileInputStream);
                        return arrayList;
                    } catch (Throwable th) {
                        th = th;
                        fileInputStream2 = fileInputStream;
                        IOUtils.closeQuietly(fileInputStream2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    IOUtils.closeQuietly(fileInputStream2);
                    throw th;
                }
            }
            IOUtils.closeQuietly(fileInputStream2);
        } catch (Exception e2) {
            e = e2;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(fileInputStream);
            return arrayList;
        }
        return arrayList;
    }

    private void write2File(BaseClientReport[] baseClientReportArr, String str) {
        if (baseClientReportArr != null && baseClientReportArr.length > 0 && !TextUtils.isEmpty(str)) {
            BufferedOutputStream bufferedOutputStream = null;
            try {
                BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(new File(str), true));
                try {
                    for (BaseClientReport baseClientReport : baseClientReportArr) {
                        if (baseClientReport != null) {
                            byte[] stringToBytes = stringToBytes(baseClientReport.toJsonString());
                            if (stringToBytes != null && stringToBytes.length >= 1) {
                                if (stringToBytes.length <= 4096) {
                                    bufferedOutputStream2.write(ByteUtils.parseInt(-573785174));
                                    bufferedOutputStream2.write(ByteUtils.parseInt(stringToBytes.length));
                                    bufferedOutputStream2.write(stringToBytes);
                                    bufferedOutputStream2.flush();
                                }
                            }
                            MyLog.e("event data throw a invalid item ");
                        }
                    }
                    IOUtils.closeQuietly(bufferedOutputStream2);
                } catch (Exception e) {
                    e = e;
                    bufferedOutputStream = bufferedOutputStream2;
                    try {
                        MyLog.e("event data write to cache file failed cause exception", e);
                        IOUtils.closeQuietly(bufferedOutputStream);
                    } catch (Throwable th) {
                        th = th;
                        bufferedOutputStream2 = bufferedOutputStream;
                        IOUtils.closeQuietly(bufferedOutputStream2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    IOUtils.closeQuietly(bufferedOutputStream2);
                    throw th;
                }
            } catch (Exception e2) {
                e = e2;
                MyLog.e("event data write to cache file failed cause exception", e);
                IOUtils.closeQuietly(bufferedOutputStream);
            }
        }
    }

    public String bytesToString(byte[] bArr) {
        if (bArr == null || bArr.length < 1) {
            return null;
        }
        if (!ClientReportLogicManager.getInstance(this.mContext).getConfig().isEventEncrypted()) {
            return XMStringUtils.bytesToString(bArr);
        }
        String eventKeyWithDefault = ClientReportUtil.getEventKeyWithDefault(this.mContext);
        if (TextUtils.isEmpty(eventKeyWithDefault)) {
            return null;
        }
        byte[] parseKey = ClientReportUtil.parseKey(eventKeyWithDefault);
        if (parseKey != null && parseKey.length > 0) {
            try {
                return XMStringUtils.bytesToString(Base64.decode(DataCryptUtils.mipushDecrypt(parseKey, bArr), 2));
            } catch (InvalidAlgorithmParameterException e) {
                MyLog.e((Throwable) e);
            } catch (NoSuchAlgorithmException e2) {
                MyLog.e((Throwable) e2);
            } catch (InvalidKeyException e3) {
                MyLog.e((Throwable) e3);
            } catch (NoSuchPaddingException e4) {
                MyLog.e((Throwable) e4);
            } catch (BadPaddingException e5) {
                MyLog.e((Throwable) e5);
            } catch (IllegalBlockSizeException e6) {
                MyLog.e((Throwable) e6);
            }
        }
        return null;
    }

    public void preProcess(BaseClientReport baseClientReport) {
        if ((baseClientReport instanceof EventClientReport) && this.mEventMap != null) {
            EventClientReport eventClientReport = (EventClientReport) baseClientReport;
            String firstEventFileName = getFirstEventFileName(eventClientReport);
            ArrayList arrayList = (ArrayList) this.mEventMap.get(firstEventFileName);
            if (arrayList == null) {
                arrayList = new ArrayList();
            }
            arrayList.add(eventClientReport);
            this.mEventMap.put(firstEventFileName, arrayList);
        }
    }

    public void process() {
        if (this.mEventMap != null) {
            if (this.mEventMap.size() > 0) {
                for (String str : this.mEventMap.keySet()) {
                    ArrayList arrayList = (ArrayList) this.mEventMap.get(str);
                    if (arrayList != null && arrayList.size() > 0) {
                        BaseClientReport[] baseClientReportArr = new BaseClientReport[arrayList.size()];
                        arrayList.toArray(baseClientReportArr);
                        write(baseClientReportArr);
                    }
                }
            }
            this.mEventMap.clear();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:71:0x00d8  */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x00bf A[SYNTHETIC] */
    public void readAndSend() {
        String absolutePath;
        File file;
        RandomAccessFile randomAccessFile;
        ClientReportUtil.moveFiles(this.mContext, "event", "eventUploading");
        File[] readFileName = ClientReportUtil.getReadFileName(this.mContext, "eventUploading");
        if (readFileName != null && readFileName.length > 0) {
            FileLock fileLock = null;
            RandomAccessFile randomAccessFile2 = null;
            File file2 = null;
            for (File file3 : readFileName) {
                if (file3 == null) {
                    if (fileLock != null && fileLock.isValid()) {
                        try {
                            fileLock.release();
                        } catch (IOException e) {
                            MyLog.e((Throwable) e);
                        }
                    }
                    IOUtils.closeQuietly(randomAccessFile2);
                    if (file2 == null) {
                    }
                } else {
                    try {
                        absolutePath = file3.getAbsolutePath();
                        StringBuilder sb = new StringBuilder();
                        sb.append(absolutePath);
                        sb.append(".lock");
                        file = new File(sb.toString());
                    } catch (Exception e2) {
                        e = e2;
                        try {
                            MyLog.e((Throwable) e);
                            try {
                                fileLock.release();
                            } catch (IOException e3) {
                                MyLog.e((Throwable) e3);
                            }
                            IOUtils.closeQuietly(randomAccessFile2);
                            if (file2 == null) {
                            }
                            file2.delete();
                        } catch (Throwable th) {
                            th = th;
                            if (fileLock != null && fileLock.isValid()) {
                                try {
                                    fileLock.release();
                                } catch (IOException e4) {
                                    MyLog.e((Throwable) e4);
                                }
                            }
                            IOUtils.closeQuietly(randomAccessFile2);
                            if (file2 != null) {
                                file2.delete();
                            }
                            throw th;
                        }
                    }
                    try {
                        IOUtils.createFileQuietly(file);
                        randomAccessFile = new RandomAccessFile(file, "rw");
                    } catch (Exception e5) {
                        e = e5;
                        file2 = file;
                        MyLog.e((Throwable) e);
                        if (fileLock != null && fileLock.isValid()) {
                            fileLock.release();
                        }
                        IOUtils.closeQuietly(randomAccessFile2);
                        if (file2 == null) {
                        }
                        file2.delete();
                    } catch (Throwable th2) {
                        th = th2;
                        file2 = file;
                        fileLock.release();
                        IOUtils.closeQuietly(randomAccessFile2);
                        if (file2 != null) {
                        }
                        throw th;
                    }
                    try {
                        FileLock lock = randomAccessFile.getChannel().lock();
                        try {
                            send(readFile(absolutePath));
                            file3.delete();
                            if (lock != null && lock.isValid()) {
                                try {
                                    lock.release();
                                } catch (IOException e6) {
                                    MyLog.e((Throwable) e6);
                                }
                            }
                            IOUtils.closeQuietly(randomAccessFile);
                            file.delete();
                            fileLock = lock;
                            randomAccessFile2 = randomAccessFile;
                            file2 = file;
                        } catch (Exception e7) {
                            e = e7;
                            fileLock = lock;
                            randomAccessFile2 = randomAccessFile;
                            file2 = file;
                            MyLog.e((Throwable) e);
                            fileLock.release();
                            IOUtils.closeQuietly(randomAccessFile2);
                            if (file2 == null) {
                            }
                            file2.delete();
                        } catch (Throwable th3) {
                            th = th3;
                            fileLock = lock;
                            randomAccessFile2 = randomAccessFile;
                            file2 = file;
                            fileLock.release();
                            IOUtils.closeQuietly(randomAccessFile2);
                            if (file2 != null) {
                            }
                            throw th;
                        }
                    } catch (Exception e8) {
                        e = e8;
                        randomAccessFile2 = randomAccessFile;
                        file2 = file;
                        MyLog.e((Throwable) e);
                        fileLock.release();
                        IOUtils.closeQuietly(randomAccessFile2);
                        if (file2 == null) {
                        }
                        file2.delete();
                    } catch (Throwable th4) {
                        th = th4;
                        randomAccessFile2 = randomAccessFile;
                        file2 = file;
                        fileLock.release();
                        IOUtils.closeQuietly(randomAccessFile2);
                        if (file2 != null) {
                        }
                        throw th;
                    }
                }
                file2.delete();
            }
        }
    }

    public void send(List<String> list) {
        ClientReportUtil.sendFile(this.mContext, list);
    }

    public void setContext(Context context) {
        this.mContext = context;
    }

    public void setEventMap(HashMap<String, ArrayList<BaseClientReport>> hashMap) {
        this.mEventMap = hashMap;
    }

    public byte[] stringToBytes(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (!ClientReportLogicManager.getInstance(this.mContext).getConfig().isEventEncrypted()) {
            return XMStringUtils.getBytes(str);
        }
        String eventKeyWithDefault = ClientReportUtil.getEventKeyWithDefault(this.mContext);
        byte[] bytes = XMStringUtils.getBytes(str);
        if (TextUtils.isEmpty(eventKeyWithDefault) || bytes == null || bytes.length <= 1) {
            return null;
        }
        byte[] parseKey = ClientReportUtil.parseKey(eventKeyWithDefault);
        if (parseKey != null) {
            try {
                if (parseKey.length > 1) {
                    return DataCryptUtils.mipushEncrypt(parseKey, Base64.encode(bytes, 2));
                }
            } catch (Exception e) {
                MyLog.e((Throwable) e);
            }
        }
        return null;
    }

    public void write(BaseClientReport[] baseClientReportArr) {
        RandomAccessFile randomAccessFile;
        FileLock lock;
        if (baseClientReportArr != null && baseClientReportArr.length > 0) {
            if (baseClientReportArr[0] != null) {
                String writeFileName = getWriteFileName(baseClientReportArr[0]);
                if (!TextUtils.isEmpty(writeFileName)) {
                    FileLock fileLock = null;
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append(writeFileName);
                        sb.append(".lock");
                        File file = new File(sb.toString());
                        IOUtils.createFileQuietly(file);
                        randomAccessFile = new RandomAccessFile(file, "rw");
                        try {
                            lock = randomAccessFile.getChannel().lock();
                        } catch (Exception e) {
                            e = e;
                            try {
                                MyLog.e((Throwable) e);
                                try {
                                    fileLock.release();
                                } catch (IOException e2) {
                                    e = e2;
                                }
                                IOUtils.closeQuietly(randomAccessFile);
                            } catch (Throwable th) {
                                th = th;
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
                            for (BaseClientReport baseClientReport : baseClientReportArr) {
                                if (baseClientReport != null) {
                                    write2File(baseClientReportArr, writeFileName);
                                }
                            }
                            if (lock != null && lock.isValid()) {
                                try {
                                    lock.release();
                                } catch (IOException e4) {
                                    e = e4;
                                }
                            }
                        } catch (Exception e5) {
                            e = e5;
                            fileLock = lock;
                            MyLog.e((Throwable) e);
                            fileLock.release();
                            IOUtils.closeQuietly(randomAccessFile);
                        } catch (Throwable th2) {
                            th = th2;
                            fileLock = lock;
                            fileLock.release();
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                    } catch (Exception e6) {
                        e = e6;
                        randomAccessFile = null;
                        MyLog.e((Throwable) e);
                        if (fileLock != null && fileLock.isValid()) {
                            fileLock.release();
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                    } catch (Throwable th3) {
                        th = th3;
                        randomAccessFile = null;
                        fileLock.release();
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                    IOUtils.closeQuietly(randomAccessFile);
                }
                return;
            }
        }
        return;
        MyLog.e((Throwable) e);
        IOUtils.closeQuietly(randomAccessFile);
    }
}

package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.misc.ByteUtils;
import com.xiaomi.channel.commonutils.misc.CollectionUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.push.mpcd.CDActionProvider;
import com.xiaomi.push.mpcd.CDActionProviderHolder;
import com.xiaomi.push.mpcd.CDataHelper;
import com.xiaomi.push.mpcd.Constants;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.DataCollectionItem;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionCollectData;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.List;

public class UploadJob extends Job {
    private Context context;
    private OnlineConfig mOnlineConfig;
    private SharedPreferences mSharedPreference;

    public UploadJob(Context context2) {
        this.context = context2;
        this.mSharedPreference = context2.getSharedPreferences("mipush_extra", 0);
        this.mOnlineConfig = OnlineConfig.getInstance(context2);
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(10:45|44|61|63|64|66|67|29|68|69) */
    /* JADX WARNING: Can't wrap try/catch for region: R(6:13|14|(3:15|16|(2:73|18)(2:19|(1:74)(4:30|31|(1:75)(2:33|(2:35|76)(2:36|77))|72)))|(3:22|23|(2:25|26))|27|28) */
    /* JADX WARNING: Can't wrap try/catch for region: R(6:42|43|(0)|54|55|56) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:27:0x0066 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:54:0x009d */
    /* JADX WARNING: Missing exception handler attribute for start block: B:66:0x00b4 */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x0094 A[SYNTHETIC, Splitter:B:49:0x0094] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:66:0x00b4=Splitter:B:66:0x00b4, B:27:0x0066=Splitter:B:27:0x0066, B:54:0x009d=Splitter:B:54:0x009d} */
    private List<DataCollectionItem> readFromFile(File file) {
        RandomAccessFile randomAccessFile;
        FileLock fileLock;
        CDActionProvider cDActionProvider = CDActionProviderHolder.getInstance().getCDActionProvider();
        String regSecret = cDActionProvider == null ? "" : cDActionProvider.getRegSecret();
        FileInputStream fileInputStream = null;
        if (TextUtils.isEmpty(regSecret)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        byte[] bArr = new byte[4];
        synchronized (Constants.cDataLock4Thread) {
            try {
                File file2 = new File(this.context.getExternalFilesDir(null), "push_cdata.lock");
                IOUtils.createFileQuietly(file2);
                randomAccessFile = new RandomAccessFile(file2, "rw");
                try {
                    fileLock = randomAccessFile.getChannel().lock();
                } catch (Exception unused) {
                    fileLock = null;
                    fileLock.release();
                    IOUtils.closeQuietly(fileInputStream);
                    IOUtils.closeQuietly(randomAccessFile);
                    return arrayList;
                } catch (Throwable th) {
                    th = th;
                    fileLock = null;
                    if (fileLock != null) {
                    }
                    IOUtils.closeQuietly(fileInputStream);
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
                try {
                    FileInputStream fileInputStream2 = new FileInputStream(file);
                    while (true) {
                        try {
                            if (fileInputStream2.read(bArr) != 4) {
                                break;
                            }
                            int i = ByteUtils.toInt(bArr);
                            byte[] bArr2 = new byte[i];
                            if (fileInputStream2.read(bArr2) != i) {
                                break;
                            }
                            byte[] decryptData = CDataHelper.decryptData(regSecret, bArr2);
                            if (decryptData != null) {
                                if (decryptData.length != 0) {
                                    DataCollectionItem dataCollectionItem = new DataCollectionItem();
                                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(dataCollectionItem, decryptData);
                                    arrayList.add(dataCollectionItem);
                                }
                            }
                        } catch (Exception unused2) {
                            fileInputStream = fileInputStream2;
                            fileLock.release();
                            IOUtils.closeQuietly(fileInputStream);
                            IOUtils.closeQuietly(randomAccessFile);
                            return arrayList;
                        } catch (Throwable th2) {
                            th = th2;
                            fileInputStream = fileInputStream2;
                            if (fileLock != null) {
                            }
                            IOUtils.closeQuietly(fileInputStream);
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                    }
                    if (fileLock != null) {
                        if (fileLock.isValid()) {
                            fileLock.release();
                        }
                    }
                    IOUtils.closeQuietly(fileInputStream2);
                } catch (Exception unused3) {
                    fileLock.release();
                    IOUtils.closeQuietly(fileInputStream);
                    IOUtils.closeQuietly(randomAccessFile);
                    return arrayList;
                } catch (Throwable th3) {
                    th = th3;
                    if (fileLock != null) {
                    }
                    IOUtils.closeQuietly(fileInputStream);
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
            } catch (Exception unused4) {
                fileLock = null;
                randomAccessFile = null;
                if (fileLock != null && fileLock.isValid()) {
                    fileLock.release();
                }
                IOUtils.closeQuietly(fileInputStream);
                IOUtils.closeQuietly(randomAccessFile);
                return arrayList;
            } catch (Throwable th4) {
                th = th4;
                fileLock = null;
                randomAccessFile = null;
                if (fileLock != null) {
                    if (fileLock.isValid()) {
                        fileLock.release();
                    }
                }
                IOUtils.closeQuietly(fileInputStream);
                IOUtils.closeQuietly(randomAccessFile);
                throw th;
            }
            IOUtils.closeQuietly(randomAccessFile);
        }
        return arrayList;
    }

    private void updateUpdateTimeStamp() {
        Editor edit = this.mSharedPreference.edit();
        edit.putLong("last_upload_data_timestamp", System.currentTimeMillis() / 1000);
        edit.commit();
    }

    private boolean verify3GUploadData() {
        boolean z = false;
        if (!this.mOnlineConfig.getBooleanValue(ConfigKey.Upload3GSwitch.getValue(), true)) {
            return false;
        }
        int max = Math.max(86400, this.mOnlineConfig.getIntValue(ConfigKey.Upload3GFrequency.getValue(), 432000));
        if (Math.abs((System.currentTimeMillis() / 1000) - this.mSharedPreference.getLong("last_upload_data_timestamp", -1)) > ((long) max)) {
            z = true;
        }
        return z;
    }

    private boolean verify4GUploadData() {
        boolean z = false;
        if (!this.mOnlineConfig.getBooleanValue(ConfigKey.Upload4GSwitch.getValue(), true)) {
            return false;
        }
        int max = Math.max(86400, this.mOnlineConfig.getIntValue(ConfigKey.Upload4GFrequency.getValue(), 259200));
        if (Math.abs((System.currentTimeMillis() / 1000) - this.mSharedPreference.getLong("last_upload_data_timestamp", -1)) > ((long) max)) {
            z = true;
        }
        return z;
    }

    private boolean verifyUploadDataWithoutWIFI() {
        if (Network.isWIFIConnected(this.context)) {
            return false;
        }
        if (!Network.is4GConnected(this.context) || verify4GUploadData()) {
            return (Network.is3GConnected(this.context) && !verify3GUploadData()) || Network.is2GConnected(this.context);
        }
        return true;
    }

    public int getJobId() {
        return 1;
    }

    public void run() {
        File file = new File(this.context.getExternalFilesDir(null), "push_cdata.data");
        if (!Network.isConnected(this.context)) {
            if (file.length() > 1863680) {
                file.delete();
            }
        } else if (!verifyUploadDataWithoutWIFI() && file.exists()) {
            List readFromFile = readFromFile(file);
            if (!CollectionUtils.isEmpty(readFromFile)) {
                int size = readFromFile.size();
                if (size > 4000) {
                    readFromFile = readFromFile.subList(size - 4000, size);
                }
                XmPushActionCollectData xmPushActionCollectData = new XmPushActionCollectData();
                xmPushActionCollectData.setDataCollectionItems(readFromFile);
                byte[] gZip = IOUtils.gZip(XmPushThriftSerializeUtils.convertThriftObjectToBytes(xmPushActionCollectData));
                XmPushActionNotification xmPushActionNotification = new XmPushActionNotification(MovieStatUtils.DOWNLOAD_FAILED, false);
                xmPushActionNotification.setType(NotificationType.DataCollection.value);
                xmPushActionNotification.setBinaryExtra(gZip);
                CDActionProvider cDActionProvider = CDActionProviderHolder.getInstance().getCDActionProvider();
                if (cDActionProvider != null) {
                    cDActionProvider.uploadNotification(xmPushActionNotification, ActionType.Notification, null);
                }
                updateUpdateTimeStamp();
            }
            file.delete();
            this.mSharedPreference.edit().remove("ltapn").commit();
        }
    }
}

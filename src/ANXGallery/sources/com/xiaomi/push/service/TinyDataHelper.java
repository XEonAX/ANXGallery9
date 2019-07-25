package com.xiaomi.push.service;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.xmpush.thrift.ClientUploadData;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

public class TinyDataHelper {
    private static String dayPrefix = sdf.format(Long.valueOf(System.currentTimeMillis()));
    private static AtomicLong idGen = new AtomicLong(0);
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

    public static void cacheTinyData(Context context, String str, String str2, long j, String str3) {
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory(str);
        clientUploadDataItem.setName(str2);
        clientUploadDataItem.setCounter(j);
        clientUploadDataItem.setData(str3);
        clientUploadDataItem.setChannel("push_sdk_channel");
        clientUploadDataItem.setPkgName(context.getPackageName());
        clientUploadDataItem.setSourcePackage(context.getPackageName());
        clientUploadDataItem.setFromSdk(true);
        clientUploadDataItem.setTimestamp(System.currentTimeMillis());
        clientUploadDataItem.setId(nextTinyDataItemId());
        TinyDataStorage.cacheTinyData(context, clientUploadDataItem);
    }

    public static synchronized String nextTinyDataItemId() {
        String sb;
        synchronized (TinyDataHelper.class) {
            String format = sdf.format(Long.valueOf(System.currentTimeMillis()));
            if (!TextUtils.equals(dayPrefix, format)) {
                idGen.set(0);
                dayPrefix = format;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(format);
            sb2.append("-");
            sb2.append(idGen.incrementAndGet());
            sb = sb2.toString();
        }
        return sb;
    }

    public static ArrayList<XmPushActionNotification> pack(List<ClientUploadDataItem> list, String str, String str2, int i) {
        if (list == null) {
            MyLog.e("requests can not be null in TinyDataHelper.transToThriftObj().");
            return null;
        } else if (list.size() == 0) {
            MyLog.e("requests.length is 0 in TinyDataHelper.transToThriftObj().");
            return null;
        } else {
            ArrayList<XmPushActionNotification> arrayList = new ArrayList<>();
            ClientUploadData clientUploadData = new ClientUploadData();
            int i2 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                ClientUploadDataItem clientUploadDataItem = (ClientUploadDataItem) list.get(i3);
                if (clientUploadDataItem != null) {
                    int length = XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadDataItem).length;
                    if (length > i) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("TinyData is too big, ignore upload request item:");
                        sb.append(clientUploadDataItem.getId());
                        MyLog.e(sb.toString());
                    } else {
                        if (i2 + length > i) {
                            XmPushActionNotification xmPushActionNotification = new XmPushActionNotification(MovieStatUtils.DOWNLOAD_FAILED, false);
                            xmPushActionNotification.setPackageName(str);
                            xmPushActionNotification.setAppId(str2);
                            xmPushActionNotification.setType(NotificationType.UploadTinyData.value);
                            xmPushActionNotification.setBinaryExtra(IOUtils.gZip(XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadData)));
                            arrayList.add(xmPushActionNotification);
                            clientUploadData = new ClientUploadData();
                            i2 = 0;
                        }
                        clientUploadData.addToUploadDataItems(clientUploadDataItem);
                        i2 += length;
                    }
                }
            }
            if (clientUploadData.getUploadDataItemsSize() != 0) {
                XmPushActionNotification xmPushActionNotification2 = new XmPushActionNotification(MovieStatUtils.DOWNLOAD_FAILED, false);
                xmPushActionNotification2.setPackageName(str);
                xmPushActionNotification2.setAppId(str2);
                xmPushActionNotification2.setType(NotificationType.UploadTinyData.value);
                xmPushActionNotification2.setBinaryExtra(IOUtils.gZip(XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadData)));
                arrayList.add(xmPushActionNotification2);
            }
            return arrayList;
        }
    }

    public static boolean shouldUpload(String str) {
        return !SystemUtils.isGlobalVersion() || "com.miui.hybrid".equals(str);
    }

    public static boolean verify(ClientUploadDataItem clientUploadDataItem, boolean z) {
        if (clientUploadDataItem == null) {
            MyLog.w("item is null, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (!z && TextUtils.isEmpty(clientUploadDataItem.channel)) {
            MyLog.w("item.channel is null or empty, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (TextUtils.isEmpty(clientUploadDataItem.category)) {
            MyLog.w("item.category is null or empty, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (TextUtils.isEmpty(clientUploadDataItem.name)) {
            MyLog.w("item.name is null or empty, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (!XMStringUtils.checkAllAscii(clientUploadDataItem.category)) {
            MyLog.w("item.category can only contain ascii char, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (!XMStringUtils.checkAllAscii(clientUploadDataItem.name)) {
            MyLog.w("item.name can only contain ascii char, verfiy ClientUploadDataItem failed.");
            return true;
        } else if (clientUploadDataItem.data == null || clientUploadDataItem.data.length() <= 10240) {
            return false;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("item.data is too large(");
            sb.append(clientUploadDataItem.data.length());
            sb.append("), max size for data is ");
            sb.append(10240);
            sb.append(" , verfiy ClientUploadDataItem failed.");
            MyLog.w(sb.toString());
            return true;
        }
    }
}

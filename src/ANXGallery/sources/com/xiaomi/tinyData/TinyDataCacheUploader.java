package com.xiaomi.tinyData;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.TinyDataHelper;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

public class TinyDataCacheUploader {
    private static HashMap<String, ArrayList<ClientUploadDataItem>> prepareTinyDataItems(Context context, List<ClientUploadDataItem> list) {
        if (list == null || list.size() == 0) {
            return null;
        }
        HashMap<String, ArrayList<ClientUploadDataItem>> hashMap = new HashMap<>();
        for (ClientUploadDataItem clientUploadDataItem : list) {
            verifyTinyDataUploadItemValue(context, clientUploadDataItem);
            ArrayList arrayList = (ArrayList) hashMap.get(clientUploadDataItem.getSourcePackage());
            if (arrayList == null) {
                arrayList = new ArrayList();
                hashMap.put(clientUploadDataItem.getSourcePackage(), arrayList);
            }
            arrayList.add(clientUploadDataItem);
        }
        return hashMap;
    }

    private static void upload(Context context, TinyDataUploader tinyDataUploader, HashMap<String, ArrayList<ClientUploadDataItem>> hashMap) {
        for (Entry entry : hashMap.entrySet()) {
            try {
                ArrayList arrayList = (ArrayList) entry.getValue();
                if (arrayList != null) {
                    if (arrayList.size() != 0) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("TinyData is uploaded immediately item size:");
                        sb.append(arrayList.size());
                        MyLog.w(sb.toString());
                        tinyDataUploader.upload(arrayList, ((ClientUploadDataItem) arrayList.get(0)).getPkgName(), (String) entry.getKey());
                    }
                }
            } catch (Exception unused) {
            }
        }
    }

    public static void uploadTinyData(Context context, TinyDataUploader tinyDataUploader, List<ClientUploadDataItem> list) {
        HashMap prepareTinyDataItems = prepareTinyDataItems(context, list);
        if (prepareTinyDataItems == null || prepareTinyDataItems.size() == 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("TinyData TinyDataCacheUploader.uploadTinyData itemsUploading == null || itemsUploading.size() == 0  ts:");
            sb.append(System.currentTimeMillis());
            MyLog.w(sb.toString());
            return;
        }
        upload(context, tinyDataUploader, prepareTinyDataItems);
    }

    private static void verifyTinyDataUploadItemValue(Context context, ClientUploadDataItem clientUploadDataItem) {
        if (clientUploadDataItem.fromSdk) {
            clientUploadDataItem.setChannel("push_sdk_channel");
        }
        if (TextUtils.isEmpty(clientUploadDataItem.getId())) {
            clientUploadDataItem.setId(TinyDataHelper.nextTinyDataItemId());
        }
        clientUploadDataItem.setTimestamp(System.currentTimeMillis());
        if (TextUtils.isEmpty(clientUploadDataItem.getPkgName())) {
            clientUploadDataItem.setSourcePackage(context.getPackageName());
        }
        if (TextUtils.isEmpty(clientUploadDataItem.getSourcePackage())) {
            clientUploadDataItem.setSourcePackage(clientUploadDataItem.getPkgName());
        }
    }
}

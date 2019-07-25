package com.xiaomi.mipush.sdk.stat.upload;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.mipush.sdk.stat.PushStatClientManager;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import java.text.SimpleDateFormat;

public class UploadDataHelper {
    private static String mDayPrefix = mSdf.format(Long.valueOf(System.currentTimeMillis()));
    private static SimpleDateFormat mSdf = new SimpleDateFormat("yyyy/MM/dd");

    public static ClientUploadDataItem wrapperData(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory("category_push_stat");
        clientUploadDataItem.setChannel("push_sdk_stat_channel");
        clientUploadDataItem.setCounter(1);
        clientUploadDataItem.setData(str);
        clientUploadDataItem.setFromSdk(true);
        clientUploadDataItem.setTimestamp(System.currentTimeMillis());
        clientUploadDataItem.setPkgName(PushStatClientManager.getInstance(context).getPackageName());
        clientUploadDataItem.setSourcePackage("com.xiaomi.xmsf");
        clientUploadDataItem.setId("");
        clientUploadDataItem.setName("push_stat");
        return clientUploadDataItem;
    }
}

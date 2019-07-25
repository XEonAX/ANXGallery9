package com.xiaomi.mipush.sdk.stat.db;

import android.content.ContentValues;
import android.content.Context;
import com.xiaomi.mipush.sdk.stat.PushStatClientManager;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager.InsertJob;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;

public class MessageInsertJob extends InsertJob {
    private String mDescription = "MessageInsertJob";

    public MessageInsertJob(String str, ContentValues contentValues, String str2) {
        super(str, contentValues);
        this.mDescription = str2;
    }

    public static MessageInsertJob buildInsertJob(Context context, String str, ClientUploadDataItem clientUploadDataItem) {
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadDataItem);
        if (convertThriftObjectToBytes == null || convertThriftObjectToBytes.length <= 0) {
            return null;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("status", Integer.valueOf(0));
        contentValues.put("messageId", "");
        contentValues.put("messageItemId", clientUploadDataItem.getId());
        contentValues.put("messageItem", convertThriftObjectToBytes);
        contentValues.put("appId", PushStatClientManager.getInstance(context).getAppId());
        contentValues.put("packageName", PushStatClientManager.getInstance(context).getPackageName());
        contentValues.put("createTimeStamp", Long.valueOf(System.currentTimeMillis()));
        contentValues.put("uploadTimestamp", Integer.valueOf(0));
        return new MessageInsertJob(str, contentValues, "a job build to insert message to db");
    }
}

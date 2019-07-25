package com.xiaomi.mipush.sdk.stat.db;

import android.content.Context;
import android.database.Cursor;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager.BaseQueryJob;
import java.util.ArrayList;
import java.util.List;

public class MessageCountQueryJob extends BaseQueryJob<Long> {
    private String mDescription;
    private long mResult = 0;

    public MessageCountQueryJob(String str, List<String> list, String str2, String[] strArr, String str3, String str4, String str5, int i, String str6) {
        super(str, list, str2, strArr, str3, str4, str5, i);
        this.mDescription = str6;
    }

    public static MessageCountQueryJob getMessageCountJob(String str) {
        ArrayList arrayList = new ArrayList();
        arrayList.add("count(*)");
        MessageCountQueryJob messageCountQueryJob = new MessageCountQueryJob(str, arrayList, null, null, null, null, null, 0, "job to get count of all message");
        return messageCountQueryJob;
    }

    public void notifyResult(Context context, List<Long> list) {
        if (context != null && list != null && list.size() > 0) {
            this.mResult = ((Long) list.get(0)).longValue();
        }
    }

    public Object output() {
        return Long.valueOf(this.mResult);
    }

    public Long processOneData(Context context, Cursor cursor) {
        return Long.valueOf(cursor.getLong(0));
    }
}

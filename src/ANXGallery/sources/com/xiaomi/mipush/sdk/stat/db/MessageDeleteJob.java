package com.xiaomi.mipush.sdk.stat.db;

import com.xiaomi.mipush.sdk.stat.db.base.DbManager.DeleteJob;

public class MessageDeleteJob extends DeleteJob {
    protected String mDescription = "MessageDeleteJob";

    public MessageDeleteJob(String str, String str2, String[] strArr, String str3) {
        super(str, str2, strArr);
        this.mDescription = str3;
    }

    public static MessageDeleteJob deleteUploadedJob(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("status = ?");
        return new MessageDeleteJob(str, sb.toString(), new String[]{String.valueOf(2)}, "a job build to delete uploaded job");
    }
}

package com.xiaomi.mipush.sdk.stat.db;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.mipush.sdk.stat.PushStatClientManager;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager;
import com.xiaomi.mipush.sdk.stat.util.FileUtil;

public class HistoryDataDeleteJob extends MessageDeleteJob {
    public HistoryDataDeleteJob(String str, String str2, String[] strArr, String str3) {
        super(str, str2, strArr, str3);
    }

    public static HistoryDataDeleteJob deleteHistoryJob(Context context, String str, int i) {
        MyLog.i("delete  messages when db size is too bigger");
        String tableName = DbManager.getInstance(context).getTableName(str);
        if (TextUtils.isEmpty(tableName)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("rowDataId in (select ");
        StringBuilder sb2 = new StringBuilder();
        sb2.append("rowDataId from ");
        sb2.append(tableName);
        sb.append(sb2.toString());
        sb.append(" order by createTimeStamp asc");
        sb.append(" limit ?)");
        return new HistoryDataDeleteJob(str, sb.toString(), new String[]{String.valueOf(i)}, "a job build to delete history message");
    }

    private void setLimit(long j) {
        if (this.mWhereValues != null && this.mWhereValues.length > 0) {
            this.mWhereValues[0] = String.valueOf(j);
        }
    }

    public void input(Context context, Object obj) {
        if (obj instanceof Long) {
            long longValue = ((Long) obj).longValue();
            long fileSize = FileUtil.getFileSize(getDataPath());
            long j = DataBaseConfig.MAX_DB_SIZE;
            if (fileSize > j) {
                double d = (double) (fileSize - j);
                Double.isNaN(d);
                double d2 = d * 1.2d;
                double d3 = (double) j;
                Double.isNaN(d3);
                double d4 = d2 / d3;
                double d5 = (double) longValue;
                Double.isNaN(d5);
                long j2 = (long) (d4 * d5);
                setLimit(j2);
                PushStatClientManager instance = PushStatClientManager.getInstance(context);
                StringBuilder sb = new StringBuilder();
                sb.append("begin delete ");
                sb.append(j2);
                sb.append("noUpload messages , because db size is ");
                sb.append(fileSize);
                sb.append("B");
                instance.record(sb.toString());
                super.input(context, obj);
                return;
            }
            MyLog.i("db size is suitable");
        }
    }
}

package com.xiaomi.mipush.sdk.stat.upload;

import android.content.Context;

public interface IScheduleWorker {
    void onDelete(Context context);

    void onUpload(Context context);
}

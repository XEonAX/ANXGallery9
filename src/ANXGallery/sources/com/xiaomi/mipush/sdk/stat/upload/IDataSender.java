package com.xiaomi.mipush.sdk.stat.upload;

import android.content.Context;

public interface IDataSender {
    void onFailed(Context context, String str, String str2);

    void onSuccess(Context context, String str, String str2);
}

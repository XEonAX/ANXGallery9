package com.xiaomi.mipush.sdk.stat.db.base;

import android.content.Context;

public abstract class BaseDbHelperFactory {
    public abstract BaseDbHelper getDbHelper(Context context, String str);
}

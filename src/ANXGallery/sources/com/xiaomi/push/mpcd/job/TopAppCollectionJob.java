package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.content.SharedPreferences;
import com.xiaomi.xmpush.thrift.ClientCollectionType;

public class TopAppCollectionJob extends CollectionJob {
    private SharedPreferences preferences;

    public TopAppCollectionJob(Context context, int i) {
        super(context, i);
        this.preferences = context.getSharedPreferences("mipush_extra", 0);
    }

    public String collectInfo() {
        return null;
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.TopApp;
    }

    public int getJobId() {
        return 9;
    }
}

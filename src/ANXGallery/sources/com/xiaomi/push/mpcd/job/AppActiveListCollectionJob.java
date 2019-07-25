package com.xiaomi.push.mpcd.job;

import android.content.Context;
import com.xiaomi.xmpush.thrift.ClientCollectionType;

public class AppActiveListCollectionJob extends CollectionJob {
    public AppActiveListCollectionJob(Context context, int i) {
        super(context, i);
    }

    public String collectInfo() {
        return null;
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.AppActiveList;
    }

    public int getJobId() {
        return 5;
    }
}

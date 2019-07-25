package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.push.mpcd.Constants;
import com.xiaomi.xmpush.thrift.ClientCollectionType;

public class BroadcastActionCollectionjob extends CollectionJob {
    public static String mChangedActions = "";
    public static String mRestartedActions = "";

    public BroadcastActionCollectionjob(Context context, int i) {
        super(context, i);
    }

    private String shrinkActionInfo(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return "";
        }
        String[] split = str2.split(",");
        if (split.length <= 10) {
            return str2;
        }
        int length = split.length;
        while (true) {
            length--;
            if (length < split.length - 10) {
                return str;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(split[length]);
            str = sb.toString();
        }
    }

    public String collectInfo() {
        String str = "";
        if (!TextUtils.isEmpty(mRestartedActions)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(shrinkActionInfo(Constants.ACTION_PACKAGE_RESTARTED, mRestartedActions));
            str = sb.toString();
            mRestartedActions = "";
        }
        if (TextUtils.isEmpty(mChangedActions)) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(shrinkActionInfo(Constants.ACTION_PACKAGE_CHANGED, mChangedActions));
        String sb3 = sb2.toString();
        mChangedActions = "";
        return sb3;
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.BroadcastAction;
    }

    public int getJobId() {
        return 12;
    }
}

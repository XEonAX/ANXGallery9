package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.util.DeleteDataUtil;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;

public class ClearDataManager {
    private boolean mHasClearOnce;

    private static class SingletonHolder {
        public static final ClearDataManager Instance = new ClearDataManager();
    }

    private ClearDataManager() {
        this.mHasClearOnce = false;
    }

    public static ClearDataManager getInstance() {
        return SingletonHolder.Instance;
    }

    public boolean clearDataBaseIfNeeded(Context context, Account account) {
        this.mHasClearOnce = false;
        if (!Preference.getSyncShouldClearDataBase()) {
            return false;
        }
        SyncLog.d("ClearDataManager", "clear data start");
        SyncLog.d("ClearDataManager", "clear data result %s", (Object) Boolean.valueOf(DeleteDataUtil.delete(context, 0)));
        GalleryCloudSyncTagUtils.insertAccountToDB(context, account);
        this.mHasClearOnce = true;
        Preference.setSyncShouldClearDataBase(false);
        SyncLog.d("ClearDataManager", "clear data end");
        return true;
    }
}

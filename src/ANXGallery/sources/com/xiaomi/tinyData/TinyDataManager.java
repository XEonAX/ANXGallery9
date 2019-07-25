package com.xiaomi.tinyData;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.TinyDataHelper;
import com.xiaomi.push.service.TinyDataStorage;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import java.util.HashMap;
import java.util.Map;

public class TinyDataManager {
    private static TinyDataManager sInstance;
    private final Context mContext;
    private Map<String, TinyDataUploader> mUploaders = new HashMap();

    private TinyDataManager(Context context) {
        this.mContext = context;
    }

    public static TinyDataManager getInstance(Context context) {
        if (context == null) {
            MyLog.e("[TinyDataManager]:mContext is null, TinyDataManager.getInstance(Context) failed.");
            return null;
        }
        if (sInstance == null) {
            synchronized (TinyDataManager.class) {
                if (sInstance == null) {
                    sInstance = new TinyDataManager(context);
                }
            }
        }
        return sInstance;
    }

    private boolean upload(String str, String str2, String str3, String str4, long j, String str5) {
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory(str3);
        clientUploadDataItem.setName(str4);
        clientUploadDataItem.setCounter(j);
        clientUploadDataItem.setData(str5);
        clientUploadDataItem.setFromSdk(true);
        clientUploadDataItem.setChannel("push_sdk_channel");
        clientUploadDataItem.setSourcePackage(str2);
        StringBuilder sb = new StringBuilder();
        sb.append("TinyData TinyDataManager.upload item:");
        sb.append(clientUploadDataItem.getId());
        sb.append("   ts:");
        sb.append(System.currentTimeMillis());
        MyLog.w(sb.toString());
        return upload(clientUploadDataItem, str);
    }

    public void addUploader(TinyDataUploader tinyDataUploader, String str) {
        if (tinyDataUploader == null) {
            MyLog.e("[TinyDataManager]: please do not add null mUploader to TinyDataManager.");
        } else if (TextUtils.isEmpty(str)) {
            MyLog.e("[TinyDataManager]: can not add a provider from unkown resource.");
        } else {
            getUploaders().put(str, tinyDataUploader);
        }
    }

    /* access modifiers changed from: 0000 */
    public TinyDataUploader getUploader() {
        TinyDataUploader tinyDataUploader = (TinyDataUploader) this.mUploaders.get("UPLOADER_PUSH_CHANNEL");
        if (tinyDataUploader != null) {
            return tinyDataUploader;
        }
        TinyDataUploader tinyDataUploader2 = (TinyDataUploader) this.mUploaders.get("UPLOADER_HTTP");
        if (tinyDataUploader2 != null) {
            return tinyDataUploader2;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public Map<String, TinyDataUploader> getUploaders() {
        return this.mUploaders;
    }

    public boolean upload(ClientUploadDataItem clientUploadDataItem, String str) {
        if (TextUtils.isEmpty(str)) {
            MyLog.w("pkgName is null or empty, upload ClientUploadDataItem failed.");
            return false;
        } else if (TinyDataHelper.verify(clientUploadDataItem, false)) {
            return false;
        } else {
            if (TextUtils.isEmpty(clientUploadDataItem.getId())) {
                clientUploadDataItem.setId(TinyDataHelper.nextTinyDataItemId());
            }
            clientUploadDataItem.setPkgName(str);
            TinyDataStorage.cacheTinyData(this.mContext, clientUploadDataItem);
            return true;
        }
    }

    public boolean upload(String str, String str2, long j, String str3) {
        return upload(this.mContext.getPackageName(), this.mContext.getPackageName(), str, str2, j, str3);
    }
}

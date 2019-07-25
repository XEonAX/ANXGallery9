package com.miui.gallery.cloud;

import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.DBImage;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import java.io.File;

public class CreateOwnerImage extends CreateImageBase {
    public CreateOwnerImage(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void doUpload(RequestCloudItem requestCloudItem, File file) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        GalleryKssManager.doOwnerUpload(requestCloudItem, file);
    }

    /* access modifiers changed from: protected */
    public DBImage getDBImage(RequestCloudItem requestCloudItem) {
        return CloudUtils.getItem(requestCloudItem.dbCloud.getBaseUri(), GalleryApp.sGetAndroidContext(), "_id", requestCloudItem.dbCloud.getId());
    }
}

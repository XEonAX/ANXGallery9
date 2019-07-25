package com.miui.gallery.push;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.push.messagehandler.MessageHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ParcelableUtil;

public class PendingPullTask extends PendingTask<GalleryPushMessage> {
    public PendingPullTask(int i) {
        super(i);
    }

    public int getNetworkType() {
        return 1;
    }

    public GalleryPushMessage parseData(byte[] bArr) throws Exception {
        return (GalleryPushMessage) ParcelableUtil.unmarshall(bArr, GalleryPushMessage.CREATOR);
    }

    public boolean process(GalleryPushMessage galleryPushMessage) throws Exception {
        if (!AgreementsUtils.isNetworkingAgreementAccepted()) {
            Log.w("PendingPullTask", "CTA not confirmed, retry later");
            return true;
        } else if (!NetworkUtils.isNetworkConnected()) {
            Log.w("PendingPullTask", "Network is disconnected, retry later");
            return true;
        } else {
            String businessModule = galleryPushMessage.getBusinessModule();
            MessageHandler create = MessageHandlerFactory.create(businessModule);
            if (create != null) {
                create.handlePull(GalleryApp.sGetAndroidContext(), galleryPushMessage);
            } else {
                Log.e("PendingPullTask", "MessageHandler is undefined: %s", (Object) businessModule);
            }
            return false;
        }
    }

    public boolean requireCharging() {
        return true;
    }

    public boolean requireDeviceIdle() {
        return true;
    }

    public byte[] wrapData(GalleryPushMessage galleryPushMessage) throws Exception {
        return ParcelableUtil.marshall(galleryPushMessage);
    }
}

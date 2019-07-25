package com.miui.gallery.cloud;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.GalleryUtils;

public class CloudReceiverRegister {

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static final CloudReceiverRegister sInstance = new CloudReceiverRegister();
    }

    private CloudReceiverRegister() {
    }

    public static CloudReceiverRegister getInstance() {
        return SingletonHolder.sInstance;
    }

    public void onAppCreate() {
        GalleryUtils.registerReceiver(GalleryApp.sGetAndroidContext(), new TimeSetReceiver(), "android.intent.action.TIME_SET");
    }
}

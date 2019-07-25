package com.miui.gallery.util.deviceprovider;

import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.cloud.CloudUtils;

public class BigApplicationHelper extends ApplicationHelper {
    /* access modifiers changed from: protected */
    public BitmapProviderInterface getBitmapProviderInternal() {
        return new BigBitmapProvider();
    }

    /* access modifiers changed from: protected */
    public final IntentProviderInterface getIntentProviderInternal() {
        return new BigIntentProvider();
    }

    /* access modifiers changed from: protected */
    public MiCloudProviderInterface getMiCloudProviderInternal() {
        return new BigMiCloudProvider();
    }

    /* access modifiers changed from: protected */
    public boolean isSecretAlbumFeatureOpenInternal() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean supportShareInternal() {
        return CloudUtils.supportShare();
    }

    /* access modifiers changed from: protected */
    public boolean supportStoryAlbumInternal() {
        return ImageFeatureManager.isDeviceSupportStoryFunction();
    }
}

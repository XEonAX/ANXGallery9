package com.miui.gallery.util.deviceprovider;

public abstract class ApplicationHelper {
    private static ApplicationHelper sApplicationHelper;

    public static BitmapProviderInterface getBitmapProvider() {
        return getInstance().getBitmapProviderInternal();
    }

    private static ApplicationHelper getInstance() {
        if (sApplicationHelper == null) {
            sApplicationHelper = newInstance();
        }
        return sApplicationHelper;
    }

    public static IntentProviderInterface getIntentProvider() {
        return getInstance().getIntentProviderInternal();
    }

    public static MiCloudProviderInterface getMiCloudProvider() {
        return getInstance().getMiCloudProviderInternal();
    }

    public static boolean isAutoUploadFeatureOpen() {
        return true;
    }

    public static boolean isBabyAlbumFeatureOpen() {
        return true;
    }

    public static boolean isCloudTrashBinFeatureOpen() {
        return true;
    }

    public static boolean isFaceAlbumFeatureOpen() {
        return true;
    }

    public static boolean isSecretAlbumFeatureOpen() {
        return getInstance().isSecretAlbumFeatureOpenInternal();
    }

    public static boolean isStoryAlbumFeatureOpen() {
        return getInstance().supportStoryAlbumInternal();
    }

    private static ApplicationHelper newInstance() {
        return new BigApplicationHelper();
    }

    public static boolean supportShare() {
        return getInstance().supportShareInternal();
    }

    /* access modifiers changed from: protected */
    public abstract BitmapProviderInterface getBitmapProviderInternal();

    /* access modifiers changed from: protected */
    public abstract IntentProviderInterface getIntentProviderInternal();

    /* access modifiers changed from: protected */
    public abstract MiCloudProviderInterface getMiCloudProviderInternal();

    /* access modifiers changed from: protected */
    public abstract boolean isSecretAlbumFeatureOpenInternal();

    /* access modifiers changed from: protected */
    public abstract boolean supportShareInternal();

    /* access modifiers changed from: protected */
    public abstract boolean supportStoryAlbumInternal();
}

package com.miui.privacy;

import android.app.Activity;
import android.app.Fragment;
import com.miui.core.SdkHelper;

public class LockSettingsHelper {
    private static final IPrivacyHelper IMPL = (SdkHelper.IS_MIUI ? new MiuiHelper() : new XmsHelper());
    private final IPrivacyWrapper mImpl;

    public LockSettingsHelper(Activity activity) {
        this.mImpl = SdkHelper.IS_MIUI ? new MiuiWrapper(activity) : new XmsWrapper(activity);
    }

    public static void confirmPrivateGalleryPassword(Fragment fragment, int i) {
        IMPL.confirmPrivateGalleryPassword(fragment, i);
    }

    public static void startAuthenticatePasswordActivity(Activity activity, int i) {
        IMPL.startAuthenticatePasswordActivity(activity, i);
    }

    public static void startAuthenticatePasswordActivity(Fragment fragment, int i) {
        IMPL.startAuthenticatePasswordActivity(fragment, i);
    }

    public static void startSetPrivacyPasswordActivity(Fragment fragment, int i) {
        IMPL.startSetPrivacyPasswordActivity(fragment, i);
    }

    public boolean isPrivacyPasswordEnabled() {
        return this.mImpl.isPrivacyPasswordEnabled();
    }

    public boolean isPrivateGalleryEnabled() {
        return this.mImpl.isPrivateGalleryEnabled();
    }

    public void setPrivateGalleryEnabled(boolean z) {
        this.mImpl.setPrivateGalleryEnabled(z);
    }
}

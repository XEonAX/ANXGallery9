package com.miui.privacy;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;

class MiuiHelper implements IPrivacyHelper {
    MiuiHelper() {
    }

    public void confirmPrivateGalleryPassword(Fragment fragment, int i) {
        fragment.startActivityForResult(new Intent("android.app.action.CONFIRM_GALLERY_PASSWORD"), i);
    }

    public void startAuthenticatePasswordActivity(Activity activity, int i) {
        Intent intent = new Intent();
        intent.setClassName("com.android.settings", "com.android.settings.PrivacyPasswordConfirmLockPattern");
        intent.setAction("android.app.action.PRIVACY_PASSWORD_CONFIRM_PASSWORD");
        intent.putExtra("android.intent.extra.shortcut.NAME", activity.getPackageName());
        activity.startActivityForResult(intent, i);
    }

    public void startAuthenticatePasswordActivity(Fragment fragment, int i) {
        Intent intent = new Intent();
        intent.setClassName("com.android.settings", "com.android.settings.PrivacyPasswordConfirmLockPattern");
        intent.setAction("android.app.action.PRIVACY_PASSWORD_CONFIRM_PASSWORD");
        intent.putExtra("android.intent.extra.shortcut.NAME", fragment.getActivity().getPackageName());
        fragment.startActivityForResult(intent, i);
    }

    public void startSetPrivacyPasswordActivity(Fragment fragment, int i) {
        Intent intent = new Intent();
        intent.setClassName("com.android.settings", "com.android.settings.PrivacyPasswordChooseLockPattern");
        intent.setAction("android.app.action.PRIVACY_PASSWORD_SET_NEW_PASSWORD");
        intent.putExtra("android.intent.extra.shortcut.NAME", fragment.getActivity().getPackageName());
        fragment.startActivityForResult(intent, i);
    }
}

package com.miui.gallery.share;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.ui.LoginAndSyncCheckFragment;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;

public class LoginAndSyncForInvitationFragment extends BaseFragment {
    private Path mPath;

    public void finish() {
        Activity activity = getActivity();
        if (activity != null) {
            activity.finish();
        }
    }

    public String getPageName() {
        return null;
    }

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 0;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1) {
            AlbumShareInvitationHandler.acceptShareInvitation(getActivity(), this.mPath);
        } else {
            finish();
        }
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.app.Fragment, com.miui.gallery.share.LoginAndSyncForInvitationFragment, com.miui.gallery.ui.BaseFragment] */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.mPath = (Path) arguments.getParcelable("invitation_path");
        }
        if (this.mPath == null) {
            finish();
            return;
        }
        Bundle bundle2 = new Bundle();
        bundle2.putBoolean("key_check_gallery_sync", true);
        bundle2.putSerializable("cloud_guide_source", CloudGuideSource.SHARE_INVITATION);
        LoginAndSyncCheckFragment.checkLoginAndSyncState(this, bundle2);
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean useImageLoader() {
        return false;
    }
}

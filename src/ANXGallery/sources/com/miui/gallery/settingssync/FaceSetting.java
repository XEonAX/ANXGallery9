package com.miui.gallery.settingssync;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.SyncableSetting;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.GallerySamplingStatHelper;

class FaceSetting implements SyncableSetting {
    FaceSetting() {
    }

    public String getName() {
        return "face";
    }

    public String getValue() {
        return null;
    }

    public Boolean isEnabled() {
        if (AIAlbumStatusHelper.isFaceSwitchSet()) {
            return Boolean.valueOf(AIAlbumStatusHelper.isFaceAlbumEnabled());
        }
        return null;
    }

    public boolean isExport() {
        return true;
    }

    public void writeValue(Boolean bool, Object obj) {
        if (bool != null) {
            if (!bool.booleanValue() && AIAlbumStatusHelper.isFaceSwitchSet() && AIAlbumStatusHelper.isFaceAlbumEnabled()) {
                GallerySamplingStatHelper.recordCountEvent("face", "settings_sync_face_status_to_close");
            }
            AIAlbumStatusHelper.setFaceAlbumStatus(GalleryApp.sGetAndroidContext(), bool.booleanValue());
        }
    }
}

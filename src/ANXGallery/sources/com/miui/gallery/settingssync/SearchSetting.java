package com.miui.gallery.settingssync;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.SyncableSetting;
import com.miui.gallery.ui.AIAlbumStatusHelper;

class SearchSetting implements SyncableSetting {
    SearchSetting() {
    }

    public String getName() {
        return "search";
    }

    public String getValue() {
        return null;
    }

    public Boolean isEnabled() {
        if (!AIAlbumStatusHelper.isLocalSearchSet()) {
            return null;
        }
        return Boolean.valueOf(AIAlbumStatusHelper.isLocalSearchOpen(true));
    }

    public boolean isExport() {
        return true;
    }

    public void writeValue(Boolean bool, Object obj) {
        if (bool == null) {
            return;
        }
        if (AIAlbumStatusHelper.isLocalSearchSet() || bool.booleanValue()) {
            AIAlbumStatusHelper.setLocalSearchStatus(GalleryApp.sGetAndroidContext(), bool.booleanValue());
        }
    }
}

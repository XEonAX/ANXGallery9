package com.miui.gallery.preference;

import com.miui.gallery.util.StorageUtils;

public class DocumentProviderPreference {
    public static int getOpenExternalDocumentCount() {
        StringBuilder sb = new StringBuilder();
        sb.append("document_provider_access_intent_count_");
        sb.append(StorageUtils.getSecondaryStoragePath());
        return PreferenceHelper.getInt(sb.toString(), 0);
    }

    public static boolean isFirstEntrance() {
        StringBuilder sb = new StringBuilder();
        sb.append("document_provider_first_entrance_sdcard_permission_");
        sb.append(StorageUtils.getSecondaryStoragePath());
        return PreferenceHelper.getBoolean(sb.toString(), true);
    }

    public static void setFirstEntrance(boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("document_provider_first_entrance_sdcard_permission_");
        sb.append(StorageUtils.getSecondaryStoragePath());
        PreferenceHelper.putBoolean(sb.toString(), z);
    }

    public static void setOpenExternalDocumentCount(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("document_provider_access_intent_count_");
        sb.append(StorageUtils.getSecondaryStoragePath());
        PreferenceHelper.putInt(sb.toString(), i);
    }
}

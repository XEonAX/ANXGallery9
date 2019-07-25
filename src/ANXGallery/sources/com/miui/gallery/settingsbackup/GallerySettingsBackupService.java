package com.miui.gallery.settingsbackup;

import com.xiaomi.settingsdk.backup.CloudBackupServiceBase;
import com.xiaomi.settingsdk.backup.ICloudBackup;

public class GallerySettingsBackupService extends CloudBackupServiceBase {
    /* access modifiers changed from: protected */
    public ICloudBackup getBackupImpl() {
        return new GallerySettingsBackupImpl();
    }
}

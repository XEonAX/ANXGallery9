package com.miui.backup;

import android.app.backup.FullBackupDataOutput;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import java.io.IOException;
import miui.app.backup.BackupMeta;
import miui.app.backup.FullBackupAgent;

public class MiuiBackupAgentImpl extends FullBackupAgent {
    private IBackupAgentDelegate mDelegate;

    public MiuiBackupAgentImpl(IBackupAgentDelegate iBackupAgentDelegate) {
        this.mDelegate = iBackupAgentDelegate;
    }

    /* access modifiers changed from: protected */
    public void attachBaseContext(Context context) {
        MiuiBackupAgentImpl.super.attachBaseContext(context);
        this.mDelegate.attachBaseContext(context);
    }

    /* access modifiers changed from: protected */
    public int getVersion(int i) {
        return this.mDelegate.getVersion(i);
    }

    /* access modifiers changed from: protected */
    public int onAttachRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor, String str) throws IOException {
        return this.mDelegate.onAttachRestore(BackupMetaUtils.translate(backupMeta), parcelFileDescriptor, str);
    }

    public void onCreate() {
        this.mDelegate.onCreate();
    }

    /* access modifiers changed from: protected */
    public int onDataRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor) throws IOException {
        return this.mDelegate.onDataRestore(BackupMetaUtils.translate(backupMeta), parcelFileDescriptor);
    }

    public void onDestroy() {
        this.mDelegate.onDestroy();
    }

    /* access modifiers changed from: protected */
    public int onFullBackup(ParcelFileDescriptor parcelFileDescriptor, int i) throws IOException {
        return this.mDelegate.onFullBackup(parcelFileDescriptor, i);
    }

    /* access modifiers changed from: protected */
    public int onRestoreEnd(BackupMeta backupMeta) throws IOException {
        return this.mDelegate.onRestoreEnd(BackupMetaUtils.translate(backupMeta));
    }

    /* access modifiers changed from: protected */
    public int tarAttaches(String str, FullBackupDataOutput fullBackupDataOutput, int i) throws IOException {
        MiuiBackupAgentImpl.super.tarAttaches(str, fullBackupDataOutput, i);
        return this.mDelegate.tarAttaches(str, fullBackupDataOutput, i);
    }
}

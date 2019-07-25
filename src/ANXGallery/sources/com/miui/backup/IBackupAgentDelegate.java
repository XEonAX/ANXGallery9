package com.miui.backup;

import android.app.backup.FullBackupDataOutput;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import java.io.IOException;

public interface IBackupAgentDelegate {

    /* renamed from: com.miui.backup.IBackupAgentDelegate$-CC reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$attachBaseContext(IBackupAgentDelegate iBackupAgentDelegate, Context context) {
        }

        public static void $default$onCreate(IBackupAgentDelegate iBackupAgentDelegate) {
        }

        public static void $default$onDestroy(IBackupAgentDelegate iBackupAgentDelegate) {
        }
    }

    void attachBaseContext(Context context);

    int getVersion(int i);

    int onAttachRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor, String str);

    void onCreate();

    int onDataRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor) throws IOException;

    void onDestroy();

    int onFullBackup(ParcelFileDescriptor parcelFileDescriptor, int i) throws IOException;

    int onRestoreEnd(BackupMeta backupMeta);

    int tarAttaches(String str, FullBackupDataOutput fullBackupDataOutput, int i);
}

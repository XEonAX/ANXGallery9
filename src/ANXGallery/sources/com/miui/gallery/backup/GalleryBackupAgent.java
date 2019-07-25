package com.miui.gallery.backup;

import android.app.backup.BackupAgent;
import android.app.backup.BackupDataInput;
import android.app.backup.BackupDataOutput;
import android.app.backup.FullBackupDataOutput;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import com.miui.backup.BackupCompatHelper;
import com.miui.backup.BackupErrorCode;
import com.miui.backup.BackupMeta;
import com.miui.backup.IBackupAgentDelegate;
import com.miui.backup.IBackupAgentDelegate.CC;
import com.miui.gallery.backup.GalleryBackupProtos.BackupMessage;
import com.miui.gallery.util.Log;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import miui.reflect.Method;

public class GalleryBackupAgent extends BackupAgent {
    private static final int GALLERY_BACKUP_DATA_VERSION = 1;
    private static final String TAG = "GalleryBackupAgent";
    private BackupAgent mBackupAgentImpl;

    private void ensureBackupAgent() {
        if (this.mBackupAgentImpl == null) {
            this.mBackupAgentImpl = BackupCompatHelper.createBackupAgentImpl(new IBackupAgentDelegate() {
                private Context mContext;

                public void attachBaseContext(Context context) {
                    this.mContext = context;
                }

                public int getVersion(int i) {
                    return 1;
                }

                public int onAttachRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor, String str) {
                    return BackupErrorCode.ERR_NONE();
                }

                public /* synthetic */ void onCreate() {
                    CC.$default$onCreate(this);
                }

                /* JADX WARNING: Code restructure failed: missing block: B:11:?, code lost:
                    r2.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:12:0x0023, code lost:
                    r2 = move-exception;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
                    r3.addSuppressed(r2);
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:14:0x0028, code lost:
                    r2.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:5:0x0019, code lost:
                    r0 = move-exception;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:9:0x001d, code lost:
                    if (r3 != null) goto L_0x001f;
                 */
                public int onDataRestore(BackupMeta backupMeta, ParcelFileDescriptor parcelFileDescriptor) throws IOException {
                    FileInputStream fileInputStream = new FileInputStream(parcelFileDescriptor.getFileDescriptor());
                    GalleryBackupHelper.restore(BackupMessage.parseFrom((InputStream) fileInputStream));
                    fileInputStream.close();
                    return BackupErrorCode.ERR_NONE();
                    throw th;
                }

                public /* synthetic */ void onDestroy() {
                    CC.$default$onDestroy(this);
                }

                /* JADX WARNING: Code restructure failed: missing block: B:11:?, code lost:
                    r3.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:12:0x0023, code lost:
                    r3 = move-exception;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
                    r2.addSuppressed(r3);
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:14:0x0028, code lost:
                    r3.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:5:0x0019, code lost:
                    r0 = move-exception;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:9:0x001d, code lost:
                    if (r2 != null) goto L_0x001f;
                 */
                public int onFullBackup(ParcelFileDescriptor parcelFileDescriptor, int i) throws IOException {
                    FileOutputStream fileOutputStream = new FileOutputStream(parcelFileDescriptor.getFileDescriptor());
                    GalleryBackupHelper.backup().writeTo(fileOutputStream);
                    fileOutputStream.close();
                    return BackupErrorCode.ERR_NONE();
                    throw th;
                }

                public int onRestoreEnd(BackupMeta backupMeta) {
                    BackupCompatHelper.setIsNeedBeKilled(this.mContext);
                    return BackupErrorCode.ERR_NONE();
                }

                public int tarAttaches(String str, FullBackupDataOutput fullBackupDataOutput, int i) {
                    return BackupErrorCode.ERR_NONE();
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public void attachBaseContext(Context context) {
        super.attachBaseContext(context);
        ensureBackupAgent();
        if (this.mBackupAgentImpl != null) {
            Class<BackupAgent> cls = BackupAgent.class;
            String str = "attachBaseContext";
            try {
                Class cls2 = Void.TYPE;
                Class[] clsArr = {Context.class};
                Method.of(cls, str, cls2, clsArr).invoke(BackupAgent.class, this.mBackupAgentImpl, new Object[]{context});
            } catch (Exception e) {
                Log.e(TAG, (Throwable) e);
            }
        }
    }

    public void onBackup(ParcelFileDescriptor parcelFileDescriptor, BackupDataOutput backupDataOutput, ParcelFileDescriptor parcelFileDescriptor2) throws IOException {
    }

    public void onCreate() {
        if (this.mBackupAgentImpl != null) {
            this.mBackupAgentImpl.onCreate();
        }
    }

    public final void onFullBackup(FullBackupDataOutput fullBackupDataOutput) throws IOException {
        if (this.mBackupAgentImpl != null) {
            this.mBackupAgentImpl.onFullBackup(fullBackupDataOutput);
        }
    }

    public void onRestore(BackupDataInput backupDataInput, int i, ParcelFileDescriptor parcelFileDescriptor) throws IOException {
    }

    /* access modifiers changed from: protected */
    public final void onRestoreFile(ParcelFileDescriptor parcelFileDescriptor, long j, int i, String str, String str2, long j2, long j3) throws IOException {
        if (this.mBackupAgentImpl != null) {
            BackupCompatHelper.invokeOnRestoreFile(this.mBackupAgentImpl, parcelFileDescriptor, j, i, str, str2, j2, j3);
        }
    }
}

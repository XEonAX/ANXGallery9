package com.miui.backup;

import android.app.backup.BackupAgent;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.miui.core.SdkHelper;
import miui.app.backup.BackupManager;
import miui.app.backup.FullBackupAgent;
import miui.reflect.IllegalArgumentException;
import miui.reflect.Method;
import miui.reflect.NoSuchMethodException;

public class BackupCompatHelper {
    private static final String TAG = "BackupCompatHelper";

    private BackupCompatHelper() {
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.backup.MiuiBackupAgentImpl, android.app.backup.BackupAgent] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.backup.MiuiBackupAgentImpl, android.app.backup.BackupAgent]
  assigns: [com.miui.backup.MiuiBackupAgentImpl]
  uses: [android.app.backup.BackupAgent]
  mth insns count: 5
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public static BackupAgent createBackupAgentImpl(IBackupAgentDelegate iBackupAgentDelegate) {
        if (SdkHelper.IS_MIUI) {
            return new MiuiBackupAgentImpl(iBackupAgentDelegate);
        }
        return null;
    }

    public static void invokeOnRestoreFile(BackupAgent backupAgent, ParcelFileDescriptor parcelFileDescriptor, long j, int i, String str, String str2, long j2, long j3) {
        try {
            Class cls = SdkHelper.IS_MIUI ? FullBackupAgent.class : BackupAgent.class;
            Method.of(cls, "onRestoreFile", "(Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJ)V").invoke(cls, backupAgent, new Object[]{parcelFileDescriptor, Long.valueOf(j), Integer.valueOf(i), str, str2, Long.valueOf(j2), Long.valueOf(j3)});
        } catch (NoSuchMethodException e) {
            Log.e(TAG, "NoSuchMethodException", e);
        } catch (IllegalArgumentException e2) {
            Log.e(TAG, "IllegalArgumentException", e2);
        }
    }

    public static void setIsNeedBeKilled(Context context) {
        if (SdkHelper.IS_MIUI) {
            try {
                BackupManager backupManager = BackupManager.getBackupManager(context);
                Class<BackupManager> cls = BackupManager.class;
                Method.of(cls, "setIsNeedBeKilled", "(Z)V").invoke(cls, backupManager, new Object[]{Boolean.valueOf(true)});
            } catch (NoSuchMethodException e) {
                Log.e(TAG, "NoSuchMethodException", e);
            } catch (IllegalArgumentException e2) {
                Log.e(TAG, "IllegalArgumentException", e2);
            }
        }
    }
}

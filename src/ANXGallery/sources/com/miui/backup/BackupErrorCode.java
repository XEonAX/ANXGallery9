package com.miui.backup;

import com.miui.core.SdkHelper;

public class BackupErrorCode {
    private static final IBackupErrorCode IMPL = (SdkHelper.IS_MIUI ? new MiuiBackupErrorCode() : new XmsBackupErrorCode());

    public static int ERR_AUTHENTICATION_FAILED() {
        return IMPL.ERR_AUTHENTICATION_FAILED();
    }

    public static int ERR_BAKFILE_BROKEN() {
        return IMPL.ERR_BAKFILE_BROKEN();
    }

    public static int ERR_BINDER_DIED() {
        return IMPL.ERR_BINDER_DIED();
    }

    public static int ERR_IO_PERMISSION() {
        return IMPL.ERR_IO_PERMISSION();
    }

    public static int ERR_NONE() {
        return IMPL.ERR_NONE();
    }

    public static int ERR_NO_BACKUPAGENT() {
        return IMPL.ERR_NO_BACKUPAGENT();
    }

    public static int ERR_UNKNOWN() {
        return IMPL.ERR_UNKNOWN();
    }

    public static int ERR_VERSION_TOO_OLD() {
        return IMPL.ERR_VERSION_TOO_OLD();
    }

    public static int ERR_VERSION_UNSUPPORTED() {
        return IMPL.ERR_VERSION_UNSUPPORTED();
    }
}

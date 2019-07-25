package com.miui.backup;

class MiuiBackupErrorCode implements IBackupErrorCode {
    MiuiBackupErrorCode() {
    }

    public int ERR_AUTHENTICATION_FAILED() {
        return 3;
    }

    public int ERR_BAKFILE_BROKEN() {
        return 6;
    }

    public int ERR_BINDER_DIED() {
        return 8;
    }

    public int ERR_IO_PERMISSION() {
        return 7;
    }

    public int ERR_NONE() {
        return 0;
    }

    public int ERR_NO_BACKUPAGENT() {
        return 2;
    }

    public int ERR_UNKNOWN() {
        return 1;
    }

    public int ERR_VERSION_TOO_OLD() {
        return 5;
    }

    public int ERR_VERSION_UNSUPPORTED() {
        return 4;
    }
}

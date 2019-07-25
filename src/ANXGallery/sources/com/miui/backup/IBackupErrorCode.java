package com.miui.backup;

interface IBackupErrorCode {
    int ERR_AUTHENTICATION_FAILED();

    int ERR_BAKFILE_BROKEN();

    int ERR_BINDER_DIED();

    int ERR_IO_PERMISSION();

    int ERR_NONE();

    int ERR_NO_BACKUPAGENT();

    int ERR_UNKNOWN();

    int ERR_VERSION_TOO_OLD();

    int ERR_VERSION_UNSUPPORTED();
}

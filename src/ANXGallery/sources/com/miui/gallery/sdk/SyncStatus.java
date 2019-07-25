package com.miui.gallery.sdk;

public enum SyncStatus {
    STATUS_NONE,
    STATUS_INIT,
    STATUS_INTERRUPT,
    STATUS_SUCCESS,
    STATUS_ABADON;

    public static SyncStatus toSyncStatus(int i) {
        switch (i) {
            case -1:
                return STATUS_NONE;
            case 0:
                return STATUS_INIT;
            case 1:
                return STATUS_INTERRUPT;
            case 2:
                return STATUS_SUCCESS;
            case 3:
                return STATUS_ABADON;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("unknown status: ");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
        }
    }
}

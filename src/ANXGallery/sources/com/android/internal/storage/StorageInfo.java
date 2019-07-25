package com.android.internal.storage;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.os.storage.StorageVolume;
import android.os.storage.VolumeInfo;

public class StorageInfo {
    private boolean isMounted;
    private boolean isPrimary;
    private boolean isSd;
    private boolean isUsb;
    private boolean isVisible;
    private boolean isXspace;
    private String mDescription;
    private String mPath;
    private Object mWrapped;

    public StorageInfo(String str) {
        this.mPath = str;
    }

    @TargetApi(24)
    public Intent createAccessIntent(Context context) {
        StorageVolume storageVolume = this.mWrapped instanceof VolumeInfo ? ((VolumeInfo) this.mWrapped).buildStorageVolume(context, context.getUserId(), false) : this.mWrapped instanceof StorageVolume ? (StorageVolume) this.mWrapped : null;
        if (storageVolume != null) {
            return storageVolume.createAccessIntent(null);
        }
        return null;
    }

    public String getDescription() {
        return this.mDescription == null ? "" : this.mDescription;
    }

    public String getPath() {
        return this.mPath;
    }

    public boolean isMounted() {
        return this.isMounted;
    }

    public boolean isPrimary() {
        return this.isPrimary;
    }

    public boolean isSd() {
        return this.isSd;
    }

    public boolean isUsb() {
        return this.isUsb;
    }

    public boolean isXspace() {
        return this.isXspace;
    }

    public void setDescription(String str) {
        this.mDescription = str;
    }

    public void setMounted(boolean z) {
        this.isMounted = z;
    }

    /* access modifiers changed from: 0000 */
    public void setPath(String str) {
        this.mPath = str;
    }

    /* access modifiers changed from: 0000 */
    public void setPrimary(boolean z) {
        this.isPrimary = z;
    }

    /* access modifiers changed from: 0000 */
    public void setSd(boolean z) {
        this.isSd = z;
    }

    /* access modifiers changed from: 0000 */
    public void setUsb(boolean z) {
        this.isUsb = z;
    }

    /* access modifiers changed from: 0000 */
    public void setVisible(boolean z) {
        this.isVisible = z;
    }

    /* access modifiers changed from: 0000 */
    public void setWrapped(Object obj) {
        this.mWrapped = obj;
    }

    public void setXspace(boolean z) {
        this.isXspace = z;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Storage{ ");
        sb.append("mPath=");
        sb.append(this.mPath);
        sb.append(",");
        sb.append("mDescription=");
        sb.append(this.mDescription);
        sb.append(",");
        sb.append("isMounted=");
        sb.append(this.isMounted);
        sb.append(",");
        sb.append("isPrimary=");
        sb.append(this.isPrimary);
        sb.append(",");
        sb.append("isSD=");
        sb.append(this.isSd);
        sb.append(",");
        sb.append("isUsb=");
        sb.append(this.isUsb);
        sb.append(",");
        sb.append("isXspace=");
        sb.append(this.isXspace);
        sb.append(" }");
        return sb.toString();
    }
}

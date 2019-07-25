package com.miui.gallery.cloud.policy;

import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloudcontrol.strategies.BackupPolicisStrategy.PolicyWrapper;
import com.miui.gallery.preference.GalleryPreferences.Sync;

public class PolicyImpl implements IPolicy {
    private final PolicyWrapper mProxy;
    private final SyncType mType;

    public PolicyImpl(SyncType syncType, PolicyWrapper policyWrapper) {
        this.mType = syncType;
        this.mProxy = policyWrapper;
    }

    public SyncType getType() {
        return this.mType;
    }

    public boolean isDisallowMetered() {
        if (!Sync.getBackupOnlyInWifi()) {
            return false;
        }
        return this.mProxy != null ? this.mProxy.isDisallowMetered() : true;
    }

    public boolean isEnable() {
        if (this.mProxy != null) {
            return this.mProxy.isEnable();
        }
        return true;
    }

    public boolean isIgnoreBatteryLow() {
        if (this.mProxy != null) {
            return this.mProxy.isIgnoreBattery();
        }
        return false;
    }

    public boolean isRequireCharging() {
        if (this.mProxy != null) {
            return this.mProxy.isRequireCharging();
        }
        return false;
    }
}

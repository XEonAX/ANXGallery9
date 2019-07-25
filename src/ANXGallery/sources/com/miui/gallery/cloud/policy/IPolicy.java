package com.miui.gallery.cloud.policy;

import com.miui.gallery.cloud.base.SyncType;

public interface IPolicy {
    SyncType getType();

    boolean isDisallowMetered();

    boolean isEnable();

    boolean isIgnoreBatteryLow();

    boolean isRequireCharging();
}

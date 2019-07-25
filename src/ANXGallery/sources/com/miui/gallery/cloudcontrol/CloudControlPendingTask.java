package com.miui.gallery.cloudcontrol;

import com.miui.gallery.push.PendingPullTask;

public class CloudControlPendingTask extends PendingPullTask {
    public CloudControlPendingTask(int i) {
        super(i);
    }

    public boolean requireCharging() {
        return false;
    }

    public boolean requireDeviceIdle() {
        return false;
    }
}

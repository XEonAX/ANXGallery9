package com.miui.gallery.cloudcontrol.strategies;

import com.google.gson.annotations.SerializedName;
import com.miui.os.Rom;

public class LocationStrategy extends BaseStrategy {
    private transient int mDailyUpdateLimit = 0;
    @SerializedName("daily_update_limit_dev")
    private int mDailyUpdateLimitDev = 0;
    @SerializedName("daily_update_limit_stable")
    private int mDailyUpdateLimitStable = 0;

    public static LocationStrategy createDefault() {
        LocationStrategy locationStrategy = new LocationStrategy();
        if (Rom.IS_ALPHA) {
            locationStrategy.mDailyUpdateLimit = 100;
        } else {
            locationStrategy.mDailyUpdateLimit = 0;
        }
        return locationStrategy;
    }

    public void doAdditionalProcessing() {
        if (Rom.IS_ALPHA) {
            this.mDailyUpdateLimit = 100;
        } else if (Rom.IS_DEV) {
            this.mDailyUpdateLimit = this.mDailyUpdateLimitDev;
        } else if (Rom.IS_STABLE) {
            this.mDailyUpdateLimit = this.mDailyUpdateLimitStable;
        } else {
            this.mDailyUpdateLimit = 0;
        }
    }

    public int getDailyUpdateLimit() {
        return this.mDailyUpdateLimit;
    }
}

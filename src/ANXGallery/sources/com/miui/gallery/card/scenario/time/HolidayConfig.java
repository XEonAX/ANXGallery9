package com.miui.gallery.card.scenario.time;

public class HolidayConfig {
    final int mHoliday;
    final int mMaxContinuousDay;
    final int mPreviousMaxDay;

    public HolidayConfig(int i, int i2, int i3) {
        this.mHoliday = i;
        this.mPreviousMaxDay = i2;
        this.mMaxContinuousDay = i3;
    }

    public int getHoliday() {
        return this.mHoliday;
    }

    public int getMaxContinuousDay() {
        return this.mMaxContinuousDay;
    }

    public int getPreviousMaxDay() {
        return this.mPreviousMaxDay;
    }
}

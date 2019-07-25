package com.miui.gallery.widget.recyclerview.transition;

public class FuzzyMatchItem {
    public final long mDate;
    public final long mId;
    public final String mLocation;
    public final int mPosition;

    public FuzzyMatchItem(int i, long j, String str, long j2) {
        this.mPosition = i;
        this.mId = j;
        this.mLocation = str;
        this.mDate = j2;
    }

    public String toString() {
        return String.format("mPosition=%d; mId=%s, mLocation=%s, mDate=%s", new Object[]{Integer.valueOf(this.mPosition), Long.valueOf(this.mId), this.mLocation, Long.valueOf(this.mDate)});
    }
}

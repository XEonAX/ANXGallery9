package com.miui.gallery.video.editor.model;

public class FilterAdjustData extends AdjustData {
    int MAX = 100;
    int MIN = 0;
    private int mId;
    private boolean mIsMid;
    private String mLabel = "";

    public FilterAdjustData(int i, short s, String str, int i2, boolean z, String str2) {
        super(s, str, i2);
        this.mId = i;
        this.mIsMid = z;
        this.mLabel = str2;
    }

    public int getId() {
        return this.mId;
    }

    public String getLable() {
        return this.mLabel;
    }

    public int getMax() {
        return this.MAX;
    }

    public int getMin() {
        return this.mIsMid ? -this.MAX : this.MIN;
    }

    public boolean isMid() {
        return this.mIsMid;
    }
}

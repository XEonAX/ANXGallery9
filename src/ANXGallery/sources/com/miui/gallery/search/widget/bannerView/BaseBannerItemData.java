package com.miui.gallery.search.widget.bannerView;

public abstract class BaseBannerItemData {
    private int mDisplayDuration = -1;

    public int getDisplayDuration() {
        return this.mDisplayDuration;
    }

    public void setDisplayDuration(int i) {
        if (i > 0) {
            this.mDisplayDuration = i;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("displayDuration = ");
        sb.append(this.mDisplayDuration);
        return sb.toString();
    }
}

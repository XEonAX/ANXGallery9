package com.miui.gallery.cloud.syncstate;

import java.util.Objects;

public class DirtyCount {
    private int mOversizedImageCount;
    private int mOversizedVideoCount;
    private int mSyncableImageCount;
    private int mSyncableVideoCount;

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null || !(obj instanceof DirtyCount)) {
            return false;
        }
        DirtyCount dirtyCount = (DirtyCount) obj;
        if (this.mSyncableImageCount == dirtyCount.mSyncableImageCount && this.mSyncableVideoCount == dirtyCount.mSyncableVideoCount && this.mOversizedImageCount == dirtyCount.mOversizedImageCount && this.mOversizedVideoCount == dirtyCount.mOversizedVideoCount) {
            z = true;
        }
        return z;
    }

    public int getOversizedCount() {
        return this.mOversizedImageCount + this.mOversizedVideoCount;
    }

    public int getSyncableCount() {
        return this.mSyncableImageCount + this.mSyncableVideoCount;
    }

    public int getTotalImageCount() {
        return this.mSyncableImageCount + this.mOversizedImageCount;
    }

    public int getTotalVideoCount() {
        return this.mSyncableVideoCount + this.mOversizedVideoCount;
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Integer.valueOf(this.mSyncableImageCount), Integer.valueOf(this.mSyncableVideoCount), Integer.valueOf(this.mOversizedImageCount), Integer.valueOf(this.mOversizedVideoCount)});
    }

    public DirtyCount plus(DirtyCount dirtyCount) {
        if (dirtyCount != null) {
            this.mSyncableImageCount += dirtyCount.mSyncableImageCount;
            this.mSyncableVideoCount += dirtyCount.mSyncableVideoCount;
            this.mOversizedImageCount += dirtyCount.mOversizedImageCount;
            this.mOversizedVideoCount += dirtyCount.mOversizedVideoCount;
        }
        return this;
    }

    public void setOversizedImageCount(int i) {
        this.mOversizedImageCount = i;
    }

    public void setOversizedVideoCount(int i) {
        this.mOversizedVideoCount = i;
    }

    public void setSyncableImageCount(int i) {
        this.mSyncableImageCount = i;
    }

    public void setSyncableVideoCount(int i) {
        this.mSyncableVideoCount = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DirtyCount{mSyncableImageCount=");
        sb.append(this.mSyncableImageCount);
        sb.append(", mSyncableVideoCount=");
        sb.append(this.mSyncableVideoCount);
        sb.append(", mOversizedImageCount=");
        sb.append(this.mOversizedImageCount);
        sb.append(", mOversizedVideoCount=");
        sb.append(this.mOversizedVideoCount);
        sb.append('}');
        return sb.toString();
    }
}

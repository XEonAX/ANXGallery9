package com.nostra13.universalimageloader.core.download;

public final class ExtraInfo {
    private final Object implicitObj;
    private final boolean requestThumbnail;

    public static final class Builder {
        /* access modifiers changed from: private */
        public Object implicitObj;
        /* access modifiers changed from: private */
        public boolean requestThumbnail;

        public ExtraInfo build() {
            return new ExtraInfo(this);
        }

        public Builder requestThumbnail(boolean z) {
            this.requestThumbnail = z;
            return this;
        }
    }

    private ExtraInfo(Builder builder) {
        this.requestThumbnail = builder.requestThumbnail;
        this.implicitObj = builder.implicitObj;
    }

    public boolean requestThumbnail() {
        return this.requestThumbnail;
    }
}

package com.miui.gallery.cloud.base;

public class GallerySyncResult<T> {
    public final GallerySyncCode code;
    public final T data;
    public final Exception exception;
    public final long retryAfter;

    public static final class Builder<T> {
        /* access modifiers changed from: private */
        public GallerySyncCode code;
        /* access modifiers changed from: private */
        public T data;
        /* access modifiers changed from: private */
        public Exception exception;
        /* access modifiers changed from: private */
        public long retryAfter = -1;

        public GallerySyncResult build() {
            return new GallerySyncResult(this);
        }

        public Builder clone(GallerySyncResult<T> gallerySyncResult) {
            this.code = gallerySyncResult.code;
            this.retryAfter = gallerySyncResult.retryAfter;
            this.exception = gallerySyncResult.exception;
            this.data = gallerySyncResult.data;
            return this;
        }

        public Builder setCode(GallerySyncCode gallerySyncCode) {
            this.code = gallerySyncCode;
            return this;
        }

        public Builder setData(T t) {
            this.data = t;
            return this;
        }

        public Builder setException(Exception exc) {
            this.exception = exc;
            return this;
        }

        public Builder setRetryAfter(long j) {
            this.retryAfter = j;
            return this;
        }
    }

    private GallerySyncResult(Builder<T> builder) {
        this.code = builder.code;
        this.retryAfter = builder.retryAfter;
        this.exception = builder.exception;
        this.data = builder.data;
    }

    public String toString() {
        return String.format("code %s, exception %s", new Object[]{this.code, this.exception});
    }
}

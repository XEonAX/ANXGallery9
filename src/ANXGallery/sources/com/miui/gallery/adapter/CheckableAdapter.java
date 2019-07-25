package com.miui.gallery.adapter;

import android.view.View;

public interface CheckableAdapter {

    public static class CheckedItem {
        private int mHeight;
        private final long mId;
        private final String mMicroThumbnailFile;
        private final String mMimeType;
        private final String mOriginFile;
        private int mServerType;
        private final String mSha1;
        private long mSize;
        private final String mThumbnailFile;
        private int mWidth;

        protected static class Builder {
            /* access modifiers changed from: private */
            public long mId;
            /* access modifiers changed from: private */
            public String mMicroThumbnailFile;
            /* access modifiers changed from: private */
            public String mMimeType;
            /* access modifiers changed from: private */
            public String mOriginFile;
            /* access modifiers changed from: private */
            public String mSha1;
            /* access modifiers changed from: private */
            public String mThumbnailFile;

            protected Builder() {
            }

            /* access modifiers changed from: 0000 */
            public CheckedItem build() {
                return new CheckedItem(this);
            }

            /* access modifiers changed from: 0000 */
            public Builder setId(long j) {
                this.mId = j;
                return this;
            }

            /* access modifiers changed from: 0000 */
            public Builder setMicroThumbnailFile(String str) {
                this.mMicroThumbnailFile = str;
                return this;
            }

            /* access modifiers changed from: 0000 */
            public Builder setMimeType(String str) {
                this.mMimeType = str;
                return this;
            }

            /* access modifiers changed from: 0000 */
            public Builder setOriginFile(String str) {
                this.mOriginFile = str;
                return this;
            }

            /* access modifiers changed from: 0000 */
            public Builder setSha1(String str) {
                this.mSha1 = str;
                return this;
            }

            /* access modifiers changed from: 0000 */
            public Builder setThumbnailFile(String str) {
                this.mThumbnailFile = str;
                return this;
            }
        }

        private CheckedItem(Builder builder) {
            this.mId = builder.mId;
            this.mSha1 = builder.mSha1;
            this.mMicroThumbnailFile = builder.mMicroThumbnailFile;
            this.mThumbnailFile = builder.mThumbnailFile;
            this.mOriginFile = builder.mOriginFile;
            this.mMimeType = builder.mMimeType;
        }

        public int getHeight() {
            return this.mHeight;
        }

        public long getId() {
            return this.mId;
        }

        public String getMimeType() {
            return this.mMimeType;
        }

        public String getOriginFile() {
            return this.mOriginFile;
        }

        public int getServerType() {
            return this.mServerType;
        }

        public String getSha1() {
            return this.mSha1;
        }

        public long getSize() {
            return this.mSize;
        }

        public String getThumbnailFile() {
            return this.mThumbnailFile;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public void setHeight(int i) {
            this.mHeight = i;
        }

        public void setServerType(int i) {
            this.mServerType = i;
        }

        public void setSize(long j) {
            this.mSize = j;
        }

        public void setWidth(int i) {
            this.mWidth = i;
        }
    }

    View getCheckableView(View view);
}

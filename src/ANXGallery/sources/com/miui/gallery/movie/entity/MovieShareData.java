package com.miui.gallery.movie.entity;

public class MovieShareData {
    private boolean mIsShortVideo;
    private String mLongVideoPath;
    private String mShortVideoPath;

    public String getVideoPath() {
        return this.mIsShortVideo ? this.mShortVideoPath : this.mLongVideoPath;
    }

    public void reset(boolean z) {
        this.mIsShortVideo = z;
        this.mShortVideoPath = "";
        this.mLongVideoPath = "";
    }

    public void setShortVideo(boolean z) {
        this.mIsShortVideo = z;
    }

    public void setVideoPath(String str, boolean z) {
        this.mIsShortVideo = z;
        if (z) {
            this.mShortVideoPath = str;
        } else {
            this.mLongVideoPath = str;
        }
    }
}

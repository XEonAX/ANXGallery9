package com.miui.gallery.video.editor;

import android.graphics.Bitmap;

public class VideoThumbnail {
    private int endTime;
    private int intrinsicTime;
    private int startTime;
    private Bitmap thumbnail;

    public VideoThumbnail() {
    }

    public VideoThumbnail(int i, int i2, int i3, Bitmap bitmap) {
        this.startTime = i;
        this.endTime = i2;
        this.intrinsicTime = i3;
        this.thumbnail = bitmap;
    }

    public VideoThumbnail(Bitmap bitmap, int i) {
        this.thumbnail = bitmap;
        this.intrinsicTime = i;
    }

    public int getIntrinsicTime() {
        return this.intrinsicTime;
    }

    public Bitmap getThumbnail() {
        return this.thumbnail;
    }
}

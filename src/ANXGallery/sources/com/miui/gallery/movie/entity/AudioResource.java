package com.miui.gallery.movie.entity;

import com.miui.gallery.movie.ui.factory.AudioFactory;

public class AudioResource extends MovieResource {
    private int resType;

    public AudioResource() {
    }

    public AudioResource(int i, String str, int i2, int i3) {
        super(str, i2, i3);
        this.resType = i;
        this.isPackageAssets = true;
        this.downloadState = 17;
    }

    public AudioResource(String str) {
        this.srcPath = str;
        this.nameKey = "local";
        this.resType = 2;
        this.isPackageAssets = true;
    }

    public String getDownloadSrcPath() {
        return this.isPackageAssets ? this.srcPath : AudioFactory.getAudioDownloadPath(this.pathKey);
    }

    public int getResType() {
        return this.resType;
    }

    public String getStatNameString() {
        StringBuilder sb = new StringBuilder();
        sb.append("audio-");
        sb.append(this.label);
        return sb.toString();
    }

    public String getStatTypeString() {
        return "audio";
    }
}

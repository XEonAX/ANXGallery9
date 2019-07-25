package com.miui.gallery.sdk.download.assist;

public class DownloadedItem {
    private byte[] mFileCipher;
    private String mFilePath;

    public DownloadedItem(String str, byte[] bArr) {
        this.mFilePath = str;
        this.mFileCipher = bArr;
    }

    public byte[] getFileCipher() {
        return this.mFileCipher;
    }

    public String getFilePath() {
        return this.mFilePath;
    }
}

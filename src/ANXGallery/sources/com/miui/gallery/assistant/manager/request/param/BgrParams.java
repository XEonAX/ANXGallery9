package com.miui.gallery.assistant.manager.request.param;

public class BgrParams {
    public final int height;
    public final byte[] pix;
    public final int width;

    public BgrParams(byte[] bArr, int i, int i2) {
        this.pix = bArr;
        this.width = i;
        this.height = i2;
    }
}

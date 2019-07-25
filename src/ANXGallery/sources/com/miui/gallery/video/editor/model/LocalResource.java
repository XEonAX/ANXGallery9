package com.miui.gallery.video.editor.model;

import com.miui.gallery.net.resource.Resource;

public class LocalResource extends Resource {
    public int imageId;
    public int isInternational;
    public String nameKey;

    public LocalResource() {
    }

    public LocalResource(int i, String str) {
        this.type = str;
        this.imageId = i;
        this.isInternational = 0;
    }

    public boolean isInternational() {
        return this.isInternational == 0;
    }
}

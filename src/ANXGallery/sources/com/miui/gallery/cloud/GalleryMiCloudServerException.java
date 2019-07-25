package com.miui.gallery.cloud;

import com.xiaomi.micloudsdk.exception.CloudServerException;

public class GalleryMiCloudServerException extends Exception {
    private Exception mCloudServerException;

    public GalleryMiCloudServerException(Exception exc) {
        this.mCloudServerException = exc;
    }

    public Exception getCloudServerException() {
        return this.mCloudServerException;
    }

    public int getStatusCode() {
        return ((CloudServerException) this.mCloudServerException).getStatusCode();
    }

    public String toString() {
        return this.mCloudServerException.toString();
    }
}

package com.miui.gallery.cloud.base;

public interface SyncTask<T> {
    String getIdentifier();

    GallerySyncResult<T> run() throws Exception;
}

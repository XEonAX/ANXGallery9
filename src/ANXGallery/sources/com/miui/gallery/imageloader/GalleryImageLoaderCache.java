package com.miui.gallery.imageloader;

import android.graphics.Bitmap;

public class GalleryImageLoaderCache {
    private static GalleryImageLoaderCache sGalleryImageLoaderCache = new GalleryImageLoaderCache();
    private IMicroThumbCache mMicroThumbCache;
    private IPhotoBytesCache mPhotoBytesCache;

    public interface IMicroThumbCache {
        Bitmap getCenterCropBitmap(String str, Bitmap bitmap);
    }

    public interface IPhotoBytesCache {
        byte[] getData(String str);

        boolean putData(String str, byte[] bArr);
    }

    public static GalleryImageLoaderCache getInstance() {
        return sGalleryImageLoaderCache;
    }

    public IMicroThumbCache getMicroThumbCache() {
        return this.mMicroThumbCache;
    }

    public IPhotoBytesCache getPhotoBytesCache() {
        return this.mPhotoBytesCache;
    }

    public void setMicroThumbCache(IMicroThumbCache iMicroThumbCache) {
        this.mMicroThumbCache = iMicroThumbCache;
    }

    public void setPhotoBytesCache(IPhotoBytesCache iPhotoBytesCache) {
        this.mPhotoBytesCache = iPhotoBytesCache;
    }
}

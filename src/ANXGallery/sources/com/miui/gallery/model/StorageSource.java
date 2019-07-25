package com.miui.gallery.model;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.loader.BaseLoader;
import com.miui.gallery.loader.StorageSetLoader;
import com.miui.gallery.util.MiscUtil;

public class StorageSource extends PhotoLoaderSource {
    private static boolean isContentSchemeWithExtraPhotoItems(Uri uri, Bundle bundle) {
        return uri != null && bundle != null && "content".equals(uri.getScheme()) && MiscUtil.isValid(bundle.getParcelableArrayList("com.miui.gallery.extra.photo_items"));
    }

    private static boolean isFileScheme(Uri uri) {
        return uri != null && "file".equals(uri.getScheme());
    }

    public BaseLoader createDataLoader(Context context, Uri uri, Bundle bundle) {
        return new StorageSetLoader(context, uri, bundle);
    }

    public boolean match(Uri uri, Bundle bundle) {
        return isContentSchemeWithExtraPhotoItems(uri, bundle) || isFileScheme(uri);
    }
}

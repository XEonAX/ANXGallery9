package com.miui.gallery.model;

import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.loader.BaseLoader;
import com.miui.gallery.loader.CloudSetLoader;
import com.miui.gallery.loader.StorageSetLoader;
import java.io.File;

public class LocalSource extends PhotoLoaderSource {
    private static UriMatcher sUriMatcher;

    public LocalSource() {
        if (sUriMatcher == null) {
            sUriMatcher = new UriMatcher(-1);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "media", 0);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "album_media", 0);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_album_media/#", 0);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_and_share", 0);
            sUriMatcher.addURI("com.miui.gallery.open", "raw/*", 1);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "recent_discovered_media", 0);
        }
    }

    public BaseLoader createDataLoader(Context context, Uri uri, Bundle bundle) {
        BaseLoader baseLoader;
        switch (sUriMatcher.match(uri)) {
            case 0:
                baseLoader = new CloudSetLoader(context, uri, bundle);
                break;
            case 1:
                baseLoader = new StorageSetLoader(context, Uri.fromFile(new File(uri.getLastPathSegment())), bundle);
                break;
            default:
                return null;
        }
        return baseLoader;
    }

    public boolean match(Uri uri, Bundle bundle) {
        return uri != null && "content".equals(uri.getScheme()) && ("com.miui.gallery.cloud.provider".equals(uri.getAuthority()) || "com.miui.gallery.open".equals(uri.getAuthority())) && sUriMatcher.match(uri) != -1;
    }
}

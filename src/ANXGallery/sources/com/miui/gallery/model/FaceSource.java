package com.miui.gallery.model;

import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.loader.BaseLoader;
import com.miui.gallery.loader.FaceCloudSetLoader;

public class FaceSource extends PhotoLoaderSource {
    private static UriMatcher sUriMatcher;

    public FaceSource() {
        if (sUriMatcher == null) {
            sUriMatcher = new UriMatcher(-1);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "person", 0);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "person_recommend", 1);
        }
    }

    public BaseLoader createDataLoader(Context context, Uri uri, Bundle bundle) {
        FaceCloudSetLoader faceCloudSetLoader;
        switch (sUriMatcher.match(uri)) {
            case 0:
                faceCloudSetLoader = new FaceCloudSetLoader(context, uri, bundle);
                break;
            case 1:
                faceCloudSetLoader = new FaceCloudSetLoader(context, uri, bundle);
                break;
            default:
                return null;
        }
        return faceCloudSetLoader;
    }

    public boolean match(Uri uri, Bundle bundle) {
        return uri != null && "content".equals(uri.getScheme()) && "com.miui.gallery.cloud.provider".equals(uri.getAuthority()) && sUriMatcher.match(uri) != -1;
    }
}

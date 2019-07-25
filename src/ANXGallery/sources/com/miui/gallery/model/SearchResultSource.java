package com.miui.gallery.model;

import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.loader.BaseLoader;
import com.miui.gallery.loader.SearchResultSetLoader;

public class SearchResultSource extends PhotoLoaderSource {
    private static UriMatcher sUriMatcher;

    public SearchResultSource() {
        if (sUriMatcher == null) {
            sUriMatcher = new UriMatcher(0);
            sUriMatcher.addURI("com.miui.gallery.cloud.provider", "searchResultPhoto", 1);
        }
    }

    public BaseLoader createDataLoader(Context context, Uri uri, Bundle bundle) {
        return new SearchResultSetLoader(context, uri, bundle);
    }

    public boolean match(Uri uri, Bundle bundle) {
        return uri != null && "content".equals(uri.getScheme()) && "com.miui.gallery.cloud.provider".equals(uri.getAuthority()) && sUriMatcher.match(uri) != 0;
    }
}

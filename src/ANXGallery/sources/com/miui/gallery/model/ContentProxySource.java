package com.miui.gallery.model;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.loader.BaseLoader;

public class ContentProxySource extends PhotoLoaderSource {
    public BaseLoader createDataLoader(Context context, Uri uri, Bundle bundle) {
        return new ContentProxyLoader(context, uri, bundle);
    }

    public boolean match(Uri uri, Bundle bundle) {
        return uri != null && "content".equals(uri.getScheme());
    }
}

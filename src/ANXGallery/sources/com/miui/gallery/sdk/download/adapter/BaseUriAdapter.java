package com.miui.gallery.sdk.download.adapter;

import android.content.UriMatcher;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;

public class BaseUriAdapter implements IUriAdapter {
    private static final UriMatcher sUriMatcher = new UriMatcher(-1);

    static {
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "gallery_cloud/#", 0);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_image/#", 2);
    }

    /* access modifiers changed from: private */
    public Uri getBaseUri(Uri uri) {
        int match = sUriMatcher.match(uri);
        if (match == 0) {
            return GalleryCloudUtils.CLOUD_URI;
        }
        if (match != 2) {
            return null;
        }
        return GalleryCloudUtils.SHARE_IMAGE_URI;
    }

    private Uri translate2ImageUri(Uri uri) {
        int match = sUriMatcher.match(uri);
        if (match == 0 || match == 2) {
            return uri;
        }
        return null;
    }

    public DBImage getDBItemForUri(Uri uri) {
        final Uri translate2ImageUri = translate2ImageUri(uri);
        if (translate2ImageUri != null) {
            return (DBImage) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), translate2ImageUri, new String[]{"*"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<DBImage>() {
                public DBImage handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToNext()) {
                        return null;
                    }
                    return CloudUtils.createDBImageByUri(BaseUriAdapter.this.getBaseUri(translate2ImageUri), cursor);
                }
            });
        }
        return null;
    }
}

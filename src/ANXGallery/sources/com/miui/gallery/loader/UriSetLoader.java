package com.miui.gallery.loader;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.webkit.MimeTypeMap;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.model.UriItem;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import java.io.File;

public class UriSetLoader extends BaseLoader {
    private String mMimeType;
    private Uri mUri;

    private static class UriDataSet extends BaseDataSet {
        private UriItem mItem;

        public UriDataSet(UriItem uriItem) {
            this.mItem = uriItem;
        }

        public boolean addToAlbum(Activity activity, int i, boolean z, boolean z2, OnAddAlbumListener onAddAlbumListener) {
            return false;
        }

        /* access modifiers changed from: protected */
        public void bindItem(BaseDataItem baseDataItem, int i) {
        }

        /* access modifiers changed from: protected */
        public BaseDataItem createItem(int i) {
            return this.mItem;
        }

        /* access modifiers changed from: protected */
        public int doDelete(BaseDataItem baseDataItem) {
            return 0;
        }

        public int getCount() {
            return 1;
        }

        public long getItemKey(int i) {
            if (this.mItem != null) {
                return this.mItem.getKey();
            }
            return -1;
        }

        /* access modifiers changed from: protected */
        public String getItemPath(int i) {
            if (this.mItem != null) {
                return this.mItem.getOriginalPath();
            }
            return null;
        }

        public void onRelease() {
        }
    }

    public UriSetLoader(Context context, Uri uri, Bundle bundle) {
        super(context);
        this.mUri = uri;
        this.mMimeType = bundle.getString("mime_type");
    }

    public BaseDataSet loadInBackground() {
        UriItem uriItem = new UriItem(this.mUri);
        String str = this.mMimeType;
        if ("file".equals(this.mUri.getScheme())) {
            if (str == null || "image/*".equalsIgnoreCase(str)) {
                String fileExtensionFromUrl = MimeTypeMap.getFileExtensionFromUrl(this.mUri.toString());
                if (!TextUtils.isEmpty(fileExtensionFromUrl)) {
                    String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl.toLowerCase());
                    if (!TextUtils.isEmpty(str)) {
                        str = mimeTypeFromExtension;
                    }
                }
            }
            uriItem.setKey((long) this.mUri.getPath().hashCode()).setCreateTime(new File(this.mUri.getPath()).lastModified());
        } else {
            if (str == null || "image/*".equalsIgnoreCase(str)) {
                str = GalleryApp.sGetAndroidContext().getContentResolver().getType(this.mUri);
            }
            uriItem.setKey((long) this.mUri.hashCode());
        }
        uriItem.setMimeType(str);
        return new UriDataSet(uriItem);
    }
}

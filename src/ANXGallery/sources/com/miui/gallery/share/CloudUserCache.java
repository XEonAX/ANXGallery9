package com.miui.gallery.share;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.provider.GalleryContract.CloudUser;
import com.miui.gallery.provider.GalleryContract.ShareUser;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class CloudUserCache extends DBCache<String, List<CloudUserCacheEntry>> {
    private static final List<CloudUserCacheEntry> EMPTY_ENTRY_LIST = Lists.newArrayList();
    private static final CloudUserCache sOwnerUserCache = new CloudUserCache() {
        /* access modifiers changed from: protected */
        public String[] getProjection() {
            return new String[]{"albumId", "userId", "createTime", "relation", "relationText", "serverStatus", "phone"};
        }

        /* access modifiers changed from: protected */
        public String getSelection() {
            return "serverStatus = ?";
        }

        /* access modifiers changed from: protected */
        public String[] getSelectionArgs() {
            return new String[]{"normal"};
        }

        public Uri getUri() {
            return CloudUser.CLOUD_USER_URI;
        }

        /* access modifiers changed from: protected */
        public /* bridge */ /* synthetic */ Object newKey(Cursor cursor) {
            return CloudUserCache.super.newKey(cursor);
        }

        /* access modifiers changed from: protected */
        public /* bridge */ /* synthetic */ Object newValue(Cursor cursor) {
            return CloudUserCache.super.newValue(cursor);
        }

        /* access modifiers changed from: protected */
        public CloudUserCacheEntry newValueElement(Cursor cursor) {
            CloudUserCacheEntry cloudUserCacheEntry = new CloudUserCacheEntry(cursor.getString(0), cursor.getString(1), cursor.getLong(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), cursor.getString(6));
            return cloudUserCacheEntry;
        }

        public void syncFromServer(String str, OnCompletionListener<Void, Void> onCompletionListener) {
            AlbumShareUIManager.syncAllUserInfoFromNetworkAsync(onCompletionListener);
        }
    };
    private static final CloudUserCache sSharerUserCache = new CloudUserCache() {
        /* access modifiers changed from: protected */
        public String[] getProjection() {
            return new String[]{"albumId", "userId", "createTime", "relation", "relationText", "serverStatus"};
        }

        /* access modifiers changed from: protected */
        public String getSelection() {
            return null;
        }

        /* access modifiers changed from: protected */
        public String[] getSelectionArgs() {
            return new String[0];
        }

        public Uri getUri() {
            return ShareUser.SHARE_USER_URI;
        }

        /* access modifiers changed from: protected */
        public /* bridge */ /* synthetic */ Object newKey(Cursor cursor) {
            return CloudUserCache.super.newKey(cursor);
        }

        /* access modifiers changed from: protected */
        public /* bridge */ /* synthetic */ Object newValue(Cursor cursor) {
            return CloudUserCache.super.newValue(cursor);
        }

        /* access modifiers changed from: protected */
        public CloudUserCacheEntry newValueElement(Cursor cursor) {
            CloudUserCacheEntry cloudUserCacheEntry = new CloudUserCacheEntry(cursor.getString(0), cursor.getString(1), cursor.getLong(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), null);
            return cloudUserCacheEntry;
        }

        public void syncFromServer(String str, OnCompletionListener<Void, Void> onCompletionListener) {
            AlbumShareUIManager.syncUserListForAlbumAsync(str, true, onCompletionListener);
        }
    };

    public static CloudUserCache getOwnerUserCache() {
        return sOwnerUserCache;
    }

    public static CloudUserCache getSharerUserCache() {
        return sSharerUserCache;
    }

    public List<CloudUserCacheEntry> getCloudUserListByAlbumId(String str) {
        List list = (List) getCache().get(str);
        return list != null ? Collections.unmodifiableList(list) : EMPTY_ENTRY_LIST;
    }

    /* access modifiers changed from: protected */
    public abstract String[] getProjection();

    /* access modifiers changed from: protected */
    public abstract String getSelection();

    /* access modifiers changed from: protected */
    public abstract String[] getSelectionArgs();

    /* access modifiers changed from: protected */
    public Map<String, List<CloudUserCacheEntry>> loadInBackground() {
        HashMap newHashMap = Maps.newHashMap();
        Cursor queryInBackground = queryInBackground();
        if (queryInBackground != null) {
            CharSequence charSequence = null;
            List list = null;
            while (queryInBackground.moveToNext()) {
                try {
                    String newKey = newKey(queryInBackground);
                    if (newKey != null) {
                        if (!TextUtils.equals(charSequence, newKey)) {
                            List newValue = newValue(queryInBackground);
                            newHashMap.put(newKey, newValue);
                            list = newValue;
                            charSequence = newKey;
                        }
                        if (list != null) {
                            list.add(newValueElement(queryInBackground));
                        }
                    }
                } finally {
                    queryInBackground.close();
                }
            }
        }
        return newHashMap;
    }

    /* access modifiers changed from: protected */
    public String newKey(Cursor cursor) {
        return cursor.getString(0);
    }

    /* access modifiers changed from: protected */
    public List<CloudUserCacheEntry> newValue(Cursor cursor) {
        return Lists.newArrayList();
    }

    /* access modifiers changed from: protected */
    public abstract CloudUserCacheEntry newValueElement(Cursor cursor);

    /* access modifiers changed from: protected */
    public Cursor queryInBackground() {
        return GalleryApp.sGetAndroidContext().getContentResolver().query(getUri(), getProjection(), getSelection(), getSelectionArgs(), "albumId");
    }

    public abstract void syncFromServer(String str, OnCompletionListener<Void, Void> onCompletionListener);
}

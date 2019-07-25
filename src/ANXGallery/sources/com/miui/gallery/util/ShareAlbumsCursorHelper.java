package com.miui.gallery.util;

import android.database.Cursor;
import java.util.HashMap;
import java.util.Map;

public class ShareAlbumsCursorHelper {
    public static final String[] SHARED_ALBUM_PROJECTION = {"_id", "creatorId", "count", "nickname"};
    private boolean mDataValid = false;
    private Map<String, ShareAlbum> mSharedAlbums;

    public static class ShareAlbum {
        String mAlbumId;
        String mCreatorId;
        String mOwnerNickName;
        int mUserCount;
    }

    public boolean isDataValid() {
        return this.mDataValid;
    }

    public boolean isOwnerShareAlbum(long j) {
        return this.mSharedAlbums != null && !this.mSharedAlbums.isEmpty() && j < 2147383647 && this.mSharedAlbums.containsKey(String.valueOf(j));
    }

    public synchronized void reset() {
        this.mDataValid = false;
        if (this.mSharedAlbums != null) {
            this.mSharedAlbums.clear();
            this.mSharedAlbums = null;
        }
    }

    public synchronized void setSharedAlbums(Cursor cursor) {
        if (this.mSharedAlbums != null) {
            this.mSharedAlbums.clear();
        }
        if (cursor == null || cursor.isClosed()) {
            this.mSharedAlbums = null;
        } else {
            while (cursor.moveToNext()) {
                ShareAlbum shareAlbum = new ShareAlbum();
                shareAlbum.mAlbumId = cursor.getString(0);
                shareAlbum.mCreatorId = cursor.getString(1);
                shareAlbum.mUserCount = cursor.getInt(2);
                shareAlbum.mOwnerNickName = cursor.getString(3);
                if (this.mSharedAlbums == null) {
                    this.mSharedAlbums = new HashMap();
                }
                this.mSharedAlbums.put(shareAlbum.mAlbumId, shareAlbum);
            }
        }
        this.mDataValid = true;
    }
}

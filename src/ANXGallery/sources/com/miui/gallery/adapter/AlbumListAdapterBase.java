package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.ShareAlbumManager;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import java.util.HashMap;
import java.util.Map;

public abstract class AlbumListAdapterBase extends BaseAdapter {
    protected static final String[] PROJECTION;
    public static final String[] SHARED_ALBUM_PROJECTION = {"_id", "creatorId", "count", "nickname"};
    protected DisplayImageOptions mDisplayImageOption;
    private Bundle mPeopleFaceCover = null;
    private Map<String, ShareAlbum> mSharedAlbums;

    public static class ShareAlbum {
        String mAlbumId;
        String mCreatorId;
        String mOwnerNickName;
        int mUserCount;
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(Cloud.ALIAS_ALBUM_CLASSIFICATION);
        sb.append(" AS ");
        sb.append("classification");
        PROJECTION = new String[]{"_id", "name", "cover_id", "cover_path", "cover_sha1", "cover_sync_state", "media_count", "face_people_id", "baby_info", "thumbnail_info", "serverId", "attributes", "immutable", "top_time", "sortBy", "baby_sharer_info", "local_path", sb.toString()};
    }

    public AlbumListAdapterBase(Context context) {
        super(context);
    }

    protected static boolean isAutoUploadedAlbum(Cursor cursor) {
        return (cursor.getLong(11) & 1) != 0 || (isSystemAlbum(cursor) && !isScreenshotsAlbum(cursor)) || isOtherShareAlbum(cursor);
    }

    protected static boolean isBabyAlbum(Cursor cursor) {
        return !TextUtils.isEmpty(cursor.getString(8));
    }

    private boolean isFaceAlbum(Cursor cursor) {
        return cursor.getLong(0) == 2147483646;
    }

    public static boolean isFavoritesAlbum(Cursor cursor) {
        return cursor.getLong(0) == 2147483642;
    }

    protected static boolean isOtherShareAlbum(Cursor cursor) {
        return ShareAlbumManager.isOtherShareAlbumId((long) cursor.getInt(0));
    }

    public static boolean isRecentAlbum(Cursor cursor) {
        return cursor.getLong(0) == 2147483644;
    }

    private static boolean isScreenshotsAlbum(Cursor cursor) {
        return String.valueOf(2).equals(cursor.getString(10));
    }

    protected static boolean isSystemAlbum(Cursor cursor) {
        String string = cursor.getString(10);
        for (Long valueOf : Album.ALL_SYSTEM_ALBUM_SERVER_IDS) {
            if (String.valueOf(valueOf).equals(string)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public int getAlbumCount(Cursor cursor) {
        return cursor.getInt(6);
    }

    public String getAlbumName(int i) {
        return getAlbumName(getCursorByPosition(i));
    }

    /* access modifiers changed from: protected */
    public String getAlbumName(Cursor cursor) {
        return isCameraAlbum(cursor) ? this.mContext.getString(R.string.album_camera_name) : isScreenshotsAlbum(cursor) ? this.mContext.getString(R.string.album_screenshot_name) : isVideoAlbum(cursor) ? this.mContext.getString(R.string.album_videos_name) : isFaceAlbum(cursor) ? this.mContext.getString(R.string.album_faces_name) : isPanoAlbum(cursor) ? this.mContext.getString(R.string.album_pano_name) : isRecentAlbum(cursor) ? this.mContext.getString(R.string.album_name_recent_discovery) : isFavoritesAlbum(cursor) ? this.mContext.getString(R.string.album_favorites_name) : cursor.getString(1);
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getCursorByPosition(i), 5, 2);
    }

    public String getLocalPath(int i) {
        return getMicroPath(getCursorByPosition(i), 3, 4);
    }

    public String[] getProjection() {
        return PROJECTION;
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        super.initDisplayImageOptions();
        this.mDisplayImageOptionBuilder.showStubImage(R.drawable.default_album_cover);
        this.mDisplayImageOption = this.mDisplayImageOptionBuilder.build();
    }

    public boolean isAutoUploadedAlbum(int i) {
        return isAutoUploadedAlbum(getCursorByPosition(i));
    }

    public boolean isBabyAlbum(int i) {
        return isBabyAlbum(getCursorByPosition(i));
    }

    public boolean isCameraAlbum(int i) {
        return isCameraAlbum(getCursorByPosition(i));
    }

    /* access modifiers changed from: protected */
    public boolean isCameraAlbum(Cursor cursor) {
        return String.valueOf(1).equals(cursor.getString(10));
    }

    public boolean isOwnerShareAlbum(int i) {
        return isOwnerShareAlbum(getCursorByPosition(i));
    }

    /* access modifiers changed from: protected */
    public boolean isOwnerShareAlbum(Cursor cursor) {
        int i = cursor.getInt(0);
        return i < 2147383647 && this.mSharedAlbums != null && this.mSharedAlbums.containsKey(String.valueOf(i));
    }

    /* access modifiers changed from: protected */
    public boolean isPanoAlbum(Cursor cursor) {
        return cursor.getLong(0) == 2147483645;
    }

    /* access modifiers changed from: protected */
    public boolean isVideoAlbum(Cursor cursor) {
        return cursor.getLong(0) == 2147483647L;
    }

    public void setSharedAlbums(Cursor cursor) {
        if (this.mSharedAlbums != null) {
            this.mSharedAlbums.clear();
        }
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                do {
                    ShareAlbum shareAlbum = new ShareAlbum();
                    shareAlbum.mAlbumId = cursor.getString(0);
                    shareAlbum.mCreatorId = cursor.getString(1);
                    shareAlbum.mUserCount = cursor.getInt(2);
                    shareAlbum.mOwnerNickName = cursor.getString(3);
                    if (this.mSharedAlbums == null) {
                        this.mSharedAlbums = new HashMap();
                    }
                    this.mSharedAlbums.put(shareAlbum.mAlbumId, shareAlbum);
                } while (cursor.moveToNext());
            }
            if (getCount() > 0) {
                notifyDataSetChanged();
            }
        }
    }
}

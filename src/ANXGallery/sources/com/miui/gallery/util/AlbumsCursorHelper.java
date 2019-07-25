package com.miui.gallery.util;

import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import android.util.LongSparseArray;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.ShareAlbumManager;

public class AlbumsCursorHelper {
    public static final String[] ALL_ALBUMS_PROJECTION = {"_id", "name", "cover_id", "cover_path", "cover_sha1", "cover_sync_state", "media_count", "face_people_id", "baby_info", "thumbnail_info", "serverId", "attributes", "immutable", "top_time", "sortBy", "baby_sharer_info", "local_path"};
    private LongSparseArray<Integer> mAlbumId2CursorPosMapping;
    private Context mContext;
    private Cursor mCursor;

    public AlbumsCursorHelper(Context context) {
        this.mContext = context;
    }

    private long getAlbumId(Cursor cursor) {
        return (long) cursor.getInt(0);
    }

    private String getAlbumLocalPath(int i) {
        moveCursorToPosition(i);
        return getAlbumLocalPath(this.mCursor);
    }

    private String getAlbumLocalPath(Cursor cursor) {
        return cursor.getString(16);
    }

    public static String getAlbumName(Context context, long j, String str, String str2) {
        return isVideoAlbum(j) ? context.getString(R.string.album_videos_name) : isFaceAlbum(j) ? context.getString(R.string.album_faces_name) : isPanoAlbum(j) ? context.getString(R.string.album_pano_name) : isCameraAlbum(str) ? context.getString(R.string.album_camera_name) : isScreenshotsAlbum(str) ? context.getString(R.string.album_screenshot_name) : isRecentAlbum(j) ? context.getString(R.string.album_name_recent_discovery) : isFavoritesAlbum(j) ? context.getString(R.string.album_favorites_name) : str2;
    }

    private String getAlbumName(Cursor cursor) {
        return getAlbumName(this.mContext, cursor.getLong(0), cursor.getString(10), cursor.getString(1));
    }

    private long getAttributes(Cursor cursor) {
        return cursor.getLong(11);
    }

    private String getBabyAlbumPeopleId(int i) {
        moveCursorToPosition(i);
        return getBabyAlbumPeopleId(this.mCursor);
    }

    private String getBabyAlbumPeopleId(Cursor cursor) {
        return cursor.getString(7);
    }

    private String getBabyInfo(int i) {
        moveCursorToPosition(i);
        return getBabyInfo(this.mCursor);
    }

    private String getBabyInfo(Cursor cursor) {
        return cursor.getString(8);
    }

    private String getBabySharerInfo(int i) {
        moveCursorToPosition(i);
        return getBabySharerInfo(this.mCursor);
    }

    private String getBabySharerInfo(Cursor cursor) {
        return cursor.getString(15);
    }

    private String getServerId(Cursor cursor) {
        return cursor.getString(10);
    }

    private String getThumbnailInfoOfBaby(int i) {
        moveCursorToPosition(i);
        return getThumbnailInfoOfBaby(this.mCursor);
    }

    private String getThumbnailInfoOfBaby(Cursor cursor) {
        return cursor.getString(9);
    }

    private boolean isAutoUploadedAlbum(Cursor cursor) {
        return (cursor.getLong(11) & 1) != 0 || (isSystemAlbum(cursor) && !isScreenshotsAlbum(cursor)) || isOtherShareAlbum(cursor);
    }

    private boolean isBabyAlbum(int i) {
        moveCursorToPosition(i);
        return isBabyAlbum(this.mCursor);
    }

    private static boolean isCameraAlbum(String str) {
        return String.valueOf(1).equals(str);
    }

    public static boolean isFaceAlbum(long j) {
        return j == 2147483646;
    }

    private static boolean isFavoritesAlbum(long j) {
        return 2147483642 == j;
    }

    private boolean isLocalAlbum(int i) {
        moveCursorToPosition(i);
        return isLocalAlbum(this.mCursor);
    }

    private boolean isLocalAlbum(Cursor cursor) {
        return !isAutoUploadedAlbum(cursor);
    }

    private boolean isOtherShareAlbum(int i) {
        moveCursorToPosition(i);
        return isOtherShareAlbum(this.mCursor);
    }

    private boolean isOtherShareAlbum(Cursor cursor) {
        return ShareAlbumManager.isOtherShareAlbumId((long) cursor.getInt(0));
    }

    public static boolean isPanoAlbum(long j) {
        return j == 2147483645;
    }

    public static boolean isRecentAlbum(long j) {
        return j == 2147483644;
    }

    private static boolean isScreenshotsAlbum(Cursor cursor) {
        return isScreenshotsAlbum(cursor.getString(10));
    }

    private static boolean isScreenshotsAlbum(String str) {
        return String.valueOf(2).equals(str);
    }

    private static boolean isSystemAlbum(Cursor cursor) {
        String string = cursor.getString(10);
        for (Long valueOf : Album.ALL_SYSTEM_ALBUM_SERVER_IDS) {
            if (String.valueOf(valueOf).equals(string)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isVideoAlbum(long j) {
        return j == 2147483647L;
    }

    private boolean moveCursorToPosition(int i) {
        return this.mCursor != null && this.mCursor.moveToPosition(i);
    }

    public boolean albumUnwriteable(int i) {
        moveCursorToPosition(i);
        return this.mCursor.getInt(12) == 1;
    }

    public boolean albumUnwriteable(long j) {
        return albumUnwriteable(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public long getAlbumId(int i) {
        moveCursorToPosition(i);
        return getAlbumId(this.mCursor);
    }

    public String getAlbumLocalPath(Long l) {
        return getAlbumLocalPath(((Integer) this.mAlbumId2CursorPosMapping.get(l.longValue())).intValue());
    }

    public String getAlbumName(int i) {
        moveCursorToPosition(i);
        return getAlbumName(this.mCursor);
    }

    public String getAlbumName(long j) {
        return getAlbumName(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public long getAttributes(int i) {
        moveCursorToPosition(i);
        return getAttributes(this.mCursor);
    }

    public long getAttributes(long j) {
        return getAttributes(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public String getBabyAlbumPeopleId(long j) {
        return getBabyAlbumPeopleId(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public String getBabyInfo(long j) {
        return getBabyInfo(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public String getBabySharerInfo(long j) {
        return getBabySharerInfo(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public String getServerId(int i) {
        moveCursorToPosition(i);
        return getServerId(this.mCursor);
    }

    public String getServerId(long j) {
        return getServerId(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public String getThumbnailInfoOfBaby(long j) {
        return getThumbnailInfoOfBaby(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public boolean isAlbumDataValid(long j) {
        return (this.mAlbumId2CursorPosMapping == null || this.mAlbumId2CursorPosMapping.get(j) == null) ? false : true;
    }

    public boolean isBabyAlbum(long j) {
        return isBabyAlbum(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    /* access modifiers changed from: protected */
    public boolean isBabyAlbum(Cursor cursor) {
        return !TextUtils.isEmpty(cursor.getString(8));
    }

    public boolean isLocalAlbum(long j) {
        return isLocalAlbum(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public boolean isOtherShareAlbum(long j) {
        return isOtherShareAlbum(((Integer) this.mAlbumId2CursorPosMapping.get(j)).intValue());
    }

    public synchronized void setAlbumsData(Cursor cursor) {
        if (this.mAlbumId2CursorPosMapping != null) {
            this.mAlbumId2CursorPosMapping.clear();
        }
        if (cursor == null || cursor.isClosed()) {
            this.mCursor = null;
            this.mAlbumId2CursorPosMapping = null;
        } else {
            this.mCursor = cursor;
            if (this.mAlbumId2CursorPosMapping == null) {
                this.mAlbumId2CursorPosMapping = new LongSparseArray<>(cursor.getCount());
            }
            cursor.moveToFirst();
            while (!cursor.isAfterLast()) {
                this.mAlbumId2CursorPosMapping.put(getAlbumId(cursor), Integer.valueOf(cursor.getPosition()));
                cursor.moveToNext();
            }
        }
    }
}

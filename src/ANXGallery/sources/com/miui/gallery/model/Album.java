package com.miui.gallery.model;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Album extends Entity implements Parcelable, AlbumConstants {
    public static final Creator<Album> CREATOR = new Creator<Album>() {
        public Album createFromParcel(Parcel parcel) {
            return new OtherAlbum(parcel);
        }

        public Album[] newArray(int i) {
            return new Album[i];
        }
    };
    private static LoadingCache<String, String> sLocalizedNamesCache = CacheBuilder.newBuilder().maximumSize(10).build(new CacheLoader<String, String>() {
        public String load(String str) {
            try {
                return GalleryApp.sGetAndroidContext().getString(Integer.valueOf(str.substring(0, str.indexOf(95))).intValue());
            } catch (Exception e) {
                Log.w("AlbumNameCache", "failed to load cache for key [%s], %s", str, e);
                return null;
            }
        }
    });
    private int mAlbumClassification;
    private long mAlbumId;
    private String mAlbumName;
    private AlbumType mAlbumType;
    private long mAttributes;
    private String mBabyInfo;
    private String mBabyShareInfo;
    private int mCount;
    private long mCoverId;
    private String mCoverPath;
    private String mCoverSha1;
    private long mCoverSize;
    private int mCoverSyncState;
    private boolean mIsImmutable;
    private boolean mIsPlaceholder;
    private String mLocalPath;
    private String mPeopleId;
    private String mServerId;
    private long mSortBy;
    private String mThumbnailInfoOfBaby;
    private long mTopTime;

    public enum AlbumType {
        PINNED,
        SYSTEM,
        BABY,
        NORMAL,
        OTHERS_SHARE,
        OTHER_ALBUMS
    }

    public Album() {
    }

    public Album(long j) {
        this.mAlbumId = j;
    }

    protected Album(Parcel parcel) {
        this.mId = parcel.readLong();
        this.mAlbumId = parcel.readLong();
        this.mAlbumName = parcel.readString();
        this.mCoverId = parcel.readLong();
        this.mCoverPath = parcel.readString();
        this.mCoverSha1 = parcel.readString();
        this.mCoverSyncState = parcel.readInt();
        this.mCoverSize = parcel.readLong();
        this.mCount = parcel.readInt();
        this.mPeopleId = parcel.readString();
        this.mBabyInfo = parcel.readString();
        this.mThumbnailInfoOfBaby = parcel.readString();
        this.mServerId = parcel.readString();
        this.mAttributes = parcel.readLong();
        boolean z = false;
        this.mIsImmutable = parcel.readByte() != 0;
        this.mTopTime = parcel.readLong();
        this.mSortBy = parcel.readLong();
        this.mBabyShareInfo = parcel.readString();
        this.mLocalPath = parcel.readString();
        this.mAlbumClassification = parcel.readInt();
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.mIsPlaceholder = z;
        this.mAlbumType = AlbumType.values()[parcel.readInt()];
    }

    public static Album fromCursor(Cursor cursor) {
        if (cursor == null || cursor.isClosed()) {
            return null;
        }
        boolean z = false;
        Album album = new Album(cursor.getLong(0));
        album.mAlbumName = cursor.getString(1);
        album.mCoverId = cursor.getLong(2);
        album.mCoverPath = cursor.getString(3);
        album.mCoverSha1 = cursor.getString(4);
        album.mCoverSyncState = cursor.getInt(5);
        album.mCoverSize = cursor.getLong(18);
        album.mCount = cursor.getInt(6);
        if (album.mCount == Integer.MAX_VALUE) {
            album.mCount = 0;
            album.mIsPlaceholder = true;
        }
        album.mPeopleId = cursor.getString(7);
        album.mBabyInfo = cursor.getString(8);
        album.mThumbnailInfoOfBaby = cursor.getString(9);
        album.mServerId = cursor.getString(10);
        album.mAttributes = cursor.getLong(11);
        if (cursor.getInt(12) == 1) {
            z = true;
        }
        album.mIsImmutable = z;
        album.mTopTime = cursor.getLong(13);
        album.mSortBy = cursor.getLong(14);
        album.mBabyShareInfo = cursor.getString(15);
        album.mLocalPath = cursor.getString(16);
        album.mAlbumClassification = cursor.getInt(17);
        album.mAlbumType = parseAlbumType(album);
        return album;
    }

    private static String getAlbumName(String str, long j, String str2) {
        int i = String.valueOf(1).equals(str) ? R.string.album_camera_name : String.valueOf(2).equals(str) ? R.string.album_screenshot_name : j == 2147483647L ? R.string.album_videos_name : j == 2147483646 ? R.string.album_faces_name : j == 2147483645 ? R.string.album_pano_name : j == 2147483644 ? R.string.album_name_recent_discovery : j == 2147483642 ? R.string.album_favorites_name : 0;
        String str3 = i != 0 ? (String) sLocalizedNamesCache.getUnchecked(String.format(Locale.US, "%d_%s", new Object[]{Integer.valueOf(i), Locale.getDefault().toString()})) : null;
        return str3 != null ? str3 : str2;
    }

    private static boolean isSystemAlbum(String str) {
        for (Long valueOf : com.miui.gallery.provider.GalleryContract.Album.ALL_SYSTEM_ALBUM_SERVER_IDS) {
            if (String.valueOf(valueOf).equals(str)) {
                return true;
            }
        }
        return false;
    }

    private static AlbumType parseAlbumType(Album album) {
        return com.miui.gallery.preference.GalleryPreferences.Album.isForceTopAlbumByTopTime(album.getSortBy()) ? AlbumType.PINNED : isSystemAlbum(album.getServerId()) ? AlbumType.SYSTEM : !TextUtils.isEmpty(album.getBabyInfo()) ? AlbumType.BABY : ShareAlbumManager.isOtherShareAlbumId(album.getAlbumId()) ? AlbumType.OTHERS_SHARE : AlbumType.NORMAL;
    }

    public int describeContents() {
        return 0;
    }

    public int getAlbumClassification() {
        return this.mAlbumClassification;
    }

    public long getAlbumId() {
        return this.mAlbumId;
    }

    public String getAlbumName() {
        return this.mAlbumName;
    }

    public AlbumType getAlbumType() {
        return this.mAlbumType;
    }

    public long getAttributes() {
        return this.mAttributes;
    }

    public String getBabyInfo() {
        return this.mBabyInfo;
    }

    public String getBabyShareInfo() {
        return this.mBabyShareInfo;
    }

    public int getCount() {
        return this.mCount;
    }

    public long getCoverId() {
        return this.mCoverId;
    }

    public String getCoverPath() {
        return this.mCoverPath;
    }

    public long getCoverSize() {
        return this.mCoverSize;
    }

    public int getCoverSyncState() {
        return this.mCoverSyncState;
    }

    public String getLocalPath() {
        return this.mLocalPath;
    }

    public String getLocalizedAlbumName() {
        return getAlbumName(this.mServerId, this.mAlbumId, this.mAlbumName);
    }

    public String getPeopleId() {
        return this.mPeopleId;
    }

    public String getServerId() {
        return this.mServerId;
    }

    public long getSortBy() {
        return this.mSortBy;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "album_id", "INTEGER");
        addColumn(arrayList, "name", "TEXT");
        addColumn(arrayList, "cover_id", "INTEGER");
        addColumn(arrayList, "cover_path", "TEXT");
        addColumn(arrayList, "cover_sha1", "TEXT");
        addColumn(arrayList, "cover_sync_state", "INTEGER");
        addColumn(arrayList, "cover_size", "INTEGER");
        addColumn(arrayList, "media_count", "INTEGER");
        addColumn(arrayList, "face_people_id", "TEXT");
        addColumn(arrayList, "baby_info", "TEXT");
        addColumn(arrayList, "thumbnail_info", "TEXT");
        addColumn(arrayList, "serverId", "TEXT");
        addColumn(arrayList, "attributes", "INTEGER");
        addColumn(arrayList, "immutable", "INTEGER");
        addColumn(arrayList, "top_time", "INTEGER");
        addColumn(arrayList, "sortBy", "INTEGER");
        addColumn(arrayList, "baby_sharer_info", "TEXT");
        addColumn(arrayList, "local_path", "TEXT");
        addColumn(arrayList, "classification", "INTEGER");
        return arrayList;
    }

    public String getThumbnailInfoOfBaby() {
        return this.mThumbnailInfoOfBaby;
    }

    public boolean isImmutable() {
        return this.mIsImmutable;
    }

    public boolean isPlaceholder() {
        return this.mIsPlaceholder;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("album_id", Long.valueOf(this.mAlbumId));
        contentValues.put("name", this.mAlbumName);
        contentValues.put("cover_id", Long.valueOf(this.mCoverId));
        contentValues.put("cover_path", this.mCoverPath);
        contentValues.put("cover_sha1", this.mCoverSha1);
        contentValues.put("cover_sync_state", Integer.valueOf(this.mCoverSyncState));
        contentValues.put("cover_size", Long.valueOf(this.mCoverSize));
        contentValues.put("media_count", Integer.valueOf(this.mCount));
        contentValues.put("face_people_id", this.mPeopleId);
        contentValues.put("baby_info", this.mBabyInfo);
        contentValues.put("thumbnail_info", this.mThumbnailInfoOfBaby);
        contentValues.put("serverId", this.mServerId);
        contentValues.put("attributes", Long.valueOf(this.mAttributes));
        contentValues.put("immutable", Integer.valueOf(this.mIsImmutable ? 1 : 0));
        contentValues.put("top_time", Long.valueOf(this.mTopTime));
        contentValues.put("sortBy", Long.valueOf(this.mSortBy));
        contentValues.put("baby_sharer_info", this.mBabyShareInfo);
        contentValues.put("local_path", this.mLocalPath);
        contentValues.put("classification", Integer.valueOf(this.mAlbumClassification));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mAlbumId = getLong(cursor, "album_id");
        this.mAlbumName = getString(cursor, "name");
        this.mCoverId = getLong(cursor, "cover_id");
        this.mCoverPath = getString(cursor, "cover_path");
        this.mCoverSha1 = getString(cursor, "cover_sha1");
        this.mCoverSyncState = getInt(cursor, "cover_sync_state");
        this.mCoverSize = getLong(cursor, "cover_size");
        this.mCount = getInt(cursor, "media_count");
        this.mPeopleId = getString(cursor, "face_people_id");
        this.mBabyInfo = getString(cursor, "baby_info");
        this.mThumbnailInfoOfBaby = getString(cursor, "thumbnail_info");
        this.mServerId = getString(cursor, "serverId");
        this.mAttributes = getLong(cursor, "attributes");
        boolean z = true;
        if (getInt(cursor, "immutable") != 1) {
            z = false;
        }
        this.mIsImmutable = z;
        this.mTopTime = getLong(cursor, "top_time");
        this.mSortBy = getLong(cursor, "sortBy");
        this.mBabyShareInfo = getString(cursor, "baby_sharer_info");
        this.mLocalPath = getString(cursor, "local_path");
        this.mAlbumClassification = getInt(cursor, "classification");
        this.mAlbumType = parseAlbumType(this);
    }

    public void setAlbumName(String str) {
        this.mAlbumName = str;
    }

    public void setAlbumType(AlbumType albumType) {
        this.mAlbumType = albumType;
    }

    public void setCount(int i) {
        this.mCount = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mId);
        parcel.writeLong(this.mAlbumId);
        parcel.writeString(this.mAlbumName);
        parcel.writeLong(this.mCoverId);
        parcel.writeString(this.mCoverPath);
        parcel.writeString(this.mCoverSha1);
        parcel.writeInt(this.mCoverSyncState);
        parcel.writeLong(this.mCoverSize);
        parcel.writeInt(this.mCount);
        parcel.writeString(this.mPeopleId);
        parcel.writeString(this.mBabyInfo);
        parcel.writeString(this.mThumbnailInfoOfBaby);
        parcel.writeString(this.mServerId);
        parcel.writeLong(this.mAttributes);
        parcel.writeByte(this.mIsImmutable ? (byte) 1 : 0);
        parcel.writeLong(this.mTopTime);
        parcel.writeLong(this.mSortBy);
        parcel.writeString(this.mBabyShareInfo);
        parcel.writeString(this.mLocalPath);
        parcel.writeInt(this.mAlbumClassification);
        parcel.writeInt(this.mIsPlaceholder ? 1 : 0);
        parcel.writeInt(this.mAlbumType.ordinal());
    }
}

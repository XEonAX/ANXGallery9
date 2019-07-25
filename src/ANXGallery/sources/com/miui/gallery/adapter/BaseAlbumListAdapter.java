package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.util.SortedList;
import android.support.v7.widget.util.SortedListAdapterCallback;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.Album.AlbumType;
import com.miui.gallery.model.AlbumConstants;
import com.miui.gallery.model.AlbumConstants.ShareAlbum;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import java.util.HashMap;
import java.util.Map;

public abstract class BaseAlbumListAdapter<VH extends BaseViewHolder> extends BaseGalleryAdapter<Album, VH> implements AlbumConstants {
    private SortedList<Album> mData = new SortedList<>(Album.class, new SortedListAdapterCallback<Album>(this) {
        public boolean areContentsTheSame(Album album, Album album2) {
            return album.getAttributes() == album2.getAttributes() && album.getCount() == album2.getCount() && album.getSortBy() == album2.getSortBy() && album.getCoverSize() == album2.getCoverSize() && TextUtils.equals(album.getLocalizedAlbumName(), album2.getLocalizedAlbumName()) && TextUtils.equals(album.getCoverPath(), album2.getCoverPath()) && TextUtils.equals(album.getBabyInfo(), album2.getBabyInfo());
        }

        public boolean areItemsTheSame(Album album, Album album2) {
            return album.getAlbumId() == album2.getAlbumId() || (!TextUtils.isEmpty(album.getServerId()) && !TextUtils.isEmpty(album2.getServerId()) && album.getServerId().equalsIgnoreCase(album2.getServerId()));
        }

        public int compare(Album album, Album album2) {
            if (album.getAlbumClassification() != album2.getAlbumClassification()) {
                return Integer.compare(album.getAlbumClassification(), album2.getAlbumClassification());
            }
            if (album.getAlbumType() != album2.getAlbumType()) {
                int ordinal = album.getAlbumType() == AlbumType.OTHERS_SHARE ? AlbumType.NORMAL.ordinal() : album.getAlbumType().ordinal();
                int ordinal2 = album2.getAlbumType() == AlbumType.OTHERS_SHARE ? AlbumType.NORMAL.ordinal() : album2.getAlbumType().ordinal();
                if (ordinal != ordinal2) {
                    return Integer.compare(ordinal, ordinal2);
                }
            }
            return Long.compare(album.getSortBy(), album2.getSortBy());
        }
    });
    private Bundle mPeopleFaceCover = null;
    private Map<String, ShareAlbum> mSharedAlbums;

    public BaseAlbumListAdapter(Context context) {
        super(context);
    }

    protected static boolean isAutoUploadedAlbum(Album album) {
        return (album.getAttributes() & 1) != 0 || (isSystemAlbum(album.getServerId()) && !isScreenshotsAlbum(album.getServerId())) || isOtherShareAlbum(album.getAlbumId());
    }

    public static boolean isFaceAlbum(long j) {
        return j == 2147483646;
    }

    public static boolean isFavoritesAlbum(long j) {
        return j == 2147483642;
    }

    public static boolean isFavoritesAlbum(Album album) {
        return isFavoritesAlbum(album.getAlbumId());
    }

    public static boolean isOtherShareAlbum(long j) {
        return ShareAlbumManager.isOtherShareAlbumId(j);
    }

    public static boolean isOthersAlbum(long j) {
        return j == 2147483641;
    }

    public static boolean isRecentAlbum(long j) {
        return j == 2147483644;
    }

    public static boolean isRecentAlbum(Album album) {
        return isRecentAlbum(album.getAlbumId());
    }

    private static boolean isScreenshotsAlbum(String str) {
        return String.valueOf(2).equals(str);
    }

    public static boolean isSystemAlbum(String str) {
        for (Long valueOf : GalleryContract.Album.ALL_SYSTEM_ALBUM_SERVER_IDS) {
            if (String.valueOf(valueOf).equals(str)) {
                return true;
            }
        }
        return false;
    }

    public boolean albumUnwriteable(int i) {
        return getItem(i).isImmutable();
    }

    public int getAlbumCount(int i) {
        return getItem(i).getCount();
    }

    public String getAlbumLocalPath(int i) {
        return getItem(i).getLocalPath();
    }

    public String getAlbumName(int i) {
        return getItem(i).getLocalizedAlbumName();
    }

    public Long getAttributes(int i) {
        return Long.valueOf(getItem(i).getAttributes());
    }

    public String getBabyAlbumPeopleId(int i) {
        return getItem(i).getPeopleId();
    }

    public String getBabyInfo(int i) {
        return getItem(i).getBabyInfo();
    }

    public String getBabySharerInfo(int i) {
        return getItem(i).getBabyShareInfo();
    }

    public SortedList<Album> getData() {
        return this.mData;
    }

    public Uri getDownloadUri(int i) {
        Album item = getItem(i);
        return getDownloadUri(item.getCoverSyncState(), item.getCoverId());
    }

    public long getFileLength(int i) {
        return getItem(i).getCoverSize();
    }

    public Album getItem(int i) {
        if (this.mData == null || i < 0 || i >= this.mData.size()) {
            return null;
        }
        return (Album) this.mData.get(i);
    }

    public int getItemCount() {
        if (this.mData != null) {
            return this.mData.size();
        }
        return 0;
    }

    public long getItemId(int i) {
        return (this.mData == null || i < 0 || i >= this.mData.size()) ? super.getItemId(i) : ((Album) this.mData.get(i)).getAlbumId();
    }

    public String getLocalPath(int i) {
        return getItem(i).getCoverPath();
    }

    public Bundle getPeopleFaceCover() {
        return this.mPeopleFaceCover;
    }

    public final String[] getProjection() {
        return PROJECTION;
    }

    public String getServerId(int i) {
        return getItem(i).getServerId();
    }

    public ShareAlbum getShareAlbumInfo(int i) {
        Album item = getItem(i);
        if (this.mSharedAlbums != null) {
            return (ShareAlbum) this.mSharedAlbums.get(String.valueOf(item.getAlbumId()));
        }
        return null;
    }

    public String getThumbnailInfoOfBaby(int i) {
        return getItem(i).getThumbnailInfoOfBaby();
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        super.initDisplayImageOptions();
        this.mDisplayImageOptionBuilder.showImageOnLoading((int) R.drawable.default_album_cover);
        this.mDisplayImageOptionBuilder.showImageOnFail(R.drawable.default_album_cover);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }

    public boolean isAutoUploadedAlbum(int i) {
        return isAutoUploadedAlbum(getItem(i));
    }

    public boolean isAutoUploadedAlbum(long j, String str, long j2) {
        return (j & 1) != 0 || (isSystemAlbum(str) && !isScreenshotsAlbum(str)) || isOtherShareAlbum(j2);
    }

    public boolean isBabyAlbum(int i) {
        return isBabyAlbum(getItem(i));
    }

    public boolean isBabyAlbum(Album album) {
        return !TextUtils.isEmpty(album.getBabyInfo());
    }

    public boolean isForceTypeTime(int i) {
        return isForceTypeTime(getItem(i));
    }

    public boolean isForceTypeTime(Album album) {
        return GalleryPreferences.Album.isForceTopAlbumByTopTime(album.getSortBy());
    }

    public boolean isHiddenAlbum(int i) {
        return (getItem(i).getAttributes() & 16) != 0;
    }

    public boolean isOtherAlbum(int i) {
        return isOtherAlbum(getItem(i));
    }

    public boolean isOtherAlbum(Album album) {
        return album.getAlbumClassification() == 1;
    }

    public boolean isOtherShareAlbum(int i) {
        return isOtherShareAlbum(getItem(i).getAlbumId());
    }

    public boolean isOwnerShareAlbum(int i) {
        return isOwnerShareAlbum(getItem(i).getAlbumId());
    }

    public boolean isOwnerShareAlbum(long j) {
        return j < 2147383647 && this.mSharedAlbums != null && this.mSharedAlbums.containsKey(String.valueOf(j));
    }

    public boolean isPanoAlbum(int i) {
        return isPanoAlbum(getItem(i));
    }

    /* access modifiers changed from: protected */
    public boolean isPanoAlbum(Album album) {
        return album.getAlbumId() == 2147483645;
    }

    public boolean isScreenshotsAlbum(int i) {
        return isScreenshotsAlbum(getItem(i).getServerId());
    }

    public boolean isShareAlbum(long j) {
        return isOtherShareAlbum(j) || isOwnerShareAlbum(j);
    }

    public boolean isShowedPhotosTabAlbum(int i) {
        return (getItem(i).getAttributes() & 4) != 0;
    }

    public boolean isSystemAlbum(int i) {
        return isSystemAlbum(getItem(i).getServerId());
    }

    /* access modifiers changed from: protected */
    public boolean isVideoAlbum(Album album) {
        return album.getAlbumId() == 2147483647L;
    }

    public void setPeopleFaceCover(Cursor cursor) {
        if (cursor != null) {
            this.mPeopleFaceCover = cursor.getExtras();
            notifyDataSetChanged();
        }
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
            if (getItemCount() > 0) {
                notifyDataSetChanged();
            }
        }
    }
}

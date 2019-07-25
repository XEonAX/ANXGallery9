package com.miui.gallery.adapter;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.miui.gallery.activity.AlbumLocalPageActivity;
import com.miui.gallery.activity.facebaby.BabyAlbumDetailActivity;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.Album.AlbumType;
import com.miui.gallery.provider.GalleryContract.RecentAlbum;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;

public class AlbumPageAdapter extends AlbumAdapterBase implements OnItemClickListener {
    private Activity mActivity;

    public AlbumPageAdapter(Activity activity) {
        super(activity);
        this.mActivity = activity;
    }

    private boolean isSameSection(AlbumType albumType, AlbumType albumType2) {
        boolean z = false;
        if (albumType == AlbumType.OTHER_ALBUMS || albumType2 == AlbumType.OTHER_ALBUMS) {
            return false;
        }
        if (albumType == AlbumType.PINNED) {
            if (albumType2 == AlbumType.PINNED) {
                z = true;
            }
            return z;
        } else if (albumType != AlbumType.SYSTEM) {
            return (albumType2 == AlbumType.SYSTEM || albumType2 == AlbumType.PINNED) ? false : true;
        } else {
            if (albumType2 == AlbumType.SYSTEM) {
                z = true;
            }
            return z;
        }
    }

    private boolean isSyncable() {
        return SyncUtil.existXiaomiAccount(this.mActivity);
    }

    public int getBottomDividerType(int i) {
        if (i == -1) {
            return 0;
        }
        if (i == getItemCount() - 1) {
            return 3;
        }
        Album item = getItem(i);
        if (item == null) {
            Log.w("AlbumPageAdapter", "current album item should not be null: %d", Integer.valueOf(i));
            return 0;
        }
        Album item2 = getItem(i + 1);
        if (item2 != null) {
            return isSameSection(item.getAlbumType(), item2.getAlbumType()) ? 2 : 1;
        }
        return 3;
    }

    /* access modifiers changed from: protected */
    public Intent newClickItemIntent(int i, long j, boolean z) {
        Intent intent;
        if (isOthersAlbum(j)) {
            return new Intent(this.mContext, AlbumLocalPageActivity.class);
        }
        if (isFaceAlbum(j)) {
            return new Intent("com.miui.gallery.action.VIEW_PEOPLE");
        }
        if (isRecentAlbum(j)) {
            Intent intent2 = new Intent("android.intent.action.VIEW");
            intent2.setData(RecentAlbum.VIEW_PAGE_URI.buildUpon().appendQueryParameter("source", "album_page").build());
            intent2.setPackage(this.mContext.getPackageName());
            return intent2;
        }
        if (!isBabyAlbum(i)) {
            intent = new Intent("com.miui.gallery.action.VIEW_ALBUM_DETAIL");
        } else {
            intent = new Intent(this.mContext, BabyAlbumDetailActivity.class);
            intent.putExtra("people_id", getBabyAlbumPeopleId(i));
            intent.putExtra("baby_info", getBabyInfo(i));
            intent.putExtra("thumbnail_info_of_baby", getThumbnailInfoOfBaby(i));
            intent.putExtra("baby_sharer_info", getBabySharerInfo(i));
        }
        intent.putExtra("other_share_album", isOtherShareAlbum(i));
        intent.putExtra("owner_share_album", isOwnerShareAlbum(i));
        intent.putExtra("is_local_album", z);
        intent.putExtra("screenshot_album", isScreenshotsAlbum(i));
        intent.putExtra("pano_album", isPanoAlbum(i));
        intent.putExtra("album_id", j);
        intent.putExtra("album_name", getAlbumName(i));
        intent.putExtra("album_server_id", getServerId(i));
        intent.putExtra("attributes", getAttributes(i));
        intent.putExtra("album_unwriteable", albumUnwriteable(i));
        intent.putExtra("album_local_path", getAlbumLocalPath(i));
        return intent;
    }

    public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
        this.mActivity.startActivity(newClickItemIntent(i, getItemId(i), !isSyncable() || !isAutoUploadedAlbum(i)));
        return true;
    }
}

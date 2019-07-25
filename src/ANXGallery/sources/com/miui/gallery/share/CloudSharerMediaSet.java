package com.miui.gallery.share;

import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.share.AlbumShareOperations.IncomingInvitation;

public class CloudSharerMediaSet {
    private static final Uri BASE_OTHER_SET_URI = GalleryCloudUtils.SHARE_ALBUM_URI;
    private static final Uri BASE_OWNER_SET_URI = GalleryCloudUtils.CLOUD_URI;
    private DBItem mItem;
    private InnerNullItemImp mNullItem;
    private Path mPath;

    class InnerNullItemImp implements DBItem {
        InnerNullItemImp() {
        }

        public String getAlbumStatus() {
            return "";
        }

        /* access modifiers changed from: protected */
        public BabyInfo getBabyInfo() {
            return null;
        }

        public String getCreatorId() {
            return "";
        }

        public String getDisplayName() {
            return "";
        }

        public String getId() {
            return "";
        }

        public String getPublicUrl() {
            return "";
        }

        public String getShareAlbumId() {
            return "";
        }

        public String getShareUrl() {
            return "";
        }

        public String getShareUrlLong() {
            return "";
        }

        public String getSharerInfo() {
            return "";
        }

        public boolean isPublic() {
            return false;
        }
    }

    public CloudSharerMediaSet(Path path) {
        this.mPath = path;
        reloadItem(path);
    }

    public static Path buildPathById(long j) {
        return new Path(j, true);
    }

    private void reloadItem(Path path) {
        if (path.isOtherShared()) {
            this.mItem = CloudUtils.getDBShareAlbumByLocalId(String.valueOf(path.getId()));
        } else {
            this.mItem = CloudUtils.getItem(BASE_OWNER_SET_URI, GalleryApp.sGetAndroidContext(), "_id", String.valueOf(path.getId()));
        }
        if (this.mItem == null) {
            this.mNullItem = new InnerNullItemImp();
        }
    }

    public String getAlbumId() {
        return getShareAlbumId();
    }

    public synchronized int getAlbumShareState(String str) {
        return AlbumShareState.getState(getAlbumStatus(), str, hasShareDetailInfo());
    }

    public String getAlbumStatus() {
        return this.mItem == null ? this.mNullItem.getAlbumStatus() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getAlbumStatus() : "";
    }

    /* access modifiers changed from: protected */
    public BabyInfo getBabyInfo() {
        return this.mItem == null ? this.mNullItem.getBabyInfo() : this.mPath.isOtherShared() ? BabyInfo.fromJSON(((DBShareAlbum) this.mItem).getBabyInfoJson()) : BabyInfo.fromJSON(((DBCloud) this.mItem).getBabyInfoJson());
    }

    public String getCreatorId() {
        return this.mItem == null ? this.mNullItem.getCreatorId() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getCreatorId() : ((DBCloud) this.mItem).getCreatorId();
    }

    public String getDisplayName() {
        return this.mItem == null ? this.mNullItem.getDisplayName() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getFileName() : ((DBCloud) this.mItem).getFileName();
    }

    /* access modifiers changed from: protected */
    public long getId() {
        if (this.mItem == null) {
            return 0;
        }
        return Long.parseLong(this.mItem.getId());
    }

    /* access modifiers changed from: protected */
    public Path getPath() {
        return this.mPath;
    }

    public String getPublicUrl() {
        return this.mItem == null ? this.mNullItem.getPublicUrl() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getPublicUri() : ((DBCloud) this.mItem).getPublicUrl();
    }

    public String getShareAlbumId() {
        return this.mItem == null ? this.mNullItem.getShareAlbumId() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getAlbumId() : ((DBCloud) this.mItem).getServerId();
    }

    public String getShareUrl() {
        return this.mItem == null ? this.mNullItem.getShareUrl() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getShareUrl() : ((DBCloud) this.mItem).getShareUrl();
    }

    public String getShareUrlLong() {
        return this.mItem == null ? this.mNullItem.getShareUrlLong() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getShareUrlLong() : "";
    }

    public String getSharerInfo() {
        return this.mItem == null ? this.mNullItem.getSharerInfo() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getSharerInfo() : "";
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x002a, code lost:
        return true;
     */
    public synchronized boolean hasShareDetailInfo() {
        String shareUrlLong = getShareUrlLong();
        if (TextUtils.isEmpty(shareUrlLong)) {
            return false;
        }
        if (!TextUtils.isEmpty(getSharerInfo())) {
            return true;
        }
        IncomingInvitation parseInvitation = AlbumShareOperations.parseInvitation(shareUrlLong);
        if (parseInvitation != null && parseInvitation.hasSharerInfo()) {
            return false;
        }
    }

    public boolean isNormalStatus() {
        return "normal".equals(getAlbumStatus());
    }

    public boolean isPublic() {
        return this.mItem == null ? this.mNullItem.isPublic() : this.mPath.isOtherShared() ? ((DBShareAlbum) this.mItem).getIsPublic() : ((DBCloud) this.mItem).isPublic();
    }

    public boolean isSharerAlbum() {
        return this.mPath.isOtherShared();
    }

    public void rereloadItem() {
        reloadItem(this.mPath);
    }

    public void setLongUrl(String str) {
    }

    public void setSharerInfo(String str) {
    }
}

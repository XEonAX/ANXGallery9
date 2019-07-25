package com.miui.gallery.ui;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy.Album;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

/* compiled from: AlbumDetailFragment */
class MenuStatusManager {
    private String mAlbumServerId;
    private boolean mAlbumUnwriteable;
    private boolean mAutoUpload;
    private Context mContext;
    private boolean mIsManualRenameRestricted;
    private boolean mIsOtherShareAlbum;
    private boolean mShowInOtherAlbums;
    private boolean mShowInPhotosTab;

    MenuStatusManager(Context context, String str, long j, boolean z, boolean z2, String str2) {
        this.mContext = context;
        this.mAlbumServerId = str;
        boolean z3 = false;
        this.mAutoUpload = (1 & j) != 0;
        this.mShowInPhotosTab = (4 & j) != 0;
        this.mShowInOtherAlbums = (j & 64) != 0;
        this.mAlbumUnwriteable = z;
        this.mIsOtherShareAlbum = z2;
        if (isSystemAlbum(str) || z2 || z || isManualRenameRestricted(str2)) {
            z3 = true;
        }
        this.mIsManualRenameRestricted = z3;
    }

    private boolean isManualRenameRestricted(String str) {
        boolean z = false;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        Album albumByPath = CloudControlStrategyHelper.getAlbumByPath(StorageUtils.ensureCommonRelativePath(str));
        if (!(albumByPath == null || albumByPath.getAttributes() == null || !albumByPath.getAttributes().isManualRenameRestricted())) {
            z = true;
        }
        return z;
    }

    private boolean isSystemAlbum(String str) {
        return isSystemAlbumButNotScreenshots(str) || String.valueOf(2).equals(str);
    }

    private boolean isSystemAlbumButNotScreenshots(String str) {
        return String.valueOf(-2147483646).equals(str) || String.valueOf(-2147483647L).equals(str) || String.valueOf(1).equals(str) || String.valueOf(1000).equals(str) || String.valueOf(-2147483645).equals(str) || String.valueOf(-2147483643).equals(str) || String.valueOf(-2147483642).equals(str) || String.valueOf(-2147483644).equals(str);
    }

    private boolean isVirtualAlbum(String str) {
        return String.valueOf(-2147483646).equals(str) || String.valueOf(-2147483647L).equals(str) || String.valueOf(1000).equals(str) || String.valueOf(-2147483645).equals(str) || String.valueOf(-2147483643).equals(str) || String.valueOf(-2147483642).equals(str);
    }

    /* access modifiers changed from: 0000 */
    public boolean canAddPhotos() {
        return !isVirtualAlbum(this.mAlbumServerId) && !this.mAlbumUnwriteable;
    }

    /* access modifiers changed from: 0000 */
    public boolean canDisableAutoUpload() {
        if (isSystemAlbumButNotScreenshots(this.mAlbumServerId) || this.mAlbumUnwriteable || this.mIsOtherShareAlbum || !SyncUtil.isGalleryCloudSyncable(this.mContext)) {
            return false;
        }
        return this.mAutoUpload;
    }

    /* access modifiers changed from: 0000 */
    public boolean canDisableShowInOtherAlbums() {
        if (isSystemAlbum(this.mAlbumServerId) || this.mIsOtherShareAlbum || this.mAlbumUnwriteable) {
            return false;
        }
        return this.mShowInOtherAlbums;
    }

    /* access modifiers changed from: 0000 */
    public boolean canDisableShowInPhotosTab() {
        if (isSystemAlbumButNotScreenshots(this.mAlbumServerId)) {
            return false;
        }
        return this.mShowInPhotosTab;
    }

    /* access modifiers changed from: 0000 */
    public boolean canEnableAutoUpload() {
        if (isSystemAlbumButNotScreenshots(this.mAlbumServerId) || this.mAlbumUnwriteable || this.mIsOtherShareAlbum) {
            return false;
        }
        if (!SyncUtil.isGalleryCloudSyncable(this.mContext)) {
            return true;
        }
        return !this.mAutoUpload;
    }

    /* access modifiers changed from: 0000 */
    public boolean canEnableShowInOtherAlbums() {
        if (isSystemAlbum(this.mAlbumServerId) || this.mIsOtherShareAlbum || this.mAlbumUnwriteable) {
            return false;
        }
        return !this.mShowInOtherAlbums;
    }

    /* access modifiers changed from: 0000 */
    public boolean canEnableShowInPhotosTab() {
        if (isSystemAlbumButNotScreenshots(this.mAlbumServerId) || this.mIsOtherShareAlbum || this.mAlbumUnwriteable) {
            return false;
        }
        return !this.mShowInPhotosTab;
    }

    /* access modifiers changed from: 0000 */
    public boolean canRename() {
        return !isSystemAlbum(this.mAlbumServerId) && !this.mAlbumUnwriteable && !this.mIsOtherShareAlbum && !this.mIsManualRenameRestricted;
    }

    /* access modifiers changed from: 0000 */
    public boolean canShare() {
        return !isSystemAlbum(this.mAlbumServerId) && !this.mAlbumUnwriteable && ApplicationHelper.supportShare();
    }

    /* access modifiers changed from: 0000 */
    public boolean canShowInPhotosTab() {
        return this.mShowInPhotosTab;
    }

    /* access modifiers changed from: protected */
    public boolean isUnWriteable() {
        return this.mAlbumUnwriteable;
    }

    /* access modifiers changed from: 0000 */
    public void onAutoUploadStatusChanged(boolean z) {
        this.mAutoUpload = z;
    }

    /* access modifiers changed from: 0000 */
    public void onShowInOtherAlbumsStatusChanged(boolean z) {
        this.mShowInOtherAlbums = z;
    }

    /* access modifiers changed from: 0000 */
    public void onShowInPhotosTabStatusChanged(boolean z) {
        this.mShowInPhotosTab = z;
    }
}

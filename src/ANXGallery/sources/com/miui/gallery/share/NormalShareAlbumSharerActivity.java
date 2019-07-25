package com.miui.gallery.share;

import com.miui.gallery.R;

public class NormalShareAlbumSharerActivity extends ShareAlbumSharerBaseActivity {
    private SharerPublicShareUiHandler mPublicShareUiHandler;

    /* JADX WARNING: type inference failed for: r3v0, types: [android.content.Context, com.miui.gallery.share.NormalShareAlbumSharerActivity] */
    /* access modifiers changed from: protected */
    public ShareUserAdapterBase createShareUserAdapter() {
        return new ShareUserAdapter(this, false, this.mCreatorId);
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "album_normal_share_info";
    }

    /* access modifiers changed from: protected */
    public int getPreferencesResourceId() {
        return R.xml.share_album_sharer;
    }

    /* access modifiers changed from: protected */
    public void initPreferences() {
        super.initPreferences();
        this.mPublicShareUiHandler = new SharerPublicShareUiHandler(this, this.mAlbumName, this.mCloudSingleMediaSet);
        this.mPublicShareUiHandler.initPreferences();
        this.mPublicShareUiHandler.updatePublicPreference(this.mCloudSingleMediaSet.isPublic(), this.mCloudSingleMediaSet.getPublicUrl());
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.mPublicShareUiHandler.onDestroy();
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onUpdateProgressChanged(int i) {
        this.mPublicShareUiHandler.updateProgressBar(i);
    }

    /* access modifiers changed from: protected */
    public void updateSharers() {
        super.updateSharers();
        this.mPublicShareUiHandler.updateSharers(this.mSharerCount);
    }
}

package com.miui.gallery.share.baby;

import com.miui.gallery.R;
import com.miui.gallery.share.ShareAlbumSharerBaseActivity;
import com.miui.gallery.share.ShareUserAdapterBase;

public class BabyShareAlbumSharerActivity extends ShareAlbumSharerBaseActivity {
    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.miui.gallery.share.baby.BabyShareAlbumSharerActivity] */
    /* access modifiers changed from: protected */
    public ShareUserAdapterBase createShareUserAdapter() {
        return new BabyAlbumShareUserAdapter(this, this.mCreatorId);
    }

    /* access modifiers changed from: protected */
    public String getPageName() {
        return "album_baby_share_info";
    }

    /* access modifiers changed from: protected */
    public int getPreferencesResourceId() {
        return R.xml.baby_share_album_preference;
    }
}

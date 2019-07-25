package com.miui.gallery.activity;

import android.os.Bundle;
import com.miui.gallery.R;

public class AlbumNewPhotoDetailActivity extends BaseActivity {
    /* access modifiers changed from: protected */
    public int getContentId() {
        return R.layout.album_new_photo_detail_activity;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(getContentId());
    }
}

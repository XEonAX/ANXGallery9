package com.miui.gallery.picker;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;

public class PickAlbumDetailActivity extends PickAlbumDetailActivityBase {
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mPicker != null) {
            setContentView(R.layout.picker_album_detail_activity);
            this.mAlbumDetailFragment = (PickAlbumDetailFragment) getFragmentManager().findFragmentById(R.id.album_detail);
            Intent intent = getIntent();
            long longExtra = intent.getLongExtra("album_id", -1);
            String stringExtra = intent.getStringExtra("album_name");
            boolean booleanExtra = intent.getBooleanExtra("other_share_album", false);
            boolean booleanExtra2 = intent.getBooleanExtra("pano_album", false);
            if (longExtra == -1) {
                finish();
                return;
            }
            this.mAlbumDetailFragment.setItemStateListener(this.mItemStateListener);
            ((PickAlbumDetailFragment) this.mAlbumDetailFragment).setAlbumId(longExtra);
            ((PickAlbumDetailFragment) this.mAlbumDetailFragment).setIsOtherSharedAlbum(booleanExtra);
            ((PickAlbumDetailFragment) this.mAlbumDetailFragment).setIsPanoAlbum(booleanExtra2);
            if (!TextUtils.isEmpty(stringExtra)) {
                setTitle(stringExtra);
            }
        }
    }
}

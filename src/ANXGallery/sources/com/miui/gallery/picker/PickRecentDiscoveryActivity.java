package com.miui.gallery.picker;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;

public class PickRecentDiscoveryActivity extends PickAlbumDetailActivityBase {
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mPicker != null) {
            setContentView(R.layout.picker_recent_discovery_activity);
            this.mAlbumDetailFragment = (PickRecentDiscoveryFragment) getFragmentManager().findFragmentById(R.id.album_recent);
            Intent intent = getIntent();
            long longExtra = intent.getLongExtra("album_id", -1);
            String stringExtra = intent.getStringExtra("album_name");
            if (longExtra == -1) {
                finish();
                return;
            }
            this.mAlbumDetailFragment.setItemStateListener(this.mItemStateListener);
            if (!TextUtils.isEmpty(stringExtra)) {
                setTitle(stringExtra);
            }
        }
    }
}

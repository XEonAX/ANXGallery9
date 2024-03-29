package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.ui.BabyAlbumDetailFragment;

public class BabyAlbumDetailActivity extends BaseActivity {
    private BabyAlbumDetailFragment mAlbumDetailFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mAlbumDetailFragment.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.baby_album_detail_activity);
        this.mAlbumDetailFragment = (BabyAlbumDetailFragment) getFragmentManager().findFragmentById(R.id.baby_album_detail);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.mAlbumDetailFragment.onCreateOptionsMenu(menu, getMenuInflater());
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (this.mAlbumDetailFragment.onOptionsItemSelected(menuItem)) {
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }
}

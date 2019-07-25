package com.miui.gallery.activity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.ui.AlbumDetailFragment;

public class AlbumDetailActivity extends BaseActivity {
    private AlbumDetailFragment mAlbumDetailFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        this.mAlbumDetailFragment.onActivityResult(i, i2, intent);
    }

    public void onBackPressed() {
        if (!this.mAlbumDetailFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.album_detail_activity);
        Intent intent = getIntent();
        if ("android.intent.action.VIEW".equals(intent.getAction())) {
            Uri data = intent.getData();
            if (data != null) {
                intent.putExtra("album_server_id", data.getLastPathSegment());
            }
        }
        this.mAlbumDetailFragment = (AlbumDetailFragment) getFragmentManager().findFragmentById(R.id.album_detail);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.mAlbumDetailFragment.onCreateOptionsMenu(menu, getMenuInflater());
        return true;
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (this.mAlbumDetailFragment.onOptionsItemSelected(menuItem)) {
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        this.mAlbumDetailFragment.onPrepareOptionsMenu(menu);
        return super.onPrepareOptionsMenu(menu);
    }
}

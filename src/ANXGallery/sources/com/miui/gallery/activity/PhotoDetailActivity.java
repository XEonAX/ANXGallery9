package com.miui.gallery.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.ui.PhotoDetailFragment;

public class PhotoDetailActivity extends BaseActivity {
    private PhotoDetailFragment mPhotoDetailFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mPhotoDetailFragment.onActivityResult(i, i2, intent);
    }

    public void onBackPressed() {
        if (!this.mPhotoDetailFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.photo_detail_activity);
        this.mPhotoDetailFragment = (PhotoDetailFragment) getFragmentManager().findFragmentById(R.id.photo_detail);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.mPhotoDetailFragment.onCreateOptionsMenu(menu, getMenuInflater());
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (this.mPhotoDetailFragment.onOptionsItemSelected(menuItem)) {
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        this.mPhotoDetailFragment.onPrepareOptionsMenu(menu);
        return super.onPrepareOptionsMenu(menu);
    }

    /* access modifiers changed from: protected */
    public boolean supportShowOnScreenLocked() {
        return true;
    }
}

package com.miui.gallery.activity;

import android.os.Bundle;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.ui.PhotoSlimFragment;

public class PhotoSlimActivity extends BaseActivity {
    private PhotoSlimFragment mPhotoSlimFragment;

    public void onBackPressed() {
        if (!this.mPhotoSlimFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.photo_slim_activity);
        this.mPhotoSlimFragment = (PhotoSlimFragment) getFragmentManager().findFragmentById(R.id.photo_slim_fragment);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332 || !this.mPhotoSlimFragment.onBackPressed()) {
            return super.onOptionsItemSelected(menuItem);
        }
        return true;
    }
}

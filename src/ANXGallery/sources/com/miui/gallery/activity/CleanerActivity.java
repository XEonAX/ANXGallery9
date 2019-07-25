package com.miui.gallery.activity;

import android.os.Bundle;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.ui.CleanerFragment;

public class CleanerActivity extends BaseActivity {
    private CleanerFragment mCleanerFragment;

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mCleanerFragment.onActivityAttachedToWindow();
    }

    public void onBackPressed() {
        if (!this.mCleanerFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.cleaner_activity);
        this.mCleanerFragment = (CleanerFragment) getFragmentManager().findFragmentById(R.id.cleaner);
        getWindow().setBackgroundDrawableResource(R.color.cleaner_background);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332 || !this.mCleanerFragment.onBackPressed()) {
            return super.onOptionsItemSelected(menuItem);
        }
        return true;
    }
}

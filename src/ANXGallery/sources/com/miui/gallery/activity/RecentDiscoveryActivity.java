package com.miui.gallery.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.ui.RecentDiscoveryFragment;

public class RecentDiscoveryActivity extends BaseActivity {
    private RecentDiscoveryFragment mRecentDiscoveryFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mRecentDiscoveryFragment.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.recent_discovery_activity);
        this.mRecentDiscoveryFragment = (RecentDiscoveryFragment) getFragmentManager().findFragmentById(R.id.album_recent);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.mRecentDiscoveryFragment.onCreateOptionsMenu(menu, getMenuInflater());
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return this.mRecentDiscoveryFragment.onOptionsItemSelected(menuItem) || super.onOptionsItemSelected(menuItem);
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        this.mRecentDiscoveryFragment.onPrepareOptionsMenu(menu);
        return super.onPrepareOptionsMenu(menu);
    }
}

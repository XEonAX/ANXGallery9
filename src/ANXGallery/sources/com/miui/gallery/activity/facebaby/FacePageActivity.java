package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.ui.FacePageFragment;

public class FacePageActivity extends BaseActivity {
    FacePageFragment mFaceFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mFaceFragment.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.face_page_activity);
        this.mFaceFragment = (FacePageFragment) getFragmentManager().findFragmentById(R.id.faceFragment);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.face_album_menu, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return !this.mFaceFragment.onOptionsItemSelected(menuItem) ? super.onOptionsItemSelected(menuItem) : super.onOptionsItemSelected(menuItem);
    }

    public void onPause() {
        super.onPause();
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        boolean isFaceDisplayMode = this.mFaceFragment.isFaceDisplayMode();
        MenuItem findItem = menu.findItem(R.id.action_change_mode_to_photo);
        if (findItem != null) {
            findItem.setVisible(isFaceDisplayMode);
        }
        MenuItem findItem2 = menu.findItem(R.id.action_change_mode_to_face);
        if (findItem2 != null) {
            findItem2.setVisible(!isFaceDisplayMode);
        }
        return true;
    }

    public void onResume() {
        super.onResume();
        setImmersionMenuEnabled(true);
    }
}

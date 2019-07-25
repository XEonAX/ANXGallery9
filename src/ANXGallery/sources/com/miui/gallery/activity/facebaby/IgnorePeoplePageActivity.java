package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.ui.IgnorePeoplePageFragment;

public class IgnorePeoplePageActivity extends BaseActivity {
    private IgnorePeoplePageFragment mFragment;

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mFragment.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.ignore_people_page_activity);
        this.mFragment = (IgnorePeoplePageFragment) getFragmentManager().findFragmentById(R.id.ignore_people_page_fragment);
    }
}

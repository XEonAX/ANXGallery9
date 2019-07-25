package com.miui.gallery.activity;

import android.os.Bundle;
import com.miui.gallery.R;

public class CloudSpaceStatusActivity extends BaseActivity {
    /* access modifiers changed from: protected */
    public boolean allowUseOnOffline() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.cloud_space_status_activity);
    }
}

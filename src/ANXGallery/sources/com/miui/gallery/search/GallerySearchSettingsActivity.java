package com.miui.gallery.search;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.SyncUtil;

public class GallerySearchSettingsActivity extends BaseActivity implements OnClickListener {
    private TextView mRequestView;

    private void configByStatus(int i) {
        switch (i) {
            case 0:
                this.mRequestView.setOnClickListener(this);
                this.mRequestView.setEnabled(true);
                this.mRequestView.setText(R.string.search_request_open);
                return;
            case 1:
                this.mRequestView.setOnClickListener(null);
                this.mRequestView.setEnabled(false);
                this.mRequestView.setText(R.string.search_request_applied);
                return;
            case 2:
                this.mRequestView.setOnClickListener(null);
                this.mRequestView.setEnabled(false);
                this.mRequestView.setText(R.string.search_request_requesting);
                return;
            default:
                return;
        }
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.miui.gallery.search.GallerySearchSettingsActivity] */
    public void onClick(View view) {
        if (view != null && view.getId() == R.id.request) {
            if (!SyncUtil.existXiaomiAccount(this)) {
                Bundle bundle = new Bundle();
                bundle.putSerializable("cloud_guide_source", CloudGuideSource.SEARCH);
                IntentUtil.guideToLoginXiaomiAccount((Context) this, bundle);
                return;
            }
            AIAlbumStatusHelper.setLocalSearchStatus(this, true);
            configByStatus(2);
            GallerySamplingStatHelper.recordCountEvent("search", "search_open_switch");
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.search_settings_activity);
        this.mRequestView = (TextView) findViewById(R.id.request);
        int openApiSearchStatus = AIAlbumStatusHelper.getOpenApiSearchStatus();
        configByStatus(openApiSearchStatus);
        if (openApiSearchStatus == 2) {
            AIAlbumStatusHelper.requestOpenCloudControlSearch("GallerySearchSettingsActivity");
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity, com.miui.gallery.search.GallerySearchSettingsActivity] */
    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        GallerySamplingStatHelper.recordPageEnd(this, "search_settings");
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity, com.miui.gallery.search.GallerySearchSettingsActivity] */
    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        GallerySamplingStatHelper.recordPageStart(this, "search_settings");
    }
}

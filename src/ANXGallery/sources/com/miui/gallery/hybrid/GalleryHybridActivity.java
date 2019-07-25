package com.miui.gallery.hybrid;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.hybrid.GalleryHybridFragment.HybridViewEventListener;
import com.miui.gallery.hybrid.hybridclient.HybridClient;
import com.miui.gallery.hybrid.hybridclient.HybridClientFactory;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.request.HostManager;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.gallery.util.StringUtils;

public class GalleryHybridActivity extends BaseActivity implements HybridViewEventListener {
    private HybridClient mHybridClient;
    private GalleryHybridFragment mHybridFragment;
    private TextView mTitleView;

    private boolean checkCloudServiceAgreementIfNeeded(Intent intent) {
        if (intent == null || !isCloudServiceRequest(intent) || PrivacyAgreementUtils.isCloudServiceAgreementEnable(GalleryApp.sGetAndroidContext())) {
            return true;
        }
        Log.w("GalleryHybridActivity", "cloud service request but cloud privacy denied, start cloud main page.");
        IntentUtil.startCloudMainPage(GalleryApp.sGetAndroidContext());
        return false;
    }

    private void configureActionBar() {
        this.mActionBar.setDisplayShowCustomEnabled(true);
        this.mActionBar.setDisplayShowHomeEnabled(false);
        this.mActionBar.setDisplayShowTitleEnabled(false);
        this.mActionBar.setHomeButtonEnabled(true);
        this.mActionBar.setCustomView(R.layout.hybrid_action_bar_custom_view);
        View customView = this.mActionBar.getCustomView();
        this.mTitleView = (TextView) customView.findViewById(R.id.title);
        customView.findViewById(R.id.close).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                GalleryHybridActivity.this.finish();
            }
        });
    }

    private boolean isCloudServiceRequest(Intent intent) {
        String[] strArr;
        String dataString = intent.getDataString();
        String stringExtra = intent.getStringExtra("url");
        for (String str : new String[]{HostManager.getTrashBinUrl()}) {
            if (TextUtils.equals(dataString, str) || TextUtils.equals(stringExtra, str)) {
                return true;
            }
        }
        return false;
    }

    private void load() {
        if (this.mHybridFragment == null) {
            Log.w("GalleryHybridActivity", "Hybrid fragment not attached, couldn't load url now!");
        } else if (!CTA.canConnectNetwork()) {
            Log.w("GalleryHybridActivity", "CTA not allowed, couldn't connect to network!");
        } else {
            if (checkCloudServiceAgreementIfNeeded(getIntent())) {
                this.mHybridFragment.load();
            } else {
                finish();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean allowUseOnOffline() {
        return false;
    }

    public String[] getRuntimePermissions() {
        return this.mHybridClient != null ? StringUtils.mergeStringArray(super.getRuntimePermissions(), this.mHybridClient.getRuntimePermissions()) : super.getRuntimePermissions();
    }

    public void onBackPressed() {
        if (!this.mHybridFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.hybrid.GalleryHybridFragment$HybridViewEventListener, com.miui.gallery.hybrid.GalleryHybridActivity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        this.mHybridClient = HybridClientFactory.createHybridClient(this, getIntent());
        super.onCreate(bundle);
        setContentView(R.layout.hybrid_activity);
        configureActionBar();
        this.mHybridFragment = (GalleryHybridFragment) getFragmentManager().findFragmentById(R.id.hybrid_fragment);
        this.mHybridFragment.setHybridViewEventListener(this);
        this.mHybridFragment.setHybridClient(this.mHybridClient);
        load();
    }

    /* access modifiers changed from: protected */
    public void onCtaChecked(boolean z) {
        if (z && resumed()) {
            load();
        }
    }

    public void onReceivedTitle(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.mTitleView.setText(str);
        }
    }
}

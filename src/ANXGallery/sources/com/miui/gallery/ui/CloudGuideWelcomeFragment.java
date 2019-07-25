package com.miui.gallery.ui;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.Intent;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.activity.CloudGuideAutoBackupActivity;
import com.miui.gallery.activity.HomePageActivity;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.preference.GalleryPreferences.CloudGuide;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import java.util.HashMap;
import java.util.Locale;

public class CloudGuideWelcomeFragment extends PreferenceFragment {
    private CheckBoxPreference mAIAlbumStatusPref;
    private CheckBoxPreference mFaceLocalStatusPref;
    /* access modifiers changed from: private */
    public CloudGuideSource mSource;

    private void statLoginState(CloudGuideSource cloudGuideSource, boolean z, boolean z2) {
        String format = String.format(Locale.US, "guide_login_status_%s", new Object[]{cloudGuideSource.name()});
        HashMap hashMap = new HashMap();
        hashMap.put("login", String.valueOf(z));
        hashMap.put("syncable", String.valueOf(z2));
        GalleryStatHelper.recordCountEvent("cloud_guide", format, hashMap);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 32) {
            super.onActivityResult(i, i2, intent);
        } else if (i2 == -1) {
            if (this.mAIAlbumStatusPref != null) {
                AIAlbumStatusHelper.setAIAlbumLocalStatus(getActivity(), this.mAIAlbumStatusPref.isChecked());
            } else if (this.mFaceLocalStatusPref != null) {
                AIAlbumStatusHelper.setFaceAlbumStatus(getActivity(), this.mFaceLocalStatusPref.isChecked());
            }
            Account account = AccountCache.getAccount();
            if (account != null) {
                if (!ContentResolver.getMasterSyncAutomatically()) {
                    ContentResolver.setMasterSyncAutomatically(true);
                    Log.d("CloudGuideWelcomeFragment", "open master sync auto");
                }
                if (!ContentResolver.getSyncAutomatically(account, "com.miui.gallery.cloud.provider")) {
                    SyncUtil.setSyncAutomatically(getActivity(), true);
                    Log.d("CloudGuideWelcomeFragment", "open gallery sync auto");
                }
            }
            if (!(this.mSource == CloudGuideSource.AUTOBACKUP || this.mSource == CloudGuideSource.SECRET || this.mSource == CloudGuideSource.SHARE_INVITATION || this.mSource == CloudGuideSource.URL)) {
                Intent intent2 = new Intent(getActivity(), HomePageActivity.class);
                intent2.addFlags(67108864);
                startActivity(intent2);
            }
            getActivity().finish();
        } else if (i2 == 1) {
            getActivity().finish();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getPreferenceManager().setSharedPreferencesName("com.miui.gallery_preferences_new");
        addPreferencesFromResource(R.xml.cloud_guide_welcome);
        Intent intent = getActivity().getIntent();
        if (intent.hasExtra("cloud_guide_source")) {
            this.mSource = (CloudGuideSource) intent.getSerializableExtra("cloud_guide_source");
        } else {
            this.mSource = CloudGuideSource.TOPBAR;
        }
        if (this.mSource == CloudGuideSource.TOPBAR) {
            CloudGuide.setCloudGuideTopbarClicked();
        }
        getActivity().getActionBar().setTitle(R.string.cloud_guide_welcome_title);
        PreferenceCategory preferenceCategory = (PreferenceCategory) findPreference("root_category");
        this.mAIAlbumStatusPref = (CheckBoxPreference) findPreference("ai_album_status");
        this.mFaceLocalStatusPref = (CheckBoxPreference) findPreference("cloud_face_local_status");
        if (AIAlbumStatusHelper.useNewAIAlbumSwitch()) {
            preferenceCategory.removePreference(this.mFaceLocalStatusPref);
            this.mFaceLocalStatusPref = null;
            return;
        }
        preferenceCategory.removePreference(this.mAIAlbumStatusPref);
        this.mAIAlbumStatusPref = null;
        this.mFaceLocalStatusPref.setChecked(!AIAlbumStatusHelper.isFaceSwitchSet() || AIAlbumStatusHelper.isAIAlbumEnabled());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.cloud_guide_welcome, viewGroup, false);
        TextView textView = (TextView) inflate.findViewById(R.id.welcome_text);
        TextView textView2 = (TextView) inflate.findViewById(R.id.introduce);
        Button button = (Button) inflate.findViewById(R.id.next);
        if (this.mSource == CloudGuideSource.AUTOBACKUP) {
            textView.setText(R.string.welcome_to_auto_backup);
            textView2.setText(R.string.auto_backup_introduce);
            button.setText(R.string.next);
        } else {
            textView.setText(R.string.welcome_to_micloud);
            textView2.setText(R.string.micloud_introduce);
            button.setText(R.string.next);
        }
        button.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                Intent intent = new Intent(CloudGuideWelcomeFragment.this.getActivity(), CloudGuideAutoBackupActivity.class);
                intent.putExtra("autobackup_album_id", CloudGuideWelcomeFragment.this.getActivity().getIntent().getLongExtra("autobackup_album_id", -1));
                intent.putExtra("cloud_guide_source", CloudGuideWelcomeFragment.this.mSource);
                CloudGuideWelcomeFragment.this.startActivityForResult(intent, 32);
            }
        });
        return inflate;
    }

    public void onDestroy() {
        statLoginState(this.mSource, SyncUtil.existXiaomiAccount(getActivity()), SyncUtil.isGalleryCloudSyncable(getActivity()));
        super.onDestroy();
    }

    public void onPause() {
        super.onPause();
        GallerySamplingStatHelper.recordPageEnd(getActivity(), "cloud_guide_welcome");
    }

    public void onResume() {
        super.onResume();
        GallerySamplingStatHelper.recordPageStart(getActivity(), "cloud_guide_welcome");
    }
}

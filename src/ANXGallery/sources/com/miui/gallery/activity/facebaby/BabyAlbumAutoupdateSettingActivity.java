package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.provider.FaceManager;
import java.lang.ref.SoftReference;
import miui.preference.PreferenceActivity;
import miui.preference.ValuePreference;

public class BabyAlbumAutoupdateSettingActivity extends PreferenceActivity implements OnPreferenceChangeListener {
    private ValuePreference mAssociateFaceAlbumPreference;
    private CheckBoxPreference mAutoAddedPreference;
    /* access modifiers changed from: private */
    public BabyInfo mBabyInfo;
    private long mPeopleFaceLocalId;
    private AsyncTask mPeopleFaceNameTask;

    private void getPeopleNameAsync() {
        if (!TextUtils.isEmpty(this.mBabyInfo.mPeopleId)) {
            final SoftReference softReference = new SoftReference(this.mAssociateFaceAlbumPreference);
            this.mPeopleFaceNameTask = new AsyncTask<Void, Void, String>() {
                /* access modifiers changed from: protected */
                public String doInBackground(Void... voidArr) {
                    return FaceManager.queryPersonName(BabyAlbumAutoupdateSettingActivity.this.mBabyInfo.mPeopleId);
                }

                /* access modifiers changed from: protected */
                public void onPostExecute(String str) {
                    if (!TextUtils.isEmpty(str)) {
                        ValuePreference valuePreference = (ValuePreference) softReference.get();
                        if (valuePreference != null) {
                            valuePreference.setValue(str);
                        }
                    }
                }
            }.execute(new Void[0]);
        }
    }

    /* access modifiers changed from: private */
    public void pickBabyFace() {
        Intent intent = new Intent("com.miui.gallery.action.PICK_PEOPLE");
        intent.putExtra("pick_people", true);
        startActivityForResult(intent, 14);
    }

    private void refreshPreference() {
        this.mAutoAddedPreference.setChecked(this.mBabyInfo.mAutoupdate);
    }

    private void setResult() {
        Intent intent = new Intent();
        intent.putExtra("associate_people_face_local_id", this.mPeopleFaceLocalId);
        intent.putExtra("baby-info", this.mBabyInfo);
        setResult(-1, intent);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 14) {
            BabyAlbumAutoupdateSettingActivity.super.onActivityResult(i, i2, intent);
            return;
        }
        if (i2 == -1 && intent != null) {
            String stringExtra = intent.getStringExtra("local_id_of_album");
            if (!TextUtils.isEmpty(stringExtra)) {
                this.mPeopleFaceLocalId = Long.parseLong(stringExtra);
                this.mBabyInfo.mPeopleId = intent.getStringExtra("server_id_of_album");
                this.mBabyInfo.mAutoupdate = true;
                this.mAutoAddedPreference.setChecked(true);
                this.mAssociateFaceAlbumPreference.setValue(intent.getStringExtra("album_name"));
            }
        }
    }

    public void onBackPressed() {
        setResult();
        BabyAlbumAutoupdateSettingActivity.super.onBackPressed();
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        BabyAlbumAutoupdateSettingActivity.super.onCreate(bundle);
        setContentView(R.layout.baby_album_auto_update_settings);
        addPreferencesFromResource(R.xml.baby_album_auto_update_preferences);
        this.mAutoAddedPreference = (CheckBoxPreference) findPreference("auto_update_face");
        this.mAutoAddedPreference.setOnPreferenceChangeListener(this);
        Intent intent = getIntent();
        boolean booleanExtra = intent.getBooleanExtra("allow_to_reassociate", false);
        this.mAssociateFaceAlbumPreference = findPreference("associate_face_album");
        if (booleanExtra) {
            this.mAssociateFaceAlbumPreference.setShowRightArrow(true);
            this.mAssociateFaceAlbumPreference.setOnPreferenceClickListener(new OnPreferenceClickListener() {
                public boolean onPreferenceClick(Preference preference) {
                    BabyAlbumAutoupdateSettingActivity.this.pickBabyFace();
                    return true;
                }
            });
        } else {
            this.mAssociateFaceAlbumPreference.setEnabled(false);
        }
        this.mBabyInfo = (BabyInfo) intent.getParcelableExtra("baby-info");
        getPeopleNameAsync();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        BabyAlbumAutoupdateSettingActivity.super.onDestroy();
        if (this.mPeopleFaceNameTask != null) {
            this.mPeopleFaceNameTask.cancel(true);
        }
    }

    public boolean onNavigateUp() {
        setResult();
        return BabyAlbumAutoupdateSettingActivity.super.onNavigateUp();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference == this.mAutoAddedPreference) {
            if (!TextUtils.isEmpty(this.mBabyInfo.mPeopleId)) {
                this.mBabyInfo.mAutoupdate = ((Boolean) obj).booleanValue();
            } else if (((Boolean) obj).booleanValue()) {
                pickBabyFace();
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        BabyAlbumAutoupdateSettingActivity.super.onResume();
        refreshPreference();
    }
}

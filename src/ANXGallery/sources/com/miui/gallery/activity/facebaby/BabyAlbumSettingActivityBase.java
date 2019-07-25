package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import android.os.Handler;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.text.TextUtils;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.provider.deprecated.ThumbnailInfo;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import java.util.Calendar;
import miui.preference.PreferenceActivity;
import miui.preference.ValuePreference;

public abstract class BabyAlbumSettingActivityBase extends PreferenceActivity {
    protected static DisplayImageOptions sDisplayImageOptions = new Builder().cacheInMemory(true).considerExifParams(true).showImageOnFail(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(true)).usingRegionDecoderFace(true).build();
    protected ValuePreference mAutoupdatePre;
    protected Long mBabyAlbumLocalId;
    protected BabyInfo mBabyInfoFrom;
    protected Preference mBabyNicknamePre;
    protected Preference mBabySexPre;
    protected String mBirthday;
    protected int mBirthdayDay;
    protected int mBirthdayMonth;
    protected int mBirthdayYear;
    protected Preference mChooseDate;
    protected Bitmap mCoverFaceBitmap;
    protected ImageView mFace;
    protected Long mFaceAlbumLocalId;
    protected Handler mHandler = new Handler();
    protected boolean mHaveSaveBabyInfo;
    protected Boolean mIsAutoupdate = Boolean.valueOf(true);
    protected boolean mIsOtherShareAlbum;
    protected String mNickName;
    protected String mPeopleId;
    protected String mRelation = "father";
    protected Preference mRelationPre;
    protected String mRelationText;
    protected String mSex = "male";
    protected ThumbnailInfo mThumbnailInfo;

    public static String combine2Birthday(int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder();
        sb.append(i);
        sb.append("-");
        sb.append(i2);
        sb.append("-");
        sb.append(i3);
        return sb.toString();
    }

    private void flatBabyInfo(BabyInfo babyInfo) {
        if (babyInfo != null) {
            this.mNickName = babyInfo.mNickName;
            this.mBirthday = babyInfo.mBirthday;
            getBirthYearMonthDay(this.mBirthday);
            this.mSex = babyInfo.mSex;
            this.mRelation = babyInfo.mRelation;
            this.mRelationText = babyInfo.mRelationText;
            this.mIsAutoupdate = Boolean.valueOf(babyInfo.mAutoupdate);
            this.mPeopleId = babyInfo.mPeopleId;
            return;
        }
        this.mIsAutoupdate = Boolean.valueOf(false);
    }

    public static int[] getCurrentYearMonthDay(long j) {
        Calendar acquire = GalleryDateUtils.acquire();
        acquire.setTimeInMillis(j);
        int[] iArr = {acquire.get(1), acquire.get(2) + 1, acquire.get(5)};
        GalleryDateUtils.release(acquire);
        return iArr;
    }

    /* access modifiers changed from: protected */
    public boolean babyInfoChanged() {
        BabyInfo babyInfo = this.mBabyInfoFrom;
        return babyInfo == null || !TextUtils.equals(this.mNickName, babyInfo.mNickName) || !TextUtils.equals(this.mBirthday, babyInfo.mBirthday) || !TextUtils.equals(this.mSex, babyInfo.mSex) || !TextUtils.equals(this.mRelation, babyInfo.mRelation) || !TextUtils.equals(this.mRelationText, babyInfo.mRelationText) || this.mIsAutoupdate.booleanValue() != babyInfo.mAutoupdate || !TextUtils.equals(this.mPeopleId, babyInfo.mPeopleId);
    }

    /* access modifiers changed from: protected */
    public void getBirthYearMonthDay(String str) {
        if (!TextUtils.isEmpty(str)) {
            String[] split = str.split("-");
            if (split.length == 3) {
                this.mBirthdayYear = Integer.parseInt(split[0]);
                this.mBirthdayMonth = Integer.parseInt(split[1]);
                this.mBirthdayDay = Integer.parseInt(split[2]);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [android.content.Context, com.miui.gallery.activity.facebaby.BabyAlbumSettingActivityBase] */
    /* access modifiers changed from: protected */
    public Intent getIntentToAutoUploadPage() {
        Intent intent = new Intent(this, BabyAlbumAutoupdateSettingActivity.class);
        intent.putExtra("baby-info", toBabyInfo(this.mPeopleId, 0));
        return intent;
    }

    /* access modifiers changed from: protected */
    public abstract int getPreferenceResourceId();

    /* access modifiers changed from: protected */
    public abstract void justSaveInfo2DbByJson();

    public void onBackPressed() {
        saveBabyInfo();
        BabyAlbumSettingActivityBase.super.onBackPressed();
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        BabyAlbumSettingActivityBase.super.onCreate(bundle);
        setContentView(R.layout.baby_album_settings);
        addPreferencesFromResource(getPreferenceResourceId());
        this.mBabyNicknamePre = findPreference("baby_name");
        this.mChooseDate = findPreference("baby_birthday");
        this.mBabySexPre = findPreference("baby_sexy");
        this.mRelationPre = findPreference("owner_relation");
        this.mFace = (ImageView) findViewById(R.id.go_to_setting);
        this.mAutoupdatePre = findPreference("auto_update_face");
        this.mAutoupdatePre.setShowRightArrow(true);
        this.mAutoupdatePre.setOnPreferenceClickListener(new OnPreferenceClickListener() {
            public boolean onPreferenceClick(Preference preference) {
                BabyAlbumSettingActivityBase.this.startActivityForResult(BabyAlbumSettingActivityBase.this.getIntentToAutoUploadPage(), 0);
                return false;
            }
        });
        Bundle extras = getIntent().getExtras();
        this.mBabyAlbumLocalId = Long.valueOf(extras.getLong(BabyAlbumUtils.BABY_BABY_ALBUM_LOCAL_ID, -1));
        if (this.mBabyAlbumLocalId.longValue() != -1) {
            BabyInfo babyInfo = (BabyInfo) extras.getParcelable("baby_info");
            this.mBabyInfoFrom = babyInfo;
            flatBabyInfo(babyInfo);
            this.mThumbnailInfo = new ThumbnailInfo(this.mBabyAlbumLocalId.longValue(), this.mIsOtherShareAlbum, getIntent().getStringExtra("thumbnail_info_of_baby"));
        }
        this.mCoverFaceBitmap = (Bitmap) getIntent().getExtras().getParcelable("face_bitmap");
        if (this.mCoverFaceBitmap != null) {
            this.mFace.setImageBitmap(this.mCoverFaceBitmap);
        }
    }

    public boolean onNavigateUp() {
        saveBabyInfo();
        return BabyAlbumSettingActivityBase.super.onNavigateUp();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        justSaveInfo2DbByJson();
        ImageLoader.getInstance().pause();
        BabyAlbumSettingActivityBase.super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        this.mHaveSaveBabyInfo = false;
        BabyAlbumSettingActivityBase.super.onResume();
        ImageLoader.getInstance().resume();
        setPreferencesValue();
    }

    /* access modifiers changed from: protected */
    public abstract void saveBabyInfo();

    /* access modifiers changed from: protected */
    public void setPreferencesValue() {
        this.mAutoupdatePre.setValue(this.mIsAutoupdate.booleanValue() ? getString(R.string.auto_update_on) : getString(R.string.auto_update_off));
    }

    /* access modifiers changed from: protected */
    public BabyInfo toBabyInfo(String str, int i) {
        BabyInfo babyInfo = new BabyInfo(this.mNickName, this.mBirthday, this.mSex, this.mRelation, this.mRelationText, str, this.mIsAutoupdate.booleanValue(), i);
        return babyInfo;
    }
}

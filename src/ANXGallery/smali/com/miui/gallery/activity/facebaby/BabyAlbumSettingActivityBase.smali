.class public abstract Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;
.super Lmiui/preference/PreferenceActivity;
.source "BabyAlbumSettingActivityBase.java"


# static fields
.field protected static sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# instance fields
.field protected mAutoupdatePre:Lmiui/preference/ValuePreference;

.field protected mBabyAlbumLocalId:Ljava/lang/Long;

.field protected mBabyInfoFrom:Lcom/miui/gallery/cloud/baby/BabyInfo;

.field protected mBabyNicknamePre:Landroid/preference/Preference;

.field protected mBabySexPre:Landroid/preference/Preference;

.field protected mBirthday:Ljava/lang/String;

.field protected mBirthdayDay:I

.field protected mBirthdayMonth:I

.field protected mBirthdayYear:I

.field protected mChooseDate:Landroid/preference/Preference;

.field protected mCoverFaceBitmap:Landroid/graphics/Bitmap;

.field protected mFace:Landroid/widget/ImageView;

.field protected mFaceAlbumLocalId:Ljava/lang/Long;

.field protected mHandler:Landroid/os/Handler;

.field protected mHaveSaveBabyInfo:Z

.field protected mIsAutoupdate:Ljava/lang/Boolean;

.field protected mIsOtherShareAlbum:Z

.field protected mNickName:Ljava/lang/String;

.field protected mPeopleId:Ljava/lang/String;

.field protected mRelation:Ljava/lang/String;

.field protected mRelationPre:Landroid/preference/Preference;

.field protected mRelationText:Ljava/lang/String;

.field protected mSex:Ljava/lang/String;

.field protected mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v2, 0x7f0700d7

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v2, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lmiui/preference/PreferenceActivity;-><init>()V

    const-string v0, "male"

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mSex:Ljava/lang/String;

    const-string v0, "father"

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelation:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static combine2Birthday(III)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private flatBabyInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mNickName:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mNickName:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mBirthday:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthday:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthday:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getBirthYearMonthDay(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mSex:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mSex:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelation:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelation:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelationText:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelationText:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mPeopleId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    :goto_0
    return-void
.end method

.method public static getCurrentYearMonthDay(J)[I
    .locals 6

    const/4 v0, 0x3

    new-array v0, v0, [I

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->acquire()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/2addr v3, p0

    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v5, 0x0

    aput p1, v0, v5

    aput v3, v0, p0

    aput v4, v0, v2

    invoke-static {v1}, Lcom/miui/gallery/util/GalleryDateUtils;->release(Ljava/util/Calendar;)V

    return-object v0
.end method


# virtual methods
.method protected babyInfoChanged()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyInfoFrom:Lcom/miui/gallery/cloud/baby/BabyInfo;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mNickName:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mNickName:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthday:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mBirthday:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mSex:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mSex:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelation:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelation:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelationText:Ljava/lang/String;

    iget-object v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mRelationText:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-boolean v2, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mPeopleId:Ljava/lang/String;

    iget-object v0, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected getBirthYearMonthDay(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthdayYear:I

    const/4 v0, 0x1

    aget-object v0, p1, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthdayMonth:I

    const/4 v0, 0x2

    aget-object p1, p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthdayDay:I

    return-void
.end method

.method protected getIntentToAutoUploadPage()Landroid/content/Intent;
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "baby-info"

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mPeopleId:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method protected abstract getPreferenceResourceId()I
.end method

.method protected abstract justSaveInfo2DbByJson()V
.end method

.method public onBackPressed()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->saveBabyInfo()V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0028

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getPreferenceResourceId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->addPreferencesFromResource(I)V

    const-string p1, "baby_name"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyNicknamePre:Landroid/preference/Preference;

    const-string p1, "baby_birthday"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mChooseDate:Landroid/preference/Preference;

    const-string p1, "baby_sexy"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabySexPre:Landroid/preference/Preference;

    const-string p1, "owner_relation"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelationPre:Landroid/preference/Preference;

    const p1, 0x7f090147

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mFace:Landroid/widget/ImageView;

    const-string p1, "auto_update_face"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiui/preference/ValuePreference;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mAutoupdatePre:Lmiui/preference/ValuePreference;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mAutoupdatePre:Lmiui/preference/ValuePreference;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/preference/ValuePreference;->setShowRightArrow(Z)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mAutoupdatePre:Lmiui/preference/ValuePreference;

    new-instance v0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase$1;-><init>(Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;)V

    invoke-virtual {p1, v0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->BABY_BABY_ALBUM_LOCAL_ID:Ljava/lang/String;

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyAlbumLocalId:Ljava/lang/Long;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-eqz v0, :cond_0

    const-string v0, "baby_info"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/baby/BabyInfo;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyInfoFrom:Lcom/miui/gallery/cloud/baby/BabyInfo;

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->flatBabyInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;)V

    new-instance p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsOtherShareAlbum:Z

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "thumbnail_info_of_baby"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "face_bitmap"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mCoverFaceBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mCoverFaceBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mFace:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mCoverFaceBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_1
    return-void
.end method

.method public onNavigateUp()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->saveBabyInfo()V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onNavigateUp()Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->justSaveInfo2DbByJson()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mHaveSaveBabyInfo:Z

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onResume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->setPreferencesValue()V

    return-void
.end method

.method protected abstract saveBabyInfo()V
.end method

.method protected setPreferencesValue()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mAutoupdatePre:Lmiui/preference/ValuePreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f100073

    invoke-virtual {p0, v1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const v1, 0x7f100072

    invoke-virtual {p0, v1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method protected toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 10

    new-instance v9, Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mNickName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mBirthday:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mSex:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelation:Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mRelationText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->mIsAutoupdate:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    move-object v0, v9

    move-object v6, p1

    move v8, p2

    invoke-direct/range {v0 .. v8}, Lcom/miui/gallery/cloud/baby/BabyInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    return-object v9
.end method

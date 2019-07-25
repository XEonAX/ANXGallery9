.class public Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;
.super Lmiui/preference/PreferenceActivity;
.source "BabyAlbumAutoupdateSettingActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

.field private mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

.field private mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

.field private mPeopleFaceLocalId:J

.field private mPeopleFaceNameTask:Landroid/os/AsyncTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lmiui/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->pickBabyFace()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;)Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    return-object p0
.end method

.method private getPeopleNameAsync()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-object v0, v0, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/ref/SoftReference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    new-instance v1, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity$2;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity$2;-><init>(Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;Ljava/lang/ref/SoftReference;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity$2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mPeopleFaceNameTask:Landroid/os/AsyncTask;

    return-void
.end method

.method private pickBabyFace()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.PICK_PEOPLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "pick_people"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v1, 0xe

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private refreshPreference()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-boolean v1, v1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    return-void
.end method

.method private setResult()V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "associate_people_face_local_id"

    iget-wide v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mPeopleFaceLocalId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "baby-info"

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->setResult(ILandroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0xe

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lmiui/preference/PreferenceActivity;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    :cond_0
    const/4 p1, -0x1

    if-ne p2, p1, :cond_1

    if-eqz p3, :cond_1

    const-string p1, "local_id_of_album"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mPeopleFaceLocalId:J

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    const-string p2, "server_id_of_album"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    const-string p2, "album_name"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->setResult()V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0022

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->setContentView(I)V

    const/high16 p1, 0x7f140000

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->addPreferencesFromResource(I)V

    const-string p1, "auto_update_face"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "allow_to_reassociate"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v2, "associate_face_album"

    invoke-virtual {p0, v2}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lmiui/preference/ValuePreference;

    iput-object v2, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setShowRightArrow(Z)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    new-instance v1, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity$1;-><init>(Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;)V

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAssociateFaceAlbumPreference:Lmiui/preference/ValuePreference;

    invoke-virtual {v0, v1}, Lmiui/preference/ValuePreference;->setEnabled(Z)V

    :goto_0
    const-string v0, "baby-info"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/baby/BabyInfo;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->getPeopleNameAsync()V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mPeopleFaceNameTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mPeopleFaceNameTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_0
    return-void
.end method

.method public onNavigateUp()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->setResult()V

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onNavigateUp()Z

    move-result v0

    return v0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mAutoAddedPreference:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-object p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->pickBabyFace()V

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumAutoupdateSettingActivity;->refreshPreference()V

    return-void
.end method

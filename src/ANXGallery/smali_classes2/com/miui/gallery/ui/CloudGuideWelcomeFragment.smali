.class public Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;
.super Landroid/preference/PreferenceFragment;
.source "CloudGuideWelcomeFragment.java"


# instance fields
.field private mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

.field private mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

.field private mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;)Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    return-object p0
.end method

.method private statLoginState(Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;ZZ)V
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "guide_login_status_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->name()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "login"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "syncable"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "cloud_guide"

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x20

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_1

    :cond_0
    const/4 p1, -0x1

    const/4 p3, 0x1

    if-ne p2, p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setAIAlbumLocalStatus(Landroid/content/Context;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setFaceAlbumStatus(Landroid/content/Context;Z)V

    :cond_2
    :goto_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result p2

    if-nez p2, :cond_3

    invoke-static {p3}, Landroid/content/ContentResolver;->setMasterSyncAutomatically(Z)V

    const-string p2, "CloudGuideWelcomeFragment"

    const-string v0, "open master sync auto"

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const-string p2, "com.miui.gallery.cloud.provider"

    invoke-static {p1, p2}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    const-string p1, "CloudGuideWelcomeFragment"

    const-string p2, "open gallery sync auto"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object p2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->AUTOBACKUP:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    if-eq p1, p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object p2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SECRET:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    if-eq p1, p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object p2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SHARE_INVITATION:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    if-eq p1, p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object p2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->URL:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    if-eq p1, p2, :cond_5

    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const-class p3, Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p2, 0x4000000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->startActivity(Landroid/content/Intent;)V

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_1

    :cond_6
    if-ne p2, p3, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_7
    :goto_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object p1

    const-string v0, "com.miui.gallery_preferences_new"

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceManager;->setSharedPreferencesName(Ljava/lang/String;)V

    const p1, 0x7f140002

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->addPreferencesFromResource(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "cloud_guide_source"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "cloud_guide_source"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->TOPBAR:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object v0, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->TOPBAR:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    if-ne p1, v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudGuide;->setCloudGuideTopbarClicked()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    const v0, 0x7f10029d

    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setTitle(I)V

    const-string p1, "root_category"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    const-string v0, "ai_album_status"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    const-string v0, "cloud_face_local_status"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->useNewAIAlbumSwitch()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    iput-object v1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    goto :goto_3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    iput-object v1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceSwitchSet()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isAIAlbumEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v0, 0x1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :goto_3
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const p3, 0x7f0b004b

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090347

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const p3, 0x7f090180

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    const v0, 0x7f0901ee

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    sget-object v2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->AUTOBACKUP:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    const v3, 0x7f1004ba

    if-ne v1, v2, :cond_0

    const v1, 0x7f100781

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f10006e

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    goto :goto_0

    :cond_0
    const v1, 0x7f100782

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f100473

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    :goto_0
    new-instance p2, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment$1;-><init>(Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->mSource:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->statLoginState(Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;ZZ)V

    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onPause()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "cloud_guide_welcome"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudGuideWelcomeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "cloud_guide_welcome"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

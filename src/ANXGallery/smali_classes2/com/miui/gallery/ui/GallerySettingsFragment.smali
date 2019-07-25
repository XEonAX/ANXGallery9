.class public Lcom/miui/gallery/ui/GallerySettingsFragment;
.super Lmiui/preference/PreferenceFragment;
.source "GallerySettingsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final DOWNLOAD_TYPE_ENTRIES:[I

.field private static final DOWNLOAD_TYPE_VALUES:[I

.field private static sSyncStatusObserverWrapper:Lcom/miui/gallery/util/SyncStatusObserverWrapper;


# instance fields
.field private mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

.field private mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

.field private mAutoBackPref:Landroid/preference/CheckBoxPreference;

.field private mAutoDownloadPref:Landroid/preference/CheckBoxPreference;

.field private mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

.field private mBrowseCategory:Landroid/preference/PreferenceCategory;

.field private mDebugClickListener:Lcom/miui/gallery/widget/MultiClickListener;

.field private mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

.field private mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

.field private mImageSelectionPref:Landroid/preference/CheckBoxPreference;

.field private mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

.field private mMainHandler:Landroid/os/Handler;

.field private mMiCloudCategory:Landroid/preference/PreferenceCategory;

.field private mObserverHandle:Ljava/lang/Object;

.field private mPreferenceRoot:Landroid/preference/PreferenceScreen;

.field private mPrivacyPolicyPref:Lmiui/preference/ValuePreference;

.field private mRecommendCategory:Landroid/preference/PreferenceCategory;

.field private mShowHiddenAlbumPref:Landroid/preference/CheckBoxPreference;

.field private mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

.field private mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

.field private mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

.field private mSyncStatusObserver:Landroid/content/SyncStatusObserver;

.field private mTrashBinPref:Lmiui/preference/ValuePreference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/util/SyncStatusObserverWrapper;

    invoke-direct {v0}, Lcom/miui/gallery/util/SyncStatusObserverWrapper;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->sSyncStatusObserverWrapper:Lcom/miui/gallery/util/SyncStatusObserverWrapper;

    const/4 v0, 0x2

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_ENTRIES:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f10031f
        0x7f10031d
    .end array-data

    :array_1
    .array-data 4
        0x7f10031e
        0x7f10031c
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lmiui/preference/PreferenceFragment;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMainHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/ui/GallerySettingsFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/GallerySettingsFragment$1;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSyncStatusObserver:Landroid/content/SyncStatusObserver;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/widget/MultiClickListener;

    new-instance v1, Lcom/miui/gallery/ui/GallerySettingsFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/GallerySettingsFragment$2;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lcom/miui/gallery/widget/MultiClickListener;-><init>(ILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDebugClickListener:Lcom/miui/gallery/widget/MultiClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/GallerySettingsFragment;)Landroid/preference/CheckBoxPreference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/GallerySettingsFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMainHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/GallerySettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->addDebugPreferences()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/GallerySettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->updateAIAlbumStatus()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/GallerySettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->refreshSlideshowIntervalPrefValue()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/GallerySettingsFragment;)Landroid/preference/CheckBoxPreference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/GallerySettingsFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->changeBackupOnlyWifi(Z)V

    return-void
.end method

.method private addDebugPreferences()V
    .locals 3

    const-string v0, "others"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_1

    check-cast v0, Landroid/preference/PreferenceCategory;

    const-string v1, "debug_gallery"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    const-string v2, "print_log"

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const v2, 0x7f1005a6

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$Debug;->isPrintLog()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    new-instance v1, Lmiui/preference/ValuePreference;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/preference/ValuePreference;-><init>(Landroid/content/Context;)V

    const-string v2, "debug_gallery"

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setKey(Ljava/lang/String;)V

    const v2, 0x7f100695

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setTitle(I)V

    invoke-virtual {v1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    new-instance v1, Lmiui/preference/ValuePreference;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/preference/ValuePreference;-><init>(Landroid/content/Context;)V

    const-string v2, "correct_photo_time"

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setKey(Ljava/lang/String;)V

    const v2, 0x7f1002dc

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setTitle(I)V

    invoke-virtual {v1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    new-instance v1, Lmiui/preference/ValuePreference;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/preference/ValuePreference;-><init>(Landroid/content/Context;)V

    const-string v2, "delete_dup_medias"

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setKey(Ljava/lang/String;)V

    const v2, 0x7f100293

    invoke-virtual {v1, v2}, Lmiui/preference/ValuePreference;->setTitle(I)V

    invoke-virtual {v1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_1
    return-void
.end method

.method private changeBackupOnlyWifi(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncUtil;->setBackupOnlyWifi(Landroid/content/Context;Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SYNC_SETTINGS_URI:Landroid/net/Uri;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    return-void
.end method

.method private changeDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    :cond_0
    return-void
.end method

.method private getAIAlbumStatus()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isAIAlbumEnabled()Z

    move-result v0

    return v0
.end method

.method private getDownloadTypeEntries()[Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_ENTRIES:[I

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_ENTRIES:[I

    array-length v2, v2

    if-ge v1, v2, :cond_0

    sget-object v2, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_ENTRIES:[I

    aget v2, v2, v1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getDownloadTypeFrom(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 2

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getDownloadTypeValue()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getDownloadTypeValues()[Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    array-length v2, v2

    if-ge v1, v2, :cond_0

    sget-object v2, Lcom/miui/gallery/ui/GallerySettingsFragment;->DOWNLOAD_TYPE_VALUES:[I

    aget v2, v2, v1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getFaceAlbumStatus()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result v0

    return v0
.end method

.method private onBackupOnlyWifiChange(Z)Z
    .locals 3

    if-nez p1, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1006ed

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1000aa

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1000d6

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1004c3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/GallerySettingsFragment$6;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment$6;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "slimDialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->changeBackupOnlyWifi(Z)V

    const/4 p1, 0x1

    return p1
.end method

.method private onDownloadTypePreferenceChange(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->changeDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V

    const/4 p1, 0x1

    return p1
.end method

.method private onlyCloud()Z
    .locals 2

    const-string v0, "com.miui.gallery.cloud.provider.SYNC_SETTINGS"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private refreshSlideshowIntervalPrefValue()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->getSlideShowInterval()I

    move-result v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const v0, 0x7f10067f

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

    invoke-virtual {v1, v0}, Lmiui/preference/ValuePreference;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method private setImageSelectionFunctionState(Z)Z
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setImageSelectionFunctionState(Z)V

    const-string v0, "GallerySettingsFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The image selection fuction state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method private setStoryFunctionState(Z)Z
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setStoryFunctionState(Z)V

    const-string v0, "GallerySettingsFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The story fuction state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancelAll(I)V

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancelAll(I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccount()Landroid/accounts/Account;

    move-result-object p1

    if-eqz p1, :cond_1

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setCardSyncTag(Landroid/accounts/Account;J)V

    const-string v0, ""

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setCardSyncInfo(Landroid/accounts/Account;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x44

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private showSlideshowIntervalDialog()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/GallerySettingsFragment$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/GallerySettingsFragment$4;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->setCompleteListener(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "SlideshowIntervalDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showSyncSettingDialog()V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f1000b1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1000b0

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f1000d6

    invoke-virtual {p0, v3}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f1000af

    invoke-virtual {p0, v4}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/ui/GallerySettingsFragment$5;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/GallerySettingsFragment$5;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    return-void
.end method

.method private statAutoDownloadSwitchChanged(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "switch_status"

    if-eqz p1, :cond_0

    const-string p1, "enable"

    goto :goto_0

    :cond_0
    const-string p1, "disable"

    :goto_0
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string v1, "sync_auto_download_switch_changed"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private switchAutoDownload(Z)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setAutoDownload(Z)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/GallerySettingsFragment$7;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment$7;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->statAutoDownloadSwitchChanged(Z)V

    return-void
.end method

.method private updateAIAlbumStatus()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getAIAlbumStatus()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getFaceAlbumStatus()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lmiui/preference/PreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060106

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setWidth(I)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHeight(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setEndView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDebugClickListener:Lcom/miui/gallery/widget/MultiClickListener;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lmiui/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object p1

    const-string v0, "com.miui.gallery_preferences_new"

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceManager;->setSharedPreferencesName(Ljava/lang/String;)V

    const p1, 0x7f140003

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->addPreferencesFromResource(I)V

    const-string p1, "root"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceScreen;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPreferenceRoot:Landroid/preference/PreferenceScreen;

    const-string p1, "micloud_category"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    const-string p1, "recommend_category"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mRecommendCategory:Landroid/preference/PreferenceCategory;

    const-string p1, "backup_automatically"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string p1, "backup_only_in_wifi"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const-string p1, "cloud_ai_album_status"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    const-string p1, "cloud_face_local_status"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->useNewAIAlbumSwitch()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPreferenceRoot:Landroid/preference/PreferenceScreen;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mRecommendCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1

    :cond_1
    const-string p1, "image_selection_function"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImageSelectionPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImageSelectionPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const-string p1, "story_function"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mRecommendCategory:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    :cond_2
    :goto_1
    const-string p1, "auto_download_media"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoDownloadPref:Landroid/preference/CheckBoxPreference;

    const-string p1, "download_type"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/ValueListPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoDownloadPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoDownloadPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/ValueListPreference;->setWhichAsValue(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getDownloadTypeEntries()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/ValueListPreference;->setEntries([Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getDownloadTypeValues()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/ValueListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getDownloadTypeValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/ValueListPreference;->setValue(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/widget/ValueListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->onlyCloud()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPreferenceRoot:Landroid/preference/PreferenceScreen;

    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->removeAll()V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPreferenceRoot:Landroid/preference/PreferenceScreen;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    :cond_3
    const-string p1, "browse_category"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBrowseCategory:Landroid/preference/PreferenceCategory;

    const-string p1, "show_local_album_only"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const-string p1, "show_hidden_album"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowHiddenAlbumPref:Landroid/preference/CheckBoxPreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowHiddenAlbumPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const-string p1, "slideshow_interval"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiui/preference/ValuePreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, v0}, Lmiui/preference/ValuePreference;->setShowRightArrow(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string p1, "impunity_declaration"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/CheckBoxPreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "others"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_2

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->remindConnectNetworkEveryTime()Z

    move-result v1

    invoke-virtual {p1, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    :goto_2
    const-string p1, "trash_bin"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiui/preference/ValuePreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mTrashBinPref:Lmiui/preference/ValuePreference;

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isCloudTrashBinFeatureOpen()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mTrashBinPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, v0}, Lmiui/preference/ValuePreference;->setShowRightArrow(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mTrashBinPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    goto :goto_3

    :cond_5
    const-string p1, "others"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mTrashBinPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    :goto_3
    const-string p1, "privacy_policy"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiui/preference/ValuePreference;

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPrivacyPolicyPref:Lmiui/preference/ValuePreference;

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPrivacyPolicyPref:Lmiui/preference/ValuePreference;

    invoke-virtual {p1, p0}, Lmiui/preference/ValuePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->refreshSlideshowIntervalPrefValue()V

    :goto_4
    invoke-static {}, Lcom/miui/gallery/util/FeatureUtil;->isSupportBackupOnlyWifi()Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    :cond_6
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x102002c

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPause()V
    .locals 3

    invoke-super {p0}, Lmiui/preference/PreferenceFragment;->onPause()V

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->sSyncStatusObserverWrapper:Lcom/miui/gallery/util/SyncStatusObserverWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/SyncStatusObserverWrapper;->setSyncStatusObserverWorker(Landroid/content/SyncStatusObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mObserverHandle:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mObserverHandle:Ljava/lang/Object;

    invoke-static {v0}, Landroid/content/ContentResolver;->removeStatusChangeListener(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mObserverHandle:Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v2}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->unregisterAIAlbumStatusReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "settings"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ne p1, v1, :cond_0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->setOnlyShowLocalPhoto(Z)V

    const-string p2, "album"

    const-string v1, "show_local_album_only"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowHiddenAlbumPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v1, :cond_1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string p2, "show_hidden_album"

    invoke-static {p2, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v1, :cond_3

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    return v2

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v1, :cond_4

    move-object p1, p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setAIAlbumLocalStatus(Landroid/content/Context;Z)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "switchTo"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "settings"

    const-string v0, "settings_change_ai_album_switch"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_1

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v1, :cond_5

    move-object p1, p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setFaceAlbumStatus(Landroid/content/Context;Z)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "switchTo"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "settings"

    const-string v0, "settings_change_face_switch"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_1

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_6

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->setRemindConnectNetworkEveryTime(Z)V

    goto/16 :goto_1

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBackupOnlyInWifiPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_7

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->onBackupOnlyWifiChange(Z)Z

    move-result p1

    return p1

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoDownloadPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_8

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->switchAutoDownload(Z)V

    goto :goto_1

    :cond_8
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mDownloadTypePref:Lcom/miui/gallery/widget/ValueListPreference;

    if-ne p1, v0, :cond_9

    check-cast p2, Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getDownloadTypeFrom(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->onDownloadTypePreferenceChange(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    return p1

    :cond_9
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImageSelectionPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_a

    move-object p1, p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->setImageSelectionFunctionState(Z)Z

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "switchTo"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "settings"

    const-string v0, "settings_change_image_selection_switch"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :cond_a
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_b

    move-object p1, p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->setStoryFunctionState(Z)Z

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "switchTo"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "settings"

    const-string v0, "settings_change_story_generation_switch"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :cond_b
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "print_log"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_c

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/BaseGalleryPreferences$Debug;->printLog(Z)V

    :cond_c
    :goto_1
    return v2
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSlideshowIntervalPref:Lmiui/preference/ValuePreference;

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->showSlideshowIntervalDialog()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mTrashBinPref:Lmiui/preference/ValuePreference;

    if-ne p1, v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, "GallerySettingsFragment"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/IntentUtil;->gotoTrashBin(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_2

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result p1

    if-nez p1, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->showSyncSettingDialog()V

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "debug_gallery"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DebugUtil;->generateDebugLog(Landroid/app/Activity;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "correct_photo_time"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DebugUtil;->correctPhotoTime(Landroid/app/Activity;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "delete_dup_medias"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DebugUtil;->deleteDupMedias(Landroid/app/Activity;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mPrivacyPolicyPref:Lmiui/preference/ValuePreference;

    if-ne p1, v0, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/IntentUtil;->gotoPrivacyPolicy(Landroid/app/Activity;)V

    :cond_6
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onResume()V
    .locals 5

    invoke-super {p0}, Lmiui/preference/PreferenceFragment;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "settings"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mObserverHandle:Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->sSyncStatusObserverWrapper:Lcom/miui/gallery/util/SyncStatusObserverWrapper;

    iget-object v2, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mSyncStatusObserver:Landroid/content/SyncStatusObserver;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/util/SyncStatusObserverWrapper;->setSyncStatusObserverWorker(Landroid/content/SyncStatusObserver;)V

    sget-object v0, Lcom/miui/gallery/ui/GallerySettingsFragment;->sSyncStatusObserverWrapper:Lcom/miui/gallery/util/SyncStatusObserverWrapper;

    invoke-static {v1, v0}, Landroid/content/ContentResolver;->addStatusChangeListener(ILandroid/content/SyncStatusObserver;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mObserverHandle:Ljava/lang/Object;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->removeAll()V

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->onlyCloud()Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBrowseCategory:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->onlyCloud()Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBrowseCategory:Landroid/preference/PreferenceCategory;

    const-string v4, "show_local_album_only"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mBrowseCategory:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mShowLocalAlbumOnlyPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_3
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    const-string v4, "cloud_ai_album_status"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_4
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getAIAlbumStatus()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :goto_0
    const/4 v3, 0x1

    goto :goto_1

    :cond_5
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    const-string v4, "cloud_face_local_status"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_6

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mMiCloudCategory:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_6
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mFaceLocalStatusPref:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getFaceAlbumStatus()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    :cond_7
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    if-nez v3, :cond_8

    new-instance v3, Lcom/miui/gallery/ui/GallerySettingsFragment$3;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/GallerySettingsFragment$3;-><init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V

    iput-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAIAlbumStatusObserver:Landroid/content/BroadcastReceiver;

    invoke-static {v3, v4}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->registerAIAlbumStatusReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    :cond_8
    :goto_2
    iget-object v3, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mAutoBackPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, "com.miui.gallery.cloud.provider"

    invoke-static {v0, v4}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_3

    :cond_9
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v3, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImpunityDeclarationPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->remindConnectNetworkEveryTime()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_a
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImageSelectionPref:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mImageSelectionPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->isImageSelectionFunctionOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_b
    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment;->mStoryFuctionPref:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->isStoryFunctionOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_c
    return-void
.end method

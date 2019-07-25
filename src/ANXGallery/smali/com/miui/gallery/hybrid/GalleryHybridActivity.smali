.class public Lcom/miui/gallery/hybrid/GalleryHybridActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "GalleryHybridActivity.java"

# interfaces
.implements Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;


# instance fields
.field private mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

.field private mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private checkCloudServiceAgreementIfNeeded(Landroid/content/Intent;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->isCloudServiceRequest(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "GalleryHybridActivity"

    const-string v0, "cloud service request but cloud privacy denied, start cloud main page."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/IntentUtil;->startCloudMainPage(Landroid/content/Context;)Z

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private configureActionBar()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lmiui/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v0, v2}, Lmiui/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setHomeButtonEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    const v1, 0x7f0b0091

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setCustomView(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0902fa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mTitleView:Landroid/widget/TextView;

    const v1, 0x7f090092

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/hybrid/GalleryHybridActivity$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity$1;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private isCloudServiceRequest(Landroid/content/Intent;)Z
    .locals 8

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/request/HostManager;->getTrashBinUrl()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    array-length v3, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    aget-object v6, v2, v5

    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-static {p1, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1

    :cond_2
    return v4
.end method

.method private load()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    if-nez v0, :cond_0

    const-string v0, "GalleryHybridActivity"

    const-string v1, "Hybrid fragment not attached, couldn\'t load url now!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "GalleryHybridActivity"

    const-string v1, "CTA not allowed, couldn\'t connect to network!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->checkCloudServiceAgreementIfNeeded(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->load()V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->finish()V

    :goto_0
    return-void
.end method


# virtual methods
.method protected allowUseOnOffline()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->getRuntimePermissions()[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {v1}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getRuntimePermissions()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StringUtils;->mergeStringArray([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->getRuntimePermissions()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/hybrid/hybridclient/HybridClientFactory;->createHybridClient(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0092

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->configureActionBar()V

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090167

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->setHybridViewEventListener(Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->setHybridClient(Lcom/miui/gallery/hybrid/hybridclient/HybridClient;)V

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->load()V

    return-void
.end method

.method protected onCtaChecked(Z)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->resumed()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->load()V

    :cond_0
    return-void
.end method

.method public onReceivedTitle(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridActivity;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

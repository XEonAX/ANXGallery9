.class public Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;
.super Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;
.source "NormalShareAlbumOwnerActivity.java"


# instance fields
.field private mFutureQR:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

.field private mQRCodePreference:Lcom/miui/gallery/share/QRPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->tryToRequestBarcodeUrl()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;)Lcom/miui/gallery/share/QRPreference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mQRCodePreference:Lcom/miui/gallery/share/QRPreference;

    return-object p0
.end method

.method private tryToRequestBarcodeUrl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mQRCodePreference:Lcom/miui/gallery/share/QRPreference;

    invoke-virtual {v0}, Lcom/miui/gallery/share/QRPreference;->getQRText()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mQRCodePreference:Lcom/miui/gallery/share/QRPreference;

    sget-object v1, Lcom/miui/gallery/share/QRPreference$Status;->REQUESTING:Lcom/miui/gallery/share/QRPreference$Status;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/QRPreference;->setStatus(Lcom/miui/gallery/share/QRPreference$Status;)V

    new-instance v0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity$2;-><init>(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;)V

    iget-object v1, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestUrlForBarcodeAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    :cond_1
    return-void
.end method


# virtual methods
.method protected createShareUserAdapter()Lcom/miui/gallery/share/ShareUserAdapterBase;
    .locals 3

    new-instance v0, Lcom/miui/gallery/share/ShareUserAdapter;

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2, v1}, Lcom/miui/gallery/share/ShareUserAdapter;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    return-object v0
.end method

.method protected getContentView()I
    .locals 1

    const v0, 0x7f0b0155

    return v0
.end method

.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_normal_share_owner_info"

    return-object v0
.end method

.method protected getPreferencesResourceId()I
    .locals 1

    const v0, 0x7f140006

    return v0
.end method

.method protected getShareUsers()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getShareUsers()Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->getOwnerEntry(Ljava/lang/String;)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-object v0
.end method

.method protected initPreferences()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->initPreferences()V

    new-instance v0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget-object v1, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mAlbumName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;-><init>(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    iput-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->initPreferences()V

    const-string v0, "qr_code"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/share/QRPreference;

    iput-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mQRCodePreference:Lcom/miui/gallery/share/QRPreference;

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mQRCodePreference:Lcom/miui/gallery/share/QRPreference;

    new-instance v1, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity$1;-><init>(Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/QRPreference;->setRetryListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->onDestroy()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mFutureQR:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->onDestroy()V

    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method

.method protected onUpdateProgressChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updateProgressBar(I)V

    return-void
.end method

.method protected requestInvitation(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->requestInvitation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method

.method protected updateSharers()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateSharers()V

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget v1, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mSharerCount:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updateSharers(I)V

    return-void
.end method

.method protected updateStatus()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->updateStatus()V

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->isValidAlbumId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->tryToRequestBarcodeUrl()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumOwnerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updateStatus()V

    return-void
.end method

.class public Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;
.super Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;
.source "NormalShareAlbumSharerActivity.java"


# instance fields
.field private mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected createShareUserAdapter()Lcom/miui/gallery/share/ShareUserAdapterBase;
    .locals 3

    new-instance v0, Lcom/miui/gallery/share/ShareUserAdapter;

    iget-object v1, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mCreatorId:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Lcom/miui/gallery/share/ShareUserAdapter;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    return-object v0
.end method

.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_normal_share_info"

    return-object v0
.end method

.method protected getPreferencesResourceId()I
    .locals 1

    const v0, 0x7f140007

    return v0
.end method

.method protected initPreferences()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->initPreferences()V

    new-instance v0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    iget-object v1, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mAlbumName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    iput-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->initPreferences()V

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    iget-object v1, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->isPublic()Z

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mCloudSingleMediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-virtual {v2}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getPublicUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->onDestroy()V

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->onDestroy()V

    return-void
.end method

.method protected onUpdateProgressChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->updateProgressBar(I)V

    return-void
.end method

.method protected updateSharers()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/share/ShareAlbumSharerBaseActivity;->updateSharers()V

    iget-object v0, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mPublicShareUiHandler:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    iget v1, p0, Lcom/miui/gallery/share/NormalShareAlbumSharerActivity;->mSharerCount:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->updateSharers(I)V

    return-void
.end method

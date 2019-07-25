.class final Lcom/miui/gallery/share/AlbumShareOperations$13;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareOperations;->syncUserListForAlbum(Ljava/lang/String;Z)Lcom/miui/gallery/share/AsyncResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/miui/gallery/share/AsyncResult<",
        "Ljava/lang/Void;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$albumId:Ljava/lang/String;

.field final synthetic val$isSharer:Z


# direct methods
.method constructor <init>(ZLjava/lang/String;)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$13;->val$isSharer:Z

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareOperations$13;->val$albumId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/miui/gallery/share/AsyncResult;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/share/AsyncResult<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, -0xb

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 v0, -0x4

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getExtToken(Landroid/content/Context;Landroid/accounts/Account;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    move-result-object v2

    if-nez v2, :cond_2

    const/4 v0, -0x3

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, -0x6

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_3
    iget-boolean v3, p0, Lcom/miui/gallery/share/AlbumShareOperations$13;->val$isSharer:Z

    if-eqz v3, :cond_4

    new-instance v3, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;

    iget-object v4, p0, Lcom/miui/gallery/share/AlbumShareOperations$13;->val$albumId:Ljava/lang/String;

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    goto :goto_0

    :cond_4
    new-instance v3, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;

    iget-object v4, p0, Lcom/miui/gallery/share/AlbumShareOperations$13;->val$albumId:Ljava/lang/String;

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    :goto_0
    invoke-static {}, Lcom/miui/gallery/share/AlbumShareOperations;->syncAllUserInfoFromNetwork()Lcom/miui/gallery/share/AsyncResult;

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareOperations$13;->call()Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method

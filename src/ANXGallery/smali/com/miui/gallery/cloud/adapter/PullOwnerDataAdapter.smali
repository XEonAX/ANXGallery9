.class public Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;
.super Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
.source "PullOwnerDataAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getBindingReason()J
    .locals 2

    const-wide/16 v0, 0x1

    return-wide v0
.end method

.method public isAsynchronous()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance p2, Lcom/miui/gallery/cloud/SyncOwnerAlbum;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1, p3}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p2

    iget-object v0, p2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;->TAG:Ljava/lang/String;

    const-string p3, "pull owner album error, return %s"

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p2

    :cond_0
    new-instance p2, Lcom/miui/gallery/cloud/SyncOwnerAll;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1, p3}, Lcom/miui/gallery/cloud/SyncOwnerAll;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/SyncOwnerCloud;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    iget-object p2, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq p2, p3, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;->TAG:Ljava/lang/String;

    const-string p3, "pull owner cloud error, return %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    return-object p1
.end method

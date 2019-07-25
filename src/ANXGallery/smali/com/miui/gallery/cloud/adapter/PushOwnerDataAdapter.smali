.class public Lcom/miui/gallery/cloud/adapter/PushOwnerDataAdapter;
.super Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
.source "PushOwnerDataAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getBindingReason()J
    .locals 2

    const-wide/16 v0, 0x20

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
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "sync_no_delay"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    new-instance v0, Lcom/miui/gallery/cloud/SyncOwnerFromLocal;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PushOwnerDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p3, p2}, Lcom/miui/gallery/cloud/SyncOwnerFromLocal;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/SyncOwnerFromLocal;->sync()V

    new-instance v0, Lcom/miui/gallery/cloud/SyncOwnerSubUbiFromLocal;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PushOwnerDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p3, p2}, Lcom/miui/gallery/cloud/SyncOwnerSubUbiFromLocal;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/SyncOwnerSubUbiFromLocal;->sync()V

    new-instance p1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1
.end method

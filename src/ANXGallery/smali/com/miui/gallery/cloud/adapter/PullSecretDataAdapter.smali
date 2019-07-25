.class public Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;
.super Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
.source "PullSecretDataAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getBindingReason()J
    .locals 2

    const-wide/16 v0, 0x2

    return-wide v0
.end method

.method public isAsynchronous()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;->TAG:Ljava/lang/String;

    const-string p2, "the feature of secret album isn\'t enabled"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncFetchAllPrivateData()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncFetchPrivateVideo()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;->TAG:Ljava/lang/String;

    const-string p2, "has fetched secret data, ignore"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p2, Lcom/miui/gallery/cloud/SyncOwnerPrivate;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1, p3}, Lcom/miui/gallery/cloud/SyncOwnerPrivate;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/SyncOwnerPrivate;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    iget-object p2, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne p2, p3, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->setSyncFetchAllPrivateData()V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->setSyncFetchPrivateVideo()V

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;->TAG:Ljava/lang/String;

    const-string p3, "pull result %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1
.end method

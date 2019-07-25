.class public Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;
.super Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
.source "PullFaceDataAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private needResyncFaceDataLaterForBaby()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/deprecated/Preference;->sHaveCheckBabyForNewService(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->ifHaveBabyType(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private try2updatePeopleFace2getBaby(Landroid/accounts/Account;Landroid/content/Context;)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setFaceSyncWatermark(Landroid/accounts/Account;J)V

    const-string p2, ""

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setFaceSyncToken(Landroid/accounts/Account;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->TAG:Ljava/lang/String;

    const-string p2, "reset people face wartemark to 0, zero"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBindingReason()J
    .locals 2

    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public isAsynchronous()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isFaceAlbumFeatureOpen()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->doSync(Landroid/content/Context;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/deprecated/Preference;->sHaveCheckBabyForNewService(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->needResyncFaceDataLaterForBaby()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->try2updatePeopleFace2getBaby(Landroid/accounts/Account;Landroid/content/Context;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/deprecated/Preference;->sSetHaveCheckBabyForNewService(Landroid/content/Context;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result p2

    if-nez p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->TAG:Ljava/lang/String;

    const-string p2, "the feature of face isn\'t enabled"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_3
    new-instance p2, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1, p3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;->TAG:Ljava/lang/String;

    const-string p3, "pull result %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1
.end method

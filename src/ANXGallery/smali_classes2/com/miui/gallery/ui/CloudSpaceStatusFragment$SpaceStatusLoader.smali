.class Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;
.super Landroid/content/AsyncTaskLoader;
.source "CloudSpaceStatusFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CloudSpaceStatusFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpaceStatusLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;",
        ">;"
    }
.end annotation


# instance fields
.field private mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final deliverResult(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->deliverResult(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    return-void
.end method

.method public loadInBackground()Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;
    .locals 6

    new-instance v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getSyncedCount(Landroid/content/Context;)[I

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getSyncedSize(Landroid/content/Context;)[J

    move-result-object v2

    const/4 v3, 0x0

    aget v4, v1, v3

    iput v4, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedPhotoCount:I

    aget-wide v3, v2, v3

    iput-wide v3, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedPhotoSize:J

    const/4 v3, 0x1

    aget v1, v1, v3

    iput v1, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedVideoCount:I

    aget-wide v1, v2, v3

    iput-wide v1, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedVideoSize:J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getCloudSpaceInfo(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getTotal()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    iget-wide v2, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getUsed()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iput-wide v2, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mLeftCloudSpace:J

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->isSpaceLow()Z

    move-result v1

    iput-boolean v1, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mIsSpaceLow:Z

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->loadInBackground()Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->onCanceled(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->onStopLoading()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->deliverResult(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->mData:Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->forceLoad()V

    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;->cancelLoad()Z

    return-void
.end method

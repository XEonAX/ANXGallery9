.class public Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;
.super Ljava/lang/Object;
.source "SyncStateUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CloudSpaceInfo"
.end annotation


# instance fields
.field private mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lmiui/cloud/sync/MiCloudStatusInfo;->fromUserData(Landroid/content/Context;)Lmiui/cloud/sync/MiCloudStatusInfo;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lmiui/cloud/sync/MiCloudStatusInfo;->getQuotaInfo()Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    move-result-object v0

    :cond_0
    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    return-void
.end method


# virtual methods
.method public getTotal()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    invoke-virtual {v0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->getTotal()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public getUsed()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    invoke-virtual {v0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->getUsed()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public isSpaceLow()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    invoke-virtual {v0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->isSpaceFull()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->mInfo:Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    invoke-virtual {v0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->isSpaceLowPercent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1

    :cond_2
    return v1
.end method

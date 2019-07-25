.class Lcom/miui/gallery/cloud/jobs/SyncJobService$JobFactory;
.super Ljava/lang/Object;
.source "SyncJobService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/jobs/SyncJobService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JobFactory"
.end annotation


# direct methods
.method public static createJob(I)Lcom/miui/gallery/cloud/jobs/AbsSyncJob;
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x2710

    if-eq p0, v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const-class v1, Lcom/miui/gallery/cloud/jobs/BackDownloadJob;

    :goto_0
    if-eqz v1, :cond_1

    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;

    invoke-virtual {v1, p0}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->setJobId(I)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/InstantiationException;->printStackTrace()V

    :cond_1
    :goto_1
    return-object v0
.end method

.class public abstract Lcom/miui/gallery/discovery/AbstractJob;
.super Ljava/lang/Object;
.source "AbstractJob.java"


# instance fields
.field protected mJobId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    return-void
.end method

.method private static isJobExtrasEquals(Landroid/os/PersistableBundle;Landroid/os/PersistableBundle;)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/os/PersistableBundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/os/PersistableBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroid/os/PersistableBundle;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Landroid/os/PersistableBundle;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public equals(Landroid/app/job/JobInfo;Landroid/app/job/JobInfo;)Z
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getId()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getId()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getService()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getService()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getIntervalMillis()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getIntervalMillis()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getNetworkType()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getNetworkType()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isRequireCharging()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isRequireCharging()Z

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isRequireDeviceIdle()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isRequireDeviceIdle()Z

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p1

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/discovery/AbstractJob;->isJobExtrasEquals(Landroid/os/PersistableBundle;Landroid/os/PersistableBundle;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public abstract execJob()Ljava/lang/Object;
.end method

.method public getJobId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    return v0
.end method

.method public abstract getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;
.end method

.method public needsReschedule()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setJobId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    return-void
.end method

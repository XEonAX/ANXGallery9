.class public Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;
.super Ljava/lang/Object;
.source "ActivityLifecycleCallbacksImpl.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field private mActiveStartTS:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mCurrentActiveActivity:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    return-void
.end method

.method private writeData(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;-><init>()V

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setContent(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setCollectedAt(J)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    sget-object p1, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->ActivityActiveTimeStamp:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setCollectionType(Lcom/xiaomi/xmpush/thrift/ClientCollectionType;)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    iget-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/xiaomi/push/mpcd/job/CollectionJob;->writeItemToFile(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/DataCollectionItem;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 5

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, ""

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    return-void

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->writeData(Ljava/lang/String;)V

    const-string p1, ""

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mCurrentActiveActivity:Ljava/lang/String;

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/ActivityLifecycleCallbacksImpl;->mActiveStartTS:Ljava/lang/String;

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

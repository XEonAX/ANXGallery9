.class final Lcom/xiaomi/push/mpcd/CDEntrance$1;
.super Ljava/lang/Object;
.source "CDEntrance.java"

# interfaces
.implements Lcom/xiaomi/push/mpcd/IntentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/mpcd/CDEntrance;->getIntentHandler()Lcom/xiaomi/push/mpcd/IntentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/push/mpcd/CDEntrance$1;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/mpcd/CDEntrance$1;->handleIntent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private handleIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9

    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_d

    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_2

    :cond_1
    aget-object v0, v0, v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {p1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/xmpush/thrift/ConfigKey;->BroadcastActionCollectionSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v5

    invoke-virtual {v4, v5, v1}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v1

    const-string v4, "android.intent.action.PACKAGE_RESTARTED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    const-wide/16 v5, 0x1

    const/16 v7, 0xc

    if-eqz v4, :cond_5

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v5, v6}, Lcom/xiaomi/channel/commonutils/misc/JobMutualExclusor;->checkPeriodAndRecordWithFileLock(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result p1

    if-eqz p1, :cond_4

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/xiaomi/push/mpcd/Constants;->ACTION_PACKAGE_RESTARTED:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    goto/16 :goto_3

    :cond_4
    :goto_0
    return-void

    :cond_5
    const-string v4, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v5, v6}, Lcom/xiaomi/channel/commonutils/misc/JobMutualExclusor;->checkPeriodAndRecordWithFileLock(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result p1

    if-eqz p1, :cond_8

    if-nez v1, :cond_6

    goto :goto_1

    :cond_6
    sget-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_7

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/xiaomi/push/mpcd/Constants;->ACTION_PACKAGE_CHANGED:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    goto/16 :goto_3

    :cond_8
    :goto_1
    return-void

    :cond_9
    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v2, "android.intent.extra.REPLACING"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_e

    if-eqz v1, :cond_e

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastActionAdded:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->getValue()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, v0}, Lcom/xiaomi/push/mpcd/CDEntrance$1;->writeActionInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_a
    const-string v2, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v2, "android.intent.extra.REPLACING"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_e

    if-eqz v1, :cond_e

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastActionRemoved:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->getValue()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, v0}, Lcom/xiaomi/push/mpcd/CDEntrance$1;->writeActionInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_b
    const-string v2, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_c

    if-eqz v1, :cond_e

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastActionReplaced:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->getValue()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, v0}, Lcom/xiaomi/push/mpcd/CDEntrance$1;->writeActionInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_c
    const-string v2, "android.intent.action.PACKAGE_DATA_CLEARED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_e

    if-eqz v1, :cond_e

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastActionDataCleared:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->getValue()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, v0}, Lcom/xiaomi/push/mpcd/CDEntrance$1;->writeActionInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :cond_d
    :goto_2
    return-void

    :catch_0
    :cond_e
    :goto_3
    return-void
.end method

.method private writeActionInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    :try_start_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x1

    invoke-static {p1, v0, v1, v2}, Lcom/xiaomi/channel/commonutils/misc/JobMutualExclusor;->checkPeriodAndRecordWithFileLock(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    new-instance v0, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setContent(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {v0, p2, p3}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setCollectedAt(J)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastAction:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    invoke-virtual {v0, p2}, Lcom/xiaomi/xmpush/thrift/DataCollectionItem;->setCollectionType(Lcom/xiaomi/xmpush/thrift/ClientCollectionType;)Lcom/xiaomi/xmpush/thrift/DataCollectionItem;

    invoke-static {p1, v0}, Lcom/xiaomi/push/mpcd/job/CollectionJob;->writeItemToFile(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/DataCollectionItem;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public handle(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/mpcd/CDEntrance$1$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/xiaomi/push/mpcd/CDEntrance$1$1;-><init>(Lcom/xiaomi/push/mpcd/CDEntrance$1;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;)V

    return-void
.end method

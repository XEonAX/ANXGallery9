.class public Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;
.super Ljava/lang/Object;
.source "DbManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;,
        Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;,
        Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseQueryJob;,
        Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;,
        Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BatchJob;
    }
.end annotation


# static fields
.field private static volatile sDbManager:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;


# instance fields
.field private mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

.field private mContext:Landroid/content/Context;

.field private final mDbHelperMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;",
            ">;"
        }
    .end annotation
.end field

.field private mPool:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v2, 0x1

    const/4 v3, 0x1

    const-wide/16 v4, 0xf

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPendingList:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPendingList:Ljava/util/ArrayList;

    return-object p0
.end method

.method private getDbHelper(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    monitor-enter v1

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;->getDbHelper(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    move-result-object v0

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v1

    goto :goto_2

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_2
    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sDbManager:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sDbManager:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sDbManager:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sDbManager:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    return-object p0
.end method

.method private sendExecCmd()V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;-><init>(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v2

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigKey;->StatDataProcessFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v3

    const/4 v4, 0x5

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z

    return-void
.end method


# virtual methods
.method public exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDataPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;->getDbHelper(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v2, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->attachInfo(Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPendingList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPendingList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sendExecCmd()V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_0
    return-void

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "should exec init method first!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public exec(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    if-eqz v0, :cond_5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->needAttachInfo()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDataPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getDbHelper(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->attachInfo(Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;Landroid/content/Context;)V

    :cond_0
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDataPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-nez v2, :cond_1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDataPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_3

    new-instance v3, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BatchJob;

    invoke-direct {v3, v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BatchJob;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    const/4 v1, 0x0

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BatchJob;->attachInfo(Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_4
    return-void

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "should exec setDbHelperFactory method first!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public execNow(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDataPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mBaseDbHelperFactory:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelperFactory;->getDbHelper(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mDbHelperMap:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v2, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->attachInfo(Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->execR(Ljava/lang/Runnable;)V

    :cond_2
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "should exec init method first!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public execR(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->mPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public getTableName(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getDbHelper(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->getTableName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

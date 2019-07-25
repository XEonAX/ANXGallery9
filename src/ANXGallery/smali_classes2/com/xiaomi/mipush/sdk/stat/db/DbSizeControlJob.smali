.class public Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;
.super Ljava/lang/Object;
.source "DbSizeControlJob.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private mPath:Ljava/lang/String;

.field private mWRContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mWRContext:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mWRContext:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mWRContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/util/FileUtil;->getFileSize(Ljava/lang/String;)J

    move-result-wide v1

    sget-wide v3, Lcom/xiaomi/mipush/sdk/stat/db/DataBaseConfig;->MAX_DB_SIZE:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;->deleteUploadedJob(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mPath:Ljava/lang/String;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->getMessageCountJob(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;->append(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;->mPath:Ljava/lang/String;

    const/16 v4, 0x3e8

    invoke-static {v0, v3, v4}, Lcom/xiaomi/mipush/sdk/stat/db/HistoryDataDeleteJob;->deleteHistoryJob(Landroid/content/Context;Ljava/lang/String;I)Lcom/xiaomi/mipush/sdk/stat/db/HistoryDataDeleteJob;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->append(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    goto :goto_0

    :cond_2
    const-string v0, "=====> do not need clean db"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

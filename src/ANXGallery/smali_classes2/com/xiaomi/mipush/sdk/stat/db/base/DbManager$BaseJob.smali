.class public abstract Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;
.super Ljava/lang/Object;
.source "DbManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseJob"
.end annotation


# instance fields
.field private mDataPath:Ljava/lang/String;

.field protected mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

.field private mNextJob:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

.field private mRandom:Ljava/util/Random;

.field private mRetryCount:I

.field protected mTableName:Ljava/lang/String;

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
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mRandom:Ljava/util/Random;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mRetryCount:I

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDataPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public append(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mNextJob:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    return-void
.end method

.method attachInfo(Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->getTableName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mTableName:Ljava/lang/String;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mWRContext:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public abstract doRun(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method finish(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mNextJob:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mNextJob:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->output()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->input(Landroid/content/Context;Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->onFinish(Landroid/content/Context;)V

    return-void
.end method

.method public getDataPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDataPath:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public input(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    return-void
.end method

.method public needAttachInfo()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mTableName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mWRContext:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onFinish(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public output()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mWRContext:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mWRContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDataPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDataPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/string/MD5;->MD5_16(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;-><init>(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;Landroid/content/Context;)V

    invoke-static {v0, v2, v1}, Lcom/xiaomi/channel/commonutils/file/FileLockerWorker;->runMutiProcessJob(Landroid/content/Context;Ljava/io/File;Ljava/lang/Runnable;)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

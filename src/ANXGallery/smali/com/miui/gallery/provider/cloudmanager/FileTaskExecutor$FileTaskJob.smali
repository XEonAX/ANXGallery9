.class Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;
.super Ljava/lang/Object;
.source "FileTaskExecutor.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileTaskJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIds:[J


# direct methods
.method public constructor <init>(Landroid/content/Context;[J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->mIds:[J

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;
    .locals 2

    new-instance p1, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->mIds:[J

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;-><init>(Landroid/content/Context;[J)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->mIds:[J

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;-><init>([J[J)V

    return-object v0
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;

    move-result-object p1

    return-object p1
.end method

.class Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;
.super Ljava/lang/Thread;
.source "SlimController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/slim/SlimController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlimWorker"
.end annotation


# instance fields
.field private volatile mIsCanceled:Z

.field private volatile mIsPaused:Z

.field private mOnSlimDoneListener:Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;

.field private mSlimLock:Ljava/lang/Object;

.field final synthetic this$0:Lcom/miui/gallery/cleaner/slim/SlimController;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    iput-boolean p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mSlimLock:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cleaner/slim/SlimController;Lcom/miui/gallery/cleaner/slim/SlimController$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    return-void
.end method

.method private getNextRemainItem()Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$400(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$500(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$500(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/util/LinkedList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$500(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isRemainItemsValid()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$400(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$500(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onDone(J)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mOnSlimDoneListener:Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mOnSlimDoneListener:Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;->onSlimDone(J)V

    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    return-void
.end method

.method public doPause()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mSlimLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mSlimLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public isCanceled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    return v0
.end method

.method public isPaused()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    return v0
.end method

.method public pauseSlim()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$1200(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    return-void
.end method

.method public resumeSlim()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mSlimLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mSlimLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$1300(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 11

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->doPause()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$300(Lcom/miui/gallery/cleaner/slim/SlimController;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$400(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$300(Lcom/miui/gallery/cleaner/slim/SlimController;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    iget-object v3, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    iget-object v4, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v4}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$600(Lcom/miui/gallery/cleaner/slim/SlimController;)[J

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$700(Lcom/miui/gallery/cleaner/slim/SlimController;[J)Ljava/util/LinkedList;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$502(Lcom/miui/gallery/cleaner/slim/SlimController;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v2, v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$302(Lcom/miui/gallery/cleaner/slim/SlimController;Z)Z

    :cond_2
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->isRemainItemsValid()Z

    move-result v0

    const-wide/16 v2, 0x0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$800(Lcom/miui/gallery/cleaner/slim/SlimController;I)V

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->onDone(J)V

    return-void

    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->getNextRemainItem()Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;

    move-result-object v1

    if-eqz v1, :cond_8

    iget-boolean v4, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    if-eqz v4, :cond_5

    return-void

    :cond_5
    iget-boolean v4, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsPaused:Z

    if-eqz v4, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->doPause()V

    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v6, v1, v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$900(Lcom/miui/gallery/cleaner/slim/SlimController;Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;Ljava/util/ArrayList;)J

    move-result-wide v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    add-long/2addr v2, v8

    iget-object v4, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    monitor-enter v4

    :try_start_1
    iget-boolean v5, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mIsCanceled:Z

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    iget-object v8, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v8}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$1000(Lcom/miui/gallery/cleaner/slim/SlimController;)J

    move-result-wide v8

    const/4 v10, 0x0

    add-long/2addr v8, v6

    invoke-static {v5, v8, v9}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$1002(Lcom/miui/gallery/cleaner/slim/SlimController;J)J

    iget-object v5, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {v5}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$1110(Lcom/miui/gallery/cleaner/slim/SlimController;)I

    :cond_7
    iget-object v5, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    iget v1, v1, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->id:I

    invoke-static {v5, v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->access$800(Lcom/miui/gallery/cleaner/slim/SlimController;I)V

    monitor-exit v4

    goto :goto_1

    :catchall_1
    move-exception v0

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :cond_8
    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->onDone(J)V

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;)V

    :cond_9
    return-void
.end method

.method public setOnSlimDoneListener(Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;->mOnSlimDoneListener:Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;

    return-void
.end method

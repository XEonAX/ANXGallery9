.class final Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;
.super Ljava/lang/Thread;
.source "JobScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/JobScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SchedulerImpl"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;
    }
.end annotation


# instance fields
.field private cancelled:Z

.field private current_sleep_duration:J

.field private volatile executing:Z

.field private finished:Z

.field private volatile lastJob:J

.field private tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->lastJob:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->executing:Z

    const-wide/16 v0, 0x32

    iput-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    new-instance v0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;-><init>(Lcom/xiaomi/push/service/JobScheduler$1;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->setDaemon(Z)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->start()V

    return-void
.end method

.method static synthetic access$302(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->finished:Z

    return p1
.end method

.method static synthetic access$400(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;)Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    return-object p0
.end method

.method static synthetic access$500(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->cancelled:Z

    return p0
.end method

.method static synthetic access$600(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->insertTask(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)V

    return-void
.end method

.method private insertTask(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->insert(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)V

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    return-void
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->cancelled:Z

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->reset()V

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isBlocked()Z
    .locals 5

    iget-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->executing:Z

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->lastJob:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x927c0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public run()V
    .locals 10

    :goto_0
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->cancelled:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->finished:Z

    if-eqz v0, :cond_1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    return-void

    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :catch_0
    :try_start_2
    monitor-exit p0

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/xiaomi/push/service/JobScheduler;->getCurrentTime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v2}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->minimum()Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    move-result-object v2

    iget-object v3, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->lock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    iget-boolean v4, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancelled:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_3

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v0, v5}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->delete(I)V

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_0

    :cond_3
    :try_start_5
    iget-wide v6, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    const/4 v4, 0x0

    sub-long/2addr v6, v0

    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    const-wide/16 v0, 0x0

    cmp-long v3, v6, v0

    const-wide/16 v8, 0x32

    if-lez v3, :cond_6

    :try_start_6
    iget-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    cmp-long v2, v6, v0

    if-lez v2, :cond_4

    iget-wide v6, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    :cond_4
    iget-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    const/4 v2, 0x0

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    iget-wide v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    const-wide/16 v2, 0x1f4

    cmp-long v4, v0, v2

    if-lez v4, :cond_5

    iput-wide v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :cond_5
    :try_start_7
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    :catch_1
    :try_start_8
    monitor-exit p0

    goto :goto_0

    :cond_6
    iput-wide v8, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->current_sleep_duration:J

    iget-object v3, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->lock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :try_start_9
    iget-object v4, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v4}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->minimum()Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    move-result-object v4

    iget-wide v6, v4, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    iget-wide v8, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    cmp-long v4, v6, v8

    if-eqz v4, :cond_7

    iget-object v4, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-static {v4, v2}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->access$100(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)I

    move-result v4

    goto :goto_1

    :cond_7
    const/4 v4, 0x0

    :goto_1
    iget-boolean v6, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancelled:Z

    if-eqz v6, :cond_8

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-static {v1, v2}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->access$100(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->delete(I)V

    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    goto/16 :goto_0

    :cond_8
    :try_start_b
    iget-wide v6, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    invoke-virtual {v2, v6, v7}, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->setScheduledTime(J)V

    iget-object v6, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->tasks:Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;

    invoke-virtual {v6, v4}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->delete(I)V

    iput-wide v0, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    const/4 v0, 0x1

    :try_start_d
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->lastJob:J

    iput-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->executing:Z

    iget-object v1, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->job:Lcom/xiaomi/push/service/JobScheduler$Job;

    invoke-virtual {v1}, Lcom/xiaomi/push/service/JobScheduler$Job;->run()V

    iput-boolean v5, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->executing:Z
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v1

    monitor-enter p0

    :try_start_e
    iput-boolean v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;->cancelled:Z

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    throw v1

    :catchall_1
    move-exception v0

    :try_start_f
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    throw v0

    :catchall_2
    move-exception v0

    :try_start_10
    monitor-exit v3
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    :try_start_11
    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    :catchall_3
    move-exception v0

    :try_start_12
    monitor-exit v3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    :try_start_13
    throw v0

    :catchall_4
    move-exception v0

    monitor-exit p0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    throw v0
.end method

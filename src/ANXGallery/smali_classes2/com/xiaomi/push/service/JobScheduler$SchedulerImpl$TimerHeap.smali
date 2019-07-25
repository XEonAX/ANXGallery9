.class final Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;
.super Ljava/lang/Object;
.source "JobScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TimerHeap"
.end annotation


# instance fields
.field private DEFAULT_HEAP_SIZE:I

.field private deletedCancelledNumber:I

.field private size:I

.field private timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    iput v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->DEFAULT_HEAP_SIZE:I

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->DEFAULT_HEAP_SIZE:I

    new-array v0, v0, [Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iput-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    iput v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->deletedCancelledNumber:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/push/service/JobScheduler$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->getTask(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)I

    move-result p0

    return p0
.end method

.method private downHeap(I)V
    .locals 8

    mul-int/lit8 v0, p1, 0x2

    add-int/lit8 v0, v0, 0x1

    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge v0, v1, :cond_2

    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-lez v1, :cond_2

    add-int/lit8 v1, v0, 0x1

    iget v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v2, v2, v1

    iget-wide v2, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    iget-object v4, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v4, v4, v0

    iget-wide v4, v4, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    move v0, v1

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, p1

    iget-wide v1, v1, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    iget-object v3, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v3, v3, v0

    iget-wide v3, v3, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, p1

    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget-object v3, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v3, v3, v0

    aput-object v3, v2, p1

    iget-object p1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aput-object v1, p1, v0

    mul-int/lit8 p1, v0, 0x2

    add-int/lit8 p1, p1, 0x1

    move v7, v0

    move v0, p1

    move p1, v7

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method private getTask(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private upHeap()V
    .locals 8

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v0, -0x1

    div-int/lit8 v1, v1, 0x2

    :goto_0
    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v2, v2, v0

    iget-wide v2, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    iget-object v4, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v4, v4, v1

    iget-wide v4, v4, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget-object v4, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v4, v4, v1

    aput-object v4, v3, v0

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aput-object v2, v0, v1

    add-int/lit8 v0, v1, -0x1

    div-int/lit8 v0, v0, 0x2

    move v7, v1

    move v1, v0

    move v0, v7

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public delete(I)V
    .locals 3

    if-ltz p1, :cond_0

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    aget-object v1, v1, v2

    aput-object v1, v0, p1

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->downHeap(I)V

    :cond_0
    return-void
.end method

.method public deleteIfCancelled()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancelled:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->deletedCancelledNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->deletedCancelledNumber:I

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->delete(I)V

    add-int/lit8 v0, v0, -0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public hasJob(I)Z
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->type:I

    if-ne v2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public insert(Lcom/xiaomi/push/service/JobScheduler$TaskWraper;)V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    array-length v0, v0

    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    aput-object p1, v0, v1

    invoke-direct {p0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->upHeap()V

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public minimum()Lcom/xiaomi/push/service/JobScheduler$TaskWraper;
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public removeJobs(I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->type:I

    if-ne v1, p1, :cond_0

    iget-object v1, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancel()Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->deleteIfCancelled()V

    return-void
.end method

.method public removeJobs(ILcom/xiaomi/push/service/JobScheduler$Job;)V
    .locals 1

    const/4 p1, 0x0

    :goto_0
    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->job:Lcom/xiaomi/push/service/JobScheduler$Job;

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancel()Z

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->deleteIfCancelled()V

    return-void
.end method

.method public reset()V
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->DEFAULT_HEAP_SIZE:I

    new-array v0, v0, [Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    iput-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->timers:[Lcom/xiaomi/push/service/JobScheduler$TaskWraper;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/service/JobScheduler$SchedulerImpl$TimerHeap;->size:I

    return-void
.end method

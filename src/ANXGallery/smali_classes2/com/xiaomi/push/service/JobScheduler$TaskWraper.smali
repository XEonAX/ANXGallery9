.class Lcom/xiaomi/push/service/JobScheduler$TaskWraper;
.super Ljava/lang/Object;
.source "JobScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/JobScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TaskWraper"
.end annotation


# instance fields
.field cancelled:Z

.field job:Lcom/xiaomi/push/service/JobScheduler$Job;

.field final lock:Ljava/lang/Object;

.field private scheduledTime:J

.field type:I

.field when:J


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->lock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public cancel()Z
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancelled:Z

    const/4 v2, 0x1

    if-nez v1, :cond_0

    iget-wide v3, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->when:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->cancelled:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setScheduledTime(J)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-wide p1, p0, Lcom/xiaomi/push/service/JobScheduler$TaskWraper;->scheduledTime:J

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

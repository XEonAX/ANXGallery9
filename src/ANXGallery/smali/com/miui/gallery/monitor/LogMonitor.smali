.class Lcom/miui/gallery/monitor/LogMonitor;
.super Ljava/lang/Object;
.source "LogMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;
    }
.end annotation


# instance fields
.field private final mBlockTime:J

.field private mStart:J

.field private final mTraceStackTime:J

.field private final mWorkHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Looper;J)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0xbb8

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    const-wide/16 v0, 0x1e

    invoke-static {v0, v1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    iput-wide p2, p0, Lcom/miui/gallery/monitor/LogMonitor;->mBlockTime:J

    iget-wide p2, p0, Lcom/miui/gallery/monitor/LogMonitor;->mBlockTime:J

    long-to-float p2, p2

    const p3, 0x3f4ccccd    # 0.8f

    mul-float p2, p2, p3

    float-to-long p2, p2

    iput-wide p2, p0, Lcom/miui/gallery/monitor/LogMonitor;->mTraceStackTime:J

    new-instance p2, Landroid/os/HandlerThread;

    const-string p3, "monitor work"

    const/16 v0, 0xa

    invoke-direct {p2, p3, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p2}, Landroid/os/HandlerThread;->start()V

    new-instance p3, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;

    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p3, p2, p1}, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;-><init>(Landroid/os/Looper;Landroid/os/Looper;)V

    iput-object p3, p0, Lcom/miui/gallery/monitor/LogMonitor;->mWorkHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method startMonitor(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/monitor/LogMonitor;->mStart:J

    iget-object p1, p0, Lcom/miui/gallery/monitor/LogMonitor;->mWorkHandler:Landroid/os/Handler;

    iget-wide v0, p0, Lcom/miui/gallery/monitor/LogMonitor;->mTraceStackTime:J

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method stopMonitor(Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/monitor/LogMonitor;->mWorkHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-wide v2, p0, Lcom/miui/gallery/monitor/LogMonitor;->mStart:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/monitor/LogMonitor;->mStart:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lcom/miui/gallery/monitor/LogMonitor;->mBlockTime:J

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "%s ########### Processing: %sms"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v5, v1

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/monitor/LogMonitor;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method

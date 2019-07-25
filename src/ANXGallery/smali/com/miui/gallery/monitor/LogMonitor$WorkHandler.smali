.class Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;
.super Landroid/os/Handler;
.source "LogMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/monitor/LogMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WorkHandler"
.end annotation


# instance fields
.field private final mFileLog:Lcom/miui/gallery/monitor/FileLog;

.field private final mMonitorLooper:Landroid/os/Looper;

.field private mStackTrace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mMonitorLooper:Landroid/os/Looper;

    new-instance p1, Lcom/miui/gallery/monitor/FileLog;

    invoke-direct {p1}, Lcom/miui/gallery/monitor/FileLog;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mFileLog:Lcom/miui/gallery/monitor/FileLog;

    return-void
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mStackTrace:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "LOOPER_MONITOR"

    iget-object v1, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mStackTrace:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "LOOPER_MONITOR"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mStackTrace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n------------------------------------\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mFileLog:Lcom/miui/gallery/monitor/FileLog;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/monitor/FileLog;->log(Ljava/lang/String;)V

    return-void
.end method

.method private traceStack()V
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mMonitorLooper:Landroid/os/Looper;

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->mStackTrace:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->printLog(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/monitor/LogMonitor$WorkHandler;->traceStack()V

    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

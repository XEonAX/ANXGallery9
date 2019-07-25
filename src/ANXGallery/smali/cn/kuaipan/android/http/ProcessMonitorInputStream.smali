.class public Lcn/kuaipan/android/http/ProcessMonitorInputStream;
.super Ljava/io/FilterInputStream;
.source "ProcessMonitorInputStream.java"


# instance fields
.field private mCurrent:J

.field private final mListener:Lcn/kuaipan/android/http/IKscTransferListener;

.field private mMarkPos:J

.field private final mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

.field private final mSendMode:Z


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;Lcn/kuaipan/android/http/KscSpeedMonitor;Lcn/kuaipan/android/http/IKscTransferListener;Z)V
    .locals 2

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    iput-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMarkPos:J

    iput-object p2, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    iput-object p3, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iput-boolean p4, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mSendMode:Z

    return-void
.end method

.method private process(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    iget-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    invoke-virtual {v0, p1, p2}, Lcn/kuaipan/android/http/KscSpeedMonitor;->recode(J)V

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mSendMode:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-interface {v0, p1, p2}, Lcn/kuaipan/android/http/IKscTransferListener;->sended(J)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-interface {v0, p1, p2}, Lcn/kuaipan/android/http/IKscTransferListener;->received(J)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized mark(I)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ljava/io/FilterInputStream;->mark(I)V

    iget-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    iput-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMarkPos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const-wide/16 v1, 0x1

    invoke-direct {p0, v1, v2}, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->process(J)V

    :cond_0
    return v0
.end method

.method public read([BII)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I

    move-result p1

    if-lez p1, :cond_0

    int-to-long p2, p1

    invoke-direct {p0, p2, p3}, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->process(J)V

    :cond_0
    return p1
.end method

.method public declared-synchronized reset()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Ljava/io/FilterInputStream;->reset()V

    iget-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mMarkPos:J

    iput-wide v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mSendMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-wide v1, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    invoke-interface {v0, v1, v2}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendPos(J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-wide v1, p0, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->mCurrent:J

    invoke-interface {v0, v1, v2}, Lcn/kuaipan/android/http/IKscTransferListener;->setReceivePos(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0, p1, p2}, Ljava/io/FilterInputStream;->skip(J)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/http/ProcessMonitorInputStream;->process(J)V

    :cond_0
    return-wide p1
.end method

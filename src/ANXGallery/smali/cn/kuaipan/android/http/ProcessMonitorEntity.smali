.class public Lcn/kuaipan/android/http/ProcessMonitorEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "ProcessMonitorEntity.java"


# instance fields
.field private final mListener:Lcn/kuaipan/android/http/IKscTransferListener;

.field private final mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

.field private mMonitorUsed:Z

.field private final mSendMode:Z


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;Lcn/kuaipan/android/http/KscSpeedMonitor;Lcn/kuaipan/android/http/IKscTransferListener;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    iput-object p2, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    iput-object p3, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iput-boolean p4, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mSendMode:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitorUsed:Z

    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->getContent()Ljava/io/InputStream;

    move-result-object v0

    iget-boolean v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitorUsed:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mSendMode:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/ProcessMonitorEntity;->getContentLength()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendTotal(J)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/ProcessMonitorEntity;->getContentLength()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcn/kuaipan/android/http/IKscTransferListener;->setReceiveTotal(J)V

    :cond_1
    :goto_0
    new-instance v1, Lcn/kuaipan/android/http/ProcessMonitorInputStream;

    iget-object v2, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    iget-object v3, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-boolean v4, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mSendMode:Z

    invoke-direct {v1, v0, v2, v3, v4}, Lcn/kuaipan/android/http/ProcessMonitorInputStream;-><init>(Ljava/io/InputStream;Lcn/kuaipan/android/http/KscSpeedMonitor;Lcn/kuaipan/android/http/IKscTransferListener;Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitorUsed:Z

    move-object v0, v1

    :cond_2
    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitorUsed:Z

    if-nez v0, :cond_0

    new-instance v0, Lcn/kuaipan/android/http/ProcessMonitorOutputStream;

    iget-object v1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitor:Lcn/kuaipan/android/http/KscSpeedMonitor;

    iget-object v2, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-boolean v3, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mSendMode:Z

    invoke-direct {v0, p1, v1, v2, v3}, Lcn/kuaipan/android/http/ProcessMonitorOutputStream;-><init>(Ljava/io/OutputStream;Lcn/kuaipan/android/http/KscSpeedMonitor;Lcn/kuaipan/android/http/IKscTransferListener;Z)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcn/kuaipan/android/http/ProcessMonitorEntity;->mMonitorUsed:Z

    move-object p1, v0

    :cond_0
    invoke-super {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method

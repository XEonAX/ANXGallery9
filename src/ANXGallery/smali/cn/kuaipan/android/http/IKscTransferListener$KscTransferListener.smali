.class public abstract Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;
.super Ljava/lang/Object;
.source "IKscTransferListener.java"

# interfaces
.implements Lcn/kuaipan/android/http/IKscTransferListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/http/IKscTransferListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "KscTransferListener"
.end annotation


# instance fields
.field private receiveTotal:J

.field private received:J

.field private sendTotal:J

.field private sended:J


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sendTotal:J

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->receiveTotal:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    return-void
.end method


# virtual methods
.method public abstract onDataReceived(JJ)V
.end method

.method public abstract onDataSended(JJ)V
.end method

.method public final received(J)V
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    :try_start_0
    iget-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->receiveTotal:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->onDataReceived(JJ)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "KscTransferListener"

    const-string v0, "Meet exception in onDataReceived()"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :catch_1
    move-exception p1

    throw p1
.end method

.method public final sended(J)V
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    :try_start_0
    iget-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sendTotal:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->onDataSended(JJ)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "KscTransferListener"

    const-string v0, "Meet exception in onDataSended()"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :catch_1
    move-exception p1

    throw p1
.end method

.method public final setReceivePos(J)V
    .locals 3

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    :cond_0
    iput-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    iget-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->received:J

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->receiveTotal:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->onDataReceived(JJ)V

    return-void
.end method

.method public final setReceiveTotal(J)V
    .locals 0

    iput-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->receiveTotal:J

    return-void
.end method

.method public final setSendPos(J)V
    .locals 3

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    :cond_0
    iput-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    iget-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sended:J

    iget-wide v0, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sendTotal:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->onDataSended(JJ)V

    return-void
.end method

.method public final setSendTotal(J)V
    .locals 0

    iput-wide p1, p0, Lcn/kuaipan/android/http/IKscTransferListener$KscTransferListener;->sendTotal:J

    return-void
.end method

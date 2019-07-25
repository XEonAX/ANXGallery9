.class public Lcn/kuaipan/android/kss/FileTranceListener;
.super Ljava/lang/Object;
.source "FileTranceListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;
    }
.end annotation


# instance fields
.field private mOffset:J

.field private final mSendMode:Z

.field private final mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/http/IKscTransferListener;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iput-boolean p2, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    return-void
.end method

.method static synthetic access$000(Lcn/kuaipan/android/kss/FileTranceListener;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->sended(J)V

    return-void
.end method

.method static synthetic access$100(Lcn/kuaipan/android/kss/FileTranceListener;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->received(J)V

    return-void
.end method

.method private received(J)V
    .locals 2

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-interface {v0, p1, p2}, Lcn/kuaipan/android/http/IKscTransferListener;->received(J)V

    return-void
.end method

.method private sended(J)V
    .locals 2

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-interface {v0, p1, p2}, Lcn/kuaipan/android/http/IKscTransferListener;->sended(J)V

    return-void
.end method


# virtual methods
.method public getChunkListaner(J)Lcn/kuaipan/android/http/IKscTransferListener;
    .locals 8

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-eqz v0, :cond_0

    new-instance v7, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;

    iget-wide v5, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    move-object v0, v7

    move-object v1, p0

    move-object v2, p0

    move-wide v3, p1

    invoke-direct/range {v0 .. v6}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;-><init>(Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/FileTranceListener;JJ)V

    return-object v7

    :cond_0
    new-instance v7, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;

    iget-wide v3, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    move-object v0, v7

    move-object v1, p0

    move-object v2, p0

    move-wide v5, p1

    invoke-direct/range {v0 .. v6}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;-><init>(Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/FileTranceListener;JJ)V

    return-object v7
.end method

.method public setReceiveTotal(J)V
    .locals 3

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-wide v1, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    add-long/2addr v1, p1

    invoke-interface {v0, v1, v2}, Lcn/kuaipan/android/http/IKscTransferListener;->setReceiveTotal(J)V

    :cond_0
    return-void
.end method

.method public setSendPos(J)V
    .locals 1

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-nez v0, :cond_0

    iput-wide p1, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    invoke-interface {v0, p1, p2}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendPos(J)V

    return-void
.end method

.method public setSendTotal(J)V
    .locals 3

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mSendMode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mTotalListener:Lcn/kuaipan/android/http/IKscTransferListener;

    iget-wide v1, p0, Lcn/kuaipan/android/kss/FileTranceListener;->mOffset:J

    add-long/2addr v1, p1

    invoke-interface {v0, v1, v2}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendTotal(J)V

    :cond_0
    return-void
.end method

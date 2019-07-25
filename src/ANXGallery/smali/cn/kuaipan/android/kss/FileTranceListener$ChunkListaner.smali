.class Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;
.super Ljava/lang/Object;
.source "FileTranceListener.java"

# interfaces
.implements Lcn/kuaipan/android/http/IKscTransferListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/kss/FileTranceListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChunkListaner"
.end annotation


# instance fields
.field private mParent:Lcn/kuaipan/android/kss/FileTranceListener;

.field private mReceiveOffset:J

.field private mSendOffset:J

.field final synthetic this$0:Lcn/kuaipan/android/kss/FileTranceListener;


# direct methods
.method constructor <init>(Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/FileTranceListener;JJ)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->this$0:Lcn/kuaipan/android/kss/FileTranceListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mParent:Lcn/kuaipan/android/kss/FileTranceListener;

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mSendOffset:J

    iput-wide p1, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mReceiveOffset:J

    invoke-virtual {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->setSendPos(J)V

    invoke-virtual {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->setReceivePos(J)V

    return-void
.end method


# virtual methods
.method public received(J)V
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mParent:Lcn/kuaipan/android/kss/FileTranceListener;

    invoke-static {v0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->access$100(Lcn/kuaipan/android/kss/FileTranceListener;J)V

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mReceiveOffset:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mReceiveOffset:J

    return-void
.end method

.method public sended(J)V
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mParent:Lcn/kuaipan/android/kss/FileTranceListener;

    invoke-static {v0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->access$000(Lcn/kuaipan/android/kss/FileTranceListener;J)V

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mSendOffset:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mSendOffset:J

    return-void
.end method

.method public setReceivePos(J)V
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mReceiveOffset:J

    sub-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->received(J)V

    return-void
.end method

.method public setReceiveTotal(J)V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mParent:Lcn/kuaipan/android/kss/FileTranceListener;

    invoke-virtual {v0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->setReceiveTotal(J)V

    return-void
.end method

.method public setSendPos(J)V
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mSendOffset:J

    sub-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->sended(J)V

    return-void
.end method

.method public setSendTotal(J)V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/FileTranceListener$ChunkListaner;->mParent:Lcn/kuaipan/android/kss/FileTranceListener;

    invoke-virtual {v0, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->setSendTotal(J)V

    return-void
.end method

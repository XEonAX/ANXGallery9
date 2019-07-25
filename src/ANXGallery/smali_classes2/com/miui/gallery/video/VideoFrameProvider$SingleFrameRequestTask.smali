.class Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;
.super Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;
.source "VideoFrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SingleFrameRequestTask"
.end annotation


# instance fields
.field private mSurface:Landroid/view/Surface;

.field private mTime:J

.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameProvider;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;JIILandroid/view/Surface;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-direct {p0, p1, p2, p5, p6}, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;-><init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;II)V

    iput-wide p3, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mTime:J

    iput-object p7, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mSurface:Landroid/view/Surface;

    return-void
.end method


# virtual methods
.method public handle(Lcom/miui/video/localvideoplayer/VideoFrameInterface;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "VideoFrameProvider"

    const-string v1, "request frame start %d"

    iget-wide v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mTime:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mSurface:Landroid/view/Surface;

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mPath:Ljava/lang/String;

    iget-wide v7, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mTime:J

    move-object v3, p1

    invoke-interface/range {v3 .. v8}, Lcom/miui/video/localvideoplayer/VideoFrameInterface;->showPreviewFrameAtTime(Landroid/view/Surface;ILjava/lang/String;J)V

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mPath:Ljava/lang/String;

    iget-wide v1, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mTime:J

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/video/VideoFrameProvider;->access$000(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;J)V

    return-void
.end method

.method public onError()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mPath:Ljava/lang/String;

    iget-wide v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$SingleFrameRequestTask;->mTime:J

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/video/VideoFrameProvider;->access$000(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;J)V

    return-void
.end method

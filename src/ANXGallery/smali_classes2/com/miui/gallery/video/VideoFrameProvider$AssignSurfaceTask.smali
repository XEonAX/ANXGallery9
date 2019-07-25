.class Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;
.super Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;
.source "VideoFrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AssignSurfaceTask"
.end annotation


# instance fields
.field private mSurface:Landroid/view/Surface;

.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameProvider;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;Landroid/view/Surface;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;-><init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;II)V

    iput-object p3, p0, Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;->mSurface:Landroid/view/Surface;

    return-void
.end method


# virtual methods
.method public handle(Lcom/miui/video/localvideoplayer/VideoFrameInterface;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "VideoFrameProvider"

    const-string v1, "setSurfaceForVideo"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;->mSurface:Landroid/view/Surface;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;->mSurface:Landroid/view/Surface;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$AssignSurfaceTask;->mPath:Ljava/lang/String;

    invoke-interface {p1, v0, v1, v2}, Lcom/miui/video/localvideoplayer/VideoFrameInterface;->setSurface(Landroid/view/Surface;ILjava/lang/String;)V

    return-void
.end method

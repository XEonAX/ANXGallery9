.class abstract Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;
.super Ljava/lang/Object;
.source "VideoFrameProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "RequestTask"
.end annotation


# instance fields
.field protected mPath:Ljava/lang/String;

.field protected mRequestHeight:I

.field protected mRequestWidth:I

.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameProvider;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;II)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->mPath:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->mRequestWidth:I

    iput p4, p0, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->mRequestHeight:I

    return-void
.end method


# virtual methods
.method public abstract handle(Lcom/miui/video/localvideoplayer/VideoFrameInterface;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public onError()V
    .locals 0

    return-void
.end method

.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-static {v0}, Lcom/miui/gallery/video/VideoFrameProvider;->access$300(Lcom/miui/gallery/video/VideoFrameProvider;)Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;->getServiceInterface()Lcom/miui/video/localvideoplayer/VideoFrameInterface;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "VideoFrameProvider"

    const-string v1, "interface null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->handle(Lcom/miui/video/localvideoplayer/VideoFrameInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;->onError()V

    const-string v1, "VideoFrameProvider"

    const-string v2, "interface remote error\n"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

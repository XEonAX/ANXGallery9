.class Lcom/miui/gallery/projection/ProjectionVideoController$1;
.super Landroid/os/Handler;
.source "ProjectionVideoController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/projection/ProjectionVideoController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/projection/ProjectionVideoController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/projection/ProjectionVideoController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController$1;->this$0:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController$1;->this$0:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->access$000(Lcom/miui/gallery/projection/ProjectionVideoController;)I

    move-result v0

    const-string v2, "RemoteVideoControl"

    const-string v3, "show progress %s pos %d"

    iget-object v4, p0, Lcom/miui/gallery/projection/ProjectionVideoController$1;->this$0:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-static {v4}, Lcom/miui/gallery/projection/ProjectionVideoController;->access$100(Lcom/miui/gallery/projection/ProjectionVideoController;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/projection/ProjectionVideoController$1;->this$0:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ProjectionVideoController;->access$100(Lcom/miui/gallery/projection/ProjectionVideoController;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/projection/ProjectionVideoController$1;->this$0:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ProjectionVideoController;->access$200(Lcom/miui/gallery/projection/ProjectionVideoController;)Lcom/miui/gallery/projection/ConnectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/projection/ConnectController;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/projection/ProjectionVideoController$1;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/projection/ProjectionVideoController$1;->removeMessages(I)V

    rem-int/lit16 v0, v0, 0x3e8

    rsub-int v0, v0, 0x3e8

    int-to-long v0, v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/projection/ProjectionVideoController$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method

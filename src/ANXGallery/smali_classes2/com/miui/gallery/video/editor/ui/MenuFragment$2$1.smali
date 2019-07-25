.class Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;
.super Ljava/lang/Object;
.source "MenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/net/download/Request$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->downloadResource(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/ui/MenuFragment$2;

.field final synthetic val$data:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

.field final synthetic val$position:I

.field final synthetic val$startTime:J


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;JILcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->this$1:Lcom/miui/gallery/video/editor/ui/MenuFragment$2;

    iput-wide p2, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$startTime:J

    iput p4, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$position:I

    iput-object p5, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$data:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 2

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->this$1:Lcom/miui/gallery/video/editor/ui/MenuFragment$2;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$data:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$position:I

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->access$000(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1$1;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;)V

    invoke-static {p1}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public onProgressUpdate(I)V
    .locals 2

    const-string v0, "MenuFragment"

    const-string v1, "downloadResource onProgressUpdate:  %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public onStart()V
    .locals 6

    const-string v0, "MenuFragment"

    const-string v1, "downloadResource receive  download callback : %d ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$startTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->this$1:Lcom/miui/gallery/video/editor/ui/MenuFragment$2;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->notifyDateSetChanged(I)V

    return-void
.end method

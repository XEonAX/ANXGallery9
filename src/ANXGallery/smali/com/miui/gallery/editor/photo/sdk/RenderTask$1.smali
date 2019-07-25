.class Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;
.super Ljava/lang/Object;
.source "RenderTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/sdk/RenderTask;->performItemFinish(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

.field final synthetic val$out:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->val$out:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$200(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->val$out:Landroid/net/Uri;

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onItemFinish(Landroid/net/Uri;Landroid/net/Uri;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$300(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "RenderTask"

    const-string v1, "render cancelled."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onTaskCancelled()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$400(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onTaskFinish()V

    :cond_2
    :goto_0
    return-void
.end method

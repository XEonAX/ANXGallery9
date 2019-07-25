.class Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;
.super Ljava/lang/Object;
.source "ShareFilePrepareFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doRender()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemFinish(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 3

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "render one item: %s -> %s"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr p2, v0

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$200(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I

    move-result v2

    add-int/2addr v1, v2

    int-to-float p2, p2

    int-to-float p1, p1

    div-float/2addr p2, p1

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1500(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I

    move-result p1

    int-to-float p1, p1

    mul-float p2, p2, p1

    float-to-int p1, p2

    add-int/2addr v1, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V

    return-void
.end method

.method public onTaskCancelled()V
    .locals 2

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "render finish"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1702(Lcom/miui/gallery/ui/ShareFilePrepareFragment;Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    return-void
.end method

.method public onTaskError()V
    .locals 2

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "render error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1702(Lcom/miui/gallery/ui/ShareFilePrepareFragment;Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    const v1, 0x7f10065a

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$500(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V

    return-void
.end method

.method public onTaskFinish()V
    .locals 2

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "render finish"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1000(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1702(Lcom/miui/gallery/ui/ShareFilePrepareFragment;Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    return-void
.end method

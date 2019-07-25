.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sample(Ljava/lang/String;Lcom/miui/gallery/editor/photo/core/RenderFragment;Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->sample()Ljava/util/List;

    move-result-object p2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "effect"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object v1

    invoke-virtual {v1, p1, p3, v0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    const-string p2, "effect"

    const-string v1, "*none*"

    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object p2

    invoke-virtual {p2, p1, p3, v0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public onDiscard(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->isRunningPreviewAnimator()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v2

    aget-object v1, v1, v2

    const-string v2, "discard_detail"

    invoke-direct {p0, v1, v0, v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->sample(Ljava/lang/String;Lcom/miui/gallery/editor/photo/core/RenderFragment;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1500(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    :cond_1
    return-void
.end method

.method public onLoadOrigin()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeOrigin()Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public onLoadPreview()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public onLoadRenderData()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getRenderData(Ljava/util/List;)V

    :cond_0
    return-object v0
.end method

.method public onSave(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->isRunningPreviewAnimator()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->export()Lcom/miui/gallery/editor/photo/core/RenderData;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Ljava/lang/String;

    move-result-object v2

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result p1

    aget-object p1, v2, p1

    const-string v2, "save_detail"

    invoke-direct {p0, p1, v0, v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->sample(Ljava/lang/String;Lcom/miui/gallery/editor/photo/core/RenderFragment;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1600(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/utils/Callback;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->enqueue(Lcom/miui/gallery/editor/photo/core/RenderData;Lcom/miui/gallery/editor/photo/utils/Callback;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1600(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/utils/Callback;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/utils/Callback;->onCancel()V

    goto :goto_0

    :cond_2
    const-string p1, "PhotoEditor"

    const-string v0, "no active render fragment"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.class Lcom/miui/gallery/video/editor/ui/AudioFragment$3;
.super Ljava/lang/Object;
.source "AudioFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/AudioFragment;->refreshData(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

.field final synthetic val$audioArrayList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/AudioFragment;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->val$audioArrayList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$200(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$200(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->val$audioArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$300(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$300(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

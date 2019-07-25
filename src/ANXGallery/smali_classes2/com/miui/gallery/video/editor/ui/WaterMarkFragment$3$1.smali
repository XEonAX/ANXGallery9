.class Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;
.super Ljava/lang/Object;
.source "WaterMarkFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

.field final synthetic val$errorCode:Lcom/miui/gallery/net/base/ErrorCode;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;Lcom/miui/gallery/net/base/ErrorCode;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->val$errorCode:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/video/editor/TextStyle;

    const v1, 0x7f070321

    const-string v2, "ve_type_none"

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/video/editor/TextStyle;-><init>(ILjava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/video/editor/TextStyle;

    const v2, 0x7f07032d

    const-string v3, "ve_type_local"

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/video/editor/TextStyle;-><init>(ILjava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v2, v2, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$300(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$300(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->notifyDataSetChanged()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;->val$errorCode:Lcom/miui/gallery/net/base/ErrorCode;

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/miui/gallery/net/base/ErrorCode;

    if-ne v0, v1, :cond_1

    new-instance v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1$1;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

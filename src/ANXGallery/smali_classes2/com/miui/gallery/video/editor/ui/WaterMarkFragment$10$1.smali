.class Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;
.super Ljava/lang/Object;
.source "WaterMarkFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager$ILoadWaterMarkListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;->onSuccess()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished([Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/manager/WaterMarkManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    iget-object v1, v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;->val$textStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/video/editor/manager/WaterMarkManager;->updateDataWithTemplate([Ljava/lang/String;Lcom/miui/gallery/video/editor/TextStyle;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10$1;->this$1:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    iget v0, v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;->val$position:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->notifyDateSetChanged(I)V

    return-void
.end method

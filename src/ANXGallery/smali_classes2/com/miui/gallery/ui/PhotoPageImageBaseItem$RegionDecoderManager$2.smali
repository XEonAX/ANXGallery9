.class Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;
.super Ljava/lang/Object;
.source "PhotoPageImageBaseItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

.field final synthetic val$decoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

.field final synthetic val$future:Lcom/miui/gallery/threadpool/Future;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/threadpool/Future;Lcom/miui/gallery/util/photoview/TileBitProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$future:Lcom/miui/gallery/threadpool/Future;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$decoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$future:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "PhotoPageImageBaseItem"

    const-string v1, "setup region"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$decoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->access$302(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/util/photoview/TileBitProvider;)Lcom/miui/gallery/util/photoview/TileBitProvider;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$decoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-static {}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->access$400()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->getTrimMemoryCallback()Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Luk/co/senab/photoview/PhotoView;->setupTile(Lcom/miui/gallery/util/photoview/TileBitProvider;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V

    return-void

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;->val$decoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->release()V

    return-void
.end method

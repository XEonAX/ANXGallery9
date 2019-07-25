.class Lcom/miui/gallery/video/editor/NexVideoEditor$3;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$OnGetVideoThumbnailListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->loadThumbnail(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field final synthetic val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetVideoThumbnailCompleted(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/VideoThumbnail;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$900(Lcom/miui/gallery/video/editor/NexVideoEditor;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->notifyThumbnailChanged()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->getDisplayView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setDisplayView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    :cond_1
    return-void
.end method

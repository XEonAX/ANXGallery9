.class Lcom/miui/gallery/video/editor/NexVideoEditor$1;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->loadMainThumbnail(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 3

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showThumbnail(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result p1

    rem-int/lit16 p1, p1, 0xb4

    const/16 p2, 0x5a

    const/16 v0, 0xa0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;

    move-result-object p1

    new-instance v2, Lcom/miui/gallery/video/editor/VideoThumbnail;

    invoke-static {p3, v0, p2, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-direct {v2, v1, v1, v1, p2}, Lcom/miui/gallery/video/editor/VideoThumbnail;-><init>(IIILandroid/graphics/Bitmap;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;

    move-result-object p1

    new-instance v2, Lcom/miui/gallery/video/editor/VideoThumbnail;

    invoke-static {p3, p2, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-direct {v2, v1, v1, v1, p2}, Lcom/miui/gallery/video/editor/VideoThumbnail;-><init>(IIILandroid/graphics/Bitmap;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$1;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->notifyThumbnailChanged()V

    :cond_1
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 0

    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method

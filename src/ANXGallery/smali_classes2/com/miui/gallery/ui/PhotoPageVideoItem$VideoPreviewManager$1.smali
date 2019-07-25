.class Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;
.super Ljava/lang/Object;
.source "PhotoPageVideoItem.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    new-instance p3, Landroid/view/Surface;

    invoke-direct {p3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-static {p2, p3}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->access$1002(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;Landroid/view/Surface;)Landroid/view/Surface;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$1100(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$1100(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)Landroid/view/Surface;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;->onSurfacePrepared(Landroid/view/Surface;)V

    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->access$1002(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;Landroid/view/Surface;)Landroid/view/Surface;

    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

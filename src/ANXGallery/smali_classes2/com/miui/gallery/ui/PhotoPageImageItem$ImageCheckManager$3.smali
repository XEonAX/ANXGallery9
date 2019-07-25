.class Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p2}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-static {p3}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->access$700(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;->render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;)V

    goto :goto_0

    :cond_0
    const-string p1, "PhotoPageImageItem"

    const-string p2, "PGEditCoreAPI released"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
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

.class Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;


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

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Landroid/graphics/Bitmap;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isAttachedToWindow()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1, p1, v2}, Luk/co/senab/photoview/PhotoView;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->ensureInflated()V

    iget-object p1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const v1, 0x7f1003a6

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setText(I)V

    :cond_0
    iget-object p1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setEnabled(Z)V

    :cond_1
    return-void
.end method

.method public onError(ILjava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.class Lcom/miui/gallery/ui/PhotoPageGifItem$1;
.super Landroid/os/Handler;
.source "PhotoPageGifItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageGifItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageGifItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->access$000(Lcom/miui/gallery/ui/PhotoPageGifItem;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    invoke-static {p1, v0, v0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->access$100(Lcom/miui/gallery/ui/PhotoPageGifItem;ZZ)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getSuppMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1, p1}, Luk/co/senab/photoview/PhotoView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem$1;->this$0:Lcom/miui/gallery/ui/PhotoPageGifItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setDisplayMatrix(Landroid/graphics/Matrix;)Z

    :cond_1
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

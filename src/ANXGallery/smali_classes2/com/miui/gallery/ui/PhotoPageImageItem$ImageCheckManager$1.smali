.class Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    goto :goto_0

    :cond_0
    const v1, 0x7f1003a5

    invoke-virtual {p1, v1}, Landroid/widget/CompoundButton;->setText(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isMediaInProcessing()Z

    move-result p2

    if-nez p2, :cond_1

    const/4 v0, 0x1

    :cond_1
    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setRegionDecodeEnable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->refreshItem()V

    return-void
.end method

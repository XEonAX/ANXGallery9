.class Lcom/miui/gallery/picker/PickGalleryActivity$3;
.super Ljava/lang/Object;
.source "PickGalleryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickGalleryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickGalleryActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->cancel()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$3;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->clear()Z

    :cond_1
    return-void
.end method

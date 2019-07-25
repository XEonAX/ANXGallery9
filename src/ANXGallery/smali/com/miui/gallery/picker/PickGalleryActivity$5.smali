.class Lcom/miui/gallery/picker/PickGalleryActivity$5;
.super Ljava/lang/Object;
.source "PickGalleryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$5;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$5;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$5;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->getRemainSize()I

    move-result p1

    :goto_0
    if-lez p1, :cond_1

    new-instance v0, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    invoke-direct {v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "remaining_count"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setArguments(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$5;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v1, "cancel_dialog"

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.class Lcom/miui/gallery/picker/uri/UriGenerator$7;
.super Ljava/lang/Object;
.source "UriGenerator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/uri/UriGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/uri/UriGenerator;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->getRemainSize()I

    move-result p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$600(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-lez p1, :cond_1

    if-eqz v0, :cond_1

    new-instance v1, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    invoke-direct {v1}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;-><init>()V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "remaining_count"

    invoke-virtual {v2, v3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$900(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setCancelListener(Landroid/content/DialogInterface$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$7;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1000(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setContinueListener(Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "cancel_dialog"

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

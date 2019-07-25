.class Lcom/miui/gallery/ui/DownloadFragment$1;
.super Ljava/lang/Object;
.source "DownloadFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/DownloadFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/DownloadFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/DownloadFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DownloadFragment$1;->this$0:Lcom/miui/gallery/ui/DownloadFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/DownloadFragment$1;->this$0:Lcom/miui/gallery/ui/DownloadFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/DownloadFragment;->access$000(Lcom/miui/gallery/ui/DownloadFragment;)Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/DownloadFragment$1;->this$0:Lcom/miui/gallery/ui/DownloadFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/DownloadFragment;->access$000(Lcom/miui/gallery/ui/DownloadFragment;)Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;->onCanceled()V

    iget-object p1, p0, Lcom/miui/gallery/ui/DownloadFragment$1;->this$0:Lcom/miui/gallery/ui/DownloadFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/DownloadFragment;->access$002(Lcom/miui/gallery/ui/DownloadFragment;Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;)Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DownloadFragment$1;->this$0:Lcom/miui/gallery/ui/DownloadFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/DownloadFragment;->dismissAllowingStateLoss()V

    return-void
.end method

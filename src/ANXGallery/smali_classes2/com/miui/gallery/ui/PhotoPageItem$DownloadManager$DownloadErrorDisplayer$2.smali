.class Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->display(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorTip;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$tip:Lcom/miui/gallery/error/core/ErrorTip;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;Lcom/miui/gallery/error/core/ErrorTip;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->this$2:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->val$tip:Lcom/miui/gallery/error/core/ErrorTip;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->val$tip:Lcom/miui/gallery/error/core/ErrorTip;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;->this$2:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/error/core/ErrorTip;->action(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorActionCallback;)V

    return-void
.end method

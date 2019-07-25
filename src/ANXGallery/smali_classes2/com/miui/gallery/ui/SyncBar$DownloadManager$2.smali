.class Lcom/miui/gallery/ui/SyncBar$DownloadManager$2;
.super Ljava/lang/Object;
.source "SyncBar.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SyncBar$DownloadManager;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$2;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setAutoDownload(Z)V

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$2;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->stopBatchDownload(Landroid/content/Context;)V

    return-void
.end method

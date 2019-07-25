.class Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

.field final synthetic val$downloadType:Lcom/miui/gallery/sdk/download/DownloadType;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->val$downloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStatusGotten(Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1700(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->isDownloading()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->val$downloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->val$downloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-interface {p1, v0, v1, v2}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->getStatus()Lcom/miui/gallery/sdk/SyncStatus;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->getDownloadedPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->val$downloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->getDownloadedPath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, v2, v3, p1}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1800(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    :cond_2
    :goto_0
    return-void
.end method

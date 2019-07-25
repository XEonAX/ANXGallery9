.class Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processThumbnail()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStatusGotten(Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1700(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->getStatus()Lcom/miui/gallery/sdk/SyncStatus;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->getDownloadedPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1602(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1900(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Z)Z

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v5, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v6

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBigPhotoImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v7

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2100(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v8

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2200(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    move-result-object v9

    invoke-virtual/range {v2 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.class Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PhotoItemBulkDownloadListener"
.end annotation


# instance fields
.field public mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method


# virtual methods
.method public onDownloadEnd(Ljava/util/List;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-interface {p1, v2, p2, v2, v2}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x1

    :goto_0
    const/4 v4, 0x1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    goto :goto_1

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v7}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v6

    invoke-virtual {v7}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v7}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    goto :goto_2

    :cond_5
    invoke-virtual {v7}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :goto_2
    const/4 v5, 0x1

    goto :goto_3

    :cond_6
    const/4 v5, 0x0

    :goto_3
    if-eqz v4, :cond_7

    if-eqz v5, :cond_7

    goto :goto_0

    :cond_7
    const/4 v4, 0x0

    goto :goto_1

    :cond_8
    const/4 v4, 0x0

    :cond_9
    if-nez v4, :cond_a

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getErrorCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1100(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p2

    if-eqz p2, :cond_b

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getErrorCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p1

    invoke-interface {p2, v2, v0, v2, p1}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V

    goto :goto_4

    :cond_a
    if-eqz v4, :cond_b

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-interface {p1, v2, p2, v2, v2}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V

    :cond_b
    :goto_4
    return-void
.end method

.method public onDownloadProgress(F)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;F)V

    return-void
.end method

.method public setDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method

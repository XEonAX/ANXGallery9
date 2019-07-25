.class final Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;
.super Ljava/lang/Object;
.source "OriginDownloader.java"

# interfaces
.implements Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->createListener(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/miui/gallery/sdk/download/assist/RequestItem;)Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

.field final synthetic val$requestItem:Lcom/miui/gallery/sdk/download/assist/RequestItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestItem:Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataReceived(JJ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestItem:Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v0, v0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "OriginalFileDownloader"

    const-string p2, "downloading cancelled: %s"

    iget-object p3, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p3}, Lcom/miui/gallery/cloud/RequestCloudItem;->getFileName()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    iget v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->priority:I

    invoke-static {v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "OriginalFileDownloader"

    const-string v1, "net work is changed, interrupt this thread item: %s"

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/RequestCloudItem;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    iput-wide p1, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->mDownloadedSize:J

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestCloudItem:Lcom/miui/gallery/cloud/RequestCloudItem;

    iput-wide p3, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->mTotalSize:J

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;->val$requestItem:Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v0, v0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {v0, p1, p2, p3, p4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackProgress(Lcom/miui/gallery/sdk/download/assist/DownloadItem;JJ)V

    return-void
.end method

.method public onDataSended(JJ)V
    .locals 0

    return-void
.end method

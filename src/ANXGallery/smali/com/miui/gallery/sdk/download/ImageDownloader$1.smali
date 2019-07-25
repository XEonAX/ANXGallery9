.class Lcom/miui/gallery/sdk/download/ImageDownloader$1;
.super Ljava/lang/Object;
.source "ImageDownloader.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/listener/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/sdk/download/ImageDownloader;->loadSync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/sdk/download/ImageDownloader;

.field final synthetic val$downloadedItem:[Lcom/miui/gallery/sdk/download/assist/DownloadedItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/sdk/download/ImageDownloader;[Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/ImageDownloader$1;->this$0:Lcom/miui/gallery/sdk/download/ImageDownloader;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/ImageDownloader$1;->val$downloadedItem:[Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    return-void
.end method

.method public onDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 0

    return-void
.end method

.method public onDownloadStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    return-void
.end method

.method public onDownloadSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/ImageDownloader$1;->val$downloadedItem:[Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    const/4 p2, 0x0

    aput-object p3, p1, p2

    return-void
.end method

.class Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.source "PhotoPageImageBaseItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageDownloadManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;Lcom/miui/gallery/ui/PhotoPageImageBaseItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;)V

    return-void
.end method


# virtual methods
.method protected doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->isPagerSelected()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onSelected()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onSelected()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected doOnLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V

    return-void
.end method

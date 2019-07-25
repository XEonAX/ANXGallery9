.class Lcom/miui/gallery/util/uil/CloudImageLoader$4;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;->onSuccessLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

.field final synthetic val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    iput-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V
    .locals 9

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$300(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v4}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFilePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->needDisplay()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFileCipher()[B

    move-result-object v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_1

    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFileCipher()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFileCipher()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    :cond_2
    :goto_0
    move-object v4, v0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v6, v0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getRegionDecodeRect()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual/range {v1 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;->val$wrapper:Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    invoke-static {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$300(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object p1

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, p1, v3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Landroid/graphics/Bitmap;)V

    :cond_4
    :goto_1
    return-void
.end method

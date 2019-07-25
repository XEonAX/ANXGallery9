.class final Lcom/miui/gallery/util/BindImageHelper$1;
.super Ljava/lang/Object;
.source "BindImageHelper.java"

# interfaces
.implements Lcom/miui/gallery/util/uil/CloudImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/BindImageHelper;->setCloudHolder(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

.field final synthetic val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$1;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    iput-object p2, p0, Lcom/miui/gallery/util/BindImageHelper$1;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onLoadingCancelled(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onLoadingComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$1;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    invoke-interface {p1}, Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;->onLoadingComplete()V

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$1;->val$aware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {}, Lcom/miui/gallery/util/BindImageHelper;->access$000()Ljava/lang/Object;

    move-result-object p2

    const p3, 0x7f090187

    invoke-interface {p1, p3, p2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/util/BindImageHelper$1;->val$listener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    invoke-interface {p1}, Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;->onLoadingFailed()V

    return-void
.end method

.method public onLoadingStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V
    .locals 0

    return-void
.end method

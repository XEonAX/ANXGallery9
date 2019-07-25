.class public Lcom/miui/gallery/util/BindImageHelper;
.super Ljava/lang/Object;
.source "BindImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;
    }
.end annotation


# static fields
.field private static final PLACE_HOLDER:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/BindImageHelper;->PLACE_HOLDER:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/BindImageHelper;->PLACE_HOLDER:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/util/BindImageHelper;->bindCloudImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V

    return-void
.end method

.method private static bindCloudImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V
    .locals 15

    if-nez p0, :cond_0

    const-string p0, "BindImageHelper"

    const-string v0, "bindCloudImage view is null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    const-string v1, "BindImageHelper"

    const-string v2, "downloadImage %s"

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v4

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v6

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getDisplayImageOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v8

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v9

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v10

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    move-result-object v11

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getRegionDecodeRect()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->isDelayRequest()Z

    move-result v13

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->isShowLoadingImage()Z

    move-result v14

    move-object v7, p0

    invoke-virtual/range {v4 .. v14}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public static bindFaceImage(Ljava/lang/String;Landroid/net/Uri;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Z)V
    .locals 7

    new-instance v2, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {v2, p2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/BindImageHelper;->bindFaceImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Z)V

    return-void
.end method

.method public static bindFaceImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Z)V
    .locals 11

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "MIUI/Gallery/cloud/.microthumbnailFile"

    move-object v1, p0

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x0

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v10, 0x0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    invoke-static/range {v2 .. v10}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V

    :cond_0
    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V
    .locals 9

    const/4 v7, 0x1

    const/4 v8, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V
    .locals 10

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-static/range {v0 .. v9}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
    .locals 10

    new-instance v3, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    move-object v0, p3

    invoke-direct {v3, p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-static/range {v0 .. v9}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V
    .locals 9

    const/4 v7, 0x1

    const/4 v8, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V
    .locals 10

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-static/range {v0 .. v9}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    return-void
.end method

.method public static bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
    .locals 8

    move-object v2, p3

    if-nez v2, :cond_0

    const-string v0, "BindImageHelper"

    const-string v1, "bindImage view is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const v0, 0x7f090187

    const/4 v1, 0x0

    invoke-interface {p3, v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setTag(ILjava/lang/Object;)V

    invoke-static/range {p1 .. p9}, Lcom/miui/gallery/util/BindImageHelper;->setCloudHolder(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V

    invoke-static {p3}, Lcom/miui/gallery/util/BindImageHelper;->bindCloudImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-object v3, p0

    invoke-virtual {v1, p0}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v3, p9

    invoke-static {p3, v3}, Lcom/miui/gallery/util/BindImageHelper;->getLocalLoadingListener(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    :goto_0
    return-void
.end method

.method private static getLocalLoadingListener(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;
    .locals 2

    const v0, 0x7f0902ce

    invoke-interface {p0, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/BindImageHelper$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/BindImageHelper$2;-><init>(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    invoke-interface {p0, v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setTag(ILjava/lang/Object;)V

    :cond_0
    check-cast v1, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    return-object v1
.end method

.method public static isViewBindDrawable(Landroid/widget/ImageView;)Z
    .locals 1

    const v0, 0x7f090187

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isViewBindDrawable(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Z
    .locals 1

    const v0, 0x7f090187

    invoke-interface {p0, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static setCloudHolder(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
    .locals 1

    invoke-static {p2}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p3}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p4}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p5}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setRegionDecodeRect(Landroid/graphics/RectF;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setNeedDisplay(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p6}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setDelayRequest(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p0

    invoke-virtual {p0, p7}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setShowLoadingImage(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;

    if-eqz p8, :cond_0

    new-instance p0, Lcom/miui/gallery/util/BindImageHelper$1;

    invoke-direct {p0, p8, p2}, Lcom/miui/gallery/util/BindImageHelper$1;-><init>(Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    :cond_0
    return-void
.end method

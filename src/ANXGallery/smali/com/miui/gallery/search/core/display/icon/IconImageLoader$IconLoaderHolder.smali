.class Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;
.super Ljava/lang/Object;
.source "IconImageLoader.java"

# interfaces
.implements Lcom/miui/gallery/search/core/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/display/icon/IconImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IconLoaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/search/core/Consumer<",
        "Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field private mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private mLastResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

.field private mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

.field private mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

.field private mUri:Landroid/net/Uri;

.field private mViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getImageHolder(Landroid/widget/ImageView;)Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;
    .locals 2

    const v0, 0x7f0902cb

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;

    invoke-direct {v1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;-><init>()V

    invoke-virtual {p0, v0, v1}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    :cond_0
    check-cast v1, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;

    return-object v1
.end method


# virtual methods
.method public consume(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;)Z
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mLastResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->isValid()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->iconUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "IconImageLoader"

    const-string v2, "Load task finished for uri %s, result is valid %s"

    iget-object v3, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->isValid()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mLastResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iget-object v2, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->displayResult()V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    if-eqz v1, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->isFromUnreliableCache()Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p1, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mUri:Landroid/net/Uri;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x1

    move-object v1, p1

    move-object v4, p0

    invoke-direct/range {v1 .. v8}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;-><init>(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/search/core/Consumer;Landroid/os/Handler;ZZZ)V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->access$100(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V

    goto :goto_1

    :cond_3
    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic consume(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->consume(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;)Z

    move-result p1

    return p1
.end method

.method public displayResult()V
    .locals 15

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iget-object v1, v0, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->localFilePath:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iget-object v2, v0, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->downloadUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getImageView()Landroid/widget/ImageView;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iget-object v6, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iget-object v7, v0, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;->facePositionRect:Landroid/graphics/RectF;

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v8

    const/4 v9, 0x0

    new-instance v10, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-direct {v10, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iget-object v11, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iget-object v12, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual/range {v8 .. v14}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public getImageView()Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mViewRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->access$200(Landroid/net/Uri;Landroid/widget/ImageView;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTask()Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    return-object v0
.end method

.method public hasRunningTask()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public set(Landroid/widget/ImageView;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mViewRef:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mUri:Landroid/net/Uri;

    iput-object p4, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iput-object p5, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iput-object p3, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mResult:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    return-void
.end method

.method public setTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->mTask:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    return-void
.end method

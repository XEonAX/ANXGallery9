.class public Lcom/miui/gallery/search/core/display/icon/IconImageLoader;
.super Ljava/lang/Object;
.source "IconImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;,
        Lcom/miui/gallery/search/core/display/icon/IconImageLoader$SingletonHolder;
    }
.end annotation


# static fields
.field private static final sURIMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mMemoryCache:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/SearchIconItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->sURIMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "web"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Lcom/google/common/cache/CacheBuilder;->maximumSize(J)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->recordStats()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->mMemoryCache:Lcom/google/common/cache/Cache;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/core/display/icon/IconImageLoader$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->submitTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V

    return-void
.end method

.method static synthetic access$200(Landroid/net/Uri;Landroid/widget/ImageView;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->generateKey(Landroid/net/Uri;Landroid/widget/ImageView;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private cancelHolderTask(Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;)V
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getTask()Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "IconImageLoader"

    const-string v2, "Cancel holder task %s"

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;->isUseDiskCache()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/context/SearchContext;->getIconLoaderCacheExecutor()Lcom/miui/gallery/search/core/context/TaskExecutor;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/miui/gallery/search/core/context/TaskExecutor;->cancel(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/context/SearchContext;->getIconLoaderExecutor()Lcom/miui/gallery/search/core/context/TaskExecutor;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/miui/gallery/search/core/context/TaskExecutor;->cancel(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V

    :goto_0
    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;->setCancelled()V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->setTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V

    :cond_1
    return-void
.end method

.method private static generateKey(Landroid/net/Uri;Landroid/widget/ImageView;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "imageView"

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const-string p0, ""

    return-object p0
.end method

.method public static getInstance()Lcom/miui/gallery/search/core/display/icon/IconImageLoader;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$SingletonHolder;->INSTANCE:Lcom/miui/gallery/search/core/display/icon/IconImageLoader;

    return-object v0
.end method

.method private internalDisplayImage(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Z)V
    .locals 11

    move-object v0, p0

    move-object v7, p2

    move-object v2, p4

    move-object/from16 v5, p5

    const/4 v1, 0x0

    const/4 v3, 0x1

    if-eqz v7, :cond_1

    const-string v4, "image"

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v4

    sget-object v6, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-eq v4, v6, :cond_1

    const/4 v1, 0x1

    :cond_1
    const/4 v4, 0x0

    :goto_0
    if-eqz v5, :cond_2

    invoke-virtual/range {p5 .. p5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->shouldShowImageOnLoading()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {p4}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageOnLoading(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {p4, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    if-eqz v1, :cond_3

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {v4, p4}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v1 .. v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    return-void

    :cond_3
    if-nez v4, :cond_4

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    const/4 v3, 0x0

    new-instance v4, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {v4, p4}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v1 .. v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    return-void

    :cond_4
    sget-object v1, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    if-ne v1, v3, :cond_5

    const-string v1, "url"

    invoke-virtual {p2, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v3

    invoke-virtual {v3, v1, p4, v5}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void

    :cond_5
    invoke-static {p4}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getImageHolder(Landroid/widget/ImageView;)Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;

    move-result-object v9

    invoke-static {p2, p4}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->generateKey(Landroid/net/Uri;Landroid/widget/ImageView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v9}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->hasRunningTask()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v9}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->displayResult()V

    goto :goto_1

    :cond_6
    invoke-direct {p0, v9}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->cancelHolderTask(Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;)V

    :goto_1
    move-object v1, v9

    move-object v2, p4

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->set(Landroid/widget/ImageView;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    iget-object v1, v0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->mMemoryCache:Lcom/google/common/cache/Cache;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/cache/SearchIconItem;

    if-eqz v1, :cond_a

    iget-object v2, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    const/4 v3, 0x0

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    if-eqz v2, :cond_7

    new-instance v2, Lcom/miui/gallery/util/face/FaceRegionRectF;

    iget-object v4, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v6, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v7, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    iget-object v7, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    iget-object v8, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    iget v8, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionOrientation:I

    move-object p1, v2

    move p2, v4

    move p3, v5

    move p4, v6

    move/from16 p5, v7

    move/from16 p6, v8

    invoke-direct/range {p1 .. p6}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    goto :goto_2

    :cond_7
    move-object v2, v3

    :goto_2
    new-instance v4, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    iget-object v5, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    if-eqz v5, :cond_8

    iget-object v5, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    goto :goto_3

    :cond_8
    move-object v5, v3

    :goto_3
    iget-object v6, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->filePath:Ljava/lang/String;

    iget-object v7, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    if-eqz v7, :cond_9

    iget-object v1, v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    :cond_9
    const/4 v1, 0x0

    move-object p1, v4

    move-object p2, v5

    move-object p3, v6

    move-object p4, v3

    move-object/from16 p5, v2

    move/from16 p6, v1

    invoke-direct/range {p1 .. p6}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;-><init>(Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Landroid/graphics/RectF;Z)V

    invoke-virtual {v9, v4}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->consume(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;)Z

    return-void

    :cond_a
    new-instance v10, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v5

    const/4 v8, 0x0

    move-object v1, v10

    move-object v2, p1

    move-object v3, p2

    move-object v4, v9

    move/from16 v6, p7

    move/from16 v7, p7

    invoke-direct/range {v1 .. v8}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;-><init>(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/search/core/Consumer;Landroid/os/Handler;ZZZ)V

    invoke-virtual {v9, v10}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader$IconLoaderHolder;->setTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V

    invoke-static {v10}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->submitTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V

    return-void
.end method

.method private static submitTask(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;->isUseDiskCache()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/context/SearchContext;->getIconLoaderCacheExecutor()Lcom/miui/gallery/search/core/context/TaskExecutor;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/miui/gallery/search/core/context/TaskExecutor;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/context/SearchContext;->getIconLoaderExecutor()Lcom/miui/gallery/search/core/context/TaskExecutor;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/miui/gallery/search/core/context/TaskExecutor;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public displayImage(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 8

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->internalDisplayImage(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Z)V

    return-void
.end method

.method public displayImageEager(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 8

    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->internalDisplayImage(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Z)V

    return-void
.end method

.method public getMemoryCache()Lcom/google/common/cache/Cache;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/Cache<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/SearchIconItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->mMemoryCache:Lcom/google/common/cache/Cache;

    return-object v0
.end method

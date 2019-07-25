.class public Lcom/miui/gallery/activity/HomePageStartupHelper;
.super Ljava/lang/Object;
.source "HomePageStartupHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;,
        Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;,
        Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "HomePageStartupHelper"


# instance fields
.field private final MICRO_THUMB_COLUMN_NUMBER:I

.field private final MICRO_THUMB_PRELOAD_MAX_COUNT:I

.field private mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

.field private mContext:Landroid/content/Context;

.field private mCursorLock:Ljava/lang/Object;

.field private mDataLoadFuture:Lcom/miui/gallery/threadpool/Future;

.field private mDataLoadListener:Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;

.field private volatile mHomePageCursor:Landroid/database/Cursor;

.field private volatile mIsDataInitialized:Z

.field private volatile mIsDestroyed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    iput v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->MICRO_THUMB_COLUMN_NUMBER:I

    iget v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->MICRO_THUMB_COLUMN_NUMBER:I

    mul-int/lit8 v0, v0, 0x6

    iput v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->MICRO_THUMB_PRELOAD_MAX_COUNT:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mCursorLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDataInitialized:Z

    iput-boolean v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDestroyed:Z

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mHomePageCursor:Landroid/database/Cursor;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/activity/HomePageStartupHelper;Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mHomePageCursor:Landroid/database/Cursor;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/activity/HomePageStartupHelper;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/miui/gallery/activity/HomePageStartupHelper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDestroyed:Z

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/activity/HomePageStartupHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->closeCursor()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/activity/HomePageStartupHelper;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mCursorLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/activity/HomePageStartupHelper;Ljava/util/ArrayList;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->getPreloadImageCount(Ljava/util/ArrayList;)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/activity/HomePageStartupHelper;)Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadListener:Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/activity/HomePageStartupHelper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDataInitialized:Z

    return p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/activity/HomePageStartupHelper;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->preloadHomePageImages(Ljava/util/ArrayList;)V

    return-void
.end method

.method private closeCursor()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mCursorLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mHomePageCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mHomePageCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getPreloadImageCount(Ljava/util/ArrayList;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->MICRO_THUMB_COLUMN_NUMBER:I

    iget v2, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->MICRO_THUMB_PRELOAD_MAX_COUNT:I

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v3, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v1, v4

    add-int v5, v1, v3

    if-le v5, v2, :cond_2

    goto :goto_1

    :cond_2
    rem-int/2addr v4, v0

    if-eqz v4, :cond_1

    sub-int v4, v0, v4

    add-int/2addr v3, v4

    goto :goto_0

    :cond_3
    :goto_1
    add-int p1, v3, v1

    if-ge p1, v2, :cond_4

    goto :goto_2

    :cond_4
    sub-int v1, v2, v3

    :goto_2
    sget-object p1, Lcom/miui/gallery/activity/HomePageStartupHelper;->TAG:Ljava/lang/String;

    const-string v0, "preload image count %d"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method

.method private loadHomePageData()Lcom/miui/gallery/threadpool/Future;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/activity/HomePageStartupHelper$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/activity/HomePageStartupHelper$1;-><init>(Lcom/miui/gallery/activity/HomePageStartupHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    return-object v0
.end method

.method private preloadHomePageImages(Ljava/util/ArrayList;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_4

    iget-boolean v1, v0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDestroyed:Z

    if-nez v1, :cond_4

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->highPriority(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;

    iget-boolean v5, v0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDestroyed:Z

    if-eqz v5, :cond_1

    sget-object v1, Lcom/miui/gallery/activity/HomePageStartupHelper;->TAG:Ljava/lang/String;

    const-string v2, "preload home page images break"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;->access$1000(Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_2

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v5

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;->access$1000(Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :goto_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v7

    iget-object v7, v7, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    sget-object v8, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    invoke-virtual {v5, v6, v7, v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->createImageAware(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object v11

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v9

    sget-object v5, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;->access$1100(Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v12

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v4

    iget-object v13, v4, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v9 .. v16}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_3
    :goto_2
    return-void

    :cond_4
    :goto_3
    return-void
.end method


# virtual methods
.method public onActivityCreate()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->loadHomePageData()Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public onActivityDestroy()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDestroyed:Z

    invoke-direct {p0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->closeCursor()V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_1
    return-void
.end method

.method public onStartup()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mAttacher:Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    invoke-interface {v0}, Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;->onStartup()V

    :cond_0
    return-void
.end method

.method public setDataLoaderListener(Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mIsDataInitialized:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mHomePageCursor:Landroid/database/Cursor;

    invoke-interface {p1, v0}, Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;->onDataLoadFinish(Landroid/database/Cursor;)V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/activity/HomePageStartupHelper;->TAG:Ljava/lang/String;

    const-string v1, "preload home page cursor failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper;->mDataLoadListener:Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;

    :goto_0
    return-void
.end method

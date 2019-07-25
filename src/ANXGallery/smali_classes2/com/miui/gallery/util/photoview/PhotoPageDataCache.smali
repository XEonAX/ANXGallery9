.class public Lcom/miui/gallery/util/photoview/PhotoPageDataCache;
.super Ljava/lang/Object;
.source "PhotoPageDataCache.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/util/photoview/PhotoPageDataCache;


# instance fields
.field private mAppointedInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mArguments:Landroid/os/Bundle;

.field private mCacheItem:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mItemViewParent:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mPageLayout:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mPairKey:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getAllItemInfos()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getViewParent()Landroid/view/ViewGroup;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f0902cd

    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v4, v5}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_2
    return-object v1
.end method

.method public static getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->sInstance:Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    invoke-direct {v0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->sInstance:Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->sInstance:Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    return-object v0
.end method

.method private getViewParent()Landroid/view/ViewGroup;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static preLoad(Landroid/content/Context;Lcom/miui/gallery/model/ImageLoadParams;)V
    .locals 8

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getDisplayImageOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getSecretKey()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v1

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v1, v2, :cond_1

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    move-object v2, v0

    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/util/ProcessingMediaHelper;->isMediaInProcessing(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/Config$ThumbConfig;->appendBlurOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    :cond_2
    move-object v4, p0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p0

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getRegionRectF()Landroid/graphics/RectF;

    move-result-object v7

    invoke-virtual/range {v1 .. v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPairKey:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPairKey:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    const-string v0, "PhotoPageDataCache"

    const-string v1, "clear"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mArguments:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    :cond_2
    return-void
.end method

.method public getArguments()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mArguments:Landroid/os/Bundle;

    return-object v0
.end method

.method public getCacheItem()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mCacheItem:Ljava/lang/ref/SoftReference;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    const-string v1, "PhotoPageDataCache"

    const-string v2, "cache item %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 10

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getViewParent()Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    const v2, 0x7fffffff

    const/high16 v3, -0x80000000

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    const/4 v5, 0x0

    move-object v2, v1

    move-object v6, v2

    const v3, 0x7fffffff

    const/high16 v7, -0x80000000

    :goto_0
    if-ge v5, v4, :cond_3

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f0902cd

    invoke-virtual {v8, v9}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, p1, :cond_0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v8, p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object p1

    return-object p1

    :cond_0
    if-ge v9, v3, :cond_1

    move-object v2, v8

    move v3, v9

    :cond_1
    if-le v9, v7, :cond_2

    move-object v6, v8

    move v7, v9

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    if-ge p1, v3, :cond_4

    invoke-static {v2, v3}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v0

    new-instance v7, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v3

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v1

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v2

    sub-int v4, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v6

    move-object v1, v7

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/photoview/ItemViewInfo;-><init>(IIIII)V

    return-object v7

    :cond_4
    if-eqz v6, :cond_5

    if-le p1, v7, :cond_5

    invoke-static {v6, v3}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v0

    new-instance v7, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v3

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v1

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v2

    add-int v4, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v6

    move-object v1, v7

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/photoview/ItemViewInfo;-><init>(IIIII)V

    return-object v7

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {v2}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getPosition()I

    move-result v3

    if-ne v3, p1, :cond_6

    return-object v2

    :cond_7
    return-object v1
.end method

.method public getPageLayout()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPageLayout:Ljava/lang/ref/SoftReference;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    const-string v1, "PhotoPageDataCache"

    const-string v2, "page layout %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mArguments:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mArguments:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public isItemVisible(I)Z
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getViewParent()Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f0902cd

    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne p1, v4, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public restoreInstance(Landroid/os/Bundle;)V
    .locals 1

    const-string v0, "key_save_arguments"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->setArguments(Landroid/os/Bundle;)V

    const-string v0, "key_save_iteminfos"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->setAppointedItemViewInfos(Ljava/util/List;)V

    return-void
.end method

.method public saveInstance(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "photo_enter_transit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "key_save_arguments"

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_0
    const-string v0, "key_save_iteminfos"

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getAllItemInfos()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method

.method public setAppointedItemViewInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mAppointedInfos:Ljava/util/List;

    return-void
.end method

.method public setArguments(Landroid/os/Bundle;)V
    .locals 4

    const-string v0, "PhotoPageDataCache"

    const-string v1, "setArguments %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-wide v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPairKey:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mPairKey:J

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mArguments:Landroid/os/Bundle;

    return-void
.end method

.method public setItemViewParent(Landroid/view/ViewGroup;)V
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->mItemViewParent:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public viewToPosition(I)Z
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getViewParent()Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/util/photoview/ScrollableView;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/util/photoview/ScrollableView;

    invoke-interface {v0, p1}, Lcom/miui/gallery/util/photoview/ScrollableView;->viewToPosition(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

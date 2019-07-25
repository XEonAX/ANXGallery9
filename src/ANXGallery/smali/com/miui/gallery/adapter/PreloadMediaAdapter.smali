.class public abstract Lcom/miui/gallery/adapter/PreloadMediaAdapter;
.super Lcom/miui/gallery/adapter/BaseMediaAdapter;
.source "PreloadMediaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;,
        Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/BaseMediaAdapter<",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

.field private mPreloadNum:I

.field private mPreloadViewList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;",
            ">;"
        }
    .end annotation
.end field

.field private mRecycleViewList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sPreloadNum:I

    iput p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadNum:I

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mRecycleViewList:Ljava/util/List;

    return-void
.end method

.method private doPreload(I)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->isBackwards()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_2

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    iget v1, v1, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->position:I

    if-le v1, p1, :cond_0

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    iget v1, v1, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->position:I

    if-ge v1, p1, :cond_0

    goto :goto_0

    :goto_1
    if-eqz v1, :cond_2

    return-void

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    if-eqz v0, :cond_4

    iget v5, v4, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->position:I

    if-le v5, p1, :cond_3

    :goto_3
    const/4 v5, 0x1

    goto :goto_4

    :cond_3
    const/4 v5, 0x0

    goto :goto_4

    :cond_4
    iget v5, v4, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->position:I

    if-ge v5, p1, :cond_3

    goto :goto_3

    :goto_4
    if-eqz v5, :cond_5

    goto :goto_5

    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    iget-object v5, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mRecycleViewList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    :goto_5
    const/4 v1, -0x1

    if-eqz v0, :cond_7

    const/4 v4, 0x1

    goto :goto_6

    :cond_7
    const/4 v4, -0x1

    :goto_6
    add-int/2addr v4, p1

    iget-object v5, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_9

    iget-object v4, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    iget-object v5, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v3

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    iget v4, v4, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->position:I

    if-eqz v0, :cond_8

    const/4 v1, 0x1

    :cond_8
    add-int/2addr v4, v1

    :cond_9
    if-eqz v0, :cond_a

    iget v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadNum:I

    add-int/2addr p1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getItemCount()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_7

    :cond_a
    iget v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadNum:I

    sub-int/2addr p1, v1

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_7
    if-eqz v0, :cond_b

    :goto_8
    if-gt v4, p1, :cond_c

    invoke-direct {p0, v4}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->loadImage(I)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    :cond_b
    :goto_9
    if-lt v4, p1, :cond_c

    invoke-direct {p0, v4}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->loadImage(I)V

    add-int/lit8 v4, v4, -0x1

    goto :goto_9

    :cond_c
    return-void
.end method

.method private getViewAware()Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mRecycleViewList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mRecycleViewList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V

    return-object v0
.end method

.method private isBackwards()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->getScrollState()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private loadImage(I)V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getViewAware()Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->setPosition(I)Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->setImageUri(Ljava/lang/String;)Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getDisplayImageSize(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getDisplayScaleType(I)Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;->setScaleType(Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadViewAware;

    new-instance v2, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInSubMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preferSyncLoadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    invoke-virtual {v2, v1, v0, p1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadViewList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private needPreload(I)Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadNum:I

    const/4 v1, 0x0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->getScrollState()I

    move-result v0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    return v1

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->getFirstPosition()I

    move-result v0

    if-gt p1, v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->getLastPosition()I

    move-result v0

    if-lt p1, v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private preload(I)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->needPreload(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->doPreload(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract doBindData(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
.end method

.method public final doBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->doBindData(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->preload(I)V

    return-void
.end method

.method public generateWrapScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->generateWrapScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;-><init>(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    iget-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mPreloadListener:Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->initDisplayImageOptions()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preferSyncLoadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

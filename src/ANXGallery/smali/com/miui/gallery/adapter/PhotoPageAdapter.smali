.class public Lcom/miui/gallery/adapter/PhotoPageAdapter;
.super Lcom/miui/gallery/widget/PagerAdapter;
.source "PhotoPageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;
.implements Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;,
        Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;,
        Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;,
        Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;,
        Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;,
        Lcom/miui/gallery/adapter/PhotoPageAdapter$PlaceHolderItem;
    }
.end annotation


# instance fields
.field private isPreviewing:Z

.field private mCachedViews:[Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/LinkedList<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/ui/PhotoPageItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCheckSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

.field private mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

.field private mDataSet:Lcom/miui/gallery/model/BaseDataSet;

.field private mInitCount:I

.field private mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

.field private mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

.field private mPreviewedListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;

.field private mPreviewingItem:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/ui/PhotoPageItem;",
            ">;"
        }
    .end annotation
.end field

.field private mProcessingMediaMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;"
        }
    .end annotation
.end field

.field private mTransitInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;


# direct methods
.method public constructor <init>(ILcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PagerAdapter;-><init>()V

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCheckSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    iput p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mInitCount:I

    iput-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    iput-object p3, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mTransitInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getViewTypeCount()I

    move-result p1

    new-array p2, p1, [Ljava/util/LinkedList;

    iput-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCachedViews:[Ljava/util/LinkedList;

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCachedViews:[Ljava/util/LinkedList;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    aput-object v0, p3, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    iput-object p4, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewedListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;

    iput-object p5, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    :cond_1
    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/PhotoPageAdapter;)Lcom/miui/gallery/model/BaseDataSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    return-object p0
.end method

.method private bindData(Lcom/miui/gallery/ui/PhotoPageItem;I)V
    .locals 4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0902cd

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->setTag(ILjava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v0, v1, p2}, Lcom/miui/gallery/model/ImageLoadParams;->match(Lcom/miui/gallery/model/BaseDataItem;I)Z

    move-result p2

    if-eqz p2, :cond_8

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    if-nez p2, :cond_0

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getCacheItem()Lcom/miui/gallery/model/ImageLoadParams;

    move-result-object p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1, p2, p0}, Lcom/miui/gallery/ui/PhotoPageItem;->setCacheItem(Lcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->needTransit()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mTransitInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {p1, p2, p0}, Lcom/miui/gallery/ui/PhotoPageItem;->animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz p2, :cond_8

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getDataItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    if-nez p2, :cond_8

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v0}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v2}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v2}, Lcom/miui/gallery/model/ImageLoadParams;->getPos()I

    move-result v2

    invoke-virtual {p2, v0, v2}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    if-eqz p2, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mProcessingMediaMap:Ljava/util/Map;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mProcessingMediaMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/provider/ProcessingMedia;

    :cond_2
    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_8

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getProcessingMedia()Lcom/miui/gallery/provider/ProcessingMedia;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mProcessingMediaMap:Ljava/util/Map;

    if-eqz v3, :cond_4

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mProcessingMediaMap:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/ProcessingMedia;

    :cond_4
    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getDataItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {v3, v0}, Lcom/miui/gallery/model/BaseDataItem;->isModified(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isProcessingStatusChanged(Lcom/miui/gallery/provider/ProcessingMedia;Lcom/miui/gallery/provider/ProcessingMedia;)Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v1, v0, p2}, Lcom/miui/gallery/model/ImageLoadParams;->match(Lcom/miui/gallery/model/BaseDataItem;I)Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/model/ImageLoadParams;)V

    goto :goto_0

    :cond_6
    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_7
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    if-nez p1, :cond_8

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyPreviewedCallback()V

    :cond_8
    :goto_1
    return-void
.end method

.method private clearPreviewParams()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public static getMinSlideHeight()F
    .locals 2

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e4ccccd    # 0.2f

    mul-float v0, v0, v1

    return v0
.end method

.method public static getMinSlideWidth()F
    .locals 2

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    return v0
.end method

.method private getPageItem(ILandroid/view/ViewGroup;)Lcom/miui/gallery/ui/PhotoPageItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCachedViews:[Ljava/util/LinkedList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCachedViews:[Ljava/util/LinkedList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageItem;

    if-eqz v0, :cond_0

    const-string p1, "PhotoPageAdapter"

    const-string p2, "instantiateItem reuse photoview"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getCacheItem()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string p1, "PhotoPageAdapter"

    const-string p2, "cache item"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageItem;

    return-object v0

    :cond_1
    const-string v0, "PhotoPageAdapter"

    const-string v1, "instantiateItem new photoview"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getLayoutId(I)I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageItem;

    return-object p1
.end method

.method public static isItemValidate(Ljava/lang/Object;)Z
    .locals 0

    if-eqz p0, :cond_0

    instance-of p0, p0, Lcom/miui/gallery/ui/PhotoPageItem;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isProcessingStatusChanged(Lcom/miui/gallery/provider/ProcessingMedia;Lcom/miui/gallery/provider/ProcessingMedia;)Z
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    if-eqz p2, :cond_2

    if-nez p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private needTransit()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mTransitInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mTransitInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->isLocationValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private notifyPreviewedCallback()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewedListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageAdapter"

    const-string v1, "notifyPreviewedCallback"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewedListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;->onPreviewed()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewedListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;

    :cond_0
    return-void
.end method

.method private onPreviewedEnd()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyPreviewedCallback()V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->clearPreviewParams()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method private startOrFinishItemActionMode(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-static {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->access$000(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getOriginIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getRenderIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageItem;->startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->finishActionMode()V

    :goto_0
    return-void
.end method


# virtual methods
.method public changeDataSet(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->changeDataSet(Lcom/miui/gallery/model/BaseDataSet;Z)V

    return-void
.end method

.method public changeDataSet(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 4

    const-string v0, "PhotoPageAdapter"

    const-string v1, "change dataset [%s] to [%s], ignoreDelayNotify %s"

    iget-object v2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, p1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->clearPreviewParams()V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyPreviewedCallback()V

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 p1, 0x1

    iget-boolean p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewingItem:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/PhotoPageItem;

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getPos()I

    move-result p1

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->refreshItem(Ljava/lang/Object;I)V

    const/4 p1, 0x0

    :cond_2
    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyDataSetChanged()V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->notifyDataChanged()V

    :cond_4
    return-void
.end method

.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2

    invoke-static {p3}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isItemValidate(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageAdapter"

    const-string v1, "destroyItem %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    check-cast p3, Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const p1, 0x7f0902d5

    invoke-virtual {p3, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCachedViews:[Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, p2, p1

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    invoke-virtual {p3, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->setPhotoPageCallback(Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V

    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    return v0

    :cond_1
    :goto_0
    iget v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mInitCount:I

    return v0
.end method

.method public getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v1
.end method

.method public getDataSet()Lcom/miui/gallery/model/BaseDataSet;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    return-object v0
.end method

.method public getItemPosition(Ljava/lang/Object;I)I
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    const/4 v1, -0x1

    const/4 v2, -0x3

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isItemValidate(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return v2

    :cond_0
    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_5

    const/4 v0, -0x2

    if-ltz p2, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v1

    if-lt p2, v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isTypeMatch(Ljava/lang/Object;I)Z

    move-result p1

    if-eqz p1, :cond_3

    return v2

    :cond_3
    return v0

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method protected getLayoutId(I)I
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const p1, 0x7f0b0103

    return p1

    :pswitch_1
    const p1, 0x7f0b0109

    return p1

    :pswitch_2
    const p1, 0x7f0b0104

    return p1

    :pswitch_3
    const p1, 0x7f0b0105

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getSlipWidth(II)I
    .locals 3

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOrientation()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/util/ExifUtil;->isWidthHeightRotated(I)Z

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_0

    int-to-float v1, p1

    mul-float v1, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v1, v0

    goto :goto_0

    :cond_0
    int-to-float v1, p1

    mul-float v1, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v1, v0

    :goto_0
    invoke-static {}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getMinSlideWidth()F

    move-result v0

    cmpl-float v0, v1, v0

    if-lez v0, :cond_1

    float-to-int p1, v1

    return p1

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/widget/PagerAdapter;->getSlipWidth(II)I

    move-result p1

    return p1
.end method

.method protected getViewType(I)I
    .locals 6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/model/ImageLoadParams;->match(Lcom/miui/gallery/model/BaseDataItem;I)Z

    move-result p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->isGif()Z

    move-result p1

    if-eqz p1, :cond_0

    return v5

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_1

    return v4

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPreviewCache:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->isFromFace()Z

    move-result p1

    if-eqz p1, :cond_2

    return v3

    :cond_2
    return v2

    :cond_3
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isGif()Z

    move-result p1

    if-eqz p1, :cond_4

    return v5

    :cond_4
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_5

    return v4

    :cond_5
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->hasFace()Z

    move-result p1

    if-eqz p1, :cond_6

    return v3

    :cond_6
    return v2

    :cond_7
    const/4 p1, -0x1

    return p1
.end method

.method protected getViewTypeCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getViewType(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    new-instance p1, Lcom/miui/gallery/adapter/PhotoPageAdapter$PlaceHolderItem;

    invoke-direct {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$PlaceHolderItem;-><init>()V

    return-object p1

    :cond_0
    const-string v2, "PhotoPageAdapter"

    const-string v3, "instantiateItem %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getPageItem(ILandroid/view/ViewGroup;)Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->bindData(Lcom/miui/gallery/ui/PhotoPageItem;I)V

    const p2, 0x7f0902d5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, p2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p1, v2, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->setPhotoPageCallback(Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->startOrFinishItemActionMode(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-object v2
.end method

.method public isPreviewing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing:Z

    return v0
.end method

.method protected isTypeMatch(Ljava/lang/Object;I)Z
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isItemValidate(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageItem;

    const v0, 0x7f0902d5

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_3

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isGif()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v2, :cond_3

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->hasFace()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v3, 0x3

    if-eq v0, v3, :cond_3

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isGif()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->hasFace()Z

    move-result p2

    if-nez p2, :cond_4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1

    :cond_5
    return v1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onImageLoadFinish(ZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->needTransit()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->onPreviewedEnd()V

    :cond_0
    return-void
.end method

.method public onTransitEnd()V
    .locals 2

    const-string v0, "PhotoPageAdapter"

    const-string v1, "onTransitEnd"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->onPreviewedEnd()V

    return-void
.end method

.method public refreshItem(Ljava/lang/Object;I)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isItemValidate(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageAdapter"

    const-string v1, "refreshItem %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->bindData(Lcom/miui/gallery/ui/PhotoPageItem;I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->startOrFinishItemActionMode(Lcom/miui/gallery/ui/PhotoPageItem;)V

    :cond_0
    return-void
.end method

.method public setProcessingMedias(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mProcessingMediaMap:Ljava/util/Map;

    return-void
.end method

.method public startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mCheckSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->startAction()V

    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    return-object p1
.end method

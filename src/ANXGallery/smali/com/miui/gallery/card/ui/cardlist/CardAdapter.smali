.class public Lcom/miui/gallery/card/ui/cardlist/CardAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "CardAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;,
        Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/app/Activity;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;"
        }
    .end annotation
.end field

.field protected final mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mEmptyView:Landroid/view/View;

.field private mFooterView:Landroid/view/View;

.field private mHeaderView:Landroid/view/View;

.field private mHideFooterWhenEmpty:Z

.field private mHideHeaderWhenEmpty:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHideFooterWhenEmpty:Z

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHideHeaderWhenEmpty:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mContext:Landroid/app/Activity;

    new-instance p1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const v1, 0x7f07019d

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mContext:Landroid/app/Activity;

    return-object p0
.end method

.method private getDataItem(I)Lcom/miui/gallery/card/Card;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v1

    sub-int/2addr p1, v1

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/Card;

    :goto_0
    return-object p1
.end method

.method private getHeaderLayoutCount()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v0

    return v0
.end method

.method private isFooterVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mFooterView:Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getDataItemSize()I

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHideFooterWhenEmpty:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isHeaderVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHeaderView:Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getDataItemSize()I

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHideHeaderWhenEmpty:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public getDataItemSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItemCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getDataItemSize()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isFooterVisible()Z

    move-result v1

    add-int/2addr v0, v1

    :goto_0
    return v0
.end method

.method public getItemViewType(I)I
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getDataItemSize()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isHeaderVisible()Z

    move-result v0

    if-ne p1, v0, :cond_1

    const/4 p1, 0x3

    return p1

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->isFooterVisible()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    if-ne p1, v0, :cond_2

    const/4 p1, 0x2

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    check-cast p1, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;

    invoke-direct {p0, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getDataItem(I)Lcom/miui/gallery/card/Card;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->bindData(Lcom/miui/gallery/card/Card;)V

    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance p1, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHeaderView:Landroid/view/View;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;-><init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;Landroid/view/View;)V

    return-object p1

    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    new-instance p1, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mFooterView:Landroid/view/View;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;-><init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;Landroid/view/View;)V

    return-object p1

    :cond_1
    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    new-instance p1, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mEmptyView:Landroid/view/View;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$ViewHolderImpl;-><init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;Landroid/view/View;)V

    return-object p1

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mContext:Landroid/app/Activity;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b003b

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;-><init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method final refreshNotifyItemChanged(I)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->getHeaderLayoutCount()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mEmptyView:Landroid/view/View;

    return-void
.end method

.method public setFooter(Landroid/view/View;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mFooterView:Landroid/view/View;

    iput-boolean p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mHideFooterWhenEmpty:Z

    return-void
.end method

.method updateDataList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->notifyDataSetChanged()V

    return-void
.end method

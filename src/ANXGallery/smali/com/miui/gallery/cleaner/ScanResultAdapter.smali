.class public Lcom/miui/gallery/cleaner/ScanResultAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ScanResultAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;,
        Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;,
        Lcom/miui/gallery/cleaner/ScanResultAdapter$HeaderHolder;
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
.field private final mContentLayoutMinHeight:I

.field private mContext:Landroid/content/Context;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cleaner/ScanResult;",
            ">;"
        }
    .end annotation
.end field

.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mHeaderView:Landroid/view/View;

.field private final mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field private mNotifyObservers:Lmiui/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/ArraySet<",
            "Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;",
            ">;"
        }
    .end annotation
.end field

.field private final mTitleMarginTop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    new-instance v0, Lmiui/util/ArraySet;

    invoke-direct {v0}, Lmiui/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06008c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mTitleMarginTop:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060085

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mContentLayoutMinHeight:I

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/cleaner/ScanResultAdapter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mContentLayoutMinHeight:I

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/cleaner/ScanResultAdapter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mTitleMarginTop:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public getDataItemSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getDataList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cleaner/ScanResult;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    return-object v0
.end method

.method public getItemCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->getDataItemSize()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    invoke-virtual {p0, p2}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, -0x1

    :goto_0
    check-cast p1, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cleaner/ScanResult;

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->getDataItemSize()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ne p2, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p1, v0, v2}, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->bindData(Lcom/miui/gallery/cleaner/ScanResult;Z)V

    :cond_2
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance p1, Lcom/miui/gallery/cleaner/ScanResultAdapter$HeaderHolder;

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/cleaner/ScanResultAdapter$HeaderHolder;-><init>(Lcom/miui/gallery/cleaner/ScanResultAdapter;Landroid/view/View;)V

    return-object p1

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0048

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;-><init>(Lcom/miui/gallery/cleaner/ScanResultAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 4

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    invoke-virtual {v1}, Lmiui/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;

    invoke-virtual {v2}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getDataObserver()Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    move-result-object v2

    if-eq v2, p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Observer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is already registered."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    new-instance v1, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;-><init>(Lcom/miui/gallery/cleaner/ScanResultAdapter;Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    invoke-virtual {p1, v1}, Lmiui/util/ArraySet;->add(Ljava/lang/Object;)Z

    invoke-super {p0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHeader(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mHeaderView:Landroid/view/View;

    return-void
.end method

.method public unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 4

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mNotifyObservers:Lmiui/util/ArraySet;

    invoke-virtual {v1}, Lmiui/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;

    invoke-virtual {v2}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getDataObserver()Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    move-result-object v3

    if-ne v3, p1, :cond_0

    invoke-super {p0, v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    monitor-exit v0

    return-void

    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Observer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " was not registered."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public updateDataList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cleaner/ScanResult;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter;->mDataList:Ljava/util/List;

    return-void
.end method

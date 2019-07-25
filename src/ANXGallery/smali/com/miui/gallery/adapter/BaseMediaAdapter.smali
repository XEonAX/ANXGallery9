.class public abstract Lcom/miui/gallery/adapter/BaseMediaAdapter;
.super Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;
.source "BaseMediaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;,
        Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">",
        "Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter<",
        "TVH;>;"
    }
.end annotation


# static fields
.field private static volatile sIsGalleryCloudSyncable:Z

.field private static volatile sIsLoginAccount:Z

.field private static sUpdateRunnable:Ljava/lang/Runnable;


# instance fields
.field protected mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

.field protected mSyncStateDisplayOptions:I

.field protected mViewScrollState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_NONE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 1

    const/4 v0, 0x7

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->mViewScrollState:I

    iput-object p2, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    iput p3, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->mSyncStateDisplayOptions:I

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->updateGalleryCloudSyncableState()V

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsLoginAccount:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsLoginAccount:Z

    return p0
.end method

.method static synthetic access$100()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsGalleryCloudSyncable:Z

    return v0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsGalleryCloudSyncable:Z

    return p0
.end method


# virtual methods
.method public abstract doBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation
.end method

.method public generateWrapScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/adapter/BaseMediaAdapter$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter$1;-><init>(Lcom/miui/gallery/adapter/BaseMediaAdapter;Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-object v0
.end method

.method public getCheckedItem(I)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getItemKey(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setId(J)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getSha1(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setSha1(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getMicroThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setMicroThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getOriginFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setOriginFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->build()Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getDisplayImageSize(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object p1
.end method

.method protected getDisplayScaleType(I)Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;
    .locals 0

    sget-object p1, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    return-object p1
.end method

.method public getItemDecodeRectF(I)Landroid/graphics/RectF;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getItemKey(I)J
.end method

.method public abstract getMimeType(I)Ljava/lang/String;
.end method

.method public abstract getSha1(I)Ljava/lang/String;
.end method

.method protected getSyncStateInternal(I)I
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsGalleryCloudSyncable:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sIsLoginAccount:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    const p1, 0x7fffffff

    :cond_1
    :goto_0
    return p1
.end method

.method public isFavorite(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    return-void
.end method

.method public final onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f0902cd

    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->doBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    return-void
.end method

.method protected onViewScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0

    iput p2, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->mViewScrollState:I

    return-void
.end method

.method protected onViewScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 0

    return-void
.end method

.method public updateGalleryCloudSyncableState()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;-><init>(Lcom/miui/gallery/adapter/BaseMediaAdapter;)V

    sput-object v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/adapter/BaseMediaAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

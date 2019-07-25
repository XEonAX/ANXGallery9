.class public Lcom/miui/gallery/util/photoview/TileView;
.super Ljava/lang/Object;
.source "TileView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;
    }
.end annotation


# instance fields
.field private mAttachViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mDecodeHandler:Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;

.field private mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

.field private mDestroyedTiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private mDrawingTiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private mIsMemoryTrimmed:Z

.field private mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

.field private mRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

.field private mRefreshId:I

.field private mRotateMatrix:Landroid/graphics/Matrix;

.field private mRotation:F

.field private mTempDecodeTiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private mTempDrawingTiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private mTileIntersect:Landroid/graphics/RectF;

.field private mTileRange:Landroid/graphics/Rect;

.field private final mTileSize:I

.field private mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

.field private mViewPort:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/photoview/TileBitProvider;Landroid/view/View;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDestroyedTiles:Ljava/util/List;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDecodeTiles:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mAttachViewRef:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    iput-object p4, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    new-instance p2, Lcom/miui/gallery/util/photoview/TileDecodeManager;

    new-instance p3, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;-><init>(Lcom/miui/gallery/util/photoview/TileView;Lcom/miui/gallery/util/photoview/TileView$1;)V

    iput-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeHandler:Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;

    iget-object p4, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-direct {p2, p3, p4}, Lcom/miui/gallery/util/photoview/TileDecodeManager;-><init>(Landroid/os/Handler;Lcom/miui/gallery/util/photoview/TileBitProvider;)V

    iput-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/TileView;->computeTileSize(Lcom/miui/gallery/util/photoview/TileBitProvider;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/photoview/TileView;)Lcom/miui/gallery/util/photoview/TileDecodeManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/photoview/TileView;)Landroid/util/SparseArray;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/photoview/TileView;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileView;->invalidate()Z

    move-result p0

    return p0
.end method

.method private calculateInSampleSize(Landroid/graphics/RectF;)I
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v1}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    :goto_0
    div-int v3, v0, v2

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpl-float v3, v3, v4

    if-gez v3, :cond_1

    div-int v3, v1, v2

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_0

    goto :goto_1

    :cond_0
    return v2

    :cond_1
    :goto_1
    mul-int/lit8 v2, v2, 0x2

    goto :goto_0
.end method

.method private ceil(II)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v1, v1, v0

    mul-int v1, v1, p2

    if-ge v1, p1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v0, v0, p1

    mul-int v0, v0, p2

    return v0
.end method

.method private computeTileSize(Lcom/miui/gallery/util/photoview/TileBitProvider;)I
    .locals 3

    invoke-interface {p1}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageHeight()I

    move-result v0

    invoke-interface {p1}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result p1

    const/16 v1, 0x4cc

    const/16 v2, 0x400

    if-le v0, v2, :cond_0

    if-ge v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x400

    :goto_0
    if-le p1, v2, :cond_1

    if-ge p1, v1, :cond_1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_1
    return v0
.end method

.method private floor(II)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v1, v1, v0

    mul-int v1, v1, p2

    if-gt v1, p1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    iget p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v0, v0, p1

    mul-int v0, v0, p2

    return v0
.end method

.method private getAttachView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mAttachViewRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mAttachViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/TileView;->cleanup()V

    :cond_1
    return-object v0
.end method

.method private increaseRefreshId()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    return-void
.end method

.method private invalidate()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileView;->getAttachView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private layoutTiles(Landroid/graphics/RectF;F)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-virtual {v2}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    invoke-virtual {v2, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;->intersect(FFFF)Z

    iput p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotation:F

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, p2, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {p2}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getRotation()I

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v2}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getRotation()I

    move-result v2

    neg-int v2, v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p2, v2, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    invoke-virtual {p2, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/TileView;->calculateInSampleSize(Landroid/graphics/RectF;)I

    move-result v8

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v2

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v2}, Lcom/miui/gallery/util/photoview/TileBitProvider;->isFlip()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->right:F

    iget v2, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr p2, v2

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v2}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v3}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr p2, v4

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v4}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float p2, p2, v4

    float-to-int p2, p2

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float/2addr v4, v5

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v5}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float v4, v4, v5

    float-to-int v4, v4

    int-to-float v5, p2

    iget-object v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    mul-float v6, v6, v2

    add-float/2addr v5, v6

    float-to-int v5, v5

    int-to-float v6, v4

    iget-object v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileIntersect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v7, v7, v3

    add-float/2addr v6, v7

    float-to-int v6, v6

    iget-object v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    invoke-direct {p0, p2, v8}, Lcom/miui/gallery/util/photoview/TileView;->floor(II)I

    move-result p2

    invoke-direct {p0, v4, v8}, Lcom/miui/gallery/util/photoview/TileView;->floor(II)I

    move-result v4

    invoke-direct {p0, v5, v8}, Lcom/miui/gallery/util/photoview/TileView;->ceil(II)I

    move-result v5

    invoke-direct {p0, v6, v8}, Lcom/miui/gallery/util/photoview/TileView;->ceil(II)I

    move-result v6

    invoke-virtual {v7, p2, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->left:I

    int-to-float p2, p2

    div-float/2addr p2, v2

    iget v4, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, p2

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->top:I

    int-to-float p2, p2

    div-float/2addr p2, v3

    iget v5, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v5, p2

    iget p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int p2, p2, v8

    int-to-float p2, p2

    div-float v6, p2, v2

    iget p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int p2, p2, v8

    int-to-float p2, p2

    div-float v7, p2, v3

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/util/photoview/TileView;->refreshTiles(FFFFI)V

    const-string p2, "TileView"

    const-string v2, "layoutTiles, tile range: %s, display rect: %s, costs %d ms."

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->toShortString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, v2, v3, p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static makeTileKey(Landroid/graphics/Rect;)I
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/16 v0, 0x20f

    iget v1, p0, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, p0

    return v0
.end method

.method private obtainTile(Landroid/graphics/Rect;Landroid/graphics/RectF;I)Lcom/miui/gallery/util/photoview/Tile;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDestroyedTiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDestroyedTiles:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/util/photoview/Tile;->updateTileParam(Landroid/graphics/Rect;I)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/photoview/Tile;->updateDisplayParam(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/photoview/Tile;

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/miui/gallery/util/photoview/Tile;-><init>(Landroid/graphics/Rect;Landroid/graphics/RectF;ILcom/miui/gallery/util/photoview/BitmapRecycleCallback;)V

    :goto_0
    return-object v0
.end method

.method private refreshTiles(FFFFI)V
    .locals 10

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileView;->increaseRefreshId()V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    const/4 v1, 0x0

    move v3, p2

    const/4 p2, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    if-ge v0, v4, :cond_3

    add-int/lit8 p2, p2, 0x1

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    move v5, p1

    const/4 v4, 0x0

    :goto_1
    iget-object v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileRange:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    if-ge v2, v6, :cond_2

    add-int/lit8 v4, v4, 0x1

    new-instance v6, Landroid/graphics/Rect;

    iget v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v7, v7, p5

    add-int/2addr v7, v2

    iget v8, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v8, v8, p5

    add-int/2addr v8, v0

    invoke-direct {v6, v2, v0, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v7, Landroid/graphics/RectF;

    add-float v8, v5, p3

    add-float v9, v3, p4

    invoke-direct {v7, v5, v3, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-static {v6}, Lcom/miui/gallery/util/photoview/TileView;->makeTileKey(Landroid/graphics/Rect;)I

    move-result v5

    iget-object v9, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v9, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/util/photoview/Tile;

    if-eqz v9, :cond_0

    invoke-virtual {v9, v7}, Lcom/miui/gallery/util/photoview/Tile;->updateDisplayParam(Landroid/graphics/RectF;)V

    iget-object v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v6, v5, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    :cond_0
    iget-object v9, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-virtual {v9, v5}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->getDecodingTile(I)Lcom/miui/gallery/util/photoview/Tile;

    move-result-object v9

    if-eqz v9, :cond_1

    invoke-virtual {v9, v7}, Lcom/miui/gallery/util/photoview/Tile;->updateDisplayParam(Landroid/graphics/RectF;)V

    goto :goto_2

    :cond_1
    invoke-direct {p0, v6, v7, p5}, Lcom/miui/gallery/util/photoview/TileView;->obtainTile(Landroid/graphics/Rect;Landroid/graphics/RectF;I)Lcom/miui/gallery/util/photoview/Tile;

    move-result-object v9

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDecodeTiles:Ljava/util/List;

    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v5, "TileView"

    const-string v6, "tile create %s"

    invoke-static {v5, v6, v9}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    invoke-virtual {v9, p2, v4}, Lcom/miui/gallery/util/photoview/Tile;->setIndex(II)V

    iget v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    invoke-virtual {v9, v5}, Lcom/miui/gallery/util/photoview/Tile;->setRefreshId(I)V

    iget v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v5, v5, p5

    add-int/2addr v2, v5

    move v5, v8

    goto :goto_1

    :cond_2
    add-float/2addr v3, p4

    iget v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int v2, v2, p5

    add-int/2addr v0, v2

    move v2, v4

    goto :goto_0

    :cond_3
    invoke-direct {p0, p2, v2}, Lcom/miui/gallery/util/photoview/TileView;->trimMemoryIfNeeded(II)V

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    const/4 p2, 0x0

    :goto_3
    if-ge p2, p1, :cond_5

    iget-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    iget-object p4, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p4, p2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result p4

    invoke-virtual {p3, p4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p3

    if-nez p3, :cond_4

    iget-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {p3}, Lcom/miui/gallery/util/photoview/Tile;->recycle()V

    iget-object p4, p0, Lcom/miui/gallery/util/photoview/TileView;->mDestroyedTiles:Ljava/util/List;

    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    :goto_4
    if-ge v1, p1, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/util/photoview/Tile;

    iget-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p2}, Lcom/miui/gallery/util/photoview/Tile;->getTileRect()Landroid/graphics/Rect;

    move-result-object p4

    invoke-static {p4}, Lcom/miui/gallery/util/photoview/TileView;->makeTileKey(Landroid/graphics/Rect;)I

    move-result p4

    invoke-virtual {p3, p4, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    if-lez p1, :cond_7

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileView;->invalidate()Z

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDecodeTiles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/util/photoview/Tile;

    iget-object p3, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->put(Lcom/miui/gallery/util/photoview/Tile;)Z

    goto :goto_5

    :cond_8
    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTempDecodeTiles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    return-void
.end method

.method private trimMemoryIfNeeded(II)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mIsMemoryTrimmed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/Config$TileConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->getBytesPerPixel(Landroid/graphics/Bitmap$Config;)I

    move-result v0

    int-to-long v0, v0

    mul-int p1, p1, p2

    iget p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int p1, p1, p2

    iget p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTileSize:I

    mul-int p1, p1, p2

    int-to-long p1, p1

    mul-long p1, p1, v0

    const-wide/32 v0, 0x3000000

    cmp-long v2, p1, v0

    const/4 p1, 0x1

    if-ltz v2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    invoke-interface {p2, p1}, Lcom/miui/gallery/util/photoview/TrimMemoryCallback;->onTrimMemory(I)V

    iput-boolean p1, p0, Lcom/miui/gallery/util/photoview/TileView;->mIsMemoryTrimmed:Z

    :cond_1
    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeManager:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDecodeHandler:Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {v4}, Lcom/miui/gallery/util/photoview/Tile;->recycle()V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    iget-boolean v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mIsMemoryTrimmed:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lcom/miui/gallery/util/photoview/TrimMemoryCallback;->onStopTrimMemory(I)V

    iput-object v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    :cond_1
    iput-boolean v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mIsMemoryTrimmed:Z

    :cond_2
    iput-object v1, p0, Lcom/miui/gallery/util/photoview/TileView;->mRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    if-lez v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileView;->invalidate()Z

    :cond_3
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 9

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v3}, Lcom/miui/gallery/util/photoview/TileBitProvider;->isFlip()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v3}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getRotation()I

    move-result v3

    if-nez v3, :cond_2

    iget v3, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotation:F

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v5}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getRotation()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mRotation:F

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    int-to-float v6, v6

    iget-object v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {p1, v5, v6, v7}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v5}, Lcom/miui/gallery/util/photoview/TileBitProvider;->isFlip()Z

    move-result v5

    if-eqz v5, :cond_3

    const/high16 v5, -0x40800000    # -1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_3
    :goto_1
    if-ge v4, v2, :cond_5

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileView;->mDrawingTiles:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {v5}, Lcom/miui/gallery/util/photoview/Tile;->getRefreshId()I

    move-result v6

    iget v7, p0, Lcom/miui/gallery/util/photoview/TileView;->mRefreshId:I

    if-ne v6, v7, :cond_4

    invoke-virtual {v5, p1, p2}, Lcom/miui/gallery/util/photoview/Tile;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Z

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_5
    if-lez v3, :cond_6

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_6
    const-string p1, "TileView"

    const-string p2, "TileView draw cost %d ms."

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public getTileProviderHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTileProviderRotation()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getRotation()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTileProviderWidth()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyInvalidate(Landroid/graphics/RectF;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/photoview/TileView;->layoutTiles(Landroid/graphics/RectF;F)V

    return-void
.end method

.method public setViewPort(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileView;->mViewPort:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.class public Lcom/miui/gallery/util/photoview/Tile;
.super Ljava/lang/Object;
.source "Tile.java"


# static fields
.field private static sPaint:Landroid/graphics/Paint;


# instance fields
.field private mBit:Lcom/miui/gallery/util/photoview/TileBit;

.field private mColumn:I

.field private mDisplayRect:Landroid/graphics/RectF;

.field private mRecycleCallbackRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mRefreshId:I

.field private mRow:I

.field private mSampleSize:I

.field private mState:I

.field private mTileRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;Landroid/graphics/RectF;ILcom/miui/gallery/util/photoview/BitmapRecycleCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mRefreshId:I

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    iput-object p2, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    iput p3, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mRecycleCallbackRef:Ljava/lang/ref/WeakReference;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/Tile;->setActive(Z)V

    return-void
.end method

.method private getBitmapRecycleCallback()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mRecycleCallbackRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mRecycleCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static getPaint()Landroid/graphics/Paint;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/photoview/Tile;->sPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/photoview/Tile;->sPaint:Landroid/graphics/Paint;

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/photoview/Tile;->sPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private isContentValidate()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/TileBit;->isContentValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private setActive(Z)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    and-int/lit8 v0, v0, -0x4

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    or-int/lit8 p1, p1, 0x0

    iput p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    :goto_0
    return-void
.end method

.method private setDecoded()V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    and-int/lit8 v0, v0, -0xd

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->isContentValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    :goto_0
    return-void
.end method


# virtual methods
.method public decode(Lcom/miui/gallery/util/photoview/TileBitProvider;)Z
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getTileBit(Landroid/graphics/Rect;I)Lcom/miui/gallery/util/photoview/TileBit;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->setDecoded()V

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->isContentValidate()Z

    move-result p1

    return p1
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)Z
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->isContentValidate()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/photoview/Tile;->getPaint()Landroid/graphics/Paint;

    move-result-object p2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    invoke-virtual {v1}, Lcom/miui/gallery/util/photoview/TileBit;->getValidateWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    invoke-virtual {v2}, Lcom/miui/gallery/util/photoview/TileBit;->getValidateHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    iget v2, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, v1

    invoke-direct {v2, v3, v4, v5, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    invoke-virtual {v0, p1, v2, p2}, Lcom/miui/gallery/util/photoview/TileBit;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getRefreshId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mRefreshId:I

    return v0
.end method

.method public getTileRect()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public isActive()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    and-int/lit8 v0, v0, 0x3

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public recycle()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->getBitmapRecycleCallback()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/photoview/TileBit;->recycle(Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mBit:Lcom/miui/gallery/util/photoview/TileBit;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/photoview/Tile;->setActive(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/Tile;->setDecoded()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mRefreshId:I

    return-void
.end method

.method public setIndex(II)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mRow:I

    iput p2, p0, Lcom/miui/gallery/util/photoview/Tile;->mColumn:I

    return-void
.end method

.method public setRefreshId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/util/photoview/Tile;->mRefreshId:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "tileRect %s, displayRect %s, sampleSize %d, state %d, refreshId %d"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/miui/gallery/util/photoview/Tile;->mRefreshId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected updateDisplayParam(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/Tile;->setActive(Z)V

    return-void
.end method

.method protected updateTileParam(Landroid/graphics/Rect;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/Tile;->mTileRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iput p2, p0, Lcom/miui/gallery/util/photoview/Tile;->mSampleSize:I

    return-void
.end method

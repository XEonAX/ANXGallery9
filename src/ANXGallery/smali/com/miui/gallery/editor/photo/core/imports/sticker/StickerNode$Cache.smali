.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;
.super Ljava/lang/Object;
.source "StickerEditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Cache"
.end annotation


# instance fields
.field private mBackground:Landroid/graphics/Bitmap;

.field private mBitmapToCanvas:Landroid/graphics/Matrix;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mCanvasBound:Landroid/graphics/Rect;

.field private mCanvasToBitmap:Landroid/graphics/Matrix;

.field private mLayer:Landroid/graphics/Bitmap;

.field private mNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;",
            ">;"
        }
    .end annotation
.end field

.field private mPaint:Landroid/graphics/Paint;

.field private mRedrawDst:Landroid/graphics/RectF;

.field private mRedrawSrc:Landroid/graphics/Rect;

.field private mReusePoint:[F


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawSrc:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawDst:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvasBound:Landroid/graphics/Rect;

    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mReusePoint:[F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mBackground:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvasToBitmap:Landroid/graphics/Matrix;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mBitmapToCanvas:Landroid/graphics/Matrix;

    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mLayer:Landroid/graphics/Bitmap;

    new-instance p1, Landroid/graphics/Canvas;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mLayer:Landroid/graphics/Bitmap;

    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvasBound:Landroid/graphics/Rect;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mLayer:Landroid/graphics/Bitmap;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mLayer:Landroid/graphics/Bitmap;

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p2, p3}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method private findIntersects(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method append(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method draw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mLayer:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method

.method find(FF)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mReusePoint:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mReusePoint:[F

    const/4 v0, 0x1

    aput p2, p1, v0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvasToBitmap:Landroid/graphics/Matrix;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mReusePoint:[F

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v0

    :goto_0
    if-ltz p1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mReusePoint:[F

    invoke-static {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;[F)Z

    move-result p2

    if-eqz p2, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method getNodes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method remove(I)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawSrc:Landroid/graphics/Rect;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->top:F

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/RectF;->right:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawDst:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawSrc:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawSrc:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mBackground:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawSrc:Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mRedrawDst:Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->findIntersects(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Ljava/util/List;

    move-result-object v2

    const-string v3, "StickerEditorView"

    const-string v4, "need rebuild %d items"

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    const-string v2, "StickerNode"

    const-string v3, "rebuild finish costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1
.end method

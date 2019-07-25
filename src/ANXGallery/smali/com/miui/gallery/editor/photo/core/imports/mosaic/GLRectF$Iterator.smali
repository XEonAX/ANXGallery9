.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;
.super Ljava/lang/Object;
.source "GLRectF.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Iterator"
.end annotation


# instance fields
.field private final mBitmapHeight:F

.field private final mBitmapWidth:F

.field private mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

.field private mSize:I

.field private final mXPixel:F

.field private mXStep:F

.field private final mYPixel:F

.field private mYStep:F


# direct methods
.method public constructor <init>(FF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapWidth:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapHeight:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapWidth:F

    const/high16 p2, 0x3f800000    # 1.0f

    div-float p1, p2, p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mXPixel:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapHeight:F

    div-float/2addr p2, p1

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mYPixel:F

    return-void
.end method


# virtual methods
.method public countMiddleRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->width()F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapWidth:F

    mul-float v0, v0, v1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->height()F

    move-result v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mBitmapHeight:F

    mul-float v1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/high16 v1, 0x40a00000    # 5.0f

    div-float/2addr v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->countMiddleRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;F)V

    return-void
.end method

.method public countMiddleRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;F)V
    .locals 3

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->centerX()F

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->centerX()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->centerY()F

    move-result p2

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->centerY()F

    move-result v1

    sub-float/2addr p2, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mXPixel:F

    div-float v1, v0, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mYPixel:F

    div-float v2, p2, v2

    div-float/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    div-float/2addr v2, p3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    add-int/lit8 p3, p3, 0x1

    int-to-float p3, p3

    div-float/2addr v0, p3

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mXStep:F

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    add-int/lit8 p3, p3, 0x1

    int-to-float p3, p3

    div-float/2addr p2, p3

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mYStep:F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->set(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    return-void
.end method

.method public hasNext()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next([F)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mXStep:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mYStep:F

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->offset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->getVertex([F)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->mSize:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "iterator size error!!!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

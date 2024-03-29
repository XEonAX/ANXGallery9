.class public Lcom/miui/gallery/collage/core/stitching/StitchingModel;
.super Ljava/lang/Object;
.source "StitchingModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;
    }
.end annotation


# instance fields
.field public horizontalOffset:F

.field public isSquare:Z

.field public mask:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public radius:I

.field public relativePath:Ljava/lang/String;

.field public verticalOffset:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static countHeight(ILcom/miui/gallery/collage/core/stitching/StitchingModel;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;)V
    .locals 6

    iget v0, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->horizontalOffset:F

    int-to-float v1, p0

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v2, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->verticalOffset:F

    mul-float v2, v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-boolean p1, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->isSquare:Z

    mul-int/lit8 v2, v0, 0x2

    sub-int/2addr p0, v2

    const/4 v2, 0x0

    if-eqz p3, :cond_3

    invoke-interface {p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;->size()I

    move-result v3

    if-lez v3, :cond_3

    const/4 v3, 0x0

    :goto_0
    invoke-interface {p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    invoke-interface {p3, v2}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;->get(I)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v5, v4

    if-eqz p1, :cond_0

    move v4, p0

    goto :goto_1

    :cond_0
    int-to-float v4, p0

    mul-float v4, v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    :goto_1
    add-int/2addr v3, v4

    iget-object v5, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->bitmapHeights:[I

    aput v4, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    if-lez v0, :cond_2

    invoke-interface {p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;->size()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    mul-int p1, p1, v1

    add-int v2, v3, p1

    goto :goto_2

    :cond_2
    invoke-interface {p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    mul-int p1, p1, v1

    add-int v2, v3, p1

    :cond_3
    :goto_2
    iput p0, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->bitmapWidth:I

    iput v1, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->verticalOffset:I

    iput v0, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->horizontalOffset:I

    iput v2, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->height:I

    return-void
.end method


# virtual methods
.method public countHeight(ILcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;[Landroid/graphics/Bitmap;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/collage/core/stitching/StitchingModel$2;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$2;-><init>(Lcom/miui/gallery/collage/core/stitching/StitchingModel;[Landroid/graphics/Bitmap;)V

    invoke-static {p1, p0, p2, v0}, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->countHeight(ILcom/miui/gallery/collage/core/stitching/StitchingModel;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;)V

    return-void
.end method

.method public countHeight(ILcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/collage/core/stitching/StitchingModel$1;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/collage/core/stitching/StitchingModel$1;-><init>(Lcom/miui/gallery/collage/core/stitching/StitchingModel;[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;)V

    invoke-static {p1, p0, p2, v0}, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->countHeight(ILcom/miui/gallery/collage/core/stitching/StitchingModel;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;Lcom/miui/gallery/collage/core/stitching/StitchingModel$BitmapCollection;)V

    return-void
.end method

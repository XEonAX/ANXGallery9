.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;
.super Ljava/lang/Object;
.source "RectFEvaluator.java"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/animation/TypeEvaluator<",
        "Landroid/graphics/RectF;",
        ">;"
    }
.end annotation


# instance fields
.field private mRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;->mRect:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public evaluate(FLandroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 5

    iget v0, p2, Landroid/graphics/RectF;->left:F

    iget v1, p3, Landroid/graphics/RectF;->left:F

    iget v2, p2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    iget v1, p2, Landroid/graphics/RectF;->top:F

    iget v2, p3, Landroid/graphics/RectF;->top:F

    iget v3, p2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v3

    mul-float v2, v2, p1

    add-float/2addr v1, v2

    iget v2, p2, Landroid/graphics/RectF;->right:F

    iget v3, p3, Landroid/graphics/RectF;->right:F

    iget v4, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v4

    mul-float v3, v3, p1

    add-float/2addr v2, v3

    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p3, p2

    mul-float p3, p3, p1

    add-float/2addr v3, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;->mRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;->mRect:Landroid/graphics/RectF;

    return-object p1
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Landroid/graphics/RectF;

    check-cast p3, Landroid/graphics/RectF;

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;->evaluate(FLandroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object p1

    return-object p1
.end method

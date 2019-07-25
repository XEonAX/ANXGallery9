.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;
.super Ljava/lang/Object;
.source "TranslateEvaluator.java"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/animation/TypeEvaluator<",
        "Landroid/graphics/Matrix;",
        ">;"
    }
.end annotation


# instance fields
.field private mEnd:[F

.field private mMatrix:Landroid/graphics/Matrix;

.field private mRaw:[F

.field private mStart:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mMatrix:Landroid/graphics/Matrix;

    const/16 v0, 0x9

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    return-void
.end method


# virtual methods
.method public evaluate(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    invoke-virtual {p3, p2}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x0

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x1

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x2

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x3

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x4

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 v0, 0x5

    aget p3, p3, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mEnd:[F

    aget v1, v1, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    add-float/2addr p3, v1

    aput p3, p2, v0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 p3, 0x6

    aget p2, p2, p3

    aput p2, p1, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/4 p3, 0x7

    aget p2, p2, p3

    aput p2, p1, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mStart:[F

    const/16 p3, 0x8

    aget p2, p2, p3

    aput p2, p1, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mMatrix:Landroid/graphics/Matrix;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mRaw:[F

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->setValues([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->mMatrix:Landroid/graphics/Matrix;

    return-object p1
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Landroid/graphics/Matrix;

    check-cast p3, Landroid/graphics/Matrix;

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;->evaluate(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    return-object p1
.end method

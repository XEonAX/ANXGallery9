.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PaintElementOperationDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;
    }
.end annotation


# instance fields
.field private mActionPosition:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mBound:Landroid/graphics/RectF;

.field private mCurrentMatrix:Landroid/graphics/Matrix;

.field private mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

.field private mDecorationRects:[Landroid/graphics/Rect;

.field private mDrawDecoration:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPoint:[F

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mRotateCenterX:F

.field private mRotateCenterY:F

.field private mRotateDegree:F

.field private mRotateMatrix:Landroid/graphics/Matrix;

.field private mWindow:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    new-array v0, v0, [Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mCurrentMatrix:Landroid/graphics/Matrix;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDrawDecoration:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    const v0, 0x7f0700bc

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mWindow:Landroid/graphics/drawable/Drawable;

    const/4 p1, 0x0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    aput-object v1, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static configRectByPointAndSize(Landroid/graphics/Rect;[FFF)V
    .locals 4

    if-eqz p1, :cond_1

    array-length v0, p1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    aget v1, p1, v0

    sub-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    const/4 v2, 0x1

    aget v3, p1, v2

    sub-float/2addr v3, p3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    aget v0, p1, v0

    add-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p2

    aget p1, p1, v2

    add-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p0, v1, v3, p2, p1}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->icon:I

    invoke-virtual {p5, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    aput-object p1, v0, v1

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    iget p2, p2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->icon:I

    invoke-virtual {p5, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    aput-object p2, p1, v0

    :cond_1
    if-eqz p3, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    const/4 p2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    iget p3, p3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->icon:I

    invoke-virtual {p5, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    aput-object p3, p1, p2

    :cond_2
    if-eqz p4, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    const/4 p2, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p1, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    iget p3, p4, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->icon:I

    invoke-virtual {p5, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    aput-object p3, p1, p2

    :cond_3
    return-void
.end method

.method public configDecorationPositon(Landroid/graphics/RectF;Landroid/graphics/Matrix;FFF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p3, p4, p5}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateDegree:F

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateCenterX:F

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateCenterY:F

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateCenterX:F

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateCenterY:F

    const/4 v3, 0x1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mWindow:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    float-to-int v4, v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRectFTemp:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    float-to-int v6, v6

    invoke-virtual {v0, v1, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateDegree:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    aget v1, v1, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    aget v4, v4, v3

    invoke-virtual {p1, v0, v1, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mWindow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x2

    if-nez v1, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    aput v6, v5, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    aput v6, v5, v3

    goto :goto_1

    :cond_1
    if-ne v1, v3, :cond_2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    aput v6, v5, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    aput v6, v5, v3

    goto :goto_1

    :cond_2
    if-ne v1, v4, :cond_3

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    aput v6, v5, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    aput v6, v5, v3

    goto :goto_1

    :cond_3
    const/4 v5, 0x3

    if-ne v1, v5, :cond_4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    aput v6, v5, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mBound:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    aput v6, v5, v3

    :cond_4
    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mCurrentMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5}, Landroid/graphics/Matrix;->reset()V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mCurrentMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mCurrentMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mCurrentMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationDrawables:[Landroid/graphics/drawable/Drawable;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    div-int/2addr v6, v4

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    aget-object v4, v4, v1

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mPoint:[F

    int-to-float v6, v6

    invoke-static {v4, v7, v6, v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configRectByPointAndSize(Landroid/graphics/Rect;[FFF)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    aget-object v1, v4, v1

    invoke-virtual {v5, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDrawDecoration:Z

    if-eqz v1, :cond_0

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method public findLowerDecorationPosition()F
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v2, v3, v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    cmpl-float v3, v2, v1

    if-lez v3, :cond_0

    move v1, v2

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    return v1
.end method

.method public getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mActionPosition:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDecorationRects:[Landroid/graphics/Rect;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v0, p1

    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    :goto_0
    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x2

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

.method public setDrawDecoration(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->mDrawDecoration:Z

    return-void
.end method

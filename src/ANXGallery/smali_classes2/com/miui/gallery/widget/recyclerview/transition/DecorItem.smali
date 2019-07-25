.class final Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;
.super Ljava/lang/Object;
.source "DecorItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    }
.end annotation


# instance fields
.field mAnimAlpha:I

.field private final mAnimFrame:Landroid/graphics/RectF;

.field mDrawable:Landroid/graphics/drawable/Drawable;

.field mFromAlpha:I

.field mFromFrame:Landroid/graphics/RectF;

.field mHost:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field mLocalPath:Ljava/lang/String;

.field mMatrix:Landroid/graphics/Matrix;

.field mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mTemp1:Landroid/graphics/RectF;

.field private mTemp2:Landroid/graphics/RectF;

.field mToAlpha:I

.field mToFrame:Landroid/graphics/RectF;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$000(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mHost:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$100(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mLocalPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$200(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$300(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$400(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$500(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromAlpha:I

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$600(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToAlpha:I

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->access$700(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)V

    return-void
.end method

.method private configureBounds()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, 0x0

    if-ltz v0, :cond_1

    if-ne v2, v0, :cond_2

    :cond_1
    if-ltz v1, :cond_3

    if-ne v3, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v5, 0x1

    :goto_1
    iget-object v6, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6}, Landroid/graphics/Matrix;->reset()V

    if-lez v0, :cond_c

    if-lez v1, :cond_c

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    iget-object v7, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-ne v6, v7, :cond_4

    goto/16 :goto_4

    :cond_4
    iget-object v6, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v4, v4, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    sget-object v4, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    iget-object v6, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-ne v4, v6, :cond_5

    goto/16 :goto_5

    :cond_5
    if-eqz v5, :cond_6

    goto/16 :goto_5

    :cond_6
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    iget-object v5, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    const/high16 v6, 0x3f000000    # 0.5f

    if-ne v4, v5, :cond_7

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    sub-int/2addr v2, v0

    int-to-float v0, v2

    mul-float v0, v0, v6

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    sub-int/2addr v3, v1

    int-to-float v1, v3

    mul-float v1, v1, v6

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v4, v0, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    goto/16 :goto_5

    :cond_7
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    iget-object v5, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    const/4 v7, 0x0

    if-ne v4, v5, :cond_9

    mul-int v4, v0, v3

    mul-int v5, v2, v1

    if-le v4, v5, :cond_8

    int-to-float v3, v3

    int-to-float v1, v1

    div-float/2addr v3, v1

    int-to-float v1, v2

    int-to-float v0, v0

    mul-float v0, v0, v3

    sub-float/2addr v1, v0

    mul-float v0, v1, v6

    move v7, v0

    move v0, v3

    const/4 v1, 0x0

    goto :goto_2

    :cond_8
    int-to-float v2, v2

    int-to-float v0, v0

    div-float v0, v2, v0

    int-to-float v2, v3

    int-to-float v1, v1

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    mul-float v1, v2, v6

    :goto_2
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_5

    :cond_9
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    iget-object v5, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-ne v4, v5, :cond_b

    if-gt v0, v2, :cond_a

    if-gt v1, v3, :cond_a

    const/high16 v4, 0x3f800000    # 1.0f

    goto :goto_3

    :cond_a
    int-to-float v4, v2

    int-to-float v5, v0

    div-float/2addr v4, v5

    int-to-float v5, v3

    int-to-float v7, v1

    div-float/2addr v5, v7

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    :goto_3
    int-to-float v2, v2

    int-to-float v0, v0

    mul-float v0, v0, v4

    sub-float/2addr v2, v0

    mul-float v2, v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    int-to-float v2, v3

    int-to-float v1, v1

    mul-float v1, v1, v4

    sub-float/2addr v2, v1

    mul-float v2, v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v4, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_5

    :cond_b
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->getTemp1()Landroid/graphics/RectF;

    move-result-object v4

    int-to-float v0, v0

    int-to-float v1, v1

    invoke-virtual {v4, v7, v7, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->getTemp2()Landroid/graphics/RectF;

    move-result-object v0

    int-to-float v1, v2

    int-to-float v2, v3

    invoke-virtual {v0, v7, v7, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->getTemp1()Landroid/graphics/RectF;

    move-result-object v1

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->getTemp2()Landroid/graphics/RectF;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-static {v3}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->scaleTypeToScaleToFit(Landroid/widget/ImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_5

    :cond_c
    :goto_4
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :goto_5
    return-void
.end method

.method private getTemp1()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp1:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp1:Landroid/graphics/RectF;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp1:Landroid/graphics/RectF;

    return-object v0
.end method

.method private getTemp2()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp2:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp2:Landroid/graphics/RectF;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mTemp2:Landroid/graphics/RectF;

    return-object v0
.end method

.method private static scaleTypeToScaleToFit(Landroid/widget/ImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    sget-object p0, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    return-object p0

    :pswitch_0
    sget-object p0, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    return-object p0

    :pswitch_1
    sget-object p0, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    return-object p0

    :pswitch_2
    sget-object p0, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateAnimFrame(F)V
    .locals 5

    float-to-double v0, p1

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    double-to-float p1, v0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    mul-float v0, v0, p1

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v3

    mul-float v2, v2, p1

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v4

    mul-float v3, v3, p1

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromAlpha:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToAlpha:I

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromAlpha:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    float-to-int p1, v0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimAlpha:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->configureBounds()V

    return-void
.end method


# virtual methods
.method public invalidate()V
    .locals 0

    return-void
.end method

.method onDraw(Landroid/graphics/Canvas;F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->updateAnimFrame(F)V

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimAlpha:I

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mAnimFrame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "mFromFrame: %s, mToFrame: %s, mFromAlpha: %s, mToAlpha: %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromAlpha:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToAlpha:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->configureBounds()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->invalidate()V

    :cond_0
    return-void
.end method

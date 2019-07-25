.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;
.super Ljava/lang/Object;
.source "EditableListViewWrapper.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AnimationManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$MyScaleItemImageViewAnimatorListener;
    }
.end annotation


# instance fields
.field private isTurnOnScaleImageViewAni:Z

.field private mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScroll2PickHelper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;

.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

    new-instance p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mScroll2PickHelper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->isTurnOnScaleImageViewAni:Z

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;Landroid/widget/ImageView;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setImageViewScale(Landroid/widget/ImageView;F)V

    return-void
.end method

.method private finishImageViewScaleAnimatorIfNecessary(Landroid/widget/ImageView;)V
    .locals 3

    const v0, 0x7f0902c8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_0
    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->getImageViewScale(Landroid/widget/ImageView;)F

    move-result v0

    const v1, 0x7f0902d3

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v2, 0x800000

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setImageViewScale(Landroid/widget/ImageView;F)V

    :cond_1
    return-void
.end method

.method private getImageViewScale(Landroid/widget/ImageView;)F
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/widget/ScalableImageView;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/widget/ScalableImageView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ScalableImageView;->getMatrixScale()F

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private setImageViewScale(Landroid/widget/ImageView;F)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/widget/ScalableImageView;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/widget/ScalableImageView;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/ScalableImageView;->setMatrixScale(F)V

    :cond_0
    return-void
.end method

.method private setItemImageView2OriginalScaleAfterEnlarge(Landroid/widget/ImageView;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->finishImageViewScaleAnimatorIfNecessary(Landroid/widget/ImageView;)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setImageViewScale(Landroid/widget/ImageView;F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_0
    const v0, 0x7f0902cf

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    const v0, 0x7f0902c8

    invoke-virtual {p1, v0, v1}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method private setItemImageViewEnlargeAfterChecked(Landroid/widget/ImageView;I)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->finishImageViewScaleAnimatorIfNecessary(Landroid/widget/ImageView;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    const v0, 0x7f0902cf

    invoke-virtual {p1, v0, p2}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    const p2, 0x3f99999a    # 1.2f

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setImageViewScale(Landroid/widget/ImageView;F)V

    const p2, 0x7f0902c8

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method private startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V
    .locals 4

    iget-boolean p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->isTurnOnScaleImageViewAni:Z

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->finishImageViewScaleAnimatorIfNecessary(Landroid/widget/ImageView;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-eqz p3, :cond_4

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    if-gtz p3, :cond_1

    goto/16 :goto_1

    :cond_1
    const/high16 p3, 0x3f800000    # 1.0f

    const v0, 0x3f99999a    # 1.2f

    const v1, 0x7f0902d3

    const v2, 0x7f0902cf

    const/4 v3, 0x2

    if-eqz p2, :cond_3

    new-array p2, v3, [F

    fill-array-data p2, :array_0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$MyScaleItemImageViewAnimatorListener;

    invoke-direct {p3, p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$MyScaleItemImageViewAnimatorListener;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;Landroid/widget/ImageView;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p3, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p3}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p1, v2, p3}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    iget-object p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

    if-nez p3, :cond_2

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mOriginalScaleType:Landroid/widget/ImageView$ScaleType;

    :cond_2
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p1, v1, p3}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    goto :goto_0

    :cond_3
    new-array p2, v3, [F

    fill-array-data p2, :array_1

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$MyScaleItemImageViewAnimatorListener;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$MyScaleItemImageViewAnimatorListener;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;Landroid/widget/ImageView;)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v2, v0}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p1, v1, p3}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    :goto_0
    int-to-long v0, p5

    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    int-to-long p3, p4

    invoke-virtual {p2, p3, p4}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    sget-object p3, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const p3, 0x7f0902c8

    invoke-virtual {p1, p3, p2}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :cond_4
    :goto_1
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
    .end array-data

    :array_1
    .array-data 4
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private startScaleListViewAnimation(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Z)V
    .locals 12

    const/high16 v0, 0x3f800000    # 1.0f

    const v1, 0x3f6b851f    # 0.92f

    if-eqz p2, :cond_0

    const v0, 0x3f6b851f    # 0.92f

    const/high16 v1, 0x3f800000    # 1.0f

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_3

    invoke-virtual {p1, v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Lcom/miui/gallery/ui/Checkable;

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    const-string v5, "scaleX"

    const/4 v6, 0x2

    new-array v7, v6, [F

    aput v0, v7, v2

    const/4 v8, 0x1

    aput v1, v7, v8

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    const-string v7, "scaleY"

    new-array v9, v6, [F

    aput v0, v9, v2

    aput v1, v9, v8

    invoke-static {v7, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v5, v6, v2

    aput-object v7, v6, v8

    invoke-static {v4, v6}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0x12c

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    new-instance v6, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v5, v6}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    const v5, 0x7f0902d2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    if-eqz p2, :cond_2

    instance-of v5, v4, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz v5, :cond_2

    move-object v5, v4

    check-cast v5, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {v5}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v7

    const v5, 0x7f0902cf

    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    const/4 v8, 0x0

    invoke-virtual {p1, v4}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAdapterPositionForExternal(Landroid/view/View;)I

    move-result v9

    const/4 v10, 0x0

    const/16 v11, 0x12c

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mScroll2PickHelper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public resetViewPropertyIfNeed(Landroid/view/View;Landroid/view/View;I)V
    .locals 3

    const v0, 0x7f0902d2

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInChoiceMode()Z

    move-result v2

    if-eqz v2, :cond_1

    const v2, 0x3f6b851f    # 0.92f

    if-eqz v1, :cond_0

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_0
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleY(F)V

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_2

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleY(F)V

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->isTurnOnScaleImageViewAni:Z

    if-nez v0, :cond_4

    return-void

    :cond_4
    instance-of v0, p1, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    const v1, 0x7f0902d0

    if-eqz v0, :cond_7

    check-cast p1, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {p1}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInChoiceMode()Z

    move-result v0

    const v2, 0x7f0902cf

    if-eqz v0, :cond_6

    invoke-virtual {p2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p3, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(I)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setItemImageView2OriginalScaleAfterEnlarge(Landroid/widget/ImageView;)V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(I)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setItemImageViewEnlargeAfterChecked(Landroid/widget/ImageView;I)V

    goto :goto_1

    :cond_6
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->setItemImageView2OriginalScaleAfterEnlarge(Landroid/widget/ImageView;)V

    :cond_7
    :goto_1
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public setLongTouchPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->mScroll2PickHelper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;->access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager$Scroll2PickHelper;I)V

    return-void
.end method

.method public startEnterActionModeAni()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$1300(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleListViewAnimation(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Z)V

    return-void
.end method

.method public startExistActionModeAni()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$1300(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleListViewAnimation(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Z)V

    return-void
.end method

.method public startPickingNumberAnimation(Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;)V
    .locals 8

    invoke-interface {p1}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;->getBackgroundMask()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-interface {p1}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;->getShowNumberTextView()Landroid/widget/TextView;

    move-result-object p1

    const-string v2, "%d"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    const-string v4, "alpha"

    const/4 v5, 0x2

    new-array v6, v5, [F

    fill-array-data v6, :array_0

    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    aput-object v4, v2, v1

    const-string v4, "scaleX"

    new-array v6, v5, [F

    fill-array-data v6, :array_1

    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v4, "scaleY"

    new-array v6, v5, [F

    fill-array-data v6, :array_2

    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    aput-object v4, v2, v5

    invoke-static {p1, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v6, 0x12c

    invoke-virtual {v2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v2, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-array v4, v3, [Landroid/animation/PropertyValuesHolder;

    const-string v6, "alpha"

    new-array v7, v5, [F

    fill-array-data v7, :array_3

    invoke-static {v6, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    aput-object v6, v4, v1

    invoke-static {p1, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v6, 0xc8

    invoke-virtual {p1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1, v6, v7}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    new-array v6, v5, [Landroid/animation/Animator;

    aput-object v2, v6, v1

    aput-object p1, v6, v3

    invoke-virtual {v4, v6}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    new-array p1, v3, [Landroid/animation/PropertyValuesHolder;

    const-string v2, "alpha"

    new-array v3, v5, [F

    fill-array-data v3, :array_4

    invoke-static {v2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, p1, v1

    invoke-static {v0, p1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v0, 0x2bc

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public startScaleAllItemImageViewAnimation(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Z)V
    .locals 6

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz v4, :cond_0

    move-object v4, v3

    check-cast v4, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {v4}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {p1, v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAdapterPositionForExternal(Landroid/view/View;)I

    move-result v3

    add-int/lit8 v5, v2, 0x1

    mul-int/lit8 v2, v2, 0x28

    invoke-virtual {p0, v4, v3, p2, v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZI)V

    move v2, v5

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public startScaleItemImageViewAnimation(Landroid/widget/ImageView;I)V
    .locals 13

    const v0, 0x7f0902cf

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v3, 0x1

    const/16 v5, 0x64

    const/16 v6, 0x12c

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    const/16 v11, 0x64

    const/16 v12, 0x12c

    move-object v7, p0

    move-object v8, p1

    move v10, p2

    invoke-direct/range {v7 .. v12}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V

    :goto_0
    return-void
.end method

.method public startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZI)V
    .locals 6

    const/16 v5, 0x12c

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZII)V

    return-void
.end method

.method public startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZII)V
    .locals 8

    const v0, 0x7f0902cf

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    if-eqz p3, :cond_0

    const/4 v4, 0x1

    move-object v2, p0

    move-object v3, p1

    move v5, p2

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V

    :cond_0
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p3, :cond_1

    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimationInternal(Landroid/widget/ImageView;ZIII)V

    :cond_1
    return-void
.end method

.method public startScaleItemImageViewAnimationByScrollPicked(Landroid/widget/ImageView;IZ)V
    .locals 1

    const/16 v0, 0x64

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZI)V

    return-void
.end method

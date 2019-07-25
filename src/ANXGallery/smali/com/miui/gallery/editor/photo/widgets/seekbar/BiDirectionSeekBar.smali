.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;
.super Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;
.source "BiDirectionSeekBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$BiDirectionDrawable;,
        Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$SeekBarChangeDelegator;
    }
.end annotation


# instance fields
.field private mAnchor:I

.field private mMax:I

.field private mStickyState:Z

.field private mTouchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x101007b

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->getMax()I

    move-result p2

    const/4 p3, 0x2

    div-int/2addr p2, p3

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mTouchSlop:I

    const/4 p1, 0x0

    invoke-virtual {p0, p3, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    return p0
.end method


# virtual methods
.method public getCurrentValue()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->getProgress()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getMaxValue()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mStickyState:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mAnchor:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    sub-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v3, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mTouchSlop:I

    if-ge v0, v3, :cond_2

    return v2

    :cond_0
    if-eq v0, v2, :cond_1

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    :cond_1
    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mAnchor:I

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p1, v0, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mStickyState:Z

    :cond_2
    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->getCurrentValue()I

    move-result v3

    if-nez v3, :cond_3

    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mStickyState:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mAnchor:I

    goto :goto_0

    :cond_3
    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mStickyState:Z

    :goto_0
    return v0
.end method

.method public setCurrentValue(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    add-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setProgress(I)V

    return-void
.end method

.method public setMaxValue(I)V
    .locals 1

    mul-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setMax(I)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    return-void
.end method

.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$SeekBarChangeDelegator;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$SeekBarChangeDelegator;-><init>(Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-super {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4

    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const v1, 0x102000d

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_1

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$BiDirectionDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {p1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$BiDirectionDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;)V

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    invoke-super {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_0
    instance-of v0, p1, Landroid/graphics/drawable/DrawableContainer;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_1
    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$BiDirectionDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar$BiDirectionDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;)V

    invoke-super {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method updateThumb(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->mMax:I

    sub-int/2addr p1, v0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->updateThumb(I)V

    return-void
.end method

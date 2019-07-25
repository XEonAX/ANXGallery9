.class public Lcom/miui/gallery/util/ScalableTouchDelegate;
.super Landroid/view/TouchDelegate;
.source "ScalableTouchDelegate.java"


# instance fields
.field private mBounds:Landroid/graphics/Rect;

.field private mDelegateTargeted:Z

.field private mDelegateView:Landroid/view/View;

.field private mHostView:Landroid/view/View;

.field private mScale:F

.field private mSlop:I

.field private mSlopBounds:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(FLandroid/view/View;Landroid/view/View;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0, p3}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    sub-float/2addr p1, v0

    :goto_0
    iput p1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mScale:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlop:I

    new-instance p1, Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    invoke-direct {p1, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object p1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    iput-object p3, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateView:Landroid/view/View;

    iput-object p2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mHostView:Landroid/view/View;

    return-void
.end method

.method private setBounds()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    iget-object v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mHostView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_1

    return-void

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/graphics/Rect;->right:I

    iget v6, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v6

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v1

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mScale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mScale:F

    mul-float v0, v0, v2

    float-to-int v0, v0

    iget-object v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    neg-int v1, v1

    neg-int v0, v0

    invoke-virtual {v2, v1, v0}, Landroid/graphics/Rect;->inset(II)V

    iget-object v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    iget v1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlop:I

    neg-int v1, v1

    iget v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlop:I

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->inset(II)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-boolean v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateTargeted:Z

    iput-boolean v4, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateTargeted:Z

    move v2, v0

    goto :goto_1

    :pswitch_1
    iget-boolean v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateTargeted:Z

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    goto :goto_1

    :pswitch_2
    invoke-direct {p0}, Lcom/miui/gallery/util/ScalableTouchDelegate;->setBounds()V

    iget-object v2, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-boolean v3, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateTargeted:Z

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v2, 0x0

    :cond_1
    :goto_1
    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mDelegateView:Landroid/view/View;

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_2

    :cond_2
    iget v1, p0, Lcom/miui/gallery/util/ScalableTouchDelegate;->mSlop:I

    mul-int/lit8 v1, v1, 0x2

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v1, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    :goto_2
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    :cond_3
    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

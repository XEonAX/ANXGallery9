.class public Lcom/miui/gallery/adapter/ExcludeOnTouchListener;
.super Ljava/lang/Object;
.source "ExcludeOnTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;
    }
.end annotation


# instance fields
.field private mExcludeRegion:Landroid/graphics/Rect;

.field private mExcludedView:Landroid/view/View;

.field private mHostView:Landroid/view/View;

.field private mLastX:I

.field private mLastY:I

.field private mMoveX:I

.field private mMoveY:I

.field private mOnTouchValidListener:Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;

.field private mSlop:I


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/View;Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mSlop:I

    iput-object p1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mHostView:Landroid/view/View;

    iput-object p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludedView:Landroid/view/View;

    iput-object p3, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mOnTouchValidListener:Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;

    return-void
.end method

.method private initExcludeRegion()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludedView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    iget-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mHostView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/graphics/Rect;->right:I

    iget v6, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v6

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v1

    invoke-virtual {v2, v3, v4, v5, v0}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    neg-int v1, v1

    iget-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->inset(II)V

    :cond_1
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-direct {p0}, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->initExcludeRegion()V

    iget-object v2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mExcludeRegion:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    return v3

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    const/4 v2, 0x1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveX:I

    iget p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastX:I

    sub-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveX:I

    iget p1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveY:I

    iget p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastY:I

    sub-int/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveY:I

    iput v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastX:I

    iput v1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastY:I

    goto :goto_0

    :pswitch_1
    iget p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveX:I

    iget v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mSlop:I

    if-gt p2, v0, :cond_2

    iget p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveY:I

    iget v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mSlop:I

    if-gt p2, v0, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mOnTouchValidListener:Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mOnTouchValidListener:Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;->onTouchValid(Landroid/view/View;)V

    :cond_1
    return v2

    :pswitch_2
    iput v0, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastX:I

    iput v1, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mLastY:I

    iput v3, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveX:I

    iput v3, p0, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;->mMoveY:I

    return v2

    :cond_2
    :goto_0
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

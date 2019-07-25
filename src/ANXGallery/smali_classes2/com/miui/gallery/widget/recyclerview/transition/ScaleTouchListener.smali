.class Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;
.super Ljava/lang/Object;
.source "ScaleTouchListener.java"

# interfaces
.implements Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;
.implements Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;
    }
.end annotation


# instance fields
.field private mCurZoomFlag:I

.field private final mDetector:Lcom/miui/gallery/view/ScaleGestureDetector;

.field private final mFrom:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private mInterceptTouch:Z

.field private final mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

.field private mSupportZoomFlag:I

.field private mUnsupportedZoom:Z

.field private mZoomInTo:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomOutTo:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mSupportZoomFlag:I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    new-instance p2, Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p0}, Lcom/miui/gallery/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mDetector:Lcom/miui/gallery/view/ScaleGestureDetector;

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mDetector:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    mul-int/lit8 p1, p1, 0x2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->setScaleMinSpan(I)V

    return-void
.end method

.method private disallowInterceptTouchEvent(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_0

    const-string p1, "ScaleTouchListener"

    const-string v0, "the from view has recycled"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p1, "ScaleTouchListener"

    const-string v0, "parent of the from view is null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method private getCurToView()Landroid/support/v7/widget/RecyclerView;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mZoomInTo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    return-object v0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mZoomOutTo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private isViewAttached()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "ScaleTouchListener"

    const-string v2, "mFrom view is detached"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    return v1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->getCurToView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "ScaleTouchListener"

    const-string v2, "mTo view is detached"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private supportZoomIn()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mSupportZoomFlag:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private supportZoomOut()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mSupportZoomFlag:I

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public bindZoomView(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mSupportZoomFlag:I

    or-int/2addr v0, p2

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mSupportZoomFlag:I

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mZoomInTo:Ljava/lang/ref/WeakReference;

    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mZoomOutTo:Ljava/lang/ref/WeakReference;

    :cond_1
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->disallowInterceptTouchEvent(Z)V

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mDetector:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    return p1
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .locals 0

    return-void
.end method

.method public onScale(Lcom/miui/gallery/view/ScaleGestureDetector;)Z
    .locals 10

    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p1, "ScaleTouchListener"

    const-string v0, "onScale: unsupported zoom %d"

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-static {v7}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_2

    :cond_1
    const-string v0, "ScaleTouchListener"

    const-string v2, "onScale scaleFactor %s"

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    if-nez v0, :cond_6

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v2, v7, v0

    if-gtz v2, :cond_2

    cmpg-float v2, v7, v0

    if-gez v2, :cond_8

    :cond_2
    cmpl-float v2, v7, v0

    const/4 v3, 0x1

    if-lez v2, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->supportZoomIn()Z

    move-result v2

    if-eqz v2, :cond_3

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    cmpg-float v0, v7, v0

    if-gez v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->supportZoomOut()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    const/4 v2, 0x1

    :cond_4
    if-eqz v2, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    if-eqz v0, :cond_8

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->getCurToView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v5

    iget v6, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-virtual {p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->getFocusX()F

    move-result v8

    invoke-virtual {p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->getFocusY()F

    move-result v9

    invoke-interface/range {v3 .. v9}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;->onScaleBegin(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFFF)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    goto :goto_1

    :cond_5
    iput-boolean v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->disallowInterceptTouchEvent(Z)V

    goto :goto_1

    :cond_6
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->isViewAttached()Z

    move-result p1

    if-nez p1, :cond_7

    return v1

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->getCurToView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-interface {p1, v0, v1, v2, v7}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;->onScale(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    :cond_8
    :goto_1
    iget-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    return p1

    :cond_9
    :goto_2
    const-string p1, "ScaleTouchListener"

    const-string v0, "illegal scale factor %s"

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method

.method public onScaleBegin(Lcom/miui/gallery/view/ScaleGestureDetector;)Z
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->disallowInterceptTouchEvent(Z)V

    const-string v1, "ScaleTouchListener"

    const-string v2, "onScaleBegin scaleFactor %s"

    invoke-virtual {p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0
.end method

.method public onScaleEnd(Lcom/miui/gallery/view/ScaleGestureDetector;)V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->isViewAttached()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    if-eqz v0, :cond_1

    const-string p1, "ScaleTouchListener"

    const-string v0, "onScaleEnd: unsupported zoom %d"

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    const-string v0, "ScaleTouchListener"

    const-string v1, "onScaleEnd scaleFactor %s"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mScaleListener:Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->getCurToView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mCurZoomFlag:I

    invoke-interface {v0, v1, v2, v3, p1}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;->onScaleEnd(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)V

    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mInterceptTouch:Z

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mUnsupportedZoom:Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->mDetector:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return-void
.end method

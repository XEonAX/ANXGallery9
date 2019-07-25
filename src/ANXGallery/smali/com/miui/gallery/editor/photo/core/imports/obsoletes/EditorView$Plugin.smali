.class public abstract Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;
.super Ljava/lang/Object;
.source "EditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Plugin"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixListener;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;
    }
.end annotation


# instance fields
.field private mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

.field private mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

.field protected mImageAnimator:Landroid/animation/ValueAnimator;

.field private mTransValues:Landroid/animation/PropertyValuesHolder;

.field private mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-void
.end method

.method static synthetic access$502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    return-object p1
.end method

.method static synthetic access$602(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    return-object p1
.end method

.method private ensureStarted()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Current plugin is not installed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result p0

    div-float/2addr p1, p0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_1
    return v0
.end method

.method protected static resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V
    .locals 4

    invoke-virtual {p0, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v2, p1, Landroid/graphics/RectF;->left:F

    iget v3, p0, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->left:F

    sub-float v1, p1, p0

    goto :goto_1

    :cond_2
    iget v2, p1, Landroid/graphics/RectF;->right:F

    iget v3, p0, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float v1, p1, p0

    :cond_3
    :goto_1
    iput v1, p2, Landroid/graphics/PointF;->x:F

    iput v0, p2, Landroid/graphics/PointF;->y:F

    goto :goto_2

    :cond_4
    iput v1, p2, Landroid/graphics/PointF;->x:F

    iput v1, p2, Landroid/graphics/PointF;->y:F

    :goto_2
    return-void
.end method


# virtual methods
.method protected config(Landroid/graphics/Canvas;)V
    .locals 0

    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected drawOverlay(Landroid/graphics/Canvas;)V
    .locals 0

    return-void
.end method

.method protected fixImageBounds(Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;)V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v2, v3, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v4

    if-nez v4, :cond_4

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v6

    cmpl-float v0, v0, v6

    if-gtz v0, :cond_0

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v6

    cmpl-float v0, v0, v6

    if-lez v0, :cond_1

    :cond_0
    invoke-static {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v7

    invoke-virtual {v5, v0, v0, v6, v7}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    :cond_1
    invoke-virtual {v5, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    invoke-virtual {v2, v3, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-static {v0, v3, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V

    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v5, v0, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_2
    if-nez p2, :cond_3

    const/4 p1, 0x0

    goto :goto_0

    :cond_3
    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixListener;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;)V

    :goto_0
    invoke-virtual {p0, v4, v5, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1

    :cond_4
    if-eqz p2, :cond_5

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;->onDone()V

    :cond_5
    :goto_1
    return-void
.end method

.method protected final getBounds()Landroid/graphics/RectF;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected final getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    return-object v0
.end method

.method protected final getImage()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected final getImageBounds()Landroid/graphics/RectF;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected final getImageDisplayBounds()Landroid/graphics/RectF;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected final getImageMatrix()Landroid/graphics/Matrix;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->access$000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method protected final invalidate()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->ensureStarted()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->invalidate()V

    return-void
.end method

.method protected onMatrixChanged()V
    .locals 0

    return-void
.end method

.method protected abstract onStart()V
.end method

.method protected abstract onTouchEvent(Landroid/view/MotionEvent;)Z
.end method

.method protected setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    const-string v0, "matrix"

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;

    invoke-direct {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;-><init>()V

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p2, v5, v2

    invoke-static {v0, v4, v5}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTransValues:Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    new-array v4, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTransValues:Landroid/animation/PropertyValuesHolder;

    aput-object v5, v4, v3

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setObjectValues([Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTransValues:Landroid/animation/PropertyValuesHolder;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    new-array p2, v2, [Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mTransValues:Landroid/animation/PropertyValuesHolder;

    aput-object v0, p2, v3

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method

.method public start()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->onStart()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->invalidate()V

    return-void
.end method

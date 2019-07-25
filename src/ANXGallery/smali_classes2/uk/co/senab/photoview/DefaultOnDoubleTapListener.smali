.class public Luk/co/senab/photoview/DefaultOnDoubleTapListener;
.super Ljava/lang/Object;
.source "DefaultOnDoubleTapListener.java"

# interfaces
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# instance fields
.field private photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->setPhotoViewAttacher(Luk/co/senab/photoview/PhotoViewAttacher;)V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->canZoom()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    return v1

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v2, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2, v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->onDoubleTap(FF)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return v1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 6

    iget-object v0, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    iget-object v2, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v5

    if-eqz v5, :cond_1

    iget p1, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, p1

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result p1

    div-float/2addr v3, p1

    iget p1, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, p1

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr v4, p1

    iget-object p1, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object p1

    invoke-interface {p1, v0, v3, v4}, Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    const/4 p1, 0x1

    return p1

    :cond_1
    iget-object v2, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v2, v0, v3, p1}, Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    :cond_2
    return v1
.end method

.method public setPhotoViewAttacher(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-void
.end method

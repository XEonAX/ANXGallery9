.class public Luk/co/senab/photoview/PhotoView;
.super Landroid/widget/ImageView;
.source "PhotoView.java"

# interfaces
.implements Luk/co/senab/photoview/IPhotoView;


# instance fields
.field private mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

.field private mPendingScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->init()V

    return-void
.end method

.method private isDrawableValid()Z
    .locals 10

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    instance-of v2, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v2, :cond_3

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_0
    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v4

    const-string v5, "PhotoView"

    const-string v6, "bitmap illegal [%d, %d]"

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v1

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Luk/co/senab/photoview/log/Logger;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v5, "size"

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%d_%d"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v1

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "photo"

    const-string v1, "photo_bitmap_recycled"

    invoke-static {v0, v1, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return v2

    :cond_3
    return v1
.end method


# virtual methods
.method public addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    return-void
.end method

.method public animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    return-void
.end method

.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->beforeDraw(Landroid/graphics/Canvas;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/ImageView;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->afterDraw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method public getAbsoluteRect(Landroid/graphics/RectF;)Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getAbsoluteRect(Landroid/graphics/RectF;)Z

    move-result p1

    return p1
.end method

.method public getBaseDisplayRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getBaseDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getBaseMatrix()Landroid/graphics/Matrix;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getBaseMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDrawableSize()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawableSize()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getIPhotoViewImplementation()Luk/co/senab/photoview/IPhotoView;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-object v0
.end method

.method public getMaxScale()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMaximumScale()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMediumScale()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMidScale()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getRotate()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v0

    return v0
.end method

.method public getScale()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public getSuppMatrix()Landroid/graphics/Matrix;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getSuppMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getVisibleRectangleBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected init()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    :cond_1
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Luk/co/senab/photoview/PhotoView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    :cond_2
    return-void
.end method

.method public isGestureOperating()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->isGestureOperating()Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->init()V

    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz v0, :cond_1

    :cond_0
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoView;->isDrawableValid()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public releaseTile()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->releaseTile()V

    return-void
.end method

.method public removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setAllowParentInterceptOnEdge(Z)V

    return-void
.end method

.method public setAlphaBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setAlphaBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setBackgroundAlpha(F)V

    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setDisplayMatrix(Landroid/graphics/Matrix;)Z

    move-result p1

    return p1
.end method

.method public setHDState(IIZ)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->setHDState(IIZ)V

    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Z)V
    .locals 2

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setImageResource(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setInterceptTouch(Z)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setInterceptTouch(Z)V

    return-void
.end method

.method public setMaxScale(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMaximumScale(F)V

    return-void
.end method

.method public setMaximumScale(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMaximumScale(F)V

    return-void
.end method

.method public setMediumScale(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMediumScale(F)V

    return-void
.end method

.method public setMidScale(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMediumScale(F)V

    return-void
.end method

.method public setMinScale(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMinimumScale(F)V

    return-void
.end method

.method public setMinimumScale(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMinimumScale(F)V

    return-void
.end method

.method public setOnBackgroundAlphaChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnBackgroundAlphaChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;)V

    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    return-void
.end method

.method public setOnExitListener(Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnExitListener(Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;)V

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V

    return-void
.end method

.method public setOnRotateListener(Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnRotateListener(Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;)V

    return-void
.end method

.method public setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V

    return-void
.end method

.method public setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V

    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    return-void
.end method

.method public setPhotoViewRotation(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationTo(F)V

    return-void
.end method

.method public setRegionDecodeEnable(Z)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRegionDecodeEnable(Z)V

    return-void
.end method

.method public setRotatable(Z)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotatable(Z)V

    return-void
.end method

.method public setRotationBy(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationBy(F)V

    return-void
.end method

.method public setRotationTo(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationTo(F)V

    return-void
.end method

.method public setScale(F)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(F)V

    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    :goto_0
    return-void
.end method

.method public setStroke(II)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setStroke(II)V

    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomTransitionDuration(I)V

    return-void
.end method

.method public setZoomable(Z)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    return-void
.end method

.method public setupTile(Lcom/miui/gallery/util/photoview/TileBitProvider;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->setupTile(Lcom/miui/gallery/util/photoview/TileBitProvider;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V

    return-void
.end method

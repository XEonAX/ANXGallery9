.class public Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "VideoThumbnailBackgroundDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;
    }
.end annotation


# instance fields
.field private mAspectRatio:F

.field private mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

.field private mBounds:Landroid/graphics/Rect;

.field private mDrawingLeft:I

.field private mDrawingRect:Landroid/graphics/Rect;

.field private mDrawingRight:I

.field private mLayoutDirection:I

.field private mPadding:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingLeft:I

    const v0, 0x7fffffff

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mLayoutDirection:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingLeft:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRight:I

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mAspectRatio:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mLayoutDirection:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v5

    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    mul-int v6, v1, v3

    add-int/2addr v6, v2

    iput v6, v5, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRight:I

    if-le v5, v6, :cond_1

    goto :goto_2

    :cond_1
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    add-int/lit8 v3, v3, 0x1

    mul-int v6, v1, v3

    add-int/2addr v6, v2

    iput v6, v5, Landroid/graphics/Rect;->right:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingLeft:I

    if-ge v5, v6, :cond_2

    goto :goto_0

    :cond_2
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    iget-object v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v7

    iput v6, v5, Landroid/graphics/Rect;->bottom:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v2

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

    invoke-interface {v6, v5, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_0

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v5, v4, v6, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v5

    :cond_4
    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    mul-int v6, v1, v3

    sub-int v6, v2, v6

    iput v6, v5, Landroid/graphics/Rect;->right:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingLeft:I

    if-ge v5, v6, :cond_5

    :goto_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_3

    :cond_5
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    add-int/lit8 v3, v3, 0x1

    mul-int v6, v1, v3

    sub-int v6, v2, v6

    iput v6, v5, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRight:I

    if-le v5, v6, :cond_6

    goto :goto_1

    :cond_6
    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    iget-object v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v7

    iput v6, v5, Landroid/graphics/Rect;->bottom:I

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    sub-int v5, v2, v5

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

    invoke-interface {v6, v5, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_4

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v5, v4, v6, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_1

    :cond_7
    :goto_3
    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getPaddingBottom()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    return v0
.end method

.method public getPaddingTop()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setAspectRatio(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mAspectRatio:F

    return-void
.end method

.method public setCLayoutDirection(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mLayoutDirection:I

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

.method public setDrawingArea(II)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mDrawingRight:I

    return-void
.end method

.method public setPadding(IIII)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public setmBitmapProvider(Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->mBitmapProvider:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;

    return-void
.end method

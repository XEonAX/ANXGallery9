.class public Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "DisabledRangeDrawable.java"


# instance fields
.field private mBounds:Landroid/graphics/Rect;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mDrawingLeft:I

.field private mDrawingRight:I

.field private mEndRangeScale:F

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mStartRangeScale:F


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingLeft:I

    const v0, 0x7fffffff

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingRight:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingLeft:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingRight:I

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingLeft:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingRight:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingLeft:I

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingTop:I

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingLeft:I

    add-int/2addr v4, v5

    int-to-float v0, v0

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mStartRangeScale:F

    mul-float v5, v5, v0

    float-to-int v5, v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingBottom:I

    sub-int/2addr v5, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingLeft:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mEndRangeScale:F

    mul-float v0, v0, v3

    float-to-int v0, v0

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingTop:I

    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingRight:I

    sub-int/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingBottom:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getOpacity()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public setDrawingArea(II)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mDrawingRight:I

    return-void
.end method

.method public setEndRangeScale(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mEndRangeScale:F

    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingTop:I

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingRight:I

    iput p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mPaddingBottom:I

    return-void
.end method

.method public setStartRangeScale(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->mStartRangeScale:F

    return-void
.end method

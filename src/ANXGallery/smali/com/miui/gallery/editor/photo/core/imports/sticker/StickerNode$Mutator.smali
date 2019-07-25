.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;
.super Ljava/lang/Object;
.source "StickerEditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Mutator"
.end annotation


# instance fields
.field private final mBitmapToCanvas:Landroid/graphics/Matrix;

.field private mBorder:Landroid/graphics/drawable/Drawable;

.field private final mCanvasToBitmap:Landroid/graphics/Matrix;

.field private mDelete:Landroid/graphics/drawable/Drawable;

.field private mDrawBounds:Landroid/graphics/Rect;

.field private mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

.field private mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

.field private mMirror:Landroid/graphics/drawable/Drawable;

.field private mReuseDegree:Landroid/graphics/Matrix;

.field private mReuseMatrix:Landroid/graphics/Matrix;

.field private mReusePoint:[F

.field private mReuseRect:Landroid/graphics/RectF;

.field private mReuseVector:[F

.field private mScale:Landroid/graphics/drawable/Drawable;

.field private mVertices:[[F


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDrawBounds:Landroid/graphics/Rect;

    const/4 v0, 0x4

    const/4 v1, 0x2

    filled-new-array {v0, v1}, [I

    move-result-object v2

    const-class v3, F

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[F

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    new-array v2, v1, [F

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReusePoint:[F

    new-array v2, v1, [F

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseDegree:Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    new-array v4, v1, [F

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700ab

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700b1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mMirror:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700b9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0700bc

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mCanvasToBitmap:Landroid/graphics/Matrix;

    return-void
.end method

.method private static setBounds(Landroid/graphics/drawable/Drawable;FF)V
    .locals 4

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float v3, p1, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    div-float/2addr v0, v2

    sub-float v2, p2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p0, v3, v2, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$002(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$002(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->updateDisplayInfo()V

    return-void
.end method

.method contains(FF)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReusePoint:[F

    aput p1, v0, v1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReusePoint:[F

    const/4 v0, 0x1

    aput p2, p1, v0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mCanvasToBitmap:Landroid/graphics/Matrix;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReusePoint:[F

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReusePoint:[F

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;[F)Z

    move-result p1

    return p1
.end method

.method draw(Landroid/graphics/Canvas;Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBitmapToCanvas:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mMirror:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method getBorderBounds()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method getDrawBounds()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDrawBounds:Landroid/graphics/Rect;

    return-object v0
.end method

.method getRadius()F
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDrawBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-double v0, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDrawBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method getVertex(I)[F
    .locals 1

    const/4 v0, 0x4

    if-gt p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object p1, v0, p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "error params"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method isDelete(FF)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method

.method isIdle()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isMirror(FF)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mMirror:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method

.method isScale(FF)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method

.method mirror()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V

    return-void
.end method

.method rotate(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseDegree:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->setSinCos(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseDegree:Landroid/graphics/Matrix;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$400(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;Landroid/graphics/Matrix;)V

    return-void
.end method

.method scale(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;F)V

    return-void
.end method

.method translate(FF)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    const/4 v0, 0x1

    aput p2, p1, v0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mCanvasToBitmap:Landroid/graphics/Matrix;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapVectors([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    aget p2, p2, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseVector:[F

    aget v0, v1, v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$600(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;FF)V

    return-void
.end method

.method unbind()Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    return-object v0
.end method

.method updateDisplayInfo()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDrawBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$800(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$900(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mBorder:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    aput v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v0, v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    const/4 v3, 0x1

    aput v2, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v0, v0, v3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    aput v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v0, v0, v3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    aput v2, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    const/4 v2, 0x2

    aget-object v0, v0, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v0, v0, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    aput v2, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    const/4 v2, 0x3

    aget-object v0, v0, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v0, v0, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    neg-float v4, v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    neg-float v5, v5

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mItem:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    array-length v4, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_0

    aget-object v6, v0, v5

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mReuseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v7, v6}, Landroid/graphics/Matrix;->mapPoints([F)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mDelete:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v4, v4, v3

    aget v4, v4, v1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v5, v5, v3

    aget v5, v5, v3

    invoke-static {v0, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->setBounds(Landroid/graphics/drawable/Drawable;FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mMirror:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v4, v4, v1

    aget v4, v4, v1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v5, v5, v1

    aget v5, v5, v3

    invoke-static {v0, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->setBounds(Landroid/graphics/drawable/Drawable;FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mScale:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v4, v4, v2

    aget v1, v4, v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mVertices:[[F

    aget-object v2, v4, v2

    aget v2, v2, v3

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->setBounds(Landroid/graphics/drawable/Drawable;FF)V

    return-void
.end method

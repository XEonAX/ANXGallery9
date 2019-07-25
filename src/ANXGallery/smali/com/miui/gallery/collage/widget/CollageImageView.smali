.class public Lcom/miui/gallery/collage/widget/CollageImageView;
.super Landroid/view/View;
.source "CollageImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;
    }
.end annotation


# instance fields
.field private final MAX_SCALE:F

.field private final MAX_SCALE_TOUCH:F

.field private mActivating:Z

.field private mAnimTargetMatrix:Landroid/graphics/Matrix;

.field private mBackgroundColor:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBitmapDisplayInitRect:Landroid/graphics/RectF;

.field private mBitmapDisplayRect:Landroid/graphics/RectF;

.field private mBitmapMatrix:Landroid/graphics/Matrix;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mCanvasMatrix:Landroid/graphics/Matrix;

.field private mDisplayInitRect:Landroid/graphics/RectF;

.field private mDisplayRect:Landroid/graphics/RectF;

.field private mDrawBitmap:Z

.field private mDrawingMatrix:Landroid/graphics/Matrix;

.field private mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

.field private mMask:Landroid/graphics/drawable/Drawable;

.field private mMatrixListener:Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;

.field private mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

.field private mMatrixValues:[F

.field private mMaxWidth:F

.field private mMaxWidthScale:F

.field private mMirror:Z

.field private mOriginBitmap:Landroid/graphics/Bitmap;

.field private mRadius:F

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mRotateDegree:I

.field private mXfermodeSrcIn:Landroid/graphics/PorterDuffXfermode;

.field private mXfermodeSrcOut:Landroid/graphics/PorterDuffXfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawingMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;-><init>(Lcom/miui/gallery/collage/widget/CollageImageView;Lcom/miui/gallery/collage/widget/CollageImageView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixListener:Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;

    const/16 p1, 0x9

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixValues:[F

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRectFTemp:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRadius:F

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mXfermodeSrcIn:Landroid/graphics/PorterDuffXfermode;

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mXfermodeSrcOut:Landroid/graphics/PorterDuffXfermode;

    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawBitmap:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->MAX_SCALE:F

    const/high16 v0, 0x40c00000    # 6.0f

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->MAX_SCALE_TOUCH:F

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mActivating:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->init()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->refreshBitmapDisplayRect()V

    return-void
.end method

.method static synthetic access$202(Lcom/miui/gallery/collage/widget/CollageImageView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mActivating:Z

    return p1
.end method

.method private drawBitmap(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawBitmap:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawingMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawBitmapWithMask(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMask:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmapWithMaskDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method private drawBitmapWithMaskDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    const/16 v2, 0x1f

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mXfermodeSrcOut:Landroid/graphics/PorterDuffXfermode;

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mXfermodeSrcIn:Landroid/graphics/PorterDuffXfermode;

    :goto_0
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapPaint:Landroid/graphics/Paint;

    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mXfermodeSrcIn:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmap(Landroid/graphics/Canvas;)V

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawBitmapWithRadius(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRadius:F

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p0, p1, v0, v3}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmapWithMaskDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixListener:Lcom/miui/gallery/collage/widget/CollageImageView$MatrixListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->setMatrixUpdateListener(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050062

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundColor:I

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mGradientDrawable:Landroid/graphics/drawable/GradientDrawable;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method

.method private refreshBitmapDisplayRect()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    return-void
.end method

.method private resetBitmapMatrix()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget-boolean v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    iget v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    iget-object v6, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/collage/render/CollageRender;->initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;ZILandroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetInitParams()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private resetBitmapMatrixWithAnim()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget-boolean v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    iget v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    iget-object v6, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/collage/render/CollageRender;->initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;ZILandroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetInitParams()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    const/4 v1, 0x4

    new-array v1, v1, [Landroid/graphics/Matrix;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapMatrix:Landroid/graphics/Matrix;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->animMatrix([Landroid/graphics/Matrix;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private resetInitParams()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40800000    # 4.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMaxWidth:F

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMaxWidthScale:F

    return-void
.end method

.method private resetMatrixWithAnim()V
    .locals 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mActivating:Z

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixValues:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixValues:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v3

    if-gtz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageImageView;->countAnimMatrixWhenZoomOut(Landroid/graphics/Matrix;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageImageView;->countAnimMatrixWhenZoomIn(Landroid/graphics/Matrix;)V

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    aput-object v4, v3, v2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    aput-object v2, v3, v0

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->animMatrix([Landroid/graphics/Matrix;)V

    return-void
.end method

.method private resolvePadding(Landroid/graphics/RectF;)V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getPaddingRight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getPaddingBottom()I

    move-result v3

    int-to-float v3, v3

    iget v4, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v0

    iput v4, p1, Landroid/graphics/RectF;->left:F

    iget v0, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->right:F

    iget v0, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, v2

    iput v0, p1, Landroid/graphics/RectF;->top:F

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v3

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method


# virtual methods
.method public appendScale(FFF)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMaxWidthScale:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr p2, v1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr p3, v1

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->refreshBitmapDisplayRect()V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void
.end method

.method protected countAnimMatrixWhenZoomIn(Landroid/graphics/Matrix;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v2, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v3, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v2, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMaxWidth:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_0

    iget v3, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMaxWidth:F

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr v3, v4

    iget-object v4, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v1, v3, v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object v3, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    :cond_0
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, v2, Landroid/graphics/RectF;->left:F

    iget v6, v2, Landroid/graphics/RectF;->right:F

    iget v7, v2, Landroid/graphics/RectF;->top:F

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v8, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    iget-object v9, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v9

    iget-object v10, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    iget-object v11, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    iget-object v12, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->top:F

    iget-object v13, v0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    cmpl-float v14, v5, v10

    const/4 v15, 0x0

    const/high16 v16, 0x3f000000    # 0.5f

    if-lez v14, :cond_2

    cmpl-float v6, v3, v8

    if-lez v6, :cond_1

    sub-float/2addr v5, v10

    neg-float v3, v5

    goto :goto_0

    :cond_1
    sub-float/2addr v5, v10

    neg-float v5, v5

    sub-float/2addr v8, v3

    mul-float v8, v8, v16

    add-float v3, v5, v8

    goto :goto_0

    :cond_2
    cmpg-float v5, v6, v11

    if-gez v5, :cond_4

    cmpl-float v5, v3, v8

    if-lez v5, :cond_3

    sub-float v3, v11, v6

    goto :goto_0

    :cond_3
    sub-float/2addr v11, v6

    sub-float/2addr v8, v3

    mul-float v8, v8, v16

    sub-float v3, v11, v8

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    cmpl-float v5, v7, v12

    if-lez v5, :cond_6

    cmpl-float v2, v4, v9

    if-lez v2, :cond_5

    sub-float/2addr v7, v12

    neg-float v15, v7

    goto :goto_1

    :cond_5
    sub-float/2addr v7, v12

    neg-float v2, v7

    sub-float/2addr v9, v4

    mul-float v9, v9, v16

    add-float v15, v2, v9

    goto :goto_1

    :cond_6
    cmpg-float v5, v2, v13

    if-gez v5, :cond_8

    cmpl-float v5, v4, v9

    if-lez v5, :cond_7

    sub-float v15, v13, v2

    goto :goto_1

    :cond_7
    sub-float/2addr v13, v2

    sub-float/2addr v9, v4

    mul-float v9, v9, v16

    sub-float v15, v13, v9

    :cond_8
    :goto_1
    invoke-virtual {v1, v3, v15}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method protected countAnimMatrixWhenZoomOut(Landroid/graphics/Matrix;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMatrixValues:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {p1, v2, v2, v1, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    cmpl-float v1, v1, v2

    const/4 v2, 0x0

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget v3, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v3

    goto :goto_0

    :cond_0
    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    cmpg-float v1, v1, v3

    if-gez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v3

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget v0, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v0

    goto :goto_1

    :cond_2
    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v0

    :cond_3
    :goto_1
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method public generateBitmapRenderData()Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;
    .locals 3

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget v0, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v0, v2

    iput v0, v1, Landroid/graphics/RectF;->left:F

    iget v0, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v0, v2

    iput v0, v1, Landroid/graphics/RectF;->right:F

    iget v0, v1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v0, v2

    iput v0, v1, Landroid/graphics/RectF;->top:F

    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v0, v2

    iput v0, v1, Landroid/graphics/RectF;->bottom:F

    new-instance v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    invoke-direct {v0}, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iput-object v2, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmap:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    iput v2, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->rotate:I

    iget-boolean v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    iput-boolean v2, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->mirror:Z

    iget-object v2, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmapInsideRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->transition:Z

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMask:Landroid/graphics/drawable/Drawable;

    iput-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->maskDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRadius:F

    iput v1, v0, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->radius:F

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getCanvasMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public getDisplayRect(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public getRotateDegree()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    return v0
.end method

.method public isActivating()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mActivating:Z

    return v0
.end method

.method public isMirror()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    return v0
.end method

.method public mirror()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapMatrix()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawingMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawingMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawingMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMask:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmapWithMask(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRadius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmapWithRadius(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->drawBitmap(Landroid/graphics/Canvas;)V

    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 p4, 0x0

    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->resolvePadding(Landroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapMatrix()V

    return-void
.end method

.method public resetBitmapLocation()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetMatrixWithAnim()V

    return-void
.end method

.method public resetDrawData(Landroid/graphics/Bitmap;IZ)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    iput p2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    iput-boolean p3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMirror:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawBitmap:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapMatrix()V

    return-void
.end method

.method public rotate()V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    add-int/lit8 v0, v0, -0x5a

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    rem-int/lit16 v0, v0, 0x168

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRotateDegree:I

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapMatrixWithAnim()V

    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBackgroundColor:I

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapRect:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapMatrix()V

    return-void
.end method

.method public setDrawBitmap(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDrawBitmap:Z

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void
.end method

.method public setMask(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void
.end method

.method public setRadius(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mRadius:F

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void
.end method

.method public transition(FF)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v5, p1, v4

    const/high16 v6, 0x3f800000    # 1.0f

    if-lez v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    cmpl-float v5, v5, v7

    if-lez v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v5

    div-float v0, v1, v0

    goto :goto_0

    :cond_0
    cmpg-float v5, p1, v4

    if-gez v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v7, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    cmpg-float v5, v5, v7

    if-gez v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, v1

    div-float v0, v5, v0

    goto :goto_0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    cmpl-float v1, p2, v4

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v5

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v1

    div-float v6, v3, v2

    goto :goto_1

    :cond_2
    cmpg-float v1, p2, v4

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mDisplayRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v3

    div-float v6, v1, v2

    :cond_3
    :goto_1
    mul-float p1, p1, v0

    mul-float p2, p2, v6

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageImageView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->refreshBitmapDisplayRect()V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageImageView;->invalidate()V

    return-void
.end method

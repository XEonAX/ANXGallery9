.class Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;
.super Ljava/lang/Object;
.source "CollageLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DragBitmapItem"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapMatrix:Landroid/graphics/Matrix;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mDisplayOriginRect:Landroid/graphics/RectF;

.field private mDisplayRect:Landroid/graphics/RectF;

.field private mMirror:Z

.field private mRectTemp:Landroid/graphics/RectF;

.field private mRotateDegree:I

.field private mScale:F

.field private mShowAnimator:Landroid/animation/ObjectAnimator;

.field private mTransitionAnimator:Landroid/animation/ObjectAnimator;

.field private mUserMatrix:Landroid/graphics/Matrix;


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayOriginRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRectTemp:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mUserMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRotateDegree:I

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mMirror:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;-><init>()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/animation/ObjectAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRotateDegree:I

    return p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mMirror:Z

    return p0
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mUserMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    neg-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method getTransitionAnimator(Landroid/graphics/RectF;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->getTransitionAnimator(Landroid/graphics/RectF;ZLandroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    return-object p1
.end method

.method getTransitionAnimator(Landroid/graphics/RectF;ZLandroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;
    .locals 9

    const/4 v0, 0x3

    const/16 v1, 0xff

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-eqz p2, :cond_0

    const/4 p2, 0x4

    new-array p2, p2, [Landroid/animation/PropertyValuesHolder;

    const-string v6, "scale"

    new-array v7, v4, [F

    iget v8, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    aput v8, v7, v5

    aput v2, v7, v3

    invoke-static {v6, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, p2, v5

    const-string v2, "alpha"

    new-array v6, v4, [I

    iget-object v7, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->getAlpha()I

    move-result v7

    aput v7, v6, v5

    aput v1, v6, v3

    invoke-static {v2, v6}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, p2, v3

    const-string v1, "displayRect"

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;

    invoke-direct {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;-><init>()V

    new-array v6, v4, [Ljava/lang/Object;

    new-instance v7, Landroid/graphics/RectF;

    iget-object v8, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-direct {v7, v8}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    aput-object v7, v6, v5

    aput-object p1, v6, v3

    invoke-static {v1, v2, v6}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    aput-object p1, p2, v4

    const-string p1, "userMatrix"

    new-instance v1, Lcom/miui/gallery/editor/photo/app/MatrixEvaluator;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/app/MatrixEvaluator;-><init>()V

    new-array v2, v4, [Ljava/lang/Object;

    new-instance v4, Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mUserMatrix:Landroid/graphics/Matrix;

    invoke-direct {v4, v6}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    aput-object v4, v2, v5

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    aput-object v4, v2, v3

    invoke-static {p1, v1, v2}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    aput-object p1, p2, v0

    invoke-static {p0, p2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-array p2, v0, [Landroid/animation/PropertyValuesHolder;

    const-string v0, "scale"

    new-array v6, v4, [F

    iget v7, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    aput v7, v6, v5

    aput v2, v6, v3

    invoke-static {v0, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, p2, v5

    const-string v0, "alpha"

    new-array v2, v4, [I

    iget-object v6, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getAlpha()I

    move-result v6

    aput v6, v2, v5

    aput v1, v2, v3

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, p2, v3

    const-string v0, "displayRect"

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;-><init>()V

    new-array v2, v4, [Ljava/lang/Object;

    new-instance v6, Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-direct {v6, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    aput-object v6, v2, v5

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    aput-object p1, p2, v4

    invoke-static {p0, p2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    :goto_0
    invoke-virtual {p1, p3}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object p1
.end method

.method receiveScrollEvent(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->offset(FF)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->refreshBitmapMatrix()V

    return-void
.end method

.method refreshBitmapMatrix()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget-boolean v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mMirror:Z

    iget v4, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRotateDegree:I

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRectTemp:Landroid/graphics/RectF;

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/collage/render/CollageRender;->initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;ZILandroid/graphics/RectF;)V

    return-void
.end method

.method release()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method reset(Landroid/animation/ValueAnimator$AnimatorUpdateListener;Landroid/animation/Animator$AnimatorListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayOriginRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->getTransitionAnimator(Landroid/graphics/RectF;ZLandroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mTransitionAnimator:Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mTransitionAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0xdc

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mTransitionAnimator:Landroid/animation/ObjectAnimator;

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mTransitionAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mTransitionAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method setCollageImageView(Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->getRotateDegree()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mRotateDegree:I

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->isMirror()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mMirror:Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayOriginRect:Landroid/graphics/RectF;

    invoke-static {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$1500(Landroid/graphics/RectF;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayOriginRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->refreshBitmapMatrix()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mUserMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->getCanvasMatrix(Landroid/graphics/Matrix;)V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setDisplayRect(Landroid/graphics/RectF;)V
    .locals 1
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->refreshBitmapMatrix()V

    return-void
.end method

.method public setScale(F)V
    .locals 0
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    return-void
.end method

.method public setUserMatrix(Landroid/graphics/Matrix;)V
    .locals 1
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mUserMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    return-void
.end method

.method show(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V
    .locals 7

    const/4 v0, 0x2

    new-array v1, v0, [Landroid/animation/PropertyValuesHolder;

    const-string v2, "scale"

    new-array v3, v0, [F

    iget v4, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mScale:F

    const/4 v5, 0x0

    aput v4, v3, v5

    const/4 v4, 0x1

    const v6, 0x3f8ccccd    # 1.1f

    aput v6, v3, v4

    invoke-static {v2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, v1, v5

    const-string v2, "alpha"

    new-array v0, v0, [I

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v3

    aput v3, v0, v5

    const/16 v3, 0xc8

    aput v3, v0, v4

    invoke-static {v2, v0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {p0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x17c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->mShowAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

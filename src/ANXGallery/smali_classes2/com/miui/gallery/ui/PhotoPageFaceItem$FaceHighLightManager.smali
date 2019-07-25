.class Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;
.super Ljava/lang/Object;
.source "PhotoPageFaceItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFaceItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaceHighLightManager"
.end annotation


# instance fields
.field private isAnimatorStarted:Z

.field private isExiting:Z

.field private mAnimator:Landroid/animation/ValueAnimator;

.field private mCurrentAlpha:F

.field private mCurrentRadius:I

.field private mCurrentX:I

.field private mCurrentY:I

.field private mExitAlpha:F

.field private mOrientation:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

.field private mStartRadius:I

.field private mStartX:I

.field private mStartY:I

.field private mTargetRadius:I

.field private mTargetX:I

.field private mTargetY:I

.field private mXfermode:Landroid/graphics/PorterDuffXfermode;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mOrientation:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mExitAlpha:F

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mXfermode:Landroid/graphics/PorterDuffXfermode;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/ui/PhotoPageFaceItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentAlpha:F

    return p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentAlpha:F

    return p1
.end method

.method static synthetic access$1302(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mExitAlpha:F

    return p1
.end method

.method static synthetic access$1402(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentX:I

    return p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetX:I

    return p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartX:I

    return p0
.end method

.method static synthetic access$1702(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentY:I

    return p1
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetY:I

    return p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartY:I

    return p0
.end method

.method static synthetic access$2002(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentRadius:I

    return p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetRadius:I

    return p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartRadius:I

    return p0
.end method

.method private initTargetValues()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawableSize()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mOrientation:I

    invoke-static {v1, v0, v2, v3}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$900(FFLcom/miui/gallery/cloud/peopleface/PeopleFace;I)Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getBaseMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetRadius:I

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetX:I

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetY:I

    :cond_1
    return-void
.end method


# virtual methods
.method protected bindViewAndData(Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/model/CloudItem;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/peopleface/PeopleFace;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/CloudItem;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/CloudItem;->getOrientation()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mOrientation:I

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->getRecommendFaceId()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->serverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->initTargetValues()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->invalidate()V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method protected isExiting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    return v0
.end method

.method protected isVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->getRecommendFaceId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->exit()V

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetRadius:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mExitAlpha:F

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPeopleFace:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mTargetRadius:I

    if-gtz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget v4, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentAlpha:F

    aput v4, v2, v3

    const/high16 v3, 0x3f000000    # 0.5f

    aput v3, v2, v1

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v5, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v6, v0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentAlpha:F

    const/high16 v9, 0x437f0000    # 255.0f

    mul-float v0, v0, v9

    float-to-int v7, v0

    const/16 v8, 0x1f

    move-object v2, p1

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoView;->getSuppMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_2

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mExitAlpha:F

    mul-float v3, v3, v9

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->drawPaint(Landroid/graphics/Paint;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mXfermode:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentY:I

    int-to-float v2, v2

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method protected onExiting()Z
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->pause()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->reverse()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->resume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 4

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isAnimatorStarted:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getWidth()I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getHeight()I

    move-result p2

    int-to-double p3, p1

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {p3, p4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p3

    int-to-double v2, p2

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr p3, v2

    invoke-static {p3, p4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p3

    div-double/2addr p3, v0

    double-to-int p3, p3

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartX:I

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentX:I

    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartY:I

    iput p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentY:I

    iput p3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mStartRadius:I

    iput p3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->mCurrentRadius:I

    :cond_0
    return-void
.end method

.method public final onMatrixChanged()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->initTargetValues()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->invalidate()V

    :cond_0
    return-void
.end method

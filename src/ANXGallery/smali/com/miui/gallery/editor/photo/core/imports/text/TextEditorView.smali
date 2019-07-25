.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;
.super Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;
.source "TextEditorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;,
        Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;,
        Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;
    }
.end annotation


# instance fields
.field private mAuxiliaryPaint:Landroid/graphics/Paint;

.field private mCanvasOffsetY:F

.field private mContext:Landroid/content/Context;

.field private mCurrentIndex:I

.field private mCurrentTargetOffsetY:F

.field private mITextDialogConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mLocation:[I

.field private mOffsetAnimator:Landroid/animation/ObjectAnimator;

.field private mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

.field private mOriginScale:F

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

.field private mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectTemp:Landroid/graphics/Rect;

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mLocation:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCanvasOffsetY:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentTargetOffsetY:F

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;F)F
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertDistanceX(F)F

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;F)F
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertDistanceY(F)F

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->findActivationIndex()I

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->notifyModify()V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;FF)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->findItemByEvent(FF)I

    move-result p0

    return p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/graphics/RectF;)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getRectOverScrollStatus(Landroid/graphics/RectF;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;FF)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->findTouchAction(FF)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->updateOperationDrawable(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->notifyItemEdit()V

    return-void
.end method

.method private configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 12

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v3, 0x0

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isReverseColor()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    :goto_0
    move-object v5, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    goto :goto_0

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_2

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isDialogEnable()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v2, 0x0

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_2

    :cond_2
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v8, 0x0

    sget-object v9, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v10, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    :goto_2
    return-void
.end method

.method private configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getRotateDegrees()F

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configDecorationPositon(Landroid/graphics/RectF;Landroid/graphics/Matrix;FFF)V

    return-void
.end method

.method private countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-interface {p1, p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->countLocation(ZF)V

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    :goto_0
    return-void
.end method

.method private findActivationIndex()I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isActivation()Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private findItemByEvent(FF)I
    .locals 6

    const/high16 v0, -0x40800000    # -1.0f

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/high16 v3, -0x40800000    # -1.0f

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v4, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->contains(FF)Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-direct {p0, v4, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getDistance(Landroid/graphics/RectF;FF)F

    move-result v4

    cmpl-float v5, v3, v0

    if-nez v5, :cond_1

    move v1, v2

    move v3, v4

    goto :goto_1

    :cond_1
    cmpg-float v4, v4, v3

    if-gtz v4, :cond_2

    move v1, v2

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private findTouchAction(FF)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;
    .locals 3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1

    :cond_5
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p1
.end method

.method private getDistance(Landroid/graphics/RectF;FF)F
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    sub-float/2addr v0, p2

    float-to-double v0, v0

    sub-float/2addr p1, p3

    float-to-double p1, p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mContext:Landroid/content/Context;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$1;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;-><init>(Landroid/content/res/Resources;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-void
.end method

.method public static synthetic lambda$addNewItem$82(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    return-void
.end method

.method private notifyClear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;->onClear()V

    :cond_0
    return-void
.end method

.method private notifyItemEdit()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;->onItemEdit()V

    :cond_0
    return-void
.end method

.method private notifyModify()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;->onModify()V

    :cond_0
    return-void
.end method

.method private refreshTextConfig()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemTextDialogConfig()Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setScaleMultipleOrigin(F)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    const v2, 0x3f733333    # 0.95f

    div-float/2addr v1, v2

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setScaleMultipleOrigin(F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v3, v3, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBitmapSize(FF)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDisplaySize(FF)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    :cond_1
    return-void
.end method

.method private setCanvasOffsetY(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCanvasOffsetY:F

    return-void
.end method

.method private updateOperationDrawable(Z)V
    .locals 6

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    :goto_0
    move-object v4, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    goto :goto_0

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v2, 0x0

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    return-void
.end method


# virtual methods
.method public addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V
    .locals 3

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    const v1, 0x3f733333    # 0.95f

    div-float/2addr v0, v1

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getWatermarkInfo()Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    move-result-object p1

    invoke-direct {v1, v2, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;-><init>(Landroid/content/res/Resources;Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;F)V

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->init()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBitmapSize(FF)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/-$$Lambda$TextEditorView$fP-5J5g38X-7RvFtudtfbSiJPsY;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/-$$Lambda$TextEditorView$fP-5J5g38X-7RvFtudtfbSiJPsY;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBitmapLoadingListener(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getPaddingTop()I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setPaddingTop(I)V

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mContext:Landroid/content/Context;

    invoke-direct {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;-><init>(Landroid/content/Context;)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    invoke-interface {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setScaleMultipleOrigin(F)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-interface {v1, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDisplaySize(FF)V

    const/4 p1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0, v1, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setLastItemActivation()V

    return-void
.end method

.method public clearActivation(Z)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->notifyClear()V

    move v1, v3

    goto :goto_1

    :cond_0
    invoke-interface {v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    invoke-interface {v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->disableChildHandleMode()V

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    :cond_2
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    const-string v0, "TextEditorView"

    const-string v1, "drawChild size : %d"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isActivation()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCanvasOffsetY:F

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCanvasOffsetY:F

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_2
    return-void
.end method

.method public enableStatusForCurrentItem(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;Z)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDialogWithStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    sub-float/2addr v1, p1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->appendUserLocationX(F)V

    sub-float/2addr v2, p2

    invoke-interface {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->appendUserLocationY(F)V

    :cond_1
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method public export()Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;
    .locals 4

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;-><init>(Landroid/graphics/RectF;Ljava/util/List;Landroid/content/res/Resources;)V

    return-object v0
.end method

.method public getActivationItemBottom()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mLocation:[I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getLocationInWindow([I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->findLowerDecorationPosition()F

    move-result v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    :cond_0
    return v0
.end method

.method public getCurrentItemStatus(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getColor()I

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextTransparent()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v1

    iput-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isBoldText()Z

    move-result v1

    iput-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isShadow()Z

    move-result v1

    iput-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v1

    iput-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserLocationX()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserLocationY()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserScaleMultiple()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getRotateDegrees()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    return-void
.end method

.method public getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    return-void
.end method

.method public getItemAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v0

    return-object v0
.end method

.method public getItemBold()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isBoldText()Z

    move-result v0

    return v0
.end method

.method public getItemColor()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getColor()I

    move-result v0

    return v0
.end method

.method public getItemDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    move-result-object v0

    return-object v0
.end method

.method public getItemShadow()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isShadow()Z

    move-result v0

    return v0
.end method

.method public getItemText()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemTextDialogConfig()Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    return-object v0
.end method

.method public getItemTransparent()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextTransparent()F

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isIndexValid(I)Z
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isItemActivation()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public offsetWithAnimator(F)V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentTargetOffsetY:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :goto_0
    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentTargetOffsetY:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p0}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    const-string v1, "canvasOffsetY"

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCanvasOffsetY:F

    aput v3, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    const-string v0, "TextEditorView"

    const-string v1, "start targetOffset : %f"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected onBitmapMatrixChanged()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->onBitmapMatrixChanged()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    const v1, 0x3e99999a    # 0.3f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mOriginScale:F

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->refreshTextConfig()V

    :goto_0
    return-void
.end method

.method protected onCanvasMatrixChange()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->onCanvasMatrixChange()V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    :cond_0
    return-void
.end method

.method public removeLastItem()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public setActivation(I)V
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->clearActivation(Z)V

    if-ltz p1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isActivation()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    invoke-direct {p0, v1, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->enableChildHandleMode()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public setItemBold(Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setBoldText(Z)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setItemDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;Landroid/content/res/Resources;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method public setItemShadow(Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setShadow(Z)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setItemText(Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setText(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    :cond_1
    return-void
.end method

.method public setItemTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setItemTextColor(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setColor(I)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setItemTransparent(F)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextTransparent(F)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setItemTypeface(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mCurrentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method public setLastItemActivation()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setActivation(I)V

    return-void
.end method

.method public setTextEditorListener(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    return-void
.end method

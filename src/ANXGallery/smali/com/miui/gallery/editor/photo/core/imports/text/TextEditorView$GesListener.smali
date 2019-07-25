.class Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;
.super Ljava/lang/Object;
.source "TextEditorView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GesListener"
.end annotation


# instance fields
.field mBaseDegrees:F

.field mBaseDistance:F

.field mCenterX:F

.field mCenterY:F

.field mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

.field mDownConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

.field mDownIndex:I

.field mDownX:F

.field mDownY:F

.field mNeedInit:Z

.field private mPointTemp1:[F

.field private mPointTemp2:[F

.field mPreDegrees:F

.field mPreScale:F

.field mRectF:Landroid/graphics/RectF;

.field mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDistance:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDegrees:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mRectF:Landroid/graphics/RectF;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mNeedInit:Z

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreScale:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreDegrees:F

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp2:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    return-void
.end method

.method private doScroll(FFLcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 3

    if-eqz p3, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-interface {p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1900(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$2000(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/graphics/RectF;)I

    move-result v0

    and-int/lit8 v1, v0, 0x8

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    cmpl-float v1, p1, v2

    if-lez v1, :cond_1

    :goto_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_1

    cmpg-float v1, p1, v2

    if-gez v1, :cond_1

    goto :goto_0

    :cond_1
    :goto_1
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_2

    cmpl-float v0, p2, v2

    if-lez v0, :cond_3

    goto :goto_2

    :cond_2
    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    cmpg-float v0, p2, v2

    if-gez v0, :cond_3

    goto :goto_2

    :cond_3
    move v2, p2

    :goto_2
    neg-float p1, p1

    invoke-interface {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->appendUserLocationX(F)V

    neg-float p1, v2

    invoke-interface {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->appendUserLocationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    const/4 p2, 0x0

    invoke-static {p1, p3, p2, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    :cond_4
    return-void
.end method


# virtual methods
.method public onActionUp(FF)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1600(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result p1

    const/4 p2, 0x1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->refreshRotateDegree()V

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    const/4 v1, 0x0

    invoke-static {v0, p1, p2, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownX:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownY:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownX:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownY:F

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;FF)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;

    move-result-object v0

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mRectF:Landroid/graphics/RectF;

    invoke-interface {v0, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result v0

    if-eq v0, v3, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;FF)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result v0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mNeedInit:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mRectF:Landroid/graphics/RectF;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    :goto_1
    const-string p1, "TextEditorView"

    const-string v0, "mTouchAction : %s"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserScaleMultiple()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    mul-float v1, v1, p1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setUserScaleMultiple(F)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result v0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp2:[F

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp2:[F

    const/4 p2, 0x0

    aget p1, p1, p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp2:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    aget v2, v2, p2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    aget v1, v3, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v3, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;F)F

    move-result p3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {v3, p4}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;F)F

    move-result p4

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$2;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$TextEditorView$TouchAction:[I

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x6

    if-eq v3, v4, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-direct {p0, p3, p4, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->doScroll(FFLcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    goto/16 :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    if-eq p1, p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setActivation(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Ljava/util/List;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-direct {p0, p3, p4, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->doScroll(FFLcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    goto/16 :goto_0

    :cond_1
    iget-boolean p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mNeedInit:Z

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p3}, Landroid/graphics/RectF;->centerX()F

    move-result p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p3}, Landroid/graphics/RectF;->centerY()F

    move-result p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    sub-float/2addr p3, v2

    float-to-double p3, p3

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    sub-float/2addr v3, v1

    float-to-double v3, v3

    invoke-static {p3, p4, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p3

    double-to-float p3, p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDistance:F

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    sub-float/2addr v1, p3

    float-to-double p3, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    sub-float/2addr v2, v1

    float-to-double v1, v2

    invoke-static {p3, p4, v1, v2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p3

    double-to-float p3, p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDegrees:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p3}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserScaleMultiple()F

    move-result p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreScale:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p3}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getRotateDegrees()F

    move-result p3

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreDegrees:F

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mNeedInit:Z

    :cond_2
    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    sub-float/2addr p3, p1

    float-to-double p3, p3

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    sub-float/2addr v1, v0

    float-to-double v1, v1

    invoke-static {p3, p4, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p3

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterY:F

    sub-float/2addr v0, v1

    float-to-double v0, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCenterX:F

    sub-float/2addr p1, v2

    float-to-double v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDistance:F

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p3, v2

    double-to-float p1, p3

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mBaseDegrees:F

    float-to-double p3, p3

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v0, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreScale:F

    mul-float p1, p1, v1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setUserScaleMultiple(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    double-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPreDegrees:F

    add-float/2addr p3, p4

    invoke-interface {p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setRotateDegrees(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-static {p1, p3, p2, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    :cond_4
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)V
    .locals 3

    const-string v0, "TextEditorView"

    const-string v1, "click number\uff1a %d"

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mDownIndex:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setActivation(I)V

    goto/16 :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    if-eqz p1, :cond_2

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$2;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$TextEditorView$TouchAction:[I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->ordinal()I

    move-result v1

    aget p1, p1, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    aget v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mPointTemp1:[F

    aget v1, v1, v2

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->contains(FF)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->clearActivation(Z)V

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->reverseColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/high16 v0, -0x1000000

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->reverseColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->invalidate()V

    goto :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isDialogEnable()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->toggleMirror()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->mCurrentConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-static {p1, v0, v2, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;)V

    :cond_2
    :goto_0
    :pswitch_4
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

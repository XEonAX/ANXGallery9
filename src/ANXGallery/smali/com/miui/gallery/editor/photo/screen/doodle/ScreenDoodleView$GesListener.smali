.class Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;
.super Ljava/lang/Object;
.source "ScreenDoodleView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GesListener"
.end annotation


# instance fields
.field private mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

.field private mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

.field private mDownIndex:I

.field private mDownNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

.field private mDownX:F

.field private mDownY:F

.field private mPointTemp1:[F

.field private mPointTemp2:[F

.field private mPointTemp3:[F

.field private mScaleMode:Z

.field private mScrollX:F

.field private mScrollY:F

.field private mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScaleMode:Z

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp1:[F

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp2:[F

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp3:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    return-void
.end method

.method private findItemByEvent(FF)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->contains(FF)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->isCanSelected()Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private findTouchActionWithAction(FF)Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->DELETE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->ROTATE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->SCALE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    return-object p1

    :cond_2
    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    return-object p1
.end method

.method private generateDoodle(FF)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->getDoodleDrawable(Landroid/content/res/Resources;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$202(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Z)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->receivePosition(FF)V

    return-void
.end method

.method private moveDoodle(FFLcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getStrokeRectF(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateDegrees()F

    move-result v1

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateX()F

    move-result v2

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateY()F

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getUserLocationX()F

    move-result v1

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getUserLocationY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getRectOverScrollStatus(Landroid/graphics/RectF;)I

    move-result v0

    const-string v1, "ScreenDoodleView"

    const-string v2, "scroll rect : %s"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

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

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->appendUserLocationX(F)V

    neg-float p1, v2

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->appendUserLocationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    return-void
.end method


# virtual methods
.method public onActionUp(FF)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countSize()V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->processOnUp()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 4

    const-string v0, "ScreenDoodleView"

    const-string v1, "onDown"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp1:[F

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp1:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownX:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp1:[F

    const/4 v2, 0x1

    aget v0, v0, v2

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownY:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollX:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownY:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollY:F

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$202(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Z)Z

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScaleMode:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownX:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownY:F

    invoke-direct {p0, v0, v3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->findItemByEvent(FF)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->findTouchActionWithAction(FF)Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->processOnDownEvent(FF)V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    :goto_0
    const-string p1, "ScreenDoodleView"

    const-string v0, "mTouchAction %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v2
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    const-string v0, "ScreenDoodleView"

    const-string v1, "onScale : %f"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->appendScale(F)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$2300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScaleMode:Z

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp1:[F

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp2:[F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v5

    move/from16 v6, p3

    invoke-virtual {v5, v6}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertDistanceX(F)F

    move-result v11

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v5

    move/from16 v6, p4

    invoke-virtual {v5, v6}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertDistanceY(F)F

    move-result v12

    iget v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollX:F

    sub-float/2addr v5, v11

    iput v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollX:F

    iget v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollY:F

    sub-float/2addr v5, v12

    iput v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollY:F

    sget-object v5, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$1;->$SwitchMap$com$miui$gallery$editor$photo$screen$doodle$ScreenDoodleView$TouchAction:[I

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x1

    const/4 v15, 0x0

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v5

    invoke-virtual {v5, v1, v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v1

    invoke-virtual {v1, v2, v4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp3:[F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    aput v2, v1, v15

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    aput v2, v1, v6

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate([F)V

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    aget v7, v3, v15

    aget v8, v3, v6

    aget v9, v4, v15

    aget v10, v4, v6

    aget v13, v1, v15

    aget v14, v1, v6

    move-object v6, v2

    invoke-virtual/range {v6 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->processScaleEvent(FFFFFFFF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    goto/16 :goto_0

    :pswitch_1
    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v5

    invoke-virtual {v5, v1, v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v1

    invoke-virtual {v1, v2, v4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mPointTemp3:[F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    aput v2, v1, v15

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    aput v2, v1, v6

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate([F)V

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    aget v7, v3, v15

    aget v8, v3, v6

    aget v9, v4, v15

    aget v10, v4, v6

    aget v13, v1, v15

    aget v14, v1, v6

    move-object v6, v2

    invoke-virtual/range {v6 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->processRotateEvent(FFFFFFFF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->setDrawDecoration(Z)V

    goto :goto_0

    :pswitch_2
    iget-boolean v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScaleMode:Z

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {v0, v11, v12, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->moveDoodle(FFLcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-ne v1, v3, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {v0, v11, v12, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->moveDoodle(FFLcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    goto :goto_0

    :cond_1
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-ne v1, v6, :cond_4

    iget v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollX:F

    iget v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mScrollY:F

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->generateDoodle(FF)V

    goto :goto_0

    :cond_2
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-nez v1, :cond_3

    iget v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownX:F

    iget v3, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownY:F

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->generateDoodle(FF)V

    :cond_3
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$900(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object v1

    invoke-virtual {v1, v2, v4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-ne v1, v6, :cond_4

    aget v1, v4, v15

    aget v2, v4, v6

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->generateDoodle(FF)V

    :cond_4
    :goto_0
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    if-eqz v1, :cond_5

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    :cond_5
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$1900(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    if-eq p1, v0, :cond_1

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$1;->$SwitchMap$com$miui$gallery$editor$photo$screen$doodle$ScreenDoodleView$TouchAction:[I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mTouchAction:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mActivationNode:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->clearActivation()V

    goto :goto_0

    :cond_2
    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I

    move-result v0

    if-eq p1, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;->mDownIndex:I

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->access$600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;I)V

    :cond_3
    :goto_0
    return-void
.end method

.class Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;
.super Ljava/lang/Object;
.source "CollageLayout.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomGestureListener"
.end annotation


# instance fields
.field private mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

.field private mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

.field private mIsLongPressMode:Z

.field private mLastX:F

.field private mLastY:F

.field final synthetic this$0:Lcom/miui/gallery/collage/widget/CollageLayout;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout;Lcom/miui/gallery/collage/widget/CollageLayout$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout;)V

    return-void
.end method


# virtual methods
.method onActionMove(Landroid/view/MotionEvent;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastX:F

    sub-float v1, v0, v1

    iget v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastY:F

    sub-float v2, p1, v2

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v3}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$900(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->receiveScrollEvent(FF)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v1, v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$300(Lcom/miui/gallery/collage/widget/CollageLayout;FF)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-static {v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$600(Lcom/miui/gallery/collage/widget/CollageLayout;Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$502(Lcom/miui/gallery/collage/widget/CollageLayout;I)I

    :cond_1
    :goto_0
    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastX:F

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastY:F

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$300(Lcom/miui/gallery/collage/widget/CollageLayout;FF)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mLastY:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$402(Lcom/miui/gallery/collage/widget/CollageLayout;Z)Z

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2

    const-string v0, "CollageLayout"

    const-string v1, "onLongPress"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->dismissControlWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$900(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->enableDragMode(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$502(Lcom/miui/gallery/collage/widget/CollageLayout;I)I

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->setDrawBitmap(Z)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$1000(Lcom/miui/gallery/collage/widget/CollageLayout;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    :cond_0
    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-virtual {v1, v0, v2, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->appendScale(FFF)V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    neg-float p2, p3

    neg-float p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/collage/widget/CollageImageView;->transition(FF)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    const/4 v0, -0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$500(Lcom/miui/gallery/collage/widget/CollageLayout;)I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$502(Lcom/miui/gallery/collage/widget/CollageLayout;I)I

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->dismissControlWindow()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$600(Lcom/miui/gallery/collage/widget/CollageLayout;Landroid/view/View;)V

    const/4 p1, 0x2

    new-array p1, p1, [I

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->getLocationInWindow([I)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$700(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->showAtLocation(Landroid/view/View;Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$800(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$PopupListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$PopupListener;->setCollageSingleView(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$502(Lcom/miui/gallery/collage/widget/CollageLayout;I)I

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->dismissControlWindow()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method

.method onUp()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iput-boolean v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mIsLongPressMode:Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$502(Lcom/miui/gallery/collage/widget/CollageLayout;I)I

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$900(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->exchangeBitmapWithAnim(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$900(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->resetBitmapWithAnim()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetBitmapLocation()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$402(Lcom/miui/gallery/collage/widget/CollageLayout;Z)Z

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$CustomGestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    return-void
.end method

.class Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;
.super Ljava/lang/Object;
.source "BitmapGestureView.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomGesListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-le v0, v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    return v2
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    neg-float p2, p3

    neg-float p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performTransition(FF)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p3

    if-le p3, v2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    sget-object p2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p2, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p4

    sub-float/2addr p3, p4

    float-to-double p3, p3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr p2, p1

    float-to-double p1, p2

    invoke-static {p3, p4, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    double-to-float p1, p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$300(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)F

    move-result p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    sget-object p2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p2, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    sget-object p2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p2, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    :cond_4
    :goto_0
    return v2
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;->onSingleTapUp(Landroid/view/MotionEvent;)V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

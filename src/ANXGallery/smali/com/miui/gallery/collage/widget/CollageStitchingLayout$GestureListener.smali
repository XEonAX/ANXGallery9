.class Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;
.super Ljava/lang/Object;
.source "CollageStitchingLayout.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageStitchingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$700(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Landroid/widget/OverScroller;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$602(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$802(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)F

    const/4 p1, 0x1

    return p1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$700(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Landroid/widget/OverScroller;

    move-result-object v0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollX()I

    move-result v1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollY()I

    move-result v2

    neg-float p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v3

    neg-float p1, p4

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollX()I

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollX()I

    move-result v6

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1500(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)I

    move-result v7

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1600(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)I

    move-result v8

    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->performHapticFeedback(I)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$602(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1200(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1300(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$500(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-static {v1, v2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1400(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->enableDragMode(Lcom/miui/gallery/collage/widget/CollageImageView;F)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1000(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1000(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {p1, p4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1100(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)I

    const/4 p1, 0x1

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$900(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;FF)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {v0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$1000(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    const/4 p1, 0x1

    return p1
.end method

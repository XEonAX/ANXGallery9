.class Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;
.super Ljava/lang/Object;
.source "ScreenMosaicView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GesListener"
.end annotation


# instance fields
.field private mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

.field public mPoint:[F

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)V

    return-void
.end method

.method private generateMosaic(FF)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->access$600(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->receivePosition(FF)V

    return-void
.end method


# virtual methods
.method public onActionUp(FF)V
    .locals 0

    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    const/4 p1, 0x1

    return p1
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->access$200(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Z

    move-result p3

    if-nez p3, :cond_0

    return-void

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mCurrentNode:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;

    const/4 p4, 0x0

    const/4 v0, 0x1

    if-nez p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->access$300(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object p3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    invoke-virtual {p3, p1, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    aget p1, p1, p4

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    aget p3, p3, v0

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->generateMosaic(FF)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->access$400(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    aget p1, p1, p4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->mPoint:[F

    aget p2, p2, v0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->generateMosaic(FF)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;->this$0:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->access$500(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)V

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

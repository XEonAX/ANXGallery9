.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;
.super Ljava/lang/Object;
.source "StickerEditorView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomGestureListener"
.end annotation


# instance fields
.field private mDownX:F

.field private mDownY:F

.field private mFirstSpan:F

.field private mPoint:[F

.field private mPreScale:F

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPoint:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)V

    return-void
.end method

.method private bindItem(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->PENDING:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->remove(I)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->unbind()Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->append(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->bind(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    return-void
.end method

.method private moveItem(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getDrawBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Landroid/graphics/RectF;)I

    move-result p1

    and-int/lit8 v0, p1, 0x8

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    cmpl-float v0, p3, v1

    if-lez v0, :cond_1

    :goto_0
    const/4 p3, 0x0

    goto :goto_1

    :cond_0
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_1

    cmpg-float v0, p3, v1

    if-gez v0, :cond_1

    goto :goto_0

    :cond_1
    :goto_1
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_2

    cmpl-float p1, p4, v1

    if-lez p1, :cond_3

    goto :goto_2

    :cond_2
    and-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_3

    cmpg-float p1, p4, v1

    if-gez p1, :cond_3

    goto :goto_2

    :cond_3
    move v1, p4

    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/PointF;

    move-result-object p1

    neg-float p3, p3

    neg-float p4, v1

    invoke-virtual {p1, p3, p4}, Landroid/graphics/PointF;->set(FF)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Landroid/graphics/PointF;)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p3

    iget p4, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p3, p4, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->translate(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/PointF;

    move-result-object p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1, p3, p2}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    return-void
.end method


# virtual methods
.method public onActionUp(FF)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPoint:[F

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isIdle()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isScale(FF)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isDelete(FF)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isMirror(FF)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/PointF;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mDownY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->PENDING:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mFirstSpan:F

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPreScale:F

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPreScale:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPreScale:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isIdle()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getRadius()F

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v3

    mul-float v3, v3, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v4

    mul-float v4, v4, v2

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v5, p1, v2

    if-gtz v5, :cond_0

    cmpg-float v3, v0, v3

    if-gez v3, :cond_0

    return v1

    :cond_0
    cmpl-float v2, p1, v2

    if-lez v2, :cond_1

    cmpl-float v0, v0, v4

    if-lez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->scale(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MOVE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    :cond_2
    return v1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mFirstSpan:F

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->mPreScale:F

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 18

    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    const/4 v5, -0x1

    if-ne v3, v4, :cond_1

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isIdle()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->find(FF)I

    move-result v1

    if-eq v1, v5, :cond_0

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->bindItem(I)V

    :cond_0
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MOVE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto/16 :goto_1

    :cond_1
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MOVE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v3, v4, :cond_2

    invoke-direct/range {p0 .. p4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->moveItem(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V

    goto/16 :goto_1

    :cond_2
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->PENDING:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v3, v4, :cond_3

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MOVE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    goto/16 :goto_1

    :cond_3
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v3, v4, :cond_6

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Landroid/graphics/PointF;

    move-result-object v3

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getVertex(I)[F

    move-result-object v4

    const/4 v6, 0x0

    aget v4, v4, v6

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getVertex(I)[F

    move-result-object v7

    const/4 v8, 0x1

    aget v7, v7, v8

    invoke-virtual {v3, v4, v7}, Landroid/graphics/PointF;->set(FF)V

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getDrawBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getDrawBounds()Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    int-to-float v7, v7

    sub-float v9, v1, v4

    float-to-double v10, v9

    sub-float v12, v2, v7

    float-to-double v13, v12

    invoke-static {v10, v11, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    iget v13, v3, Landroid/graphics/PointF;->x:F

    sub-float/2addr v13, v4

    float-to-double v13, v13

    iget v15, v3, Landroid/graphics/PointF;->y:F

    sub-float/2addr v15, v7

    float-to-double v5, v15

    invoke-static {v13, v14, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v5

    iget-object v13, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v13}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v13

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v14

    mul-float v14, v14, v13

    iget-object v15, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v15}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)F

    move-result v15

    mul-float v15, v15, v13

    float-to-double v13, v14

    cmpg-double v16, v10, v13

    if-gez v16, :cond_4

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    div-double v1, v13, v10

    double-to-float v1, v1

    mul-float v9, v9, v1

    add-float v2, v9, v4

    mul-float v12, v12, v1

    add-float v1, v12, v7

    move/from16 v17, v2

    move v2, v1

    move/from16 v1, v17

    goto :goto_0

    :cond_4
    move-wide v13, v10

    :goto_0
    float-to-double v9, v15

    cmpl-double v11, v13, v9

    if-lez v11, :cond_5

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    div-double v11, v9, v13

    double-to-float v11, v11

    sub-float/2addr v1, v4

    mul-float v1, v1, v11

    add-float/2addr v1, v4

    sub-float/2addr v2, v7

    mul-float v2, v2, v11

    add-float/2addr v2, v7

    move-wide v13, v9

    :cond_5
    div-double v5, v13, v5

    double-to-float v5, v5

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->scale(F)V

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getVertex(I)[F

    move-result-object v5

    const/4 v9, 0x0

    aget v5, v5, v9

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->getVertex(I)[F

    move-result-object v6

    aget v6, v6, v8

    invoke-virtual {v3, v5, v6}, Landroid/graphics/PointF;->set(FF)V

    iget v5, v3, Landroid/graphics/PointF;->x:F

    sub-float v5, v1, v5

    float-to-double v5, v5

    iget v8, v3, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v8

    float-to-double v8, v2

    invoke-static {v5, v6, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v5

    mul-double v8, v13, v13

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double v8, v8, v10

    mul-double v5, v5, v5

    sub-double/2addr v8, v5

    mul-double v10, v10, v13

    mul-double v10, v10, v13

    div-double/2addr v8, v10

    sub-float/2addr v1, v4

    float-to-double v1, v1

    iget v5, v3, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v4

    float-to-double v4, v5

    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float/2addr v3, v7

    float-to-double v6, v3

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v8

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v4, v1

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v1

    double-to-float v2, v4

    double-to-float v3, v8

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->rotate(FF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    goto :goto_1

    :cond_6
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->find(FF)I

    move-result v1

    if-eq v1, v5, :cond_7

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->bindItem(I)V

    :cond_7
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    :cond_8
    :goto_1
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isIdle()Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->find(FF)I

    move-result p1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->unbind()Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->append(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$600(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->bindItem(I)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isMirror(FF)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->mirror()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->isDelete(FF)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;->unbind()Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$302(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$State;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->invalidate()V

    return-void

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;->find(FF)I

    move-result p1

    if-eq p1, v1, :cond_4

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$CustomGestureListener;->bindItem(I)V

    :cond_4
    return-void
.end method

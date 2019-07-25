.class Lcom/miui/gallery/view/ScaleGestureDetector$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ScaleGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/view/ScaleGestureDetector;


# direct methods
.method constructor <init>(Lcom/miui/gallery/view/ScaleGestureDetector;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector$1;->this$0:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector$1;->this$0:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/view/ScaleGestureDetector;->access$002(Lcom/miui/gallery/view/ScaleGestureDetector;F)F

    iget-object v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector$1;->this$0:Lcom/miui/gallery/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/view/ScaleGestureDetector;->access$102(Lcom/miui/gallery/view/ScaleGestureDetector;F)F

    iget-object p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector$1;->this$0:Lcom/miui/gallery/view/ScaleGestureDetector;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/view/ScaleGestureDetector;->access$202(Lcom/miui/gallery/view/ScaleGestureDetector;I)I

    return v0
.end method

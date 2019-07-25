.class Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$3;
.super Ljava/lang/Object;
.source "CollageLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$3;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$3;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    return-void
.end method

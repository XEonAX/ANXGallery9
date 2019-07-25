.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;
.super Landroid/support/v7/widget/LinearSmoothScroller;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->access$400(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;)F

    move-result v0

    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p1, p1

    div-float/2addr v0, p1

    return v0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1
.end method

.method protected onTargetFound(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    add-int/2addr v0, p1

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->access$500(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;)F

    move-result v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    const/16 p1, 0x12c

    neg-int p2, p2

    const/4 v0, 0x0

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p3, p2, v0, p1, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->update(IIILandroid/view/animation/Interpolator;)V

    :cond_1
    return-void
.end method

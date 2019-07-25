.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;
.super Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BurstScrollControlLinearLayoutManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->mSmoothScrollerSpeed:F

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->mMinDistance:F

    return p0
.end method


# virtual methods
.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .locals 0

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager$1;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    return-void
.end method

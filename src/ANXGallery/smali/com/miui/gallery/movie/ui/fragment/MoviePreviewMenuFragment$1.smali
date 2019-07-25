.class Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MoviePreviewMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->onCreateAnimator(IZI)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->getView()Landroid/view/View;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

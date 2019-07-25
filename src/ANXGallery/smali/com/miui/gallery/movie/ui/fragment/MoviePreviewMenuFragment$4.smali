.class Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;
.super Ljava/lang/Object;
.source "MoviePreviewMenuFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;
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

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "MoviePreviewMenuFragment"

    const-string v1, "onGlobalLayout MovieManager is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$600(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/view/MultiThumbnailSequenceView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/view/MultiThumbnailSequenceView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$700(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$502(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;I)I

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$600(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/view/MultiThumbnailSequenceView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/view/MultiThumbnailSequenceView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$700(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$802(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;I)I

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$900(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$400(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$1000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$4;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$1100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    return-void
.end method

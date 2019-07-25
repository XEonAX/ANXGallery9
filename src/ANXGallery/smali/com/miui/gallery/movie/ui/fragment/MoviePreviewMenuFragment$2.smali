.class Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;
.super Ljava/lang/Object;
.source "MoviePreviewMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;


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

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongVideoTitleViewClick()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/entity/MovieInfo;->backToLongVideo()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/core/MovieManager;->setIsShortVideo(Z)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateShareData(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDurationClick(Lcom/miui/gallery/movie/entity/MovieInfo;ZZ)V

    return-void
.end method

.method public onShortVideoTitleViewClick()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/entity/MovieInfo;->changeToShortVideo()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/core/MovieManager;->setIsShortVideo(Z)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateShareData(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MoviePreviewMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDurationClick(Lcom/miui/gallery/movie/entity/MovieInfo;ZZ)V

    return-void
.end method

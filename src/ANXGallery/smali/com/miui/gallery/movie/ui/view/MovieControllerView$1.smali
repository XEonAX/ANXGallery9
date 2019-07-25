.class Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;
.super Ljava/lang/Object;
.source "MovieControllerView.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/view/MovieControllerView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field tempCurrentTime:I

.field final synthetic this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoProgressChanged()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    iget v1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$102(Lcom/miui/gallery/movie/ui/view/MovieControllerView;I)I

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->pause()V

    return-void
.end method

.method public onVideoProgressChanging(IF)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$000(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$100(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->getTotalTime()I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p2

    float-to-int p2, v0

    const/4 v0, 0x0

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$100(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)I

    move-result p1

    if-gtz p1, :cond_1

    return-void

    :cond_1
    iget p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    if-le p1, p2, :cond_2

    iget p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    sub-int/2addr p1, p2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$100(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/movie/core/MovieManager;->getTotalTime()I

    move-result v1

    if-lt p1, v1, :cond_4

    return-void

    :cond_4
    iget p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    iget p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/movie/core/MovieManager;->getTotalTime()I

    move-result p2

    if-le p1, p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->getTotalTime()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/core/MovieManager;->seek(I)V

    iget p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    int-to-float p1, p1

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/movie/core/MovieManager;->getTotalTime()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->updatePlayProgress(F)V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    iget v1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    div-int/lit16 v1, v1, 0x3e8

    invoke-virtual {p2, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->setDuration(I)V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->setDeleteVisible(Z)V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$300(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;

    move-result-object p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->this$0:Lcom/miui/gallery/movie/ui/view/MovieControllerView;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->access$300(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;

    move-result-object p2

    iget v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;->tempCurrentTime:I

    invoke-interface {p2, p1, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;->onChanged(FI)V

    :cond_6
    return-void
.end method

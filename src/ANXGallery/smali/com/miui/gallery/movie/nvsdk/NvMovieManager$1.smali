.class Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;
.super Ljava/lang/Object;
.source "NvMovieManager.java"

# interfaces
.implements Lcom/meicam/sdk/NvsStreamingContext$CompileCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->export(Ljava/lang/String;Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;->this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompileFailed(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;->this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;

    invoke-static {p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->access$000(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;->this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;

    invoke-static {p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->access$000(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0, v0, v0}, Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;->onEncodeEnd(ZZI)V

    :cond_0
    return-void
.end method

.method public onCompileFinished(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 0

    return-void
.end method

.method public onCompileProgress(Lcom/meicam/sdk/NvsTimeline;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;->this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;

    invoke-static {p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->access$000(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;->this$0:Lcom/miui/gallery/movie/nvsdk/NvMovieManager;

    invoke-static {p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->access$000(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;->onEncodeProgress(I)V

    :cond_0
    return-void
.end method

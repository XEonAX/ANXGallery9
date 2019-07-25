.class Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;
.super Ljava/lang/Object;
.source "MovieDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/net/download/Request$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/utils/MovieDownloadManager;->lambda$downloadResource$117(Lcom/miui/gallery/movie/entity/MovieResource;ZLio/reactivex/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

.field final synthetic val$cap$0:Lcom/miui/gallery/movie/entity/MovieResource;

.field final synthetic val$emitter:Lio/reactivex/ObservableEmitter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;Lio/reactivex/ObservableEmitter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;->this$0:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;->val$cap$0:Lcom/miui/gallery/movie/entity/MovieResource;

    iput-object p3, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;->val$emitter:Lio/reactivex/ObservableEmitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;->val$emitter:Lio/reactivex/ObservableEmitter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onProgressUpdate(I)V
    .locals 3

    const-string v0, "MovieDownloadManager"

    const-string v1, "download progress %s :%d"

    iget-object v2, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;->val$cap$0:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-virtual {v2}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method

.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadProgressListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

.field private total:I


# direct methods
.method private constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    return-void
.end method

.method private parseDownloadResult(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;

    invoke-direct {v2, p0, p2, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;Ljava/util/List;Ljava/util/List;)V

    new-instance p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;)V

    invoke-virtual {v1, v2, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7902(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method


# virtual methods
.method public onCancelled(Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    const-string v0, "StoryAlbumFragment"

    const-string v1, "download cancelled, success: %d, fails: %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->dismissSafely()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7402(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

    return-void
.end method

.method public onEnd(Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    const-string v0, "StoryAlbumFragment"

    const-string v1, "download end, success: %d, fails: %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->dismissSafely()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7402(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;

    iget-object v0, p2, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mTask:Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object v2, v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object p2, p2, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mTask:Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const p2, 0x7f1006b2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

    return-void
.end method

.method public onStart(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;",
            ">;)V"
        }
    .end annotation

    const-string v0, "StoryAlbumFragment"

    const-string v1, "download start, %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->total:I

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    invoke-direct {v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;-><init>()V

    invoke-static {p1, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7402(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->show(Landroid/app/Activity;)V

    return-void
.end method

.method public onUpdate(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    int-to-float p1, p1

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->total:I

    int-to-float p2, p2

    div-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->updateProgress(F)V

    return-void
.end method

.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

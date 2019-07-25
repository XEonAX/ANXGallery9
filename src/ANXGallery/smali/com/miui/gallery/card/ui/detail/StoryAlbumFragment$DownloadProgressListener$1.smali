.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


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
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

.field final synthetic val$fails:Ljava/util/List;

.field final synthetic val$success:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->val$fails:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->val$success:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 4

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->val$fails:Ljava/util/List;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->val$success:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;

    new-instance v2, Ljava/io/File;

    iget-object v3, v1, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mPath:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener$1;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    iget-object v3, v3, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$8000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Landroid/net/Uri;

    move-result-object v3

    iget-object v1, v1, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mTask:Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    iget v1, v1, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mPosition:I

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v3, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.class Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;
.super Ljava/lang/Object;
.source "LibraryManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/assistant/library/LibraryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LibraryDownloadJob"
.end annotation


# instance fields
.field private final mAllowedOverMetered:Z

.field private final mDownloadSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/miui/gallery/assistant/library/LibraryItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mLibrary:Lcom/miui/gallery/assistant/library/Library;

.field private final mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

.field final synthetic this$0:Lcom/miui/gallery/assistant/library/LibraryManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    iput-boolean p3, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mAllowedOverMetered:Z

    iput-object p4, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mDownloadSet:Ljava/util/Set;

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->cancel()V

    return-void
.end method

.method private cancel()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    invoke-static {v0}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$1000(Lcom/miui/gallery/assistant/library/LibraryManager;)Lcom/miui/gallery/net/library/LibraryDownloadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->cancel(J)V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/Library;->getLibraryItems()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/Library;->getLibraryItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->isExist()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mDownloadSet:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mDownloadSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadResult(JI)V

    goto :goto_1

    :cond_2
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    invoke-static {v0}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$1000(Lcom/miui/gallery/assistant/library/LibraryManager;)Lcom/miui/gallery/net/library/LibraryDownloadManager;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v2

    iget-boolean v4, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mAllowedOverMetered:Z

    iget-object v5, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mDownloadSet:Ljava/util/Set;

    iget-object v6, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->download(JZLjava/util/Set;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v1

    const/4 v3, 0x2

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadResult(JI)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibraryDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;->mLibrary:Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadResult(JI)V

    :goto_1
    new-instance v0, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob$1;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;)V

    invoke-interface {p1, v0}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->setCancelListener(Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;)V

    const/4 p1, 0x0

    return-object p1
.end method

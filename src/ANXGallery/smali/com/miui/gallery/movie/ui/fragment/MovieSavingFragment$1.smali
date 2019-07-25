.class Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;
.super Ljava/lang/Object;
.source "MovieSavingFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->doSaving(Landroid/content/Context;Landroid/app/FragmentManager;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$fragmentManager:Landroid/app/FragmentManager;

.field final synthetic val$onSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

.field final synthetic val$tempFilePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/app/FragmentManager;Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$fragmentManager:Landroid/app/FragmentManager;

    iput-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$tempFilePath:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$context:Landroid/content/Context;

    iput-object p5, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$onSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onEncodeEnd$137(Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieStorage;->getOutputMediaFilePath()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    invoke-static {p1, p2}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x2

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/lang/String;I)Landroid/net/Uri;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaStoreUtils;->sendScannerBroadcast(Landroid/content/Context;Ljava/lang/String;)V

    return-object p2
.end method


# virtual methods
.method public onEncodeEnd(ZZI)V
    .locals 4

    const-string v0, "MovieSavingFragment"

    const-string v1, "save result: %b,code: %d,path: %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$tempFilePath:Ljava/lang/String;

    invoke-static {v0, v1, v2, p3, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$tempFilePath:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$context:Landroid/content/Context;

    new-instance v2, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;

    invoke-direct {v2, v0, v1}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1$1;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;ZZ)V

    invoke-virtual {p3, v2, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    invoke-virtual {p3}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->dismissSafely()V

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$onSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$onSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    const/4 v0, 0x0

    invoke-interface {p3, p1, p2, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;->onFinish(ZZLjava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onEncodeProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->setProgress(I)V

    return-void
.end method

.method public onEncodeStart()V
    .locals 3

    const-string v0, "MovieSavingFragment"

    const-string v1, "save start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->val$fragmentManager:Landroid/app/FragmentManager;

    const-string v2, "MovieSavingFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

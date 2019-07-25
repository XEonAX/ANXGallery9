.class Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;
.super Ljava/lang/Object;
.source "VideoNavFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VideoFramesManager"
.end annotation


# instance fields
.field private mFragmentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;",
            ">;"
        }
    .end annotation
.end field

.field private mFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/FutureHandler<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoFramesJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager$1;-><init>(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;

    new-instance v0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager$2;-><init>(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mVideoFramesJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFragmentRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;)Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->getFragment()Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    move-result-object p0

    return-object p0
.end method

.method private getFragment()Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFragmentRef:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    :goto_0
    return-object v0
.end method


# virtual methods
.method public handleVideoFrames()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->getFragment()Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "VideoNavFragment"

    const-string v1, "the mFragmentRef is null. "

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mVideoFramesJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$VideoFramesManager;->mFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

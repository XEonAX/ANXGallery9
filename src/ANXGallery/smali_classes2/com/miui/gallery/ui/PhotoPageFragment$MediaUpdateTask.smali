.class Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaUpdateTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

.field private mFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;-><init>()V

    return-void
.end method

.method static synthetic access$6500(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;)Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mCallback:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mCallback:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

    return-void
.end method

.method public execute(Ljava/lang/String;ZLcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_1
    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mCallback:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p3

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;Ljava/lang/String;Z)V

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;Ljava/lang/String;)V

    invoke-virtual {p3, v0, p2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->mFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

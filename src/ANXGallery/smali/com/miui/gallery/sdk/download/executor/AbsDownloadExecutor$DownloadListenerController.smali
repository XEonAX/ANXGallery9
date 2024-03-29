.class Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;
.super Ljava/lang/Object;
.source "AbsDownloadExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DownloadListenerController"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;
    }
.end annotation


# instance fields
.field private final mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

.field private final mDownloadListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet<",
            "Lcom/miui/gallery/sdk/download/listener/DownloadListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

.field private final mProgressListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet<",
            "Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    new-instance v0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$1;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;)V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    new-instance v0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$2;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;)V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->callStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->callSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->callFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->callCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->callProgress(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V

    return-void
.end method

.method private callCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 2

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getDownloadListeners(Ljava/lang/String;Z)Ljava/util/LinkedList;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$6;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$6;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V

    return-void
.end method

.method private callFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 2

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getDownloadListeners(Ljava/lang/String;Z)Ljava/util/LinkedList;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$5;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$5;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V

    return-void
.end method

.method private callProgress(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V
    .locals 11

    move-object v8, p0

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getProgressListeners(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v9

    new-instance v10, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$7;

    move-object v0, v10

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-wide/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$7;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V

    invoke-direct {p0, v9, v10}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V

    return-void
.end method

.method private callStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 2

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getDownloadListeners(Ljava/lang/String;Z)Ljava/util/LinkedList;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$3;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V

    return-void
.end method

.method private callSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 2

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getDownloadListeners(Ljava/lang/String;Z)Ljava/util/LinkedList;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$4;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$4;-><init>(Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V

    return-void
.end method

.method private dispatchListener(Ljava/util/LinkedList;Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/LinkedList<",
            "TE;>;",
            "Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller<",
            "TE;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p2, v0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController$Caller;->call(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private getDownloadListeners(Ljava/lang/String;Z)Ljava/util/LinkedList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/sdk/download/listener/DownloadListener;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getListeners(Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v1

    if-eqz p2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    monitor-enter p2

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-object v1

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method private getListeners(Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/LinkedList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet<",
            "TE;>;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/LinkedList<",
            "TE;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashSet;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getProgressListeners(Ljava/lang/String;)Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->getListeners(Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private putItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet<",
            "TE;>;>;",
            "Ljava/lang/String;",
            "TE;)Z"
        }
    .end annotation

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {v0, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    return-object v0
.end method

.method public getDownloadProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    return-object v0
.end method

.method public putItem(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mDownloadListeners:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v4

    invoke-direct {p0, v3, v1, v4}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->putItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_1
    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->mProgressListeners:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    move-result-object p1

    invoke-direct {p0, v3, v1, p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor$DownloadListenerController;->putItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p1

    or-int/2addr v0, p1

    monitor-exit v2

    goto :goto_1

    :catchall_1
    move-exception p1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :cond_1
    :goto_1
    return v0
.end method

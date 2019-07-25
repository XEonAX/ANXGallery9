.class public Lcom/miui/gallery/util/baby/BabyFaceFinder;
.super Ljava/lang/Object;
.source "BabyFaceFinder.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final TIME_INTERVAL_FOR_CHECK_CANDIDATE_PEOPLE:Ljava/lang/Long;


# instance fields
.field private mFoundBabyAlbums:Ljava/lang/Boolean;

.field private mFuture:Lcom/miui/gallery/threadpool/Future;

.field private mListener:Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-wide/32 v0, 0x240c8400

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->TIME_INTERVAL_FOR_CHECK_CANDIDATE_PEOPLE:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private accept(Ljava/lang/String;I)Z
    .locals 0

    invoke-static {p2}, Lcom/miui/gallery/model/PeopleContactInfo;->isBabyRelation(I)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/baby/BabyFaceFinder;Ljava/lang/String;I)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/baby/BabyFaceFinder;->accept(Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public declared-synchronized onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFoundBabyAlbums:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mListener:Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mListener:Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;

    iget-object v1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFoundBabyAlbums:Ljava/lang/Boolean;

    invoke-interface {v0, v1}, Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;->onBabyAlbumsFound(Ljava/lang/Boolean;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setBabyAlbumsFoundListener(Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mListener:Lcom/miui/gallery/util/baby/BabyFaceFinder$BabyAlbumsFoundListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized startFindFace(Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getLastClickPeopleRecommandationTime(Ljava/lang/String;)J

    move-result-wide v2

    const/4 p1, 0x0

    sub-long/2addr v0, v2

    sget-object p1, Lcom/miui/gallery/util/baby/BabyFaceFinder;->TIME_INTERVAL_FOR_CHECK_CANDIDATE_PEOPLE:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/util/baby/BabyFaceFinder$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/baby/BabyFaceFinder$1;-><init>(Lcom/miui/gallery/util/baby/BabyFaceFinder;)V

    invoke-virtual {p1, v0, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder;->mFuture:Lcom/miui/gallery/threadpool/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

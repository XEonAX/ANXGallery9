.class final Lcom/miui/gallery/threadpool/GallerySchedulers$MiscHolder;
.super Ljava/lang/Object;
.source "GallerySchedulers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/threadpool/GallerySchedulers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MiscHolder"
.end annotation


# static fields
.field static final SCHEDULER:Lio/reactivex/Scheduler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->asExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/threadpool/GallerySchedulers$MiscHolder;->SCHEDULER:Lio/reactivex/Scheduler;

    return-void
.end method

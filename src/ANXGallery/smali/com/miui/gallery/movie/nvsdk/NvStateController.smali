.class public Lcom/miui/gallery/movie/nvsdk/NvStateController;
.super Ljava/lang/Object;
.source "NvStateController.java"

# interfaces
.implements Lcom/meicam/sdk/NvsStreamingContext$PlaybackCallback;
.implements Lcom/meicam/sdk/NvsStreamingContext$PlaybackCallback2;
.implements Lcom/meicam/sdk/NvsStreamingContext$StreamingEngineCallback;
.implements Lcom/miui/gallery/movie/core/IMovieController;


# instance fields
.field private mNvsRational:Lcom/meicam/sdk/NvsRational;

.field private mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

.field private mTimeline:Lcom/meicam/sdk/NvsTimeline;


# direct methods
.method public constructor <init>(Lcom/meicam/sdk/NvsStreamingContext;Lcom/meicam/sdk/NvsTimeline;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iput-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    new-instance p1, Lcom/meicam/sdk/NvsRational;

    const/4 p2, 0x3

    const/4 v0, 0x4

    invoke-direct {p1, p2, v0}, Lcom/meicam/sdk/NvsRational;-><init>(II)V

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mNvsRational:Lcom/meicam/sdk/NvsRational;

    return-void
.end method

.method private getCurrentEngineState()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    invoke-virtual {v0}, Lcom/meicam/sdk/NvsStreamingContext;->getStreamingEngineState()I

    move-result v0

    return v0
.end method

.method private getStateFromNvEngine(I)I
    .locals 0

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    const/16 p1, -0x1f4

    return p1

    :pswitch_0
    const/16 p1, 0xc8

    return p1

    :pswitch_1
    const/4 p1, 0x3

    return p1

    :pswitch_2
    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x2

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic lambda$onPlaybackEOF$145(Lcom/miui/gallery/movie/nvsdk/NvStateController;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    invoke-interface {v1}, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;->onPlaybackEOF()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private seekLong(J)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object v4, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mNvsRational:Lcom/meicam/sdk/NvsRational;

    const/4 v5, 0x0

    move-wide v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/meicam/sdk/NvsStreamingContext;->seekTimeline(Lcom/meicam/sdk/NvsTimeline;JLcom/meicam/sdk/NvsRational;I)Z

    return-void
.end method


# virtual methods
.method public addStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V
    .locals 1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public cancelExport()V
    .locals 2

    const-string v0, "NvStateController"

    const-string v1, "cancelExport"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->stop(I)V

    :cond_0
    const-string v0, "NvStateController"

    const-string v1, "cancelExport done"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public isResume()Z
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onFirstVideoFramePresented(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    invoke-interface {v0}, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;->onPlaybackPreloadingCompletion()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->pause()V

    return-void
.end method

.method public onPlaybackEOF(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvStateController$qOG8X6sK0eL11IndkyJbkEYS_vQ;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvStateController$qOG8X6sK0eL11IndkyJbkEYS_vQ;-><init>(Lcom/miui/gallery/movie/nvsdk/NvStateController;)V

    invoke-virtual {p1, v0}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public onPlaybackPreloadingCompletion(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 0

    return-void
.end method

.method public onPlaybackStopped(Lcom/meicam/sdk/NvsTimeline;)V
    .locals 0

    return-void
.end method

.method public onPlaybackTimelinePosition(Lcom/meicam/sdk/NvsTimeline;J)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    const-wide/16 v1, 0x3e8

    div-long v1, p2, v1

    long-to-int v1, v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;->onPlaybackTimeChanged(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public onStreamingEngineStateChanged(I)V
    .locals 3

    const-string v0, "NvStateController"

    const-string v1, "state: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getStateFromNvEngine(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    invoke-interface {v1, p1}, Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;->onStateChanged(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public pause()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->stop(I)V

    :cond_0
    return-void
.end method

.method public pauseOrResume()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->pause()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->resume()V

    :goto_1
    return-void
.end method

.method public play()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->getTimelineCurrentPosition(Lcom/meicam/sdk/NvsTimeline;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play(J)V

    return-void
.end method

.method public play(J)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object v2, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v2}, Lcom/meicam/sdk/NvsTimeline;->getDuration()J

    move-result-wide v4

    iget-object v6, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mNvsRational:Lcom/meicam/sdk/NvsRational;

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-wide v2, p1

    invoke-virtual/range {v0 .. v8}, Lcom/meicam/sdk/NvsStreamingContext;->playbackTimeline(Lcom/meicam/sdk/NvsTimeline;JJLcom/meicam/sdk/NvsRational;ZI)Z

    return-void
.end method

.method public removeStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStateChangeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public replay()V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play(J)V

    return-void
.end method

.method public resume()V
    .locals 11

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->getCurrentEngineState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->getTimelineCurrentPosition(Lcom/meicam/sdk/NvsTimeline;)J

    move-result-wide v4

    iget-object v2, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v3, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0}, Lcom/meicam/sdk/NvsTimeline;->getDuration()J

    move-result-wide v6

    iget-object v8, p0, Lcom/miui/gallery/movie/nvsdk/NvStateController;->mNvsRational:Lcom/meicam/sdk/NvsRational;

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual/range {v2 .. v10}, Lcom/meicam/sdk/NvsStreamingContext;->playbackTimeline(Lcom/meicam/sdk/NvsTimeline;JJLcom/meicam/sdk/NvsRational;ZI)Z

    :cond_0
    return-void
.end method

.method public seek(I)V
    .locals 2

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v0, p1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->seekLong(J)V

    return-void
.end method

.class public Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;
.super Ljava/lang/Object;
.source "ScreenRenderManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;
    }
.end annotation


# instance fields
.field private mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

.field private mOrigin:Landroid/graphics/Bitmap;

.field private mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

.field private mRenderBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/DraftManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    return-void
.end method

.method private getOriginBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    :goto_0
    return-object v0
.end method

.method public static synthetic lambda$decodeOrigin$51(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Lio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeOrigin()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$decodeOrigin$52(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;->onRefresh(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$renderBitmap$53(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;Lio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->getOriginBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;->apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$renderBitmap$54(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;ZLandroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    const/4 v0, 0x1

    invoke-interface {p1, p3, v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;->setShareBitmap(Landroid/graphics/Bitmap;Z)V

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;->onComplete(Z)V

    return-void
.end method


# virtual methods
.method public decodeOrigin()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isPreviewSameWithOrigin()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;->onRefresh(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$Qpce5PSG3T3JVpMFQJ0UH4DI-6Q;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$Qpce5PSG3T3JVpMFQJ0UH4DI-6Q;-><init>(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {v1}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$mvqfefzzvS17LQ04eEXb3PXDMJI;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$mvqfefzzvS17LQ04eEXb3PXDMJI;-><init>(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    :cond_1
    :goto_0
    return-void
.end method

.method public getRenderBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->getOriginBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    :goto_0
    return-object v0
.end method

.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mRenderBitmap:Landroid/graphics/Bitmap;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOrigin:Landroid/graphics/Bitmap;

    :cond_1
    return-void
.end method

.method public renderBitmap(ZLcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;)V
    .locals 2

    const-string v0, "ScreenRenderManager"

    const-string v1, "renderBitmap: start."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$ITM1GkVdg_4LvypZh25f2xGmMVE;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$ITM1GkVdg_4LvypZh25f2xGmMVE;-><init>(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p2

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p2

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$4fAgjdWa2WrI_ig_XD4OqoFZllw;

    invoke-direct {v0, p0, p3, p1}, Lcom/miui/gallery/editor/photo/screen/core/-$$Lambda$ScreenRenderManager$4fAgjdWa2WrI_ig_XD4OqoFZllw;-><init>(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;Z)V

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public setOriginLoadedListener(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager;->mOriginLoadedListener:Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderManager$OnOriginLoadedListener;

    return-void
.end method

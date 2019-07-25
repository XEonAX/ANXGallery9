.class public Lcom/miui/gallery/loader/AsyncContentLoader;
.super Landroid/content/AsyncTaskLoader;
.source "AsyncContentLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ljava/io/Closeable;",
        ">",
        "Landroid/content/AsyncTaskLoader<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mCancellationSignal:Landroid/os/CancellationSignal;

.field private mCursorConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/loader/CursorConvertCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mData:Ljava/io/Closeable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mIsObserversRegistered:Z

.field private final mObserver:Landroid/content/Loader$ForceLoadContentObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/content/Loader<",
            "TT;>.Force",
            "LoadContentObserver;"
        }
    .end annotation
.end field

.field private mProjection:[Ljava/lang/String;

.field private mSelection:Ljava/lang/String;

.field private mSelectionArgs:[Ljava/lang/String;

.field private mSortOrder:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/loader/CursorConvertCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/loader/CursorConvertCallback<",
            "TT;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/content/Loader$ForceLoadContentObserver;

    invoke-direct {p1, p0}, Landroid/content/Loader$ForceLoadContentObserver;-><init>(Landroid/content/Loader;)V

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mObserver:Landroid/content/Loader$ForceLoadContentObserver;

    iput-object p2, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCursorConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    return-void
.end method

.method private registerContentObservers()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mIsObserversRegistered:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mIsObserversRegistered:Z

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mObserver:Landroid/content/Loader$ForceLoadContentObserver;

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method private unregisterContentObservers()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mIsObserversRegistered:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mIsObserversRegistered:Z

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mObserver:Landroid/content/Loader$ForceLoadContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public cancelLoadInBackground()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->cancelLoadInBackground()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public deliverResult(Ljava/io/Closeable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_2
    if-eqz v0, :cond_3

    if-eq v0, p1, :cond_3

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :cond_3
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/io/Closeable;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/AsyncContentLoader;->deliverResult(Ljava/io/Closeable;)V

    return-void
.end method

.method public final loadInBackground()Ljava/io/Closeable;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->isLoadInBackgroundCanceled()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mUri:Landroid/net/Uri;

    iget-object v4, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mProjection:[Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mSelection:Ljava/lang/String;

    iget-object v6, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mSelectionArgs:[Ljava/lang/String;

    iget-object v7, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mSortOrder:Ljava/lang/String;

    iget-object v8, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    invoke-virtual/range {v2 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v1, :cond_0

    :try_start_2
    iget-object v2, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCursorConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    invoke-interface {v2, v1}, Lcom/miui/gallery/loader/CursorConvertCallback;->convert(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    goto :goto_1

    :cond_0
    move-object v2, v0

    :goto_0
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    monitor-enter p0

    :try_start_3
    iput-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    monitor-exit p0

    return-object v2

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    :catchall_2
    move-exception v2

    move-object v1, v0

    :goto_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    monitor-enter p0

    :try_start_4
    iput-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mCancellationSignal:Landroid/os/CancellationSignal;

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v2

    :catchall_3
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v0

    :cond_1
    :try_start_6
    new-instance v0, Landroid/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/os/OperationCanceledException;-><init>()V

    throw v0

    :catchall_4
    move-exception v0

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    throw v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->loadInBackground()Ljava/io/Closeable;

    move-result-object v0

    return-object v0
.end method

.method protected onAbandon()V
    .locals 0

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onAbandon()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->unregisterContentObservers()V

    return-void
.end method

.method public onCanceled(Ljava/io/Closeable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/io/Closeable;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/AsyncContentLoader;->onCanceled(Ljava/io/Closeable;)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->onStopLoading()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->unregisterContentObservers()V

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/AsyncContentLoader;->deliverResult(Ljava/io/Closeable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mData:Ljava/io/Closeable;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->forceLoad()V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->registerContentObservers()V

    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AsyncContentLoader;->cancelLoad()Z

    return-void
.end method

.method public setProjection([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mProjection:[Ljava/lang/String;

    return-void
.end method

.method public setSelection(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mSelection:Ljava/lang/String;

    return-void
.end method

.method public setSortOrder(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mSortOrder:Ljava/lang/String;

    return-void
.end method

.method public setUri(Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/AsyncContentLoader;->mUri:Landroid/net/Uri;

    return-void
.end method

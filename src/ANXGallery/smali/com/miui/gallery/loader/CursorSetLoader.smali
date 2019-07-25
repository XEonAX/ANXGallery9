.class public abstract Lcom/miui/gallery/loader/CursorSetLoader;
.super Lcom/miui/gallery/loader/BaseLoader;
.source "CursorSetLoader.java"


# instance fields
.field private mObserver:Landroid/content/Loader$ForceLoadContentObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/model/BaseDataSet;",
            ">.Force",
            "LoadContentObserver;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/BaseLoader;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/content/Loader$ForceLoadContentObserver;

    invoke-direct {p1, p0}, Landroid/content/Loader$ForceLoadContentObserver;-><init>(Landroid/content/Loader;)V

    iput-object p1, p0, Lcom/miui/gallery/loader/CursorSetLoader;->mObserver:Landroid/content/Loader$ForceLoadContentObserver;

    return-void
.end method


# virtual methods
.method protected abstract getOrder()Ljava/lang/String;
.end method

.method protected abstract getProjection()[Ljava/lang/String;
.end method

.method protected abstract getSelection()Ljava/lang/String;
.end method

.method protected abstract getSelectionArgs()[Ljava/lang/String;
.end method

.method protected abstract getTAG()Ljava/lang/String;
.end method

.method protected abstract getUri()Landroid/net/Uri;
.end method

.method public loadInBackground()Lcom/miui/gallery/model/CursorDataSet;
    .locals 12

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getTAG()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_load"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "loadInBackground"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v1, 0x1f4

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getUri()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getProjection()[Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getSelection()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getOrder()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual/range {v5 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    :try_start_1
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v5

    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v5

    :cond_0
    :goto_0
    invoke-virtual {p0, v4}, Lcom/miui/gallery/loader/CursorSetLoader;->wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;

    move-result-object v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-lez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getSelection()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "load_performance"

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getTAG()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-object v4

    :catchall_0
    move-exception v4

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-lez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getSelection()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cost"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->getTAG()Ljava/lang/String;

    move-result-object v1

    const-string v2, "load_performance"

    invoke-static {v2, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    throw v4
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->loadInBackground()Lcom/miui/gallery/model/CursorDataSet;

    move-result-object v0

    return-object v0
.end method

.method protected abstract wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;
.end method

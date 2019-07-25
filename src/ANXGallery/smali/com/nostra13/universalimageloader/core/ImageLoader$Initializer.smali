.class public abstract Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Initializer"
.end annotation


# instance fields
.field private mImageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;)Lcom/nostra13/universalimageloader/core/ImageLoader;
    .locals 0

    invoke-direct {p0}, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->initialize()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p0

    return-object p0
.end method

.method private final initialize()Lcom/nostra13/universalimageloader/core/ImageLoader;
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->mImageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    sget-object v2, Lcom/nostra13/universalimageloader/core/ImageLoader;->TAG:Ljava/lang/String;

    const-string v3, "wait for initialize ImageLoader cost: %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->mImageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method


# virtual methods
.method protected abstract getConfig()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
.end method

.method public final preInitialize()V
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/nostra13/universalimageloader/core/ImageLoader;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;-><init>()V

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->getConfig()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->init(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;)V

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->mImageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

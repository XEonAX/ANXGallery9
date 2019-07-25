.class Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;
.super Ljava/lang/Object;
.source "SlideShowAdapter.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/SlideShowAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field final synthetic this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/SlideShowAdapter;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->syncLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->mDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->mDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method private getDisplayOptions(Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->mDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;->getSecretKey()[B

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 6

    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$600(Lcom/miui/gallery/adapter/SlideShowAdapter;)Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-static {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;->access$700(Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->getDisplayOptions(Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;

    invoke-static {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;->access$800(Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;)I

    move-result v0

    invoke-direct {v2, v1, v0}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;-><init>(Landroid/graphics/Bitmap;I)V

    const/4 v0, 0x0

    :goto_1
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    if-nez v0, :cond_1

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$100(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    const-wide/16 v3, 0x3e8

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4, v5}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v3, "SlideShowAdapter"

    const-string v4, "offer interrupted, curSize %d"

    iget-object v5, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v5}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$100(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    :cond_1
    if-nez v0, :cond_0

    const-string v0, "SlideShowAdapter"

    const-string v1, "not offered, curSize %d"

    iget-object v2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v2}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$100(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$200(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$306(Lcom/miui/gallery/adapter/SlideShowAdapter;)I

    monitor-exit v0

    goto/16 :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    const-string p1, "SlideShowAdapter"

    const-string v0, "loadJob cancelled, curSize %d"

    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;->this$0:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-static {v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->access$100(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

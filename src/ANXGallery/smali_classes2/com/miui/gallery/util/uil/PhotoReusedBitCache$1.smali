.class Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;
.super Ljava/lang/Object;
.source "PhotoReusedBitCache.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->initFirstCacheBitmap()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/uil/PhotoReusedBitCache;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;->this$0:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2

    const-string p1, "PhotoReusedBitCache"

    const-string v0, "init first cache bitmap"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;->this$0:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->clear()V

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float p1, p1, v0

    float-to-int p1, p1

    mul-int/lit8 v0, p1, 0x4

    div-int/lit8 v0, v0, 0x3

    iget-object v1, p0, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;->this$0:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;->this$0:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->put(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "PhotoReusedBitCache"

    const-string v0, "create first cache bitmap oom"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

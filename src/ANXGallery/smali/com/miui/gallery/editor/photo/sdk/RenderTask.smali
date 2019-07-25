.class public Lcom/miui/gallery/editor/photo/sdk/RenderTask;
.super Ljava/lang/Object;
.source "RenderTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;,
        Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;,
        Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;,
        Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

.field private mCancelled:Z

.field private mContext:Landroid/content/Context;

.field private mCurrent:Landroid/net/Uri;

.field private mHandler:Landroid/os/Handler;

.field private mOutputGenerator:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;

.field private mTasks:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/Collection;Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection<",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCancelled:Z

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mTasks:Ljava/util/Iterator;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mOutputGenerator:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "generator can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "tasks can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "context can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCurrent:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCancelled:Z

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->scheduleNext()Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Landroid/graphics/Bitmap;Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->saveShareBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Z

    move-result p0

    return p0
.end method

.method private saveShareBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Z
    .locals 5

    const-string v0, "RenderTask"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openOutputStream(Ljava/lang/String;Landroid/content/Context;Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p2

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/miui/gallery3d/exif/ExifInterface;->getAllTags()Ljava/util/List;

    move-result-object p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    const/4 v0, 0x0

    if-eqz p3, :cond_4

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_2

    :cond_1
    const-string v1, "RenderTask"

    const-string v2, "filter exif"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v1}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v2}, Lcom/miui/gallery3d/exif/ExifTag;->getTagId()S

    move-result v3

    sget v4, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-static {v4}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v4

    if-eq v3, v4, :cond_2

    sget v4, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-static {v4}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v4

    if-eq v3, v4, :cond_2

    sget v4, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-static {v4}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v4

    if-eq v3, v4, :cond_2

    sget v4, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_XIAOMI_COMMENT:I

    invoke-static {v4}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v4

    if-eq v3, v4, :cond_2

    sget v4, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    invoke-static {v4}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v4

    if-eq v3, v4, :cond_2

    invoke-virtual {v1, v2}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    goto :goto_1

    :cond_2
    const-string v2, "RenderTask"

    const-string v3, "skip user comment"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    sget p3, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getOrientationValueForRotation(I)S

    move-result v2

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    invoke-virtual {v1, p3, v2}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    sget p3, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p3, v2}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    sget p3, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p3, v2}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v1, p2}, Lcom/miui/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p2

    goto :goto_3

    :cond_4
    :goto_2
    const-string p3, "RenderTask"

    const-string v1, "no exif found in source image"

    invoke-static {p3, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    :try_start_0
    sget-object p3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x5f

    invoke-virtual {p1, p3, v1, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    const-string p3, "RenderTask"

    invoke-static {p3, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_0
    move-exception p1

    :try_start_1
    const-string p3, "RenderTask"

    invoke-static {p3, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "RenderTask"

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    const/4 p1, 0x0

    :goto_4
    return p1

    :goto_5
    const-string p3, "RenderTask"

    invoke-static {p3, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw p1
.end method

.method private scheduleNext()Z
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mTasks:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mTasks:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCurrent:Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mOutputGenerator:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCurrent:Landroid/net/Uri;

    invoke-interface {v0, v2}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;->generate(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;-><init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;)V

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v4, 0x1

    new-array v5, v4, [Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;

    new-instance v6, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCurrent:Landroid/net/Uri;

    invoke-direct {v6, v7, v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    aput-object v6, v5, v1

    invoke-virtual {v2, v3, v5}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return v4

    :cond_0
    return v1
.end method


# virtual methods
.method public cancel()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCancelled:Z

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "can\'t run in sub thread."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public decodeOrigin(Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Landroid/graphics/Bitmap;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeUri(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->calculateInSampleSize(Landroid/content/Context;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mContext:Landroid/content/Context;

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeUri(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p2}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result p2

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->joinExif(Landroid/graphics/Bitmap;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->setConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public performItemFinish(Landroid/net/Uri;)V
    .locals 2

    const-string v0, "RenderTask"

    const-string v1, "render finish: %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;-><init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setCallback(Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    return-void
.end method

.method public start()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCancelled:Z

    if-eqz v0, :cond_1

    const-string v0, "RenderTask"

    const-string v1, "render cancelled."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onTaskCancelled()V

    :cond_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->scheduleNext()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->mCallback:Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onTaskFinish()V

    :cond_2
    return-void

    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "can\'t run in sub thread."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

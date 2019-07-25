.class public Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;
.super Ljava/lang/Object;
.source "FaceInfo.java"


# static fields
.field public static a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

.field private static b:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;",
            ">;"
        }
    .end annotation
.end field

.field private static c:Ljava/util/concurrent/Executor;

.field private static d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static i:Ljava/lang/Thread;


# instance fields
.field private e:F

.field private f:F

.field private g:F

.field private h:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b:Landroid/util/LruCache;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->c:Ljava/util/concurrent/Executor;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->d:Ljava/util/Map;

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->i:Ljava/lang/Thread;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;ILandroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/io/File;ZLandroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZLandroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/io/File;ZLandroid/content/Context;)V

    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b:Landroid/util/LruCache;

    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    return-object p0
.end method

.method public static a()Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    return-object v0
.end method

.method public static a(Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;)V
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;->deinit()Z

    :cond_0
    sput-object p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b()Z

    return-void
.end method

.method private a(Ljava/io/File;ZLandroid/content/Context;)V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    if-nez p1, :cond_0

    return-void

    :cond_0
    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    if-eqz p2, :cond_5

    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->i:Ljava/lang/Thread;

    if-eqz p2, :cond_1

    :try_start_0
    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->i:Ljava/lang/Thread;

    invoke-virtual {p2}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    const/4 p2, 0x0

    sput-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->i:Ljava/lang/Thread;

    :cond_1
    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    if-eqz p2, :cond_3

    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, p3}, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;->init(Ljava/lang/String;Landroid/content/Context;)Z

    sget-object p1, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    if-eqz p1, :cond_2

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a:Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-interface {p2, p1}, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;->detect(Landroid/graphics/RectF;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b(Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_2
    const-string p1, "FaceInfo"

    const-string p2, "faceDetectProc:skip detect(faceModule is null)"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    const-string p1, "FaceInfo"

    const-string p2, "faceDetectProc:skip init(faceModule is null)"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_1
    const-string p1, "FaceInfo"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "FaceDetector elapsed time:("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_5
    const-string p1, "FaceInfo"

    const-string p2, "Can not find FaceDetector module"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method public static a(Ljava/lang/String;Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;)V
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b:Landroid/util/LruCache;

    invoke-virtual {v0, p0, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static b()Z
    .locals 2

    const-string v0, "FaceInfo"

    const-string v1, "clearFaceInfo"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->b:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public a(Landroid/graphics/RectF;)V
    .locals 4

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->e:F

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->f:F

    iget v2, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->g:F

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->h:F

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method public b(Landroid/graphics/RectF;)V
    .locals 2

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->e:F

    iget v0, p1, Landroid/graphics/RectF;->top:F

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->f:F

    iget v0, p1, Landroid/graphics/RectF;->right:F

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->g:F

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->h:F

    return-void
.end method

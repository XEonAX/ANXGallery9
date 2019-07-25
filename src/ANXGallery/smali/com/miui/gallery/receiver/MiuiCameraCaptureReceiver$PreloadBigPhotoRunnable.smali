.class Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;
.super Ljava/lang/Object;
.source "MiuiCameraCaptureReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PreloadBigPhotoRunnable"
.end annotation


# instance fields
.field private mFilePath:Ljava/lang/String;

.field private mIsTempFile:Z

.field private mMediaStoreId:J


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mMediaStoreId:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->isCanceled(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mMediaStoreId:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mIsTempFile:Z

    return p0
.end method

.method private isCanceled(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mFilePath:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mMediaStoreId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mFilePath:Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;-><init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public setData(Ljava/lang/String;JZ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mFilePath:Ljava/lang/String;

    iput-wide p2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mMediaStoreId:J

    iput-boolean p4, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->mIsTempFile:Z

    return-void
.end method

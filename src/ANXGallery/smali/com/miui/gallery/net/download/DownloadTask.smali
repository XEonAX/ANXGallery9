.class public Lcom/miui/gallery/net/download/DownloadTask;
.super Ljava/lang/Object;
.source "DownloadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;,
        Lcom/miui/gallery/net/download/DownloadTask$CoreTask;
    }
.end annotation


# static fields
.field private static final RETRY_INTERVAL_MILLI:J


# instance fields
.field private mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

.field private mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/miui/gallery/net/download/DownloadTask;->RETRY_INTERVAL_MILLI:J

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/net/download/Request;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;-><init>(Lcom/miui/gallery/net/download/DownloadTask;Lcom/miui/gallery/net/download/Request;)V

    iput-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/net/download/DownloadTask;Lcom/miui/gallery/net/download/Request;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask;->process(Lcom/miui/gallery/net/download/Request;)I

    move-result p0

    return p0
.end method

.method private configure(Ljava/net/HttpURLConnection;)V
    .locals 2

    const/16 v0, 0x2710

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v0, 0x3a98

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v0, "Accept-Encoding"

    const-string v1, "identity"

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static getTempFile(Ljava/io/File;)Ljava/io/File;
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".download"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static isRetryState(I)Z
    .locals 1

    const/16 v0, 0xc

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static openOutputStream(Ljava/io/File;)Ljava/io/OutputStream;
    .locals 3

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "DownloadTask"

    const-string v0, "create folder failed"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "DownloadTask"

    const-string v0, "output file is a directory"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_1
    const-string v0, "DownloadTask"

    const-string v1, "output file will be overwritten"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/net/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "DownloadTask"

    const-string v1, "temp file exists, try delete"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "DownloadTask"

    const-string v1, "temp file delete failed, will overwrite"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    const-string v0, "DownloadTask"

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v2
.end method

.method private performProgressUpdate([BI)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide v0, v0, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDownloadSize:J

    iget-object v2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide v3, v2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDownloadSize:J

    int-to-long v5, p2

    add-long/2addr v3, v5

    iput-wide v3, v2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDownloadSize:J

    iget-object v2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-object v2, v2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-object v2, v2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, p2}, Ljava/security/MessageDigest;->update([BII)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide p1, p1, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mContentLength:J

    const-wide/16 v2, 0x0

    cmp-long v4, p1, v2

    if-lez v4, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide p1, p1, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDownloadSize:J

    long-to-double p1, p1

    iget-object v2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide v2, v2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mContentLength:J

    long-to-double v2, v2

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double p1, p1, v2

    double-to-int p1, p1

    long-to-double v0, v0

    iget-object p2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide v4, p2, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mContentLength:J

    long-to-double v4, v4

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v4

    mul-double v0, v0, v2

    double-to-int p2, v0

    if-eq p2, p1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->publishProgress(I)V

    :cond_1
    return-void
.end method

.method private postProcess(I)I
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    iget-object v0, v0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getDestination()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/net/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "DownloadTask"

    const-string v2, "delete tmp file failed %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    iget-object v0, v0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getDestination()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/net/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/16 v3, 0x9

    if-nez v2, :cond_1

    const-string p1, "DownloadTask"

    const-string v0, "downloaded file missing"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_1
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string p1, "DownloadTask"

    const-string v0, "downloaded file rename failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_2
    const-string v0, "DownloadTask"

    const-string v1, "rename tmp file success"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return p1
.end method

.method private postTransferContent()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    iget-object v0, v0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getVerifier()Lcom/miui/gallery/net/download/Verifier;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    iget-object v0, v0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getVerifier()Lcom/miui/gallery/net/download/Verifier;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-object v1, v1, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/net/download/Verifier;->verify([B)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "DownloadTask"

    const-string v1, "verify fail"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x6

    return v0

    :cond_1
    :goto_0
    const-string v0, "DownloadTask"

    const-string v1, "verify success"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method private preProcess(Lcom/miui/gallery/net/download/Request;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;-><init>(Lcom/miui/gallery/net/download/DownloadTask$1;)V

    iput-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getListener()Lcom/miui/gallery/net/download/Request$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/net/download/DownloadTask$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$1;-><init>(Lcom/miui/gallery/net/download/DownloadTask;Lcom/miui/gallery/net/download/Request;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private preTransferContent(Lcom/miui/gallery/net/download/Request;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getVerifier()Lcom/miui/gallery/net/download/Verifier;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "DownloadTask"

    const-string v1, "need verify, try to get MessageDigest"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Verifier;->getInstance()Ljava/security/MessageDigest;

    move-result-object p1

    iput-object p1, v0, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    :cond_0
    return-void
.end method

.method private process(Lcom/miui/gallery/net/download/Request;)I
    .locals 7

    const-string v0, "DownloadTask"

    const-string v1, "start to download request[%s, %s]"

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getDestination()Ljava/io/File;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask;->preProcess(Lcom/miui/gallery/net/download/Request;)V

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getMaxRetryTimes()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask;->tryDownload(Lcom/miui/gallery/net/download/Request;)I

    move-result v3

    invoke-static {v3}, Lcom/miui/gallery/net/download/DownloadTask;->isRetryState(I)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "DownloadTask"

    const-string v5, "retry for %d"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    sget-wide v4, Lcom/miui/gallery/net/download/DownloadTask;->RETRY_INTERVAL_MILLI:J

    invoke-static {v4, v5, v1}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    if-le v2, v0, :cond_0

    goto :goto_0

    :catch_0
    const/4 v3, 0x5

    :cond_1
    :goto_0
    invoke-direct {p0, v3}, Lcom/miui/gallery/net/download/DownloadTask;->postProcess(I)I

    move-result p1

    return p1
.end method

.method private processHeader(Ljava/net/HttpURLConnection;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result p1

    int-to-long v1, p1

    iput-wide v1, v0, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mContentLength:J

    const-string p1, "DownloadTask"

    const-string v0, "content length: %d"

    iget-object v1, p0, Lcom/miui/gallery/net/download/DownloadTask;->mTaskInfo:Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;

    iget-wide v1, v1, Lcom/miui/gallery/net/download/DownloadTask$TaskInfo;->mContentLength:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private static translateErrorCode(I)I
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/16 p0, 0xb

    return p0

    :pswitch_0
    const/4 p0, 0x3

    return p0

    :pswitch_1
    const/4 p0, 0x2

    return p0

    :pswitch_2
    const/4 p0, 0x1

    return p0

    :pswitch_3
    const/4 p0, 0x0

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static translateResponseCode(I)I
    .locals 4

    const/16 v0, 0xc8

    if-eq p0, v0, :cond_6

    const-string v0, "DownloadTask"

    const-string v1, "processing http code %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    div-int/lit8 v0, p0, 0x64

    const/4 v1, 0x3

    const/4 v2, 0x7

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v1, 0x4

    const/16 v3, 0xc

    if-ne v0, v1, :cond_2

    const/16 v0, 0x198

    if-ne p0, v0, :cond_1

    return v3

    :cond_1
    return v2

    :cond_2
    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    const/16 v0, 0x1f8

    if-ne p0, v0, :cond_3

    return v3

    :cond_3
    const/16 p0, 0x8

    return p0

    :cond_4
    const/4 p0, 0x2

    if-ne v0, p0, :cond_5

    return v2

    :cond_5
    return v2

    :cond_6
    const-string p0, "DownloadTask"

    const-string v0, "http status is ok"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private tryDownload(Lcom/miui/gallery/net/download/Request;)I
    .locals 7

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getNetworkType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/net/download/ConnectionController;->open(Landroid/net/Uri;I)Lcom/miui/gallery/net/download/ConnectionController$Holder;

    move-result-object v0

    iget-object v1, v0, Lcom/miui/gallery/net/download/ConnectionController$Holder;->value:Ljava/lang/Object;

    check-cast v1, Ljava/net/HttpURLConnection;

    if-nez v1, :cond_0

    const-string p1, "DownloadTask"

    const-string v1, "open connection failed"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, v0, Lcom/miui/gallery/net/download/ConnectionController$Holder;->reason:I

    invoke-static {p1}, Lcom/miui/gallery/net/download/DownloadTask;->translateErrorCode(I)I

    move-result p1

    return p1

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/net/download/DownloadTask;->configure(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/net/download/DownloadTask;->translateResponseCode(I)I

    move-result v2

    if-eqz v2, :cond_1

    const-string p1, "DownloadTask"

    const-string v3, "response code not valid"

    invoke-static {p1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return v2

    :cond_1
    :try_start_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/net/download/DownloadTask;->processHeader(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    invoke-virtual {p1}, Lcom/miui/gallery/net/download/Request;->getDestination()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/net/download/DownloadTask;->openOutputStream(Ljava/io/File;)Ljava/io/OutputStream;

    move-result-object v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v3, :cond_4

    :try_start_3
    const-string p1, "DownloadTask"

    const-string v0, "open output stream failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 p1, 0x4

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v2, :cond_2

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    if-eqz v3, :cond_3

    :try_start_5
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    return p1

    :catchall_0
    move-exception p1

    goto/16 :goto_a

    :cond_4
    :try_start_6
    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask;->preTransferContent(Lcom/miui/gallery/net/download/Request;)V

    const-string p1, "DownloadTask"

    const-string v0, "start to transfer data"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x2000

    new-array p1, p1, [B

    const/4 v0, 0x0

    const/4 v4, 0x0

    :goto_2
    iget-object v5, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    invoke-virtual {v5}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->isCancelled()Z

    move-result v5

    const/4 v6, -0x1

    if-nez v5, :cond_5

    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    if-eq v4, v6, :cond_5

    invoke-virtual {v3, p1, v0, v4}, Ljava/io/OutputStream;->write([BII)V

    invoke-direct {p0, p1, v4}, Lcom/miui/gallery/net/download/DownloadTask;->performProgressUpdate([BI)V

    goto :goto_2

    :cond_5
    if-ne v4, v6, :cond_8

    const-string p1, "DownloadTask"

    const-string v0, "download success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/net/download/DownloadTask;->postTransferContent()I

    move-result p1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v2, :cond_6

    :try_start_7
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_6
    :goto_3
    if-eqz v3, :cond_7

    :try_start_8
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_4

    :catch_3
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_4
    return p1

    :cond_8
    :try_start_9
    const-string p1, "DownloadTask"

    const-string v0, "cancelled, during download"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    const/4 p1, 0x5

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v2, :cond_9

    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    goto :goto_5

    :catch_4
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_5
    if-eqz v3, :cond_a

    :try_start_b
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    goto :goto_6

    :catch_5
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_a
    :goto_6
    return p1

    :catchall_1
    move-exception p1

    move-object v3, v0

    goto :goto_a

    :catch_6
    move-object v3, v0

    :catch_7
    move-object v0, v2

    goto :goto_7

    :catchall_2
    move-exception p1

    move-object v2, v0

    move-object v3, v2

    goto :goto_a

    :catch_8
    move-object v3, v0

    :goto_7
    :try_start_c
    const-string p1, "DownloadTask"

    const-string v2, "tryDownload occur error."

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    const/16 p1, 0xb

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v0, :cond_b

    :try_start_d
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9

    goto :goto_8

    :catch_9
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_b
    :goto_8
    if-eqz v3, :cond_c

    :try_start_e
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_a

    goto :goto_9

    :catch_a
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_c
    :goto_9
    return p1

    :catchall_3
    move-exception p1

    move-object v2, v0

    :goto_a
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v2, :cond_d

    :try_start_f
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_b

    goto :goto_b

    :catch_b
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_d
    :goto_b
    if-eqz v3, :cond_e

    :try_start_10
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_c

    goto :goto_c

    :catch_c
    move-exception v0

    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_e
    :goto_c
    throw p1
.end method


# virtual methods
.method cancel(Z)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->cancel(Z)Z

    move-result p1

    return p1
.end method

.method execute(Ljava/util/concurrent/Executor;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method isDone()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask;->mCoreTask:Lcom/miui/gallery/net/download/DownloadTask$CoreTask;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

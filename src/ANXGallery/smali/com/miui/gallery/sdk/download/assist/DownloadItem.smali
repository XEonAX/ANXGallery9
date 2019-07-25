.class public Lcom/miui/gallery/sdk/download/assist/DownloadItem;
.super Ljava/lang/Object;
.source "DownloadItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    }
.end annotation


# instance fields
.field private final mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

.field private final mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

.field private final mManual:Z

.field private final mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

.field private final mRequireCharging:Z

.field private final mRequireDeviceStorage:Z

.field private final mRequirePower:Z

.field private final mRequireWLAN:Z

.field private mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private final mUri:Landroid/net/Uri;

.field private final mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

.field private final mUriLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$000(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$100(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$200(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUriLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$300(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$400(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$500(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$600(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$700(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequirePower:Z

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$800(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireCharging:Z

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$900(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireWLAN:Z

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$1000(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireDeviceStorage:Z

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->access$1100(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mManual:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;Lcom/miui/gallery/sdk/download/assist/DownloadItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->cloneFrom(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)V

    return-void
.end method

.method public static callbackCancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/miui/gallery/sdk/download/listener/DownloadListener;->onDownloadCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_0
    return-void
.end method

.method public static callbackError(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    invoke-interface {v0, v1, p0, p1}, Lcom/miui/gallery/sdk/download/listener/DownloadListener;->onDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_0
    return-void
.end method

.method public static callbackProgress(Lcom/miui/gallery/sdk/download/assist/DownloadItem;JJ)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    move-wide v3, p1

    move-wide v5, p3

    invoke-interface/range {v0 .. v6}, Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;->onDownloadProgress(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V

    :cond_0
    return-void
.end method

.method public static callbackStarted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/miui/gallery/sdk/download/listener/DownloadListener;->onDownloadStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_0
    return-void
.end method

.method public static callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    invoke-interface {v0, v1, p0, p1}, Lcom/miui/gallery/sdk/download/listener/DownloadListener;->onDownloadSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public compareAnsSetStatus(II)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    return p1
.end method

.method public getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    return-object v0
.end method

.method public getDownloader()Lcom/miui/gallery/sdk/download/downloader/IDownloader;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPriority()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x3e7

    goto :goto_0

    :cond_0
    const/16 v0, 0x3e8

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireWLAN()Z

    move-result v1

    if-eqz v1, :cond_1

    add-int/lit8 v0, v0, -0x3

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequirePower()Z

    move-result v1

    if-eqz v1, :cond_2

    add-int/lit8 v0, v0, -0x5

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireDeviceStorage()Z

    move-result v1

    if-eqz v1, :cond_3

    add-int/lit8 v0, v0, -0xb

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireCharging()Z

    move-result v1

    if-eqz v1, :cond_4

    add-int/lit8 v0, v0, -0x15

    :cond_4
    return v0
.end method

.method public getProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    return-object v0
.end method

.method public getUriLock()Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUriLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getStatus()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isManual()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mManual:Z

    return v0
.end method

.method public isRequireCharging()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireCharging:Z

    return v0
.end method

.method public isRequireDeviceStorage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireDeviceStorage:Z

    return v0
.end method

.method public isRequirePower()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequirePower:Z

    return v0
.end method

.method public isRequireWLAN()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mRequireWLAN:Z

    return v0
.end method

.method public isStatusOk()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getStatus()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "uri[%s], type[%s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mUri:Landroid/net/Uri;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

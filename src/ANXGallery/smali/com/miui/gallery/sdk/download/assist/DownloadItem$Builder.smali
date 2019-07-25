.class public Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
.super Ljava/lang/Object;
.source "DownloadItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/sdk/download/assist/DownloadItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

.field private mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

.field private mManual:Z

.field private mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

.field private mRequireCharging:Z

.field private mRequireDeviceStorage:Z

.field private mRequirePower:Z

.field private mRequireWLAN:Z

.field private mType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private mUri:Landroid/net/Uri;

.field private mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

.field private mUriLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireDeviceStorage:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mManual:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/listener/DownloadListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Lcom/miui/gallery/sdk/download/downloader/IDownloader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequirePower:Z

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireCharging:Z

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireWLAN:Z

    return p0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/sdk/download/assist/DownloadItem;
    .locals 2

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;Lcom/miui/gallery/sdk/download/assist/DownloadItem$1;)V

    return-object v0
.end method

.method public cloneFrom(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUri:Landroid/net/Uri;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloadListener()Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getProgressListener()Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getDownloader()Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequirePower()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequirePower:Z

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireCharging()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireCharging:Z

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireWLAN()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireWLAN:Z

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireDeviceStorage()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireDeviceStorage:Z

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mManual:Z

    return-object p0
.end method

.method public setDownloadListener(Lcom/miui/gallery/sdk/download/listener/DownloadListener;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    return-object p0
.end method

.method public setDownloader(Lcom/miui/gallery/sdk/download/downloader/IDownloader;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mDownloader:Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    return-object p0
.end method

.method public setManual(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mManual:Z

    return-object p0
.end method

.method public setProgressListener(Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    return-object p0
.end method

.method public setRequireCharging(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireCharging:Z

    return-object p0
.end method

.method public setRequireDeviceStorage(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireDeviceStorage:Z

    return-object p0
.end method

.method public setRequirePower(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequirePower:Z

    return-object p0
.end method

.method public setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mRequireWLAN:Z

    return-object p0
.end method

.method public setType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method public setUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUri:Landroid/net/Uri;

    return-object p0
.end method

.method public setUriAdapter(Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriAdapter:Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    return-object p0
.end method

.method public setUriLock(Ljava/util/concurrent/locks/ReentrantLock;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->mUriLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object p0
.end method

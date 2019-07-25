.class public Lcom/miui/gallery/picker/uri/UriGenerator;
.super Ljava/lang/Object;
.source "UriGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;,
        Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;
    }
.end annotation


# static fields
.field private static final CHECKED_ITEM_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mActivityWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mCancelOriginInfoListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCheckedItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;"
        }
    .end annotation
.end field

.field private mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mDataBaseQueryTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mDownloadPendings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

.field private mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

.field private mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

.field private mOriginRequestPendings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;",
            ">;"
        }
    .end annotation
.end field

.field private mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

.field private mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

.field private mResults:[Landroid/net/Uri;

.field private mSha1s:[Ljava/lang/String;

.field private mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "_id"

    const-string v1, "sha1"

    const-string v2, "serverType"

    const-string v3, "size"

    const-string v4, "exifImageLength"

    const-string v5, "exifImageWidth"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/picker/uri/UriGenerator;->CHECKED_ITEM_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;Lcom/miui/gallery/picker/helper/Picker$ImageType;Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;",
            "Lcom/miui/gallery/picker/helper/Picker$ImageType;",
            "Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$1;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDataBaseQueryTask:Landroid/os/AsyncTask;

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$3;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$4;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$5;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$6;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelOriginInfoListener:Landroid/content/DialogInterface$OnCancelListener;

    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$7;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    iput-object p4, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator;->queryCheckedItems()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator;->getUrisFromCheckedItems()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/picker/uri/UriGenerator;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->deliverResult(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/picker/uri/UriGenerator;)[Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelOriginInfoListener:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestPendings:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/picker/uri/UriGenerator;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->showDownloadConfirmDialog(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator;->startDownload()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/OriginUrlRequestor;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method private deliverResult(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    array-length v0, v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    invoke-interface {p1}, Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;->onFail()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN_OR_DOWNLOAD_INFO:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v0, v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance p1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestPendings:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/UriGenerator$1;)V

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;-><init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mSha1s:[Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->start([Landroid/net/Uri;[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;->onSuccess([Landroid/net/Uri;Ljava/util/List;)V

    :goto_0
    return-void
.end method

.method private getUrisFromCheckedItems()V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mSha1s:[Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestPendings:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/4 v7, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v7, v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mSha1s:[Ljava/lang/String;

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getSha1()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getOriginFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v1, v7

    goto/16 :goto_2

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v1, v2, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v3, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getSize()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-direct {v3, v4, v1, v5, v7}, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;II)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN_OR_DOWNLOAD_INFO:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v1, v2, :cond_3

    iget-object v9, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mOriginRequestPendings:Ljava/util/ArrayList;

    new-instance v10, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getHeight()I

    move-result v4

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getWidth()I

    move-result v5

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getServerType()I

    move-result v6

    move-object v1, v10

    move v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;-><init>(ILandroid/net/Uri;III)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getThumbnailFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v1, v7

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v2, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-virtual {v8}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {v2, v3, v4, v0, v7}, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;II)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    :cond_5
    const-string v1, "UriGenerator"

    const-string v2, "picked file: %d, pending: %d"

    iget-object v3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    array-length v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_6

    invoke-direct {p0, v3}, Lcom/miui/gallery/picker/uri/UriGenerator;->deliverResult(Ljava/util/List;)V

    goto/16 :goto_4

    :cond_6
    invoke-static {v1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_8

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0e003e

    iget-object v5, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v0

    invoke-virtual {v1, v4, v5, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    array-length v0, v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    invoke-interface {v0}, Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;->onFail()V

    goto :goto_4

    :cond_7
    invoke-direct {p0, v3}, Lcom/miui/gallery/picker/uri/UriGenerator;->deliverResult(Ljava/util/List;)V

    goto :goto_4

    :cond_8
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->showDownloadConfirmDialog(Z)V

    goto :goto_4

    :cond_9
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    array-length v1, v1

    if-nez v1, :cond_a

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0037

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_a
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f100597

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v0

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator;->startDownload()V

    goto :goto_4

    :cond_b
    invoke-direct {p0, v2}, Lcom/miui/gallery/picker/uri/UriGenerator;->showDownloadConfirmDialog(Z)V

    :goto_4
    return-void
.end method

.method private queryCheckedItems()V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    invoke-virtual {v4}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getId()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6, v4}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    if-eqz v3, :cond_0

    const-string v5, ","

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v4}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getId()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Landroid/app/Activity;

    if-eqz v4, :cond_2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_PICKER:Landroid/net/Uri;

    const-string v5, "sha1"

    const/4 v6, 0x0

    invoke-static {v3, v5, v6}, Lcom/miui/gallery/util/UriUtil;->appendGroupBy(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    sget-object v6, Lcom/miui/gallery/picker/uri/UriGenerator;->CHECKED_ITEM_PROJECTION:[Ljava/lang/String;

    const-string v3, "_id IN (%s) AND (localGroupId!=-1000) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v2

    invoke-static {v3, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    new-instance v10, Lcom/miui/gallery/picker/uri/UriGenerator$2;

    invoke-direct {v10, p0, v0}, Lcom/miui/gallery/picker/uri/UriGenerator$2;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;Landroid/util/LongSparseArray;)V

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method private showDownloadConfirmDialog(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "download_file_count"

    iget-object v3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "local_file_count"

    iget-object v3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mResults:[Landroid/net/Uri;

    array-length v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    iget v4, v4, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mSize:I

    add-int/2addr v2, v4

    goto :goto_0

    :cond_0
    const-string v3, "download_file_size"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "retry_mode"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    invoke-direct {p1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setPositiveListener(Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setNegativeListener(Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "confirm_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private startDownload()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    :cond_0
    new-instance v0, Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v2, Lcom/miui/gallery/picker/uri/UriGenerator$8;

    invoke-direct {v2, p0}, Lcom/miui/gallery/picker/uri/UriGenerator$8;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/picker/uri/Downloader;-><init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->start()V

    return-void
.end method


# virtual methods
.method public generate()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mCheckedItems:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mImageType:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN_OR_DOWNLOAD_INFO:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator;->getUrisFromCheckedItems()V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mDataBaseQueryTask:Landroid/os/AsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_1
    return-void

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator;->mUriGenerateListener:Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    invoke-interface {v0}, Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;->onFail()V

    :cond_4
    return-void
.end method

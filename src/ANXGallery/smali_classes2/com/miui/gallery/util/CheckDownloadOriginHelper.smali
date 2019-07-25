.class public Lcom/miui/gallery/util/CheckDownloadOriginHelper;
.super Ljava/lang/Object;
.source "CheckDownloadOriginHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;,
        Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;,
        Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;
    }
.end annotation


# instance fields
.field private mAlbumId:J

.field private mContext:Landroid/content/Context;

.field private mFragmentManger:Landroid/app/FragmentManager;

.field private mListener:Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

.field private mMediaIds:[J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/FragmentManager;J[J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mFragmentManger:Landroid/app/FragmentManager;

    iput-wide p3, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mAlbumId:J

    iput-object p5, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mMediaIds:[J

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/List;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->doDownloadOrigin(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mListener:Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->startDownloadOrigin(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mAlbumId:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mMediaIds:[J

    return-object p0
.end method

.method private doDownloadOrigin(Ljava/util/List;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;",
            ">;Z)V"
        }
    .end annotation

    const-string v0, "CheckDownloadOriginHelper"

    const-string v1, "doDownloadOrigin %s"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    const v0, 0x7f100321

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    const v0, 0x7f100322

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x104000a

    const/high16 v6, 0x1040000

    new-instance v7, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;

    invoke-direct {v7, p0, p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/List;)V

    new-instance v8, Lcom/miui/gallery/util/CheckDownloadOriginHelper$2;

    invoke-direct {v8, p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$2;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)V

    invoke-static/range {v1 .. v8}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto :goto_2

    :cond_1
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;

    new-instance v1, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    iget-wide v2, v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;->mId:J

    invoke-static {v2, v3}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-wide v4, v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;->mSize:J

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;J)V

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-direct {p0, p2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->startDownloadOrigin(Ljava/util/ArrayList;)V

    :goto_2
    return-void
.end method

.method private startDownloadOrigin(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    const-string v0, "CheckDownloadOriginHelper"

    const-string v1, "startDownloadOrigin %s"

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)V

    invoke-static {p1}, Lcom/miui/gallery/ui/DownloadFragment;->newInstance(Ljava/util/ArrayList;)Lcom/miui/gallery/ui/DownloadFragment;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DownloadFragment;->setOnDownloadListener(Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;)V

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mFragmentManger:Landroid/app/FragmentManager;

    const-string v1, "DownloadFragment"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/DownloadFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public setListener(Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mListener:Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    return-void
.end method

.method public start()V
    .locals 3

    const-string v0, "CheckDownloadOriginHelper"

    const-string v1, "doCheckOrigin"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;

    iget-object v1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Landroid/content/Context;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

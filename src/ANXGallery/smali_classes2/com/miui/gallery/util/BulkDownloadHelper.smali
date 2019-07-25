.class public Lcom/miui/gallery/util/BulkDownloadHelper;
.super Ljava/lang/Object;
.source "BulkDownloadHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;,
        Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;,
        Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;
    }
.end annotation


# instance fields
.field private mCurSize:J

.field private mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

.field private mExcutingList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;"
        }
    .end annotation
.end field

.field private mFailList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSuccessList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;"
        }
    .end annotation
.end field

.field private mTotalSize:J


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mSuccessList:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mFailList:Ljava/util/List;

    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->reset()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->contains(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->onItemLoadingFail(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/BulkDownloadHelper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mCurSize:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/miui/gallery/util/BulkDownloadHelper;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mCurSize:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/BulkDownloadHelper;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mSuccessList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/util/BulkDownloadHelper;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->isDownloadEnd()Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/util/BulkDownloadHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->onDownloadEnd()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/util/BulkDownloadHelper;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/util/BulkDownloadHelper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    return-wide v0
.end method

.method private contains(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private generatorItemListener(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/BulkDownloadHelper$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/BulkDownloadHelper$1;-><init>(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V

    return-object v0
.end method

.method private isDownloadEnd()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mSuccessList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mFailList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onDownloadEnd()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    iget-object v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mSuccessList:Ljava/util/List;

    iget-object v2, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mFailList:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;->onDownloadEnd(Ljava/util/List;Ljava/util/List;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->reset()V

    return-void
.end method

.method private onItemLoadingFail(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getSize()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mFailList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->isDownloadEnd()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->onDownloadEnd()V

    :cond_0
    return-void
.end method

.method private reset()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mSuccessList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mFailList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mCurSize:J

    iput-wide v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->reset()V

    return-void
.end method

.method public download(Ljava/util/List;ZLcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;Z",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->cancel()V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->reset()V

    iget-object p2, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p2, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mExcutingList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    iget-wide v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getSize()J

    move-result-wide v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mTotalSize:J

    goto :goto_0

    :cond_1
    iput-object p3, p0, Lcom/miui/gallery/util/BulkDownloadHelper;->mDownloadListener:Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    new-instance p2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance p3, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    if-nez v3, :cond_2

    const-string v3, "BulkDownloadHelper"

    const-string v4, "Null download uri for item %s"

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/util/BulkDownloadHelper;->onItemLoadingFail(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v2}, Lcom/miui/gallery/util/BulkDownloadHelper;->generatorItemListener(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p1

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->loadImages(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    :cond_4
    return-void
.end method

.class public Lcom/miui/gallery/ui/ShareFilePrepareFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ShareFilePrepareFragment.java"

# interfaces
.implements Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;
.implements Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;,
        Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;,
        Lcom/miui/gallery/ui/ShareFilePrepareFragment$OutputGenerator;,
        Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;
    }
.end annotation


# instance fields
.field private mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private final mCompressFails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCompressFuture:Lcom/miui/gallery/threadpool/Future;

.field private mDecodeSecretTask:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

.field private final mDownloadFails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

.field private mErrorListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;

.field private mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

.field private mMaxCompressProgress:I

.field private mMaxDownloadProgress:I

.field private mMaxRenderProgress:I

.field private mMaxSecretProgress:I

.field private mPendingPrepareEnd:Z

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private final mRenderFails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private final mRenderItems:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private final mRenderSuccess:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

.field private mSecretIds:[J

.field private mSecretKeys:[[B

.field private final mSecretList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private final mShareUris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mStopped:Z

.field private final mSuccessPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCompressFails:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadFails:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderSuccess:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mShareUris:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Lmiui/app/ProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxDownloadProgress:I

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->onPrepareEnd()V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->scheduleCleanSecret()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderSuccess:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxRenderProgress:I

    return p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->scheduleClean()V

    return-void
.end method

.method static synthetic access$1702(Lcom/miui/gallery/ui/ShareFilePrepareFragment;Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxSecretProgress:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->updateProgress(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->resolveError(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mShareUris:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doRender()V

    return-void
.end method

.method private doCompress(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCompressFuture:Lcom/miui/gallery/threadpool/Future;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/FileCompressTask;

    const-string v2, "MIUI/Gallery/.compressShare"

    invoke-direct {v1, p1, p0, v2}, Lcom/miui/gallery/util/FileCompressTask;-><init>(Ljava/util/List;Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCompressFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private doDownload(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-direct {v0}, Lcom/miui/gallery/util/BulkDownloadHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1, p0}, Lcom/miui/gallery/util/BulkDownloadHelper;->download(Ljava/util/List;ZLcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;)V

    return-void
.end method

.method private doRender()V
    .locals 5

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "render items: %s"

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    new-instance v3, Lcom/miui/gallery/ui/ShareFilePrepareFragment$OutputGenerator;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$OutputGenerator;-><init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/miui/gallery/editor/photo/sdk/RenderTask$Generator;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    new-instance v1, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$3;-><init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->setCallback(Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->start()V

    return-void
.end method

.method private doSecret()V
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getSecretFolder()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f10065e

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->resolveError(I)V

    return-void

    :cond_0
    new-instance v6, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretKeys:[[B

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretIds:[J

    new-instance v5, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;-><init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;-><init>(Ljava/io/File;Ljava/util/List;[[B[JLcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;)V

    iput-object v6, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDecodeSecretTask:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDecodeSecretTask:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private getSecretFolder()Ljava/io/File;
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "dc_tmp_files"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private handleFiles()V
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key_compress_items"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "key_download_items"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "key_render_items"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "key_secret_items"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "key_share_uri"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string v6, "key_secret_keys"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, [[B

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "key_secret_ids"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v6

    if-eqz v4, :cond_0

    iget-object v7, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mShareUris:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->clear()V

    iget-object v7, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mShareUris:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    if-eqz v2, :cond_1

    const-string v4, "ShareFilePrepareFragment"

    const-string v7, "render files: %s"

    invoke-virtual {v2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v7, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderSuccess:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_1
    if-eqz v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput-object v5, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretKeys:[[B

    iput-object v6, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretIds:[J

    :cond_2
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    const/16 v3, 0x64

    if-eqz v2, :cond_4

    const-string v2, "ShareFilePrepareFragment"

    const-string v4, "compress file."

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x0

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    :cond_3
    const/high16 v1, 0x42c80000    # 100.0f

    int-to-float v5, v2

    mul-float v5, v5, v1

    add-int/2addr v2, v4

    int-to-float v1, v2

    div-float/2addr v5, v1

    float-to-int v1, v5

    iput v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxCompressProgress:I

    iget v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxCompressProgress:I

    sub-int/2addr v3, v1

    iput v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxDownloadProgress:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doCompress(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_4
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v6, v4, 0x64

    int-to-float v6, v6

    mul-float v6, v6, v2

    add-int/2addr v4, v0

    add-int/2addr v4, v5

    int-to-float v0, v4

    div-float/2addr v6, v0

    float-to-int v4, v6

    iput v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxDownloadProgress:I

    mul-int/lit8 v5, v5, 0x64

    int-to-float v4, v5

    mul-float v4, v4, v2

    div-float/2addr v4, v0

    float-to-int v0, v4

    iput v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxSecretProgress:I

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxDownloadProgress:I

    sub-int/2addr v3, v0

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxSecretProgress:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxRenderProgress:I

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doDownload(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v4, v1, 0x64

    int-to-float v4, v4

    mul-float v4, v4, v2

    add-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr v4, v0

    float-to-int v0, v4

    iput v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxSecretProgress:I

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxSecretProgress:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxRenderProgress:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doSecret()V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_7

    iput v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxRenderProgress:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doRender()V

    goto :goto_0

    :cond_7
    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->dismissAllowingStateLoss()V

    :goto_0
    return-void
.end method

.method public static newInstance(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/miui/gallery/ui/ShareFilePrepareFragment;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/List<",
            "[B>;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/ui/ShareFilePrepareFragment;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_compress_items"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "key_download_items"

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "key_render_items"

    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "key_secret_items"

    invoke-virtual {v1, p0, p3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "key_secret_ids"

    invoke-static {p6}, Lcom/miui/gallery/util/Numbers;->toArray(Ljava/util/List;)[J

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    const-string p0, "key_share_uri"

    invoke-virtual {v1, p0, p5}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    if-eqz p4, :cond_1

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_1

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [[B

    const/4 p1, 0x0

    :goto_0
    array-length p2, p0

    if-ge p1, p2, :cond_0

    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [B

    aput-object p2, p0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "key_secret_keys"

    invoke-virtual {v1, p1, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    :cond_1
    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onPrepareEnd()V
    .locals 7

    const-string v0, "ShareFilePrepareFragment"

    const-string v1, "prepare finish, render fails: %d"

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mStopped:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->dismissAllowingStateLoss()V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCompressFails:Ljava/util/List;

    iget-object v4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    iget-object v5, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderSuccess:Ljava/util/List;

    iget-object v6, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadFails:Ljava/util/List;

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;->onPrepareComplete(Ljava/util/List;Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mPendingPrepareEnd:Z

    :cond_1
    :goto_0
    return-void
.end method

.method private resolveError(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->dismissAllowingStateLoss()V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mErrorListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mErrorListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;

    invoke-interface {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;->onError()V

    :cond_0
    return-void
.end method

.method private scheduleClean()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "render_tmp_files"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->schedule(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private scheduleCleanSecret()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getSecretFolder()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->schedule(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private updateProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setProgress(I)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->handleFiles()V

    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onCompressComplete(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "key_download_items"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doDownload(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->onPrepareEnd()V

    :goto_0
    return-void
.end method

.method public onCompressProgress(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxCompressProgress:I

    int-to-float v0, v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->updateProgress(I)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    new-instance p1, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f10031b

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mTitle:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setProgressStyle(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/16 v1, 0x64

    invoke-virtual {p1, v1}, Lmiui/app/ProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;-><init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    const/4 v3, -0x2

    invoke-virtual {p1, v3, v1, v2}, Lmiui/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->setCancelable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->cancel()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mHelper:Lcom/miui/gallery/util/BulkDownloadHelper;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderTask:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->cancel()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDecodeSecretTask:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDecodeSecretTask:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->cancel(Z)Z

    :cond_2
    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

    return-void
.end method

.method public onDownloadEnd(Ljava/util/List;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ShareFilePrepareFragment"

    const-string v2, "download success, need render: %s"

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const-string v2, "ShareFilePrepareFragment"

    const-string v3, "download success, need secret: %s"

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v1, "ShareFilePrepareFragment"

    const-string v2, "download success, continue"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSuccessPaths:Ljava/util/List;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "ShareFilePrepareFragment"

    const-string v3, "download failed, skip render: %s"

    invoke-virtual {v0}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderFails:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadFails:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "ShareFilePrepareFragment"

    const-string p2, "download finish, need secret %d items"

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mSecretList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doSecret()V

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "ShareFilePrepareFragment"

    const-string p2, "download finish, need render %d items"

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mRenderItems:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doRender()V

    goto :goto_2

    :cond_6
    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->onPrepareEnd()V

    :goto_2
    return-void
.end method

.method public onDownloadProgress(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxDownloadProgress:I

    int-to-float v0, v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    iget v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mMaxCompressProgress:I

    add-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->updateProgress(I)V

    return-void
.end method

.method public onStart()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mStopped:Z

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStart()V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mPendingPrepareEnd:Z

    if-eqz v1, :cond_0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mPendingPrepareEnd:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->onPrepareEnd()V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mStopped:Z

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStop()V

    return-void
.end method

.method public setErrorListener(Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mErrorListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;

    return-void
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method public setOnDownloadListener(Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->mDownloadListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;

    return-void
.end method

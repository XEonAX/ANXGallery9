.class public Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;
.super Ljava/lang/Object;
.source "FontDownloadManager.java"


# instance fields
.field private mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

.field private mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->downloadResource(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->unZipDownloadFile(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    return-void
.end method

.method private downloadResource(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    :cond_0
    if-eqz p2, :cond_1

    const-string v0, "FontDownloadManager"

    const-string v1, "font is ready to download."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;->onStart()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getDownloadFilePath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;

    invoke-direct {v2, p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    invoke-virtual {v0, p1, v1, v2, p3}, Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;->download(Lcom/miui/gallery/editor/photo/core/imports/text/model/FontBean;Ljava/lang/String;Lcom/miui/gallery/net/download/Request$Listener;Z)V

    return-void
.end method

.method private unZipDownloadFile(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    sget-object p2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public cancelAll()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;->cancelAll()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mFontResDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/net/FontResDownloadManager;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->release()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->mUnzipFontTask:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;

    :cond_1
    return-void
.end method

.method public downloadFontResource(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_0

    const p2, 0x7f10055e

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string p1, "FontDownloadManager"

    const-string p2, "download resource no network"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v6, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$1;

    invoke-direct {v6, p0, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    move-object p2, p1

    check-cast p2, Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100560

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f10055f

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f10055c

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f10055d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, p2, p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->downloadResource(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;Z)V

    :goto_0
    return-void
.end method

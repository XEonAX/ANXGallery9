.class final Lcom/miui/gallery/ui/SyncBar$DownloadManager;
.super Lcom/miui/gallery/ui/SyncBar$ChildManager;
.source "SyncBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SyncBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DownloadManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;
    }
.end annotation


# static fields
.field private static sNeedShowError:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/error/core/ErrorCode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCurError:Lcom/miui/gallery/error/core/ErrorCode;

.field private mDownloadState:I

.field private mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_FULL:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->PRIMARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->SECONDARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/ui/SyncBar;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/SyncBar$ChildManager;-><init>(Lcom/miui/gallery/ui/SyncBar;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    sget-object p1, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mCurError:Lcom/miui/gallery/error/core/ErrorCode;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/SyncBar$DownloadManager;Lcom/miui/gallery/error/core/ErrorCode;)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mCurError:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p1
.end method

.method private getErrorHandler()Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    return-object v0
.end method

.method private statClickWhenDownloading()V
    .locals 2

    const-string v0, "Sync"

    const-string v1, "sync_auto_download_click_when_downloading"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public needShow()Z
    .locals 5

    iget v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-ne v0, v2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getErrorHandler()Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->getErrorTip()Lcom/miui/gallery/error/core/ErrorTip;

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v2, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->sNeedShowError:Ljava/util/LinkedList;

    invoke-virtual {v0}, Lcom/miui/gallery/error/core/ErrorTip;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mCurError:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0}, Lcom/miui/gallery/error/core/ErrorTip;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v0

    if-eq v2, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_2
    return v3
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->statClickWhenDownloading()V

    new-instance v0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const v2, 0x7f100327

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    const v2, 0x7f100326

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    const v2, 0x7f1004c3

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getErrorHandler()Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->getErrorTip()Lcom/miui/gallery/error/core/ErrorTip;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/error/core/ErrorTip;->getMessage(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/error/core/ErrorTip;->getActionStr(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/ui/SyncBar$DownloadManager$3;

    invoke-direct {v3, p0, v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$3;-><init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager;Lcom/miui/gallery/error/core/ErrorTip;)V

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    const v1, 0x7f1000d7

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/ui/SyncBar$DownloadManager$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$2;-><init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)V

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object p1

    instance-of p1, p1, Landroid/app/Activity;

    if-eqz p1, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "download"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public onDownloadCancelled(Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;)V"
        }
    .end annotation

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    new-instance p2, Lcom/miui/gallery/ui/SyncBar$PanelData;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    return-void
.end method

.method public onDownloadComplete(Ljava/util/List;Ljava/util/List;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;",
            "Lcom/miui/gallery/error/core/ErrorCode;",
            ")V"
        }
    .end annotation

    const/4 p1, 0x0

    if-eqz p3, :cond_0

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-eq p3, p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    const/4 p1, 0x3

    iput p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getErrorHandler()Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;-><init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)V

    invoke-virtual {p1, p3, p2}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->handleError(Lcom/miui/gallery/error/core/ErrorCode;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V

    goto :goto_1

    :cond_1
    const/4 p2, 0x2

    iput p2, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    new-instance p2, Lcom/miui/gallery/ui/SyncBar$PanelData;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    :goto_1
    return-void
.end method

.method public onDownloadProgress(Ljava/util/List;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mDownloadState:I

    iget-object v1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->mErrorHandler:Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->clearError()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100327

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100325

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v9, 0x0

    aput-object p1, v3, v9

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-instance p1, Lcom/miui/gallery/ui/SyncBar$PanelData;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p1

    move-object v8, p0

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p1, v9}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->unregisterBatchDownloadListener(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    return-void
.end method

.method public onResume()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->registerBatchDownloadListener(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    return-void
.end method

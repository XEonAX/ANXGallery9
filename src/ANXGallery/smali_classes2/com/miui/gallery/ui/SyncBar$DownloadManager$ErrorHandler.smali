.class Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;
.super Ljava/lang/Object;
.source "SyncBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SyncBar$DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ErrorHandler"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mErrorCodeTranslator:Lcom/miui/gallery/error/core/ErrorCodeTranslator;

.field private mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/error/BaseErrorCodeTranslator;

    invoke-direct {v0}, Lcom/miui/gallery/error/BaseErrorCodeTranslator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mErrorCodeTranslator:Lcom/miui/gallery/error/core/ErrorCodeTranslator;

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;Lcom/miui/gallery/error/core/ErrorTip;)Lcom/miui/gallery/error/core/ErrorTip;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    return-object p1
.end method


# virtual methods
.method public clearError()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    return-void
.end method

.method public getErrorTip()Lcom/miui/gallery/error/core/ErrorTip;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    return-object v0
.end method

.method public handleError(Lcom/miui/gallery/error/core/ErrorCode;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mErrorCodeTranslator:Lcom/miui/gallery/error/core/ErrorCodeTranslator;

    iget-object v1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler$1;

    invoke-direct {v2, p0, p2}, Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler$1;-><init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager$ErrorHandler;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V

    invoke-interface {v0, v1, p1, v2}, Lcom/miui/gallery/error/core/ErrorCodeTranslator;->translate(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V

    return-void
.end method

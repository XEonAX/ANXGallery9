.class public Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;
.super Ljava/lang/Object;
.source "DownloadItemStatus.java"


# instance fields
.field private final mItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

.field private final mSyncStatus:Lcom/miui/gallery/sdk/SyncStatus;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/sdk/SyncStatus;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mSyncStatus:Lcom/miui/gallery/sdk/SyncStatus;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    return-void
.end method


# virtual methods
.method public getDownloadedPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFilePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getStatus()Lcom/miui/gallery/sdk/SyncStatus;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mSyncStatus:Lcom/miui/gallery/sdk/SyncStatus;

    return-object v0
.end method

.method public isDownloading()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mSyncStatus:Lcom/miui/gallery/sdk/SyncStatus;

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;->mSyncStatus:Lcom/miui/gallery/sdk/SyncStatus;

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INTERRUPT:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

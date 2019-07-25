.class Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;
.super Lcom/miui/gallery/scanner/ScanTask;
.source "MediaScannerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScannerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScanFilesTask"
.end annotation


# instance fields
.field private mFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mScanStartIndex:I

.field private mScanType:I

.field private mTaskStartTime:J

.field final synthetic this$0:Lcom/miui/gallery/scanner/MediaScannerService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/scanner/MediaScannerService;Ljava/util/List;IZIJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;IZIJ)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-direct {p0, p3, p4}, Lcom/miui/gallery/scanner/ScanTask;-><init>(IZ)V

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    iput p5, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanType:I

    iput-wide p6, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mTaskStartTime:J

    const-string p1, "MediaScannerService"

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected canRunningInBackground()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-eqz p1, :cond_3

    instance-of v0, p1, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->getFiles()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v0, v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    return v1

    :cond_3
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 8

    iget v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanStartIndex:I

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    return-object v2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanStartIndex:I

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0, v1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v2

    :cond_1
    const-string v1, "MediaScannerService"

    const-string v3, "%s %s"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {v1, v0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->scanFiles(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)I

    move-result v1

    iget v5, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanStartIndex:I

    add-int/2addr v5, v1

    iput v5, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanStartIndex:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eq v1, v0, :cond_2

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_2
    iget v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanType:I

    const/4 v5, 0x1

    if-ne v0, v5, :cond_3

    iget-wide v5, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mTaskStartTime:J

    invoke-static {v5, v6}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setLastImagesScanTime(J)V

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mScanType:I

    const/4 v5, 0x2

    if-ne v0, v5, :cond_4

    iget-wide v5, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mTaskStartTime:J

    invoke-static {v5, v6}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setLastVideosScanTime(J)V

    :cond_4
    :goto_0
    const-string v0, "MediaScannerService"

    const-string v5, "ScanFilesTask [%s], scan [%d] files costs [%d]"

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "interrupted"

    goto :goto_1

    :cond_5
    const-string p1, "finished"

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v0, v5, p1, v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "ScanFilesTask priority %d, foreground %s, files %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->getPriority()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->isForeground()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaScannerService$ScanFilesTask;->mFiles:Ljava/util/List;

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

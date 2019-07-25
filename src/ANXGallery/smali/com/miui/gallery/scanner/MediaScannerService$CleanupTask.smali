.class Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;
.super Lcom/miui/gallery/scanner/ScanTask;
.source "MediaScannerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScannerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CleanupTask"
.end annotation


# instance fields
.field private mAlbumIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/scanner/MediaScannerService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/scanner/MediaScannerService;ZI)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;-><init>(Lcom/miui/gallery/scanner/MediaScannerService;ZILjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/scanner/MediaScannerService;ZILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-direct {p0, p3, p2}, Lcom/miui/gallery/scanner/ScanTask;-><init>(IZ)V

    iput-object p4, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    const-string p1, "MediaScannerService"

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->toString()Ljava/lang/String;

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
    .locals 4

    if-eqz p1, :cond_5

    instance-of v0, p1, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;

    if-eqz v0, :cond_5

    check-cast p1, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->getPriority()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->getPriority()I

    move-result v1

    const/4 v2, 0x0

    if-le v0, v1, :cond_0

    return v2

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->getAlbumIds()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    if-eqz v0, :cond_4

    if-eqz p1, :cond_4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_3
    return v1

    :cond_4
    return v2

    :cond_5
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getAlbumIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getMountedVolumePaths(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {v1}, Lcom/miui/gallery/util/StorageUtils;->isPrimaryStorageWritable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/scanner/MediaScanner;->cleanup(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Ljava/util/List;)V

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {p1}, Lcom/miui/gallery/scanner/MediaScannerService;->access$000(Lcom/miui/gallery/scanner/MediaScannerService;)V

    :cond_1
    if-nez v1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {p1}, Lcom/miui/gallery/scanner/MediaScannerService;->access$100(Lcom/miui/gallery/scanner/MediaScannerService;)V

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "CleanupTask priority [%d], foreground [%s], album ids: [%s]"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->getPriority()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->isForeground()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, ", "

    invoke-static {v3}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/base/Joiner;->skipNulls()Lcom/google/common/base/Joiner;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/scanner/MediaScannerService$CleanupTask;->mAlbumIds:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    const-string v3, "all"

    :goto_0
    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

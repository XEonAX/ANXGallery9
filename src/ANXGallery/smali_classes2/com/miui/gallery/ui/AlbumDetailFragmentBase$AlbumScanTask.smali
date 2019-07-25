.class Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;
.super Ljava/lang/Object;
.source "AlbumDetailFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumDetailFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AlbumScanTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAlbumId:J

.field private final mAlbumLocalPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->mAlbumLocalPath:Ljava/lang/String;

    iput-wide p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->mAlbumId:J

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 6

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->mAlbumLocalPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/StorageUtils;->getAbsolutePath(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    array-length v2, v0

    if-lez v2, :cond_0

    invoke-static {v0}, Lcom/google/common/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x3

    invoke-static {p1, v0, v2, v1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanDirectories(Landroid/content/Context;Ljava/util/ArrayList;IZ)V

    :cond_0
    iget-wide v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->mAlbumId:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    const/4 v0, 0x4

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;->mAlbumId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v2}, Lcom/google/common/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->cleanupByAlbumId(Landroid/content/Context;ILjava/util/ArrayList;)V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

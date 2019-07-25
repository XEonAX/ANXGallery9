.class Lcom/miui/gallery/provider/GalleryDBHelper$6;
.super Ljava/lang/Object;
.source "GalleryDBHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/GalleryDBHelper;->deleteVideoThumbnailFile(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/GalleryDBHelper;

.field final synthetic val$videos:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/GalleryDBHelper;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$6;->this$0:Lcom/miui/gallery/provider/GalleryDBHelper;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$6;->val$videos:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryDBHelper$6;->val$videos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailDirectory()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudUtils;->getThumbnailNameBySha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_1

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->MICRO_THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v6, v5, [Ljava/io/File;

    aput-object v2, v6, v4

    invoke-static {v3, v6}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_1
    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getMainSDCardCloudThumbnailFilePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudUtils;->getThumbnailNameBySha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v3, v5, [Ljava/io/File;

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    goto :goto_0

    :cond_2
    return-void
.end method

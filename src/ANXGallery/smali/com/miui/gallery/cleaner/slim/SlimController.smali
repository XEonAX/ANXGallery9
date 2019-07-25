.class public Lcom/miui/gallery/cleaner/slim/SlimController;
.super Ljava/lang/Object;
.source "SlimController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/slim/SlimController$OnSlimDoneListener;,
        Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;,
        Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;,
        Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;,
        Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;,
        Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorker;
    }
.end annotation


# static fields
.field public static final TIME_COST_STAGE:[I

.field private static instance:Lcom/miui/gallery/cleaner/slim/SlimController;


# instance fields
.field private mIds:[J

.field private volatile mIsRemainItemsToInit:Z

.field private mObserverHolder:Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

.field private mReleaseSize:J

.field private mRemainCount:I

.field private mRemainItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private mRemainItemsLock:Ljava/lang/Object;

.field private mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

.field private mStartTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimController;->TIME_COST_STAGE:[I

    return-void

    :array_0
    .array-data 4
        0x5
        0xa
        0xf
        0x19
        0x28
        0x3c
        0xb4
        0x12c
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mObserverHolder:Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItemsLock:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/cleaner/slim/SlimController;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mReleaseSize:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/cleaner/slim/SlimController;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mReleaseSize:J

    return-wide p1
.end method

.method static synthetic access$1110(Lcom/miui/gallery/cleaner/slim/SlimController;)I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainCount:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainCount:I

    return v0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/cleaner/slim/SlimController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->onSlimPaused()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/cleaner/slim/SlimController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->onSlimResumed()V

    return-void
.end method

.method static synthetic access$1602(Lcom/miui/gallery/cleaner/slim/SlimController;Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;)Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/cleaner/slim/SlimController;)Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mObserverHolder:Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/cleaner/slim/SlimController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIsRemainItemsToInit:Z

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/cleaner/slim/SlimController;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIsRemainItemsToInit:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItemsLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/cleaner/slim/SlimController;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItems:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/cleaner/slim/SlimController;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItems:Ljava/util/LinkedList;

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/cleaner/slim/SlimController;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/cleaner/slim/SlimController;[J)Ljava/util/LinkedList;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController;->queryMediaItem([J)Ljava/util/LinkedList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/cleaner/slim/SlimController;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController;->onSlimProgress(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/cleaner/slim/SlimController;Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;Ljava/util/ArrayList;)J
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/slim/SlimController;->handleSlim(Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;Ljava/util/ArrayList;)J

    move-result-wide p0

    return-wide p0
.end method

.method private static buildThumbnail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/cloud/ThumbnailMetaWriter;)Ljava/io/File;
    .locals 6

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    const-string p0, "SlimController"

    const-string p1, "file not exists: %s"

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_4

    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_2
    move-object v2, v1

    :goto_0
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    return-object v3

    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1

    :cond_4
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    if-ne p3, v4, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p1, p3, v2, p4}, Lcom/miui/gallery/cloud/CloudUtils;->buildBigThumbnailForImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/ThumbnailMetaWriter;)Ljava/lang/String;

    move-result-object p3

    goto :goto_2

    :cond_5
    move-object p3, v1

    :goto_2
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_6

    const-string p3, "SlimController"

    const-string p4, "fail to build thumbnail. args: fileName=%s, sha1=%s, localFilePath=%s"

    invoke-static {p3, p4, p0, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :cond_6
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v3}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_7

    return-object v3

    :cond_7
    const-string p3, "SlimController"

    const-string p4, "fail to rename %s to %s!"

    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v5

    invoke-static {p3, p4, v2, v5}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p4, v4, [Ljava/io/File;

    const/4 v2, 0x0

    aput-object p0, p4, v2

    invoke-static {p3, p4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eq p2, p1, :cond_9

    const/4 v2, 0x1

    goto :goto_3

    :cond_8
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    :cond_9
    :goto_3
    const-string p1, "move_part"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "slim"

    const-string p2, "slim_error"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v1

    :cond_a
    :goto_4
    const-string p3, "SlimController"

    const-string p4, "illegal args: fileName=%s, sha1=%s, localFilePath=%s"

    invoke-static {p3, p4, p0, p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;
    .locals 2

    const-class v0, Lcom/miui/gallery/cleaner/slim/SlimController;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cleaner/slim/SlimController;->instance:Lcom/miui/gallery/cleaner/slim/SlimController;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/slim/SlimController;-><init>()V

    sput-object v1, Lcom/miui/gallery/cleaner/slim/SlimController;->instance:Lcom/miui/gallery/cleaner/slim/SlimController;

    :cond_0
    sget-object v1, Lcom/miui/gallery/cleaner/slim/SlimController;->instance:Lcom/miui/gallery/cleaner/slim/SlimController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private handleSlim(Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;Ljava/util/ArrayList;)J
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecord;",
            ">;)J"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    iget-object v2, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-wide/16 v3, 0x0

    if-eqz v2, :cond_0

    return-wide v3

    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v5, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    return-wide v3

    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-object v7, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-static {v7}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->sha1:Ljava/lang/String;

    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    const/4 v8, 0x0

    const/16 v9, 0x2d

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eqz v7, :cond_3

    new-instance v3, Ljava/io/File;

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v12

    const-string v4, "SlimController"

    const-string v7, "thumbnail file already exits %s"

    iget-object v14, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-static {v4, v7, v14}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v3, v11, [Ljava/io/File;

    new-instance v4, Ljava/io/File;

    iget-object v7, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object v4, v3, v10

    invoke-static {v2, v3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    const-string v2, "SlimController"

    const-string v3, "delete localFile: %s"

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget-object v3, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    const-string v4, "SlimController"

    invoke-direct {v2, v9, v3, v4}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    iget v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->id:I

    iget-object v0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-static {v1, v0, v8}, Lcom/miui/gallery/cleaner/slim/SlimController;->saveToDB(ILjava/lang/String;Ljava/lang/String;)V

    sub-long/2addr v5, v12

    return-wide v5

    :cond_3
    iget-object v7, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-static {v7}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v12, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->sha1:Ljava/lang/String;

    invoke-static {v7, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    iget v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->id:I

    iget-object v0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-static {v1, v0, v8}, Lcom/miui/gallery/cleaner/slim/SlimController;->saveToDB(ILjava/lang/String;Ljava/lang/String;)V

    return-wide v3

    :cond_4
    iget-object v7, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->fileName:Ljava/lang/String;

    iget-object v8, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->sha1:Ljava/lang/String;

    iget-object v12, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    iget v13, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->serverType:I

    new-instance v15, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;

    iget-object v14, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->sha1:Ljava/lang/String;

    iget-object v3, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->fileName:Ljava/lang/String;

    iget-wide v10, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->mixDateTime:J

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->dateTime:Ljava/lang/String;

    iget-object v9, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->gpsDateStamp:Ljava/lang/String;

    move-wide/from16 v22, v5

    iget-object v5, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->gpsTimeStamp:Ljava/lang/String;

    move-object v6, v14

    move-object v14, v15

    move-object/from16 v24, v2

    move-object v2, v15

    move-object v15, v6

    move-object/from16 v16, v3

    move-wide/from16 v17, v10

    move-object/from16 v19, v4

    move-object/from16 v20, v9

    move-object/from16 v21, v5

    invoke-direct/range {v14 .. v21}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7, v8, v12, v13, v2}, Lcom/miui/gallery/cleaner/slim/SlimController;->buildThumbnail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/cloud/ThumbnailMetaWriter;)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_7

    new-instance v3, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    const-string v5, "SlimController"

    const/16 v6, 0x2d

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/io/File;

    const/4 v3, 0x0

    aput-object v24, v4, v3

    invoke-static {v1, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    const-string v1, "SlimController"

    const-string v3, "delete localFile: %s"

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    const-string v1, "SlimController"

    const-string v3, "successfully slim %s to %s"

    iget-object v4, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    iget-object v5, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->id:I

    iget-object v3, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    const-string v4, ""

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/cleaner/slim/SlimController;->saveToDB(ILjava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/io/File;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v1

    sub-long v3, v22, v1

    const-wide/16 v1, 0x0

    cmp-long v5, v3, v1

    if-gtz v5, :cond_6

    const-string v3, "SlimController"

    const-string v4, "slim size < 0: %s"

    iget-object v0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    invoke-static {v3, v4, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_6
    move-wide v1, v3

    :goto_0
    return-wide v1

    :cond_7
    const-wide/16 v1, 0x0

    return-wide v1
.end method

.method private onSlimPaused()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController$2;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private onSlimProgress(I)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimController$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController$1;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;I)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private onSlimResumed()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimController$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController$3;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private queryMediaItem([J)Ljava/util/LinkedList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([J)",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->PROJECTION:[Ljava/lang/String;

    const-string v3, "%s IN (%s)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "_id"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string v5, ","

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object p1

    invoke-static {v5, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Lcom/miui/gallery/cleaner/slim/SlimController$4;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/slim/SlimController$4;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/LinkedList;

    return-object p1
.end method

.method private static saveToDB(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "localFile"

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public declared-synchronized getReleaseSize()J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mReleaseSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRemainCount()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSlimCount()I
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getTotalCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getRemainCount()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getStartTime()J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mStartTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getTotalCount()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSlimPaused()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;->isPaused()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSlimStarted()Z
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimming()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getReleaseSize()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSlimming()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pause()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;->pause()V

    const-string v0, "SlimController"

    const-string v1, "pause slim"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mObserverHolder:Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public declared-synchronized resume()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;->resume()V

    const-string v0, "SlimController"

    const-string v1, "resume slim"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start([J)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->stop()V

    if-eqz p1, :cond_1

    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "SlimController"

    const-string v1, "start slim"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    iget-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    array-length p1, p1

    iput p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainCount:I

    iget-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItemsLock:Ljava/lang/Object;

    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIsRemainItemsToInit:Z

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance p1, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;-><init>(Lcom/miui/gallery/cleaner/slim/SlimController;Lcom/miui/gallery/cleaner/slim/SlimController$1;)V

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    iget-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;->start()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mStartTime:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized stop()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    if-eqz v0, :cond_0

    const-string v0, "SlimController"

    const-string v1, "stop slim"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mSlimWorkerPool:Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController$SlimWorkerPool;->stop()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIds:[J

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainCount:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mReleaseSize:J

    iput-wide v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mStartTime:J

    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItemsLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v3, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItems:Ljava/util/LinkedList;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItems:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    :cond_1
    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mRemainItems:Ljava/util/LinkedList;

    iput-boolean v1, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mIsRemainItemsToInit:Z

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController;->mObserverHolder:Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

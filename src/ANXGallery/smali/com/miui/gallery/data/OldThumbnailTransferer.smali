.class public Lcom/miui/gallery/data/OldThumbnailTransferer;
.super Ljava/lang/Object;
.source "OldThumbnailTransferer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/OldThumbnailTransferer$SingletonHolder;
    }
.end annotation


# instance fields
.field private final mThumbnailWrittenExif:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/OldThumbnailTransferer;->mThumbnailWrittenExif:Ljava/util/Set;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/data/OldThumbnailTransferer$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/data/OldThumbnailTransferer;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/data/OldThumbnailTransferer;Lcom/miui/gallery/data/DBImage;[Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transfer(Lcom/miui/gallery/data/DBImage;[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static getInstance()Lcom/miui/gallery/data/OldThumbnailTransferer;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/data/OldThumbnailTransferer$SingletonHolder;->access$100()Lcom/miui/gallery/data/OldThumbnailTransferer;

    move-result-object v0

    return-object v0
.end method

.method private inThumbnailFolder([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    invoke-static {p2, v3}, Lcom/miui/gallery/util/ExtraTextUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private isTheSameItem(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_2

    return v1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private refillMetaForSecretItem(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".tmp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/CryptoUtil;->decryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;

    invoke-direct {v1, p2}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Lcom/miui/gallery/data/DBImage;)V

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->write(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object p2

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/CryptoUtil;->encryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    const-string v1, "OldThumbnailTransferer"

    const-string v2, "refill meta for file %s successfully"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    const-string p2, "OldThumbnailTransferer"

    const-string v1, "fail to encrypt file %s"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string p2, "OldThumbnailTransferer"

    const-string v1, "fail to write meta for %s"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const-string p2, "OldThumbnailTransferer"

    const-string v1, "fail to decrypt file %s"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    const/4 p2, 0x0

    :goto_1
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return p2
.end method

.method public static transfer(Landroid/content/Context;)V
    .locals 2

    const-string v0, "old_thumbnail_transfered"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/data/BackgroundJobService;->startJobTransferOldThumbnail(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method private transfer(Landroid/net/Uri;[ILjava/util/List;Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "[I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    aget v1, p2, v0

    if-gtz v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudThumbnailFilePath()[Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v8

    const-string v1, "*"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v9

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s=%d OR %s=%d) AND (%s IS NULL OR %s=\'\' OR %s=\'%s\') AND %s!=%d AND %s NOT NULL"

    const/16 v4, 0xb

    new-array v4, v4, [Ljava/lang/Object;

    const-string v6, "serverType"

    aput-object v6, v4, v0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v0

    const-string v0, "serverType"

    const/4 v6, 0x2

    aput-object v0, v4, v6

    const/4 v0, 0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v0

    const/4 v0, 0x4

    const-string v7, "serverStatus"

    aput-object v7, v4, v0

    const/4 v0, 0x5

    const-string v7, "serverStatus"

    aput-object v7, v4, v0

    const/4 v0, 0x6

    const-string v7, "serverStatus"

    aput-object v7, v4, v0

    const/4 v0, 0x7

    const-string v7, "custom"

    aput-object v7, v4, v0

    const/16 v0, 0x8

    const-string v7, "localFlag"

    aput-object v7, v4, v0

    const/16 v0, 0x9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v0

    const/16 v0, 0xa

    const-string v6, "thumbnailFile"

    aput-object v6, v4, v0

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v10, 0x0

    const-string v11, "mixedDateTime DESC"

    new-instance v12, Lcom/miui/gallery/data/OldThumbnailTransferer$1;

    move-object v1, v12

    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/data/OldThumbnailTransferer$1;-><init>(Lcom/miui/gallery/data/OldThumbnailTransferer;[ILandroid/net/Uri;[Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    move-object v6, v8

    move-object v7, p1

    move-object v8, v9

    move-object v9, v0

    invoke-static/range {v6 .. v12}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method

.method private transfer(Lcom/miui/gallery/data/DBImage;[Ljava/lang/String;)Z
    .locals 10

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/cloud/RequestCloudItem;->getDownloadOriginalFilePath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_0

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p2, p1}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)I

    const-string p1, "OldThumbnailTransferer"

    const-string p2, "original file %s for %s exists. skip transfering"

    invoke-static {p1, p2, v3, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v5

    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    invoke-direct {p0, p2, v1}, Lcom/miui/gallery/data/OldThumbnailTransferer;->inThumbnailFolder([Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_a

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/data/OldThumbnailTransferer;->refillMetaForSecretItem(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p1, "OldThumbnailTransferer"

    const-string p2, "failed to refill meta for %s. end transfering"

    invoke-static {p1, p2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v5

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer;->mThumbnailWrittenExif:Ljava/util/Set;

    invoke-interface {p2, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    new-instance p2, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;

    invoke-direct {p2, p1}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Lcom/miui/gallery/data/DBImage;)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->write(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p1, "OldThumbnailTransferer"

    const-string p2, "failed to write exif for %s. end transfering"

    invoke-static {p1, p2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v5

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer;->mThumbnailWrittenExif:Ljava/util/Set;

    invoke-interface {p2, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_5
    invoke-static {p1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getThumbnailDownloadFileNameNotSecret(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p2}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/data/OldThumbnailTransferer;->isTheSameItem(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_1

    :cond_6
    const-string v2, "OldThumbnailTransferer"

    const-string v3, "rename before transfering %s"

    invoke-static {v2, v3, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p2}, Lcom/miui/gallery/cloud/CloudUtils;->renameForPhotoConflict(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    invoke-static {v1, p2, v2}, Lcom/miui/gallery/cloud/CloudUtils;->copyImage(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    goto :goto_2

    :cond_7
    :goto_1
    const-string v2, "OldThumbnailTransferer"

    const-string v3, "destFile %s already exists"

    invoke-static {v2, v3, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_8
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    invoke-static {v1, p2, v2}, Lcom/miui/gallery/cloud/CloudUtils;->copyImage(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    :goto_2
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_9

    const-string p1, "OldThumbnailTransferer"

    const-string v0, "failed to transfer %s to "

    invoke-static {p1, v0, v1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v5

    :cond_9
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "thumbnailFile"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s=?"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Object;

    const-string v9, "_id"

    aput-object v9, v8, v5

    invoke-static {v4, v6, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v6, v7, [Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v5

    invoke-static {v3, p1, v2, v4, v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    const-string p1, "OldThumbnailTransferer"

    const-string v0, "transfered %s to %s successfully"

    invoke-static {p1, v0, v1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v7

    :cond_a
    :goto_3
    const-string p1, "OldThumbnailTransferer"

    const-string p2, "skip transfering thumbnail %s for %s"

    invoke-static {p1, p2, v1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v5
.end method

.method private transferSubUbiImage(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance p3, Lcom/miui/gallery/data/OldThumbnailTransferer$2;

    invoke-direct {p3, p0}, Lcom/miui/gallery/data/OldThumbnailTransferer$2;-><init>(Lcom/miui/gallery/data/OldThumbnailTransferer;)V

    const-string v0, ","

    invoke-static {p4, v0, p3}, Lcom/miui/gallery/util/GalleryUtils;->concatAll(Ljava/util/Collection;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$ConcatConverter;)Ljava/lang/String;

    move-result-object p4

    const-string v0, ","

    invoke-static {p5, v0, p3}, Lcom/miui/gallery/util/GalleryUtils;->concatAll(Ljava/util/Collection;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$ConcatConverter;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-eqz p5, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudThumbnailFilePath()[Ljava/lang/String;

    move-result-object p5

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v0, "*"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s IN (%s) OR %s IN (%s))"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ubiLocalId"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p4, v4, v5

    const/4 p4, 0x2

    const-string v5, "ubiServerId"

    aput-object v5, v4, p4

    const/4 p4, 0x3

    aput-object p3, v4, p4

    invoke-static {v0, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-instance v7, Lcom/miui/gallery/data/OldThumbnailTransferer$3;

    invoke-direct {v7, p0, p1, p5}, Lcom/miui/gallery/data/OldThumbnailTransferer$3;-><init>(Lcom/miui/gallery/data/OldThumbnailTransferer;Landroid/net/Uri;[Ljava/lang/String;)V

    move-object v2, p2

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method transfer()V
    .locals 11

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const/16 v3, 0x1f4

    aput v3, v1, v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    sget-object v4, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    invoke-direct {p0, v4, v1, v3, v10}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transfer(Landroid/net/Uri;[ILjava/util/List;Ljava/util/List;)V

    sget-object v5, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    const-string v6, "ownerSubUbifocus"

    const-string v7, "cloud"

    move-object v4, p0

    move-object v8, v3

    move-object v9, v10

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transferSubUbiImage(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-interface {v10}, Ljava/util/List;->clear()V

    sget-object v4, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    invoke-direct {p0, v4, v1, v3, v10}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transfer(Landroid/net/Uri;[ILjava/util/List;Ljava/util/List;)V

    sget-object v5, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    const-string v6, "shareSubUbifocus"

    const-string v7, "shareImage"

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transferSubUbiImage(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudThumbnailFilePath()[Ljava/lang/String;

    move-result-object v1

    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, v1, v4

    const-string v6, "OldThumbnailTransferer"

    const-string v7, "thumbnails transfered. delete old thumbnail folder: %s"

    invoke-static {v6, v7, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v6, Lcom/miui/gallery/util/MediaFileUtils$FileType;->FOLDER:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v7, v0, [Ljava/lang/String;

    aput-object v5, v7, v2

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudThumbnailModifiedTimeMapFilePath()[Ljava/lang/String;

    move-result-object v1

    array-length v3, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_1

    aget-object v5, v1, v4

    const-string v6, "OldThumbnailTransferer"

    const-string v7, "thumbnails transfered. delete thumbnail modified time file: %s"

    invoke-static {v6, v7, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v6, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v7, v0, [Ljava/lang/String;

    aput-object v5, v7, v2

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    const-string v1, "old_thumbnail_transfered"

    invoke-static {v1, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

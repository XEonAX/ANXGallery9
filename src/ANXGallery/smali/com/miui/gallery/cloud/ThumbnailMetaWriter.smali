.class public Lcom/miui/gallery/cloud/ThumbnailMetaWriter;
.super Ljava/lang/Object;
.source "ThumbnailMetaWriter.java"


# instance fields
.field private final mDateTime:Ljava/lang/String;

.field private final mGPSDateStamp:Ljava/lang/String;

.field private final mGPSTimeStamp:Ljava/lang/String;

.field private final mMixDateTime:J

.field private final mOriginalFileName:Ljava/lang/String;

.field private final mSha1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/data/DBImage;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mSha1:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mOriginalFileName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mMixDateTime:J

    const-string p2, "dateTime"

    invoke-virtual {p1, p2}, Lcom/miui/gallery/data/DBImage;->getJsonExifString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    const-string p2, "GPSDateStamp"

    invoke-virtual {p1, p2}, Lcom/miui/gallery/data/DBImage;->getJsonExifString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSDateStamp:Ljava/lang/String;

    const-string p2, "GPSTimeStamp"

    invoke-virtual {p1, p2}, Lcom/miui/gallery/data/DBImage;->getJsonExifString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSTimeStamp:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mSha1:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mOriginalFileName:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mMixDateTime:J

    iput-object p5, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSDateStamp:Ljava/lang/String;

    iput-object p7, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSTimeStamp:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public write(Ljava/lang/String;)Z
    .locals 14

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->needUseDocumentProvider(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->openFileDescriptor(Landroid/content/Context;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    :try_start_1
    const-string v1, "ThumbnailMetaWriter"

    const-string v3, "Failed to open file descriptor  of %s"

    invoke-static {v1, v3, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :catch_0
    move-exception v1

    goto/16 :goto_2

    :cond_0
    :try_start_2
    sget-object v3, Lcom/miui/gallery/util/ExifUtil;->sMediaExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/io/FileDescriptor;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/media/ExifInterface;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :cond_1
    :try_start_3
    sget-object v2, Lcom/miui/gallery/util/ExifUtil;->sMediaExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    invoke-interface {v2, p1}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/media/ExifInterface;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v2, v1

    :goto_0
    :try_start_4
    new-instance v4, Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    iget-object v5, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mSha1:Ljava/lang/String;

    iget-object v6, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mOriginalFileName:Ljava/lang/String;

    invoke-static {v6}, Lcom/miui/gallery/util/FileUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3, v4}, Lcom/miui/gallery/util/ExifUtil;->setUserCommentData(Landroid/media/ExifInterface;Lcom/miui/gallery/util/ExifUtil$UserCommentData;)V

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSDateStamp:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const-wide/16 v5, -0x1

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSTimeStamp:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "GPSDateStamp"

    iget-object v7, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSDateStamp:Ljava/lang/String;

    invoke-virtual {v3, v4, v7}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "GPSTimeStamp"

    iget-object v7, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSTimeStamp:Ljava/lang/String;

    invoke-virtual {v3, v4, v7}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSDateStamp:Ljava/lang/String;

    iget-object v7, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mGPSTimeStamp:Ljava/lang/String;

    invoke-static {v4, v7}, Lcom/miui/gallery/util/GalleryTimeUtils;->getGpsDateTime(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    goto :goto_1

    :cond_2
    move-wide v7, v5

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const-wide/16 v9, 0x0

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/miui/gallery/util/ExifUtil;->setDateTime(Landroid/media/ExifInterface;Ljava/lang/String;)V

    cmp-long v4, v7, v9

    if-gez v4, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/util/GalleryTimeUtils;->getDateTime(Ljava/lang/String;)J

    move-result-wide v7

    :cond_3
    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mDateTime:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-static {v3}, Lcom/miui/gallery/util/ExifUtil;->getDateTime(Landroid/media/ExifInterface;)J

    move-result-wide v11

    cmp-long v4, v11, v5

    if-nez v4, :cond_5

    iget-wide v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mMixDateTime:J

    cmp-long v6, v4, v9

    if-ltz v6, :cond_5

    :cond_4
    invoke-static {}, Lcom/miui/gallery/util/GalleryTimeUtils;->getDefaultDateFormat()Ljava/text/SimpleDateFormat;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    iget-wide v11, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mMixDateTime:J

    invoke-direct {v5, v11, v12}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/util/ExifUtil;->setDateTime(Landroid/media/ExifInterface;Ljava/lang/String;)V

    cmp-long v4, v7, v9

    if-gez v4, :cond_5

    iget-wide v7, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mMixDateTime:J

    :cond_5
    invoke-virtual {v3}, Landroid/media/ExifInterface;->saveAttributes()V

    invoke-static {p1}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mSha1:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_7

    :cond_6
    iget-object v4, p0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->mSha1:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_9

    :cond_7
    cmp-long v1, v7, v9

    if-ltz v1, :cond_8

    invoke-static {p1, v7, v8}, Lcom/miui/gallery/util/FileUtils;->setLastModified(Ljava/lang/String;J)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "ThumbnailMetaWriter"

    const-string v3, "failed to set last modified for thumbnail"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_8
    const/4 p1, 0x1

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p1

    :catchall_0
    move-exception p1

    move-object v2, v1

    goto :goto_4

    :catch_1
    move-exception v2

    move-object v13, v2

    move-object v2, v1

    move-object v1, v13

    :goto_2
    :try_start_5
    const-string v3, "ThumbnailMetaWriter"

    invoke-static {v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :cond_9
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "model"

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "version"

    sget-object v4, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "path"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "exception"

    if-eqz v1, :cond_a

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    :cond_a
    const-string p1, ""

    :goto_3
    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "exif_parser"

    const-string v1, "exif_write_error"

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return v0

    :catchall_1
    move-exception p1

    :goto_4
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

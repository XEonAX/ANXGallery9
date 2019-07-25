.class Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;
.super Ljava/lang/Object;
.source "MediaFileHandleJob.java"


# instance fields
.field private mAlbumDir:Ljava/lang/String;

.field private mId:J

.field private mLocalFile:Ljava/lang/String;

.field private mLocalFlag:I

.field private mReason:I

.field private mServerAlbumId:Ljava/lang/String;

.field private mThumbnail:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    iput-object p4, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mAlbumDir:Ljava/lang/String;

    iput p8, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFlag:I

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mServerAlbumId:Ljava/lang/String;

    iput p9, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mReason:I

    return-void
.end method

.method private delete(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string p2, "Could\'t get relative path for %s"

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v2

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mAlbumDir:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    if-eqz p3, :cond_1

    sget-object p3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, p1, [Ljava/lang/String;

    aput-object p2, v0, v2

    invoke-static {p3, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    sget-object p3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NONE:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v1, p1, [Ljava/lang/String;

    aput-object p2, v1, v2

    invoke-static {p3, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    new-array p2, p1, [Ljava/io/File;

    aput-object v0, p2, v2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    :goto_0
    const-string p2, "CloudManager.MediaFileHandleJob"

    const-string p3, "deleted"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    :cond_2
    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string p2, "file not exist, skip."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method private doCopy(Landroid/content/Context;Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->editFile(Landroid/content/Context;ZZ)V

    return-void
.end method

.method private doMove(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->editFile(Landroid/content/Context;ZZ)V

    return-void
.end method

.method private editFile(Landroid/content/Context;ZZ)V
    .locals 8

    const-string v0, "CloudManager.MediaFileHandleJob"

    const-string v1, "editFile"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_3

    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->getDesFile(Landroid/content/Context;Ljava/io/File;)Ljava/io/File;

    move-result-object v4

    if-ne v4, v1, :cond_0

    const-string v1, "thumbnailFile"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    if-eqz v4, :cond_3

    if-eqz p2, :cond_1

    invoke-static {v1, v4}, Lcom/miui/gallery/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    goto :goto_0

    :cond_1
    invoke-static {v1, v4}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_2

    sget-object v6, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v7, v2, [Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v3

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_2
    move v1, v5

    :goto_0
    if-eqz v1, :cond_4

    const-string v5, "CloudManager.MediaFileHandleJob"

    const-string v6, "edit localFile finish, with des(%s)"

    invoke-static {v5, v6, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "localFile"

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "thumbnailFile"

    invoke-virtual {v0, v5}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->notifyMediaProviderScanFile(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :cond_4
    :goto_1
    if-nez v1, :cond_8

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v4}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->getDesFile(Landroid/content/Context;Ljava/io/File;)Ljava/io/File;

    move-result-object v5

    if-ne v5, v4, :cond_5

    const-string v1, "localFile"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const/4 v1, 0x1

    goto :goto_3

    :cond_5
    if-eqz v5, :cond_8

    if-eqz p2, :cond_6

    invoke-static {v4, v5}, Lcom/miui/gallery/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    goto :goto_2

    :cond_6
    invoke-static {v4, v5}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_7

    sget-object v6, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v7, v2, [Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v3

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_7
    :goto_2
    if-eqz v1, :cond_8

    const-string v4, "CloudManager.MediaFileHandleJob"

    const-string v6, "edit thumbnail finish, with des(%s)"

    invoke-static {v4, v6, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "thumbnailFile"

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "localFile"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->notifyMediaProviderScanFile(Ljava/lang/String;)V

    :cond_8
    :goto_3
    if-nez v1, :cond_9

    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string p2, "both thumbnail and localFile edit failed."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_9
    if-eqz p2, :cond_a

    if-eqz p3, :cond_a

    const-string p2, "localFlag"

    const/16 p3, 0x8

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_a
    const-string p2, "CloudManager.MediaFileHandleJob"

    const-string p3, "edit success, update db: %s"

    invoke-static {p2, p3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-wide p2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {p2, p3}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result p2

    if-eqz p2, :cond_b

    iget-wide p2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {p2, p3}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide p2

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    const-string v4, "_id=?"

    new-array v2, v2, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v2, v3

    invoke-virtual {p1, v1, v0, v4, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    goto :goto_4

    :cond_b
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string p3, "_id=?"

    new-array v1, v2, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    :goto_4
    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string p2, "edit finish with updates(%d)"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static from(Landroid/content/ContentResolver;Landroid/database/Cursor;JI)Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;
    .locals 20

    move-object/from16 v0, p1

    const/4 v1, 0x7

    const/4 v2, 0x0

    :try_start_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/16 v3, 0x8

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v3, 0x6

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v4, 0x2

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v9, 0x3

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    const-wide/16 v14, -0x3e8

    cmp-long v0, v12, v14

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    move-object v9, v0

    move-object v4, v2

    goto/16 :goto_1

    :cond_0
    invoke-static/range {p2 .. p3}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    const/4 v9, 0x1

    if-nez v0, :cond_3

    sget-object v15, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v16, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v17, "_id=?"

    new-array v0, v9, [Ljava/lang/String;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v4

    const/16 v19, 0x0

    move-object/from16 v14, p0

    move-object/from16 v18, v0

    invoke-virtual/range {v14 .. v19}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v9, :cond_2

    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->genRelativePath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    move-object v4, v2

    move-object v2, v9

    move-object v9, v0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v2, v9

    goto :goto_2

    :cond_2
    move-object v4, v2

    move-object v2, v9

    move-object v9, v4

    goto :goto_1

    :cond_3
    :try_start_2
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareAlbum;->OTHER_SHARE_URI:Landroid/net/Uri;

    const-string v1, "albumId"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v14

    const-string v15, "_id=?"

    new-array v1, v9, [Ljava/lang/String;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v4

    const/16 v17, 0x0

    move-object/from16 v12, p0

    move-object v13, v0

    move-object/from16 v16, v1

    invoke-virtual/range {v12 .. v17}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v1, :cond_4

    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v2, v1

    goto :goto_2

    :cond_4
    move-object v0, v2

    :goto_0
    invoke-static {v2, v9}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->genRelativePath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/ShareMediaManager;->convertToMediaId(J)J

    move-result-wide v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v9, v2

    move-wide v5, v3

    move-object v4, v0

    move-object v2, v1

    :goto_1
    :try_start_4
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;

    move-object v3, v0

    move/from16 v12, p4

    invoke-direct/range {v3 .. v12}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz v2, :cond_5

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_5
    return-object v0

    :catchall_2
    move-exception v0

    :goto_2
    if-eqz v2, :cond_6

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v0
.end method

.method private getDesFile(Landroid/content/Context;Ljava/io/File;)Ljava/io/File;
    .locals 7

    invoke-virtual {p2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string v0, "Could\'t get relative path for %s"

    invoke-virtual {p2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mAlbumDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mServerAlbumId:Ljava/lang/String;

    invoke-static {p2, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->getMediaFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "CloudManager.MediaFileHandleJob"

    const-string v3, "Other shared dest filename %s"

    invoke-static {v1, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mAlbumDir:Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_2
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    invoke-static {p2, v1, v4}, Lcom/miui/gallery/util/FileUtils;->forceCreate(Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const/4 v5, 0x1

    if-eqz v0, :cond_3

    const-string v0, "thumbnailFile"

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    const-string v0, "thumbnailFile=?"

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-virtual {p1, p2, v1, v0, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    const-string v0, "thumbnailFile"

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v0, "thumbnailFile=?"

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-virtual {p1, p2, v1, v0, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_4
    :goto_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_5

    return-object v3

    :cond_5
    return-object v2

    :cond_6
    const-string p1, "CloudManager.MediaFileHandleJob"

    const-string v1, "skip copy localFile(%s), album(%s)"

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mAlbumDir:Ljava/lang/String;

    invoke-static {p1, v1, v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p2
.end method

.method private static notifyMediaProviderScanFile(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/io/File;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    aput-object v2, v1, p0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public doDelete(Landroid/content/Context;ZZ)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CloudManager.MediaFileHandleJob"

    const-string v1, "delete thumbnail(%s)"

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    invoke-direct {p0, p1, v0, p3}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->delete(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mReason:I

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mThumbnail:Ljava/lang/String;

    const-string v3, "CloudManager.MediaFileHandleJob"

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "CloudManager.MediaFileHandleJob"

    const-string v1, "delete localFile(%s)"

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-direct {p0, p1, v0, p3}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->delete(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_1

    new-instance p3, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mReason:I

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    const-string v2, "CloudManager.MediaFileHandleJob"

    invoke-direct {p3, v0, v1, v2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {p3}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_1
    if-eqz p2, :cond_3

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result p3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p3, :cond_2

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p3, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    const-string v4, "_id=?"

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-virtual {p1, p3, v4, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v2, "_id=?"

    new-array v1, v1, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    invoke-virtual {p1, p3, v2, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    new-instance p1, Ljava/io/File;

    iget-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFile:Ljava/lang/String;

    invoke-direct {p1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long p1, v0, v4

    if-lez p1, :cond_4

    const-wide/16 v0, 0x3c

    cmp-long p1, v2, v0

    if-gez p1, :cond_4

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p3, "local"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "Sync"

    const-string p3, "sync_photo_delete_in_one_minute"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p1, "Sync"

    const-string p2, "sync_photo_delete_interval"

    invoke-static {p1, p2, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    return-void
.end method

.method public run(Landroid/content/Context;)Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->mLocalFlag:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    return v1

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->doMove(Landroid/content/Context;)V

    return v2

    :pswitch_2
    const/4 v1, 0x1

    :pswitch_3
    invoke-virtual {p0, p1, v1, v2}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->doDelete(Landroid/content/Context;ZZ)V

    xor-int/lit8 p1, v1, 0x1

    return p1

    :pswitch_4
    const/4 v1, 0x1

    :pswitch_5
    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->doCopy(Landroid/content/Context;Z)V

    return v2

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_5
        :pswitch_1
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

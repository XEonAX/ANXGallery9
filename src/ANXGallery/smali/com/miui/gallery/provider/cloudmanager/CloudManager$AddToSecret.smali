.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddToSecret"
.end annotation


# instance fields
.field private mMediaId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    return-void
.end method

.method private addFilePath(Landroid/content/ContentValues;Z)J
    .locals 11

    const-string v0, "microthumbfile"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/16 v2, 0xc

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x6

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->addPostfixToFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, "fileName"

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x7

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v4

    const-wide/16 v5, -0x71

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v4, :cond_8

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v9, 0x5

    invoke-interface {v4, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    const/4 v9, 0x2

    if-ne v4, v9, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-static {v0, v4}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->encodeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    if-eqz p2, :cond_3

    :cond_2
    new-instance v9, Ljava/io/File;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v10, v9}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    :cond_3
    invoke-static {v3, v1}, Lcom/miui/gallery/util/FileUtils;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-static {v1, v3, v8}, Lcom/miui/gallery/cloud/CloudUtils;->moveImageToFolder(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/util/FileUtils;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string p1, "CloudManager"

    const-string p2, "Failed to move item %s to secret folder"

    invoke-static {p1, p2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "detail"

    const-string v0, "local file move failed to secret folder"

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "src"

    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "des"

    invoke-virtual {p1, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "operation_abnormal"

    const-string v0, "add_secret_failed_bc_file_operation_failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-wide v5

    :cond_4
    move-object v1, v4

    goto :goto_2

    :cond_5
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v9, "detail"

    const-string v10, "local file already exist in secret folder"

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v9, "src"

    invoke-virtual {v4, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v9, "des"

    invoke-virtual {v4, v9, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v9, "operation_abnormal"

    const-string v10, "add_secret_abnormal"

    invoke-static {v9, v10, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :goto_2
    const-string v4, "localFile"

    invoke-virtual {p1, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v4, v8, [Ljava/lang/String;

    aput-object v1, v4, v7

    invoke-static {v2, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    goto :goto_3

    :cond_6
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v4, "detail"

    const-string v9, "local file still exist after move to secret"

    invoke-virtual {v2, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "src"

    invoke-virtual {v2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "operation_abnormal"

    const-string v9, "add_secret_abnormal"

    invoke-static {v4, v9, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :goto_3
    move-object v2, v1

    const/4 v1, 0x1

    goto :goto_4

    :cond_7
    const-string p1, "CloudManager"

    const-string p2, "Failed to move name conflict item %s to %s"

    invoke-static {p1, p2, v1, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "detail"

    const-string v0, "local file rename conflict file"

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "src"

    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "des"

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "operation_abnormal"

    const-string v0, "add_secret_failed_bc_file_operation_failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-wide v5

    :cond_8
    move-object v2, v1

    const/4 v1, 0x0

    :goto_4
    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/16 v9, 0x8

    invoke-interface {v4, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_10

    invoke-static {v0, v7}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->encodeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    if-eqz v1, :cond_9

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "detail"

    const-string v1, "local & thumbnail both exist"

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "localFile"

    invoke-virtual {p2, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "thumbnailFile"

    invoke-virtual {p2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "operation_abnormal"

    const-string v1, "add_secret_abnormal"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p2, "thumbnailFile"

    invoke-virtual {p1, p2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p2, v8, [Ljava/lang/String;

    aput-object v4, p2, v7

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    goto/16 :goto_5

    :cond_9
    invoke-static {v0, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    if-eqz p2, :cond_b

    :cond_a
    new-instance p2, Ljava/io/File;

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0, v10}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p2}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    :cond_b
    invoke-static {v3, v4}, Lcom/miui/gallery/util/FileUtils;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_c

    invoke-static {v4, v3, v8}, Lcom/miui/gallery/cloud/CloudUtils;->moveImageToFolder(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/util/FileUtils;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_d

    const-string p1, "CloudManager"

    const-string p2, "Failed to move item %s to secret folder"

    invoke-static {p1, p2, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "detail"

    const-string v0, "thumbnail file move failed to secret folder"

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "src"

    invoke-virtual {p1, p2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "des"

    invoke-virtual {p1, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "operation_abnormal"

    const-string v0, "add_secret_failed_bc_file_operation_failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-wide v5

    :cond_c
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "detail"

    const-string v1, "thumbnail file already exist in secret folder"

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "src"

    invoke-virtual {p2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "des"

    invoke-virtual {p2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "operation_abnormal"

    const-string v1, "add_secret_abnormal"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_d
    const-string p2, "thumbnailFile"

    invoke-virtual {p1, p2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_e

    sget-object p2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, v8, [Ljava/lang/String;

    aput-object p1, v0, v7

    invoke-static {p2, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    goto :goto_5

    :cond_e
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "detail"

    const-string v1, "thumbnail file still exist after move to secret"

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "src"

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "operation_abnormal"

    const-string v0, "add_secret_abnormal"

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_5

    :cond_f
    const-string p1, "CloudManager"

    const-string v0, "Failed to move name conflict item %s to %s"

    invoke-static {p1, v0, v4, v10}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "detail"

    const-string v1, "thumbnail rename conflict file"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "src"

    invoke-virtual {p1, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "des"

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "operation_abnormal"

    const-string v0, "add_secret_failed_bc_file_operation_failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-wide v5

    :cond_10
    :goto_5
    const-wide/16 p1, -0x1

    return-wide p1
.end method

.method static canAddSecret(Landroid/content/Context;Landroid/database/Cursor;)I
    .locals 5

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p0, -0x6a

    return p0

    :cond_0
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    const/16 v3, -0x6b

    if-eq v1, v2, :cond_2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/Config$SecretAlbumConfig;->isVideoSupported()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    return v3

    :cond_2
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    const/4 v2, 0x7

    if-eqz v1, :cond_5

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudUtils;->canUpload(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v0, :cond_3

    const/16 p0, -0x6c

    return p0

    :cond_3
    if-eqz v1, :cond_5

    return v3

    :cond_4
    const/16 p0, -0x66

    return p0

    :cond_5
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0, p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0

    const-wide/16 v0, -0x6f

    cmp-long v2, p0, v0

    if-nez v2, :cond_6

    const/16 p0, -0x6f

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method private checkConflict(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 18

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/16 v2, 0x9

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x6

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v4, 0x5

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-static {v2, v3}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->encodeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    :try_start_0
    const-string v9, "cloud"

    const-string v8, "sha1"

    const-string v10, "fileName"

    const-string v11, "localFlag"

    const-string v12, "localFile"

    filled-new-array {v8, v10, v11, v12}, [Ljava/lang/String;

    move-result-object v10

    const-string v11, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (sha1 = ? OR fileName = ? OR fileName = ?) AND localGroupId=? AND (serverId IS NOT NULL OR localFile IS NOT NULL)"

    const/4 v8, 0x4

    new-array v12, v8, [Ljava/lang/String;

    aput-object v0, v12, v6

    aput-object v2, v12, v5

    aput-object v3, v12, v4

    const-wide/16 v13, -0x3e8

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    const/4 v15, 0x3

    aput-object v8, v12, v15

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    move-object/from16 v8, p1

    const/4 v7, 0x3

    move-object/from16 v15, v16

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v8, :cond_8

    const/4 v9, 0x0

    :cond_1
    :goto_1
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v0, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    invoke-interface {v8, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x7

    if-eq v10, v12, :cond_2

    const/16 v12, 0x8

    if-ne v10, v12, :cond_3

    :cond_2
    invoke-static {v11}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v10, :cond_4

    :cond_3
    const/16 v0, -0x68

    :goto_2
    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :cond_4
    :try_start_2
    const-string v10, "operation_abnormal"

    const-string v11, "add_secret_sha1_conflict_with_unsynced_file_unexist_item"

    invoke-static {v10, v11}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    invoke-interface {v8, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    if-nez v9, :cond_1

    invoke-virtual {v2, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    invoke-virtual {v3, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v10, :cond_1

    :cond_6
    const/4 v9, 0x1

    goto :goto_1

    :cond_7
    if-eqz v9, :cond_8

    const/16 v0, -0x69

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object/from16 v17, v8

    goto :goto_3

    :cond_8
    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_1
    move-exception v0

    const/16 v17, 0x0

    :goto_3
    invoke-static/range {v17 .. v17}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :cond_9
    :goto_4
    return v6
.end method

.method private deleteAllWithSameSha1(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Z)V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0x9

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " AND _id!="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sha1=? AND localGroupId!=-1000"

    if-nez p3, :cond_0

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_0
    move-object v6, v2

    const/4 p3, 0x0

    :try_start_0
    const-string v4, "cloud"

    const-string v1, "_id"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v5

    const/4 v1, 0x1

    new-array v7, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, v7, v1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, p1

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result p3

    if-lez p3, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result p3

    new-array v6, p3, [J

    const/4 p3, 0x0

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge p3, v2, :cond_1

    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    aput-wide v2, v6, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v5

    const/16 v7, 0x24

    move-object v3, p1

    move-object v4, p2

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    move-object p3, v0

    goto :goto_2

    :cond_2
    :goto_1
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_1
    move-exception p1

    move-object v0, p3

    goto :goto_3

    :catch_1
    move-exception p1

    :goto_2
    :try_start_2
    const-string p2, "CloudManager"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {p3}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_4

    :goto_3
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_3
    :goto_4
    return-void
.end method

.method private postCheck(Landroid/database/sqlite/SQLiteDatabase;JZ)V
    .locals 10

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "cloud"

    const-string v1, "localFlag"

    const-string v3, "localFile"

    const-string v4, "serverStatus"

    filled-new-array {v1, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "_id=?"

    const/4 v9, 0x1

    new-array v5, v9, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    aput-object p2, v5, p3

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_6

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    if-eq p2, v2, :cond_4

    const/4 v2, 0x7

    if-ne p2, v2, :cond_0

    goto/16 :goto_1

    :cond_0
    if-eq p2, v0, :cond_3

    const/4 p3, -0x1

    if-eq p2, p3, :cond_3

    const/16 p3, 0xb

    if-ne p2, p3, :cond_1

    goto :goto_0

    :cond_1
    const-string p2, "deleted"

    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "purged"

    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_7

    :cond_2
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string p3, "result"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "detail"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "record in invalid server state "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "operation_abnormal"

    const-string p4, "add_secret_abnormal"

    invoke-static {p3, p4, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_2

    :cond_3
    :goto_0
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    const-string v0, "result"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "detail"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "record in invalid local state "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "operation_abnormal"

    const-string p4, "add_secret_abnormal"

    invoke-static {p2, p4, p3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_2

    :cond_4
    :goto_1
    invoke-static {p3}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "result"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "detail"

    const-string v0, "local file not exist with unsynced item"

    invoke-virtual {p2, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "localFile"

    invoke-virtual {p2, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "operation_abnormal"

    const-string p4, "add_secret_abnormal"

    invoke-static {p3, p4, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_2

    :cond_5
    if-eqz p4, :cond_7

    sget-object p2, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_7

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string p4, "result"

    const-string v0, "true"

    invoke-virtual {p2, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "detail"

    const-string v0, "local file not in secret folder"

    invoke-virtual {p2, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "localFile"

    invoke-virtual {p2, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "operation_abnormal"

    const-string p4, "add_secret_abnormal"

    invoke-static {p3, p4, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_5

    :catch_0
    move-exception p2

    move-object v0, p1

    goto :goto_3

    :cond_6
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string p3, "result"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "detail"

    const-string p4, "failed to retrieve record again"

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "operation_abnormal"

    const-string p4, "add_secret_abnormal"

    invoke-static {p3, p4, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_7
    :goto_2
    invoke-static {p1}, Lmiui/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_1
    move-exception p2

    move-object p1, v0

    goto :goto_5

    :catch_1
    move-exception p2

    :goto_3
    :try_start_2
    const-string p1, "CloudManager"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v0}, Lmiui/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :goto_4
    return-void

    :goto_5
    invoke-static {p1}, Lmiui/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p2
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mContext:Landroid/content/Context;

    iget-object v4, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->canAddSecret(Landroid/content/Context;Landroid/database/Cursor;)I

    move-result v3

    if-gez v3, :cond_0

    int-to-long v1, v3

    return-wide v1

    :cond_0
    iget-object v3, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    iput-wide v5, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-direct/range {p0 .. p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->checkConflict(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v3

    const/16 v5, -0x68

    const/4 v6, 0x1

    if-ne v3, v5, :cond_1

    invoke-direct {v0, v1, v2, v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->deleteAllWithSameSha1(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Z)V

    iget-wide v1, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    return-wide v1

    :cond_1
    iget-object v5, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x2

    invoke-interface {v5, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const/4 v7, 0x7

    const/4 v8, 0x0

    const/16 v9, 0x8

    const-wide/16 v12, -0x1

    const-wide/16 v14, -0x3e8

    const/16 v10, -0x69

    if-eq v5, v7, :cond_9

    if-ne v5, v9, :cond_2

    goto/16 :goto_2

    :cond_2
    if-eqz v5, :cond_5

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "localGroupId"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-ne v3, v10, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    :goto_0
    invoke-direct {v0, v5, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->addFilePath(Landroid/content/ContentValues;Z)J

    move-result-wide v7

    cmp-long v3, v7, v12

    if-nez v3, :cond_b

    const-string v3, "cloud"

    const-string v9, "_id=?"

    new-array v10, v6, [Ljava/lang/String;

    iget-wide v11, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-virtual {v1, v3, v5, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_b

    if-eqz v2, :cond_4

    const-string v3, "_id=?"

    new-array v7, v6, [Ljava/lang/String;

    iget-wide v8, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-virtual {v2, v3, v7, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    :cond_4
    iget-wide v7, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    goto/16 :goto_4

    :cond_5
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "localFlag"

    const/16 v9, 0xb

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v7, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    const-string v9, "localFlag"

    const/4 v11, 0x5

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v9, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$200()[Ljava/lang/String;

    move-result-object v9

    iget-object v11, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-static {v9, v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    if-ne v3, v10, :cond_6

    const/4 v3, 0x1

    goto :goto_1

    :cond_6
    const/4 v3, 0x0

    :goto_1
    invoke-direct {v0, v7, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->addFilePath(Landroid/content/ContentValues;Z)J

    move-result-wide v9

    cmp-long v3, v9, v12

    if-nez v3, :cond_8

    const-string v3, "fromLocalGroupId"

    iget-object v9, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    const/4 v10, 0x3

    invoke-interface {v9, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v3, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "localGroupId"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v3, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "localImageId"

    iget-wide v9, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v3, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "cloud"

    invoke-virtual {v1, v3, v8, v7}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v3, v8, v10

    if-lez v3, :cond_7

    invoke-virtual {v2, v8, v9, v7}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string v3, "cloud"

    const-string v7, "_id=?"

    new-array v10, v6, [Ljava/lang/String;

    iget-wide v11, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-virtual {v1, v3, v5, v7, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_7

    const-string v3, "_id=?"

    new-array v5, v6, [Ljava/lang/String;

    iget-wide v10, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v4

    invoke-virtual {v2, v3, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    :cond_7
    move-wide v7, v8

    goto :goto_4

    :cond_8
    move-wide v7, v9

    goto :goto_4

    :cond_9
    :goto_2
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$200()[Ljava/lang/String;

    move-result-object v7

    iget-object v11, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mCursor:Landroid/database/Cursor;

    invoke-static {v7, v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    const-string v7, "localFlag"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v7, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-ne v3, v10, :cond_a

    const/4 v3, 0x1

    goto :goto_3

    :cond_a
    const/4 v3, 0x0

    :goto_3
    invoke-direct {v0, v5, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->addFilePath(Landroid/content/ContentValues;Z)J

    move-result-wide v9

    cmp-long v3, v9, v12

    if-nez v3, :cond_8

    const-string v3, "localGroupId"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "cloud"

    invoke-virtual {v1, v3, v8, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-lez v3, :cond_b

    invoke-virtual {v2, v7, v8, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string v3, "cloud"

    const-string v5, "_id=?"

    new-array v9, v6, [Ljava/lang/String;

    iget-wide v10, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v4

    invoke-virtual {v1, v3, v5, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_b

    const-string v3, "_id=?"

    new-array v5, v6, [Ljava/lang/String;

    iget-wide v9, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v4

    invoke-virtual {v2, v3, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    :cond_b
    :goto_4
    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-lez v3, :cond_c

    invoke-direct {v0, v1, v7, v8, v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->postCheck(Landroid/database/sqlite/SQLiteDatabase;JZ)V

    invoke-direct {v0, v1, v2, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->deleteAllWithSameSha1(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Z)V

    goto :goto_5

    :cond_c
    iget-wide v2, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->postCheck(Landroid/database/sqlite/SQLiteDatabase;JZ)V

    :goto_5
    return-wide v7
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 13

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const-string v6, "cloud"

    sget-object v7, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v8, "_id=?"

    const/4 v0, 0x1

    new-array v9, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-wide v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v9, v0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "AddToSecret{%d}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->mMediaId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

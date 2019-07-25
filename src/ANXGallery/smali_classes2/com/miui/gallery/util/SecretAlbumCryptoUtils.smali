.class public Lcom/miui/gallery/util/SecretAlbumCryptoUtils;
.super Ljava/lang/Object;
.source "SecretAlbumCryptoUtils.java"


# static fields
.field private static final sFileLocks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/locks/ReentrantLock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->sFileLocks:Ljava/util/Map;

    return-void
.end method

.method public static decrypt(Ljava/lang/String;Ljava/lang/String;Z[B)Z
    .locals 0

    if-eqz p2, :cond_0

    invoke-static {p0, p1, p3}, Lcom/miui/gallery/util/CryptoUtil;->decryptFileHeader(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result p0

    return p0

    :cond_0
    invoke-static {p0, p1, p3}, Lcom/miui/gallery/util/CryptoUtil;->decryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result p0

    return p0
.end method

.method public static decryptVideo2CacheFolder(Landroid/net/Uri;[BJ)Landroid/net/Uri;
    .locals 15

    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->getSecretFolder()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v0, "SecretAlbumCryptoUtils"

    const-string v2, "Failed to create secret temp folder!!!"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->isEncryptedVideoByPath(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-nez v5, :cond_3

    goto/16 :goto_2

    :cond_3
    new-instance v10, Ljava/io/File;

    invoke-static {v4, v0}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->generateDecryptFileName4Video(Ljava/io/File;[B)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v10, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->getLockForFile(Ljava/lang/String;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantLock;->isLocked()Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "SecretAlbumCryptoUtils"

    const-string v5, "file is already decrypting, just waiting... %s"

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v0, "SecretAlbumCryptoUtils"

    const-string v1, "decrypted file [%s] already exists, reuse it"

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    goto/16 :goto_1

    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    new-instance v14, Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->generateTempFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v14, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v0, :cond_6

    const/4 v4, 0x1

    const/4 v6, 0x0

    invoke-static {v2, v5, v4, v0, v6}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decryptFile(Ljava/lang/String;Ljava/lang/String;Z[BZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_6
    const/4 v6, 0x1

    const/4 v9, 0x0

    move-object v4, v2

    move-wide/from16 v7, p2

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decryptFile(Ljava/lang/String;Ljava/lang/String;ZJZ)Ljava/lang/String;

    move-result-object v0

    const-string v4, "SecretAlbumCryptoUtils"

    const-string v5, "decode %s and secret key is null"

    invoke-static {v4, v5, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    const-string v2, "SecretAlbumCryptoUtils"

    const-string v4, "decrypt video costs %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    sub-long/2addr v5, v12

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v2, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v0, "SecretAlbumCryptoUtils"

    const-string v1, "decrypted file [%s] already exists"

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    const-string v0, "SecretAlbumCryptoUtils"

    const-string v2, "delete temp file"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v14}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    goto :goto_1

    :cond_7
    if-eqz v0, :cond_9

    invoke-virtual {v14, v10}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_1

    :cond_8
    const-string v0, "SecretAlbumCryptoUtils"

    const-string v2, "rename temp file failed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v14}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    invoke-static {v10}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_9
    :goto_1
    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    if-eqz v1, :cond_a

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->schedule(Landroid/content/Context;Ljava/lang/String;)V

    :cond_a
    return-object v1

    :catchall_0
    move-exception v0

    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :cond_b
    :goto_2
    return-object v1
.end method

.method public static encrypt(Ljava/lang/String;Ljava/lang/String;Z[B)Z
    .locals 0

    if-eqz p2, :cond_0

    invoke-static {p0, p1, p3}, Lcom/miui/gallery/util/CryptoUtil;->encryptFileHeader(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result p0

    return p0

    :cond_0
    invoke-static {p0, p1, p3}, Lcom/miui/gallery/util/CryptoUtil;->encryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result p0

    return p0
.end method

.method private static generateDecryptFileName4Video(Ljava/io/File;[B)Ljava/lang/String;
    .locals 5

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->getMD5Key([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_0
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s%s%d.mp4"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v0

    const/4 p0, 0x1

    const-string v0, "L"

    aput-object v0, v4, p0

    const/4 p0, 0x2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, p0

    invoke-static {p1, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static generateTempFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "temp_%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getLockForFile(Ljava/lang/String;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 3

    sget-object v0, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->sFileLocks:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->sFileLocks:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/locks/ReentrantLock;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sget-object v2, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->sFileLocks:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static getSecretFolder()Ljava/io/File;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    const-string v2, ".temp_video_files"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

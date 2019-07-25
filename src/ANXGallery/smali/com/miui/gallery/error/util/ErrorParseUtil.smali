.class public Lcom/miui/gallery/error/util/ErrorParseUtil;
.super Ljava/lang/Object;
.source "ErrorParseUtil.java"


# direct methods
.method private static isHostConnectException(Ljava/lang/Throwable;)Z
    .locals 2

    instance-of v0, p0, Lorg/apache/http/conn/HttpHostConnectException;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    instance-of v0, p0, Ljava/net/UnknownHostException;

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "HttpHostConnectException"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public static parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 2

    instance-of v0, p0, Lorg/apache/http/conn/ConnectTimeoutException;

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->CONNECT_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_0
    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_1

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->SOCKET_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/error/util/ErrorParseUtil;->isHostConnectException(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "com.miui.gallery"

    invoke-static {v0, v1}, Lcom/miui/security/net/NetworkRestrict;->isMobileRestrict(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "ErrorParseUtil"

    const-string p1, "mobile net is restrict"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->NETWORK_RESTRICT:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_2
    const-string v1, "com.miui.gallery"

    invoke-static {v0, v1}, Lcom/miui/security/net/NetworkRestrict;->isWifiRestrict(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "ErrorParseUtil"

    const-string p1, "wifi is restrict"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->NETWORK_RESTRICT:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_3
    instance-of v0, p0, Ljava/io/IOException;

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "EROFS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "Read-only file system"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "EPERM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "ENOTCONN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "EBUSY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "ENOSPC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "Permission denied"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_5
    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getSecondaryStoragePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->SECONDARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    goto :goto_1

    :cond_6
    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->PRIMARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    :goto_1
    return-object p0

    :cond_7
    instance-of v0, p0, Ljava/io/FileNotFoundException;

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    :goto_2
    const-string v1, "No space left on device"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_FULL:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_9
    instance-of v0, p0, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    if-eqz v0, :cond_b

    check-cast p0, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getCloudServerException()Ljava/lang/Exception;

    move-result-object p0

    instance-of p1, p0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    if-eqz p1, :cond_a

    check-cast p0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-virtual {p0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->is5xxServerException()Z

    move-result p0

    if-eqz p0, :cond_a

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->OVER_QUOTA:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_a
    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_b
    instance-of v0, p0, Lcom/xiaomi/opensdk/exception/RetriableException;

    if-eqz v0, :cond_c

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->RETRIABLE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_c
    instance-of v0, p0, Lcom/xiaomi/opensdk/exception/UnretriableException;

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_3

    :cond_d
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    :goto_3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "Local IO error"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_e

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/error/util/ErrorParseUtil;->testWriteStorage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p0

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/miui/gallery/error/util/ErrorParseUtil;->parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p0

    return-object p0

    :cond_e
    :goto_4
    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0
.end method

.method private static testWriteStorage(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/miui/gallery/util/StorageUtils;->getVolumePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPriorStoragePath()Ljava/lang/String;

    move-result-object p0

    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v1, ".test"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string p0, "test"

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception v1

    move-object v2, v1

    move-object v1, p0

    move-object p0, v2

    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

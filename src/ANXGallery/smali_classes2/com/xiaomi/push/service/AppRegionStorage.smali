.class public Lcom/xiaomi/push/service/AppRegionStorage;
.super Ljava/lang/Object;
.source "AppRegionStorage.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/push/service/AppRegionStorage;


# instance fields
.field private final COUNTRY_CODE_CACHE_FILE_LOCK:Ljava/lang/String;

.field private final COUNTRY_CODE_CACHE_FILE_NAME:Ljava/lang/String;

.field private final REGION_CACHE_FILE_LOCK:Ljava/lang/String;

.field private final REGION_CACHE_FILE_NAME:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private volatile mCountryCode:Ljava/lang/String;

.field private final mCountryCodeLock:Ljava/lang/Object;

.field private volatile mRegion:Ljava/lang/String;

.field private final mRegionLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegionLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCodeLock:Ljava/lang/Object;

    const-string v0, "mipush_region"

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->REGION_CACHE_FILE_NAME:Ljava/lang/String;

    const-string v0, "mipush_country_code"

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->COUNTRY_CODE_CACHE_FILE_NAME:Ljava/lang/String;

    const-string v0, "mipush_region.lock"

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->REGION_CACHE_FILE_LOCK:Ljava/lang/String;

    const-string v0, "mipush_country_code.lock"

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->COUNTRY_CODE_CACHE_FILE_LOCK:Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/AppRegionStorage;
    .locals 2

    sget-object v0, Lcom/xiaomi/push/service/AppRegionStorage;->sInstance:Lcom/xiaomi/push/service/AppRegionStorage;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/push/service/AppRegionStorage;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/AppRegionStorage;->sInstance:Lcom/xiaomi/push/service/AppRegionStorage;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/push/service/AppRegionStorage;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/AppRegionStorage;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/AppRegionStorage;->sInstance:Lcom/xiaomi/push/service/AppRegionStorage;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/push/service/AppRegionStorage;->sInstance:Lcom/xiaomi/push/service/AppRegionStorage;

    return-object p0
.end method

.method private readFromFileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "No ready file to get data from "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-object v2

    :cond_0
    monitor-enter p4

    :try_start_0
    new-instance p2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-direct {p2, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->createFileQuietly(Ljava/io/File;)Z

    new-instance p1, Ljava/io/RandomAccessFile;

    const-string p3, "rw"

    invoke-direct {p1, p2, p3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p2

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->fileToStr(Ljava/io/File;)Ljava/lang/String;

    move-result-object p3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p2, :cond_1

    :try_start_3
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    if-eqz v0, :cond_1

    :try_start_4
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_0

    :catch_0
    move-exception p2

    :try_start_5
    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    monitor-exit p4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    return-object p3

    :catch_1
    move-exception p3

    goto :goto_1

    :catchall_0
    move-exception p3

    goto :goto_3

    :catch_2
    move-exception p3

    move-object p2, v2

    goto :goto_1

    :catchall_1
    move-exception p3

    move-object p1, v2

    goto :goto_3

    :catch_3
    move-exception p3

    move-object p1, v2

    move-object p2, p1

    :goto_1
    :try_start_6
    invoke-static {p3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    if-eqz p2, :cond_2

    :try_start_7
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz p3, :cond_2

    :try_start_8
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_2

    :catch_4
    move-exception p2

    :try_start_9
    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    monitor-exit p4

    return-object v2

    :catchall_2
    move-exception p3

    move-object v2, p2

    :goto_3
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    if-eqz p2, :cond_3

    :try_start_a
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_4

    :catch_5
    move-exception p2

    :try_start_b
    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_4

    :catchall_3
    move-exception p1

    goto :goto_5

    :cond_3
    :goto_4
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p3

    :goto_5
    monitor-exit p4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    throw p1
.end method

.method private write2FileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    monitor-enter p5

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->createFileQuietly(Ljava/io/File;)Z

    new-instance p4, Ljava/io/RandomAccessFile;

    const-string v2, "rw"

    invoke-direct {p4, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p4}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-direct {v0, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, p2}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->strToFile(Ljava/io/File;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_0

    :try_start_3
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    if-eqz p1, :cond_0

    :try_start_4
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_5
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    invoke-static {p4}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_3

    :catch_1
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catch_2
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object p4, v0

    goto :goto_3

    :catch_3
    move-exception p1

    move-object p4, v0

    :goto_1
    :try_start_6
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    if-eqz v0, :cond_0

    :try_start_7
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz p1, :cond_0

    :try_start_8
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_0

    :catch_4
    move-exception p1

    :try_start_9
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    :goto_2
    monitor-exit p5

    return-void

    :catchall_2
    move-exception p1

    :goto_3
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    if-eqz p2, :cond_1

    :try_start_a
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_4

    :catch_5
    move-exception p2

    :try_start_b
    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_4

    :catchall_3
    move-exception p1

    goto :goto_5

    :cond_1
    :goto_4
    invoke-static {p4}, Lcom/xiaomi/channel/commonutils/file/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1

    :goto_5
    monitor-exit p5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    throw p1
.end method


# virtual methods
.method public getCountryCode()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mContext:Landroid/content/Context;

    const-string v1, "mipush_country_code"

    const-string v2, "mipush_country_code.lock"

    iget-object v3, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCodeLock:Ljava/lang/Object;

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/push/service/AppRegionStorage;->readFromFileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mContext:Landroid/content/Context;

    const-string v1, "mipush_region"

    const-string v2, "mipush_region.lock"

    iget-object v3, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegionLock:Ljava/lang/Object;

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/push/service/AppRegionStorage;->readFromFileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    return-object v0
.end method

.method public setCountryCode(Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    iget-object v2, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCode:Ljava/lang/String;

    const-string v4, "mipush_country_code"

    const-string v5, "mipush_country_code.lock"

    iget-object v6, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mCountryCodeLock:Ljava/lang/Object;

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/AppRegionStorage;->write2FileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public setRegion(Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    iget-object v2, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegion:Ljava/lang/String;

    const-string v4, "mipush_region"

    const-string v5, "mipush_region.lock"

    iget-object v6, p0, Lcom/xiaomi/push/service/AppRegionStorage;->mRegionLock:Ljava/lang/Object;

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/AppRegionStorage;->write2FileWithLock(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

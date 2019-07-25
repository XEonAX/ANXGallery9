.class public Lcom/miui/gallery/util/BaseDocumentProviderUtils;
.super Ljava/lang/Object;
.source "BaseDocumentProviderUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;
    }
.end annotation


# direct methods
.method private static findFileIgnoreCase(Landroid/support/v4/provider/DocumentFile;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .locals 4

    invoke-virtual {p0}, Landroid/support/v4/provider/DocumentFile;->listFiles()[Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    invoke-virtual {v2}, Landroid/support/v4/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDocumentFile(Landroid/content/Context;Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->getDocumentFileOrDir(Landroid/content/Context;Ljava/io/File;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    return-object p0
.end method

.method public static getDocumentFileDirectory(Landroid/content/Context;Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->getDocumentFileOrDir(Landroid/content/Context;Ljava/io/File;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    return-object p0
.end method

.method private static getDocumentFileOrDir(Landroid/content/Context;Ljava/io/File;Z)Landroid/support/v4/provider/DocumentFile;
    .locals 7

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "BaseDocumentProviderUtils"

    const-string p1, "getDocumentFileOrDir context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/miui/gallery/util/StorageUtils;->getVolumePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "BaseDocumentProviderUtils"

    const-string p1, "getDocumentFileOrDir basefolder null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v3, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-static {v1}, Lcom/miui/gallery/preference/BaseGalleryPreferences$BaseDocumentProvider;->getUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    return-object v0

    :cond_3
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    if-eqz v3, :cond_4

    return-object p0

    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/BaseFileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    :goto_1
    :try_start_0
    array-length v3, v2

    if-ge v4, v3, :cond_9

    aget-object v3, v2, v4

    invoke-static {p0, v3}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->findFileIgnoreCase(Landroid/support/v4/provider/DocumentFile;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v3

    if-nez v3, :cond_7

    array-length v3, v2

    sub-int/2addr v3, v5

    if-lt v4, v3, :cond_6

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_6

    if-eqz p2, :cond_5

    goto :goto_2

    :cond_5
    aget-object v3, v2, v4

    invoke-virtual {p0, v1, v3}, Landroid/support/v4/provider/DocumentFile;->createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    goto :goto_3

    :cond_6
    :goto_2
    aget-object v3, v2, v4

    invoke-virtual {p0, v3}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_8

    return-object v0

    :cond_7
    move-object p0, v3

    :cond_8
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "BaseDocumentProviderUtils"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p0, v0

    :cond_9
    return-object p0
.end method

.method public static needRequestExternalSDCardPermission(Landroid/content/Context;)Z
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x1c

    if-ge v0, v2, :cond_0

    return v1

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/StorageUtils;->hasExternalSDCard(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$BaseDocumentProvider;->getExternalSDCardUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method public static needUseDocumentProvider(Ljava/lang/String;)Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/StorageUtils;->isInSecondaryStorage(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static openFileDescriptor(Landroid/content/Context;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v1}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->getDocumentFile(Landroid/content/Context;Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "BaseDocumentProviderUtils"

    const-string v1, "Failed to get document for file %s"

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {v1}, Landroid/support/v4/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "rw"

    invoke-virtual {p0, v1, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v1, "BaseDocumentProviderUtils"

    const-string v2, "Failed to get file descriptor for %s, %s"

    invoke-static {v1, v2, p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    :cond_2
    :goto_0
    return-object v0
.end method

.method public static safeWriteFile(Ljava/lang/String;Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->needUseDocumentProvider(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v0, p0}, Lcom/miui/gallery/util/BaseDocumentProviderUtils;->openFileDescriptor(Landroid/content/Context;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez p0, :cond_0

    invoke-static {v1}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :cond_1
    :try_start_2
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object p0, v1

    :goto_0
    :try_start_3
    invoke-interface {p1, v0}, Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;->handle(Ljava/io/FileOutputStream;)Ljava/lang/Object;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    invoke-static {v0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catch_1
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object p0, v1

    goto :goto_2

    :catch_2
    move-exception p1

    move-object p0, v1

    move-object v0, p0

    :goto_1
    :try_start_4
    const-string v2, "BaseDocumentProviderUtils"

    const-string v3, "Failed to write file: %s"

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    invoke-static {v0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :catchall_2
    move-exception p1

    move-object v1, v0

    :goto_2
    invoke-static {v1}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p0}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

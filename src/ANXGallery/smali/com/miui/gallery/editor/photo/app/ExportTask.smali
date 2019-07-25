.class public Lcom/miui/gallery/editor/photo/app/ExportTask;
.super Ljava/lang/Object;
.source "ExportTask.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

.field private mExportUri:Landroid/net/Uri;

.field private mExternalCall:Z

.field private mSecretId:J

.field private mSource:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createExportFile(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/net/Uri;)Ljava/io/File;
    .locals 8

    const-string v0, "file"

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_0
    const-string v0, "content"

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v0, "_data"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p2

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/io/File;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v1, v2

    :cond_1
    :goto_0
    const-string p2, "ExportTask"

    invoke-static {p2, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catch_0
    move-object v0, v1

    :catch_1
    :try_start_2
    const-string v2, "ExportTask"

    const-string v3, "receive an exception when look for parent for %s"

    invoke-static {v2, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :goto_1
    const-string p2, "ExportTask"

    invoke-static {p2, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw p1

    :cond_2
    :goto_2
    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->createFile(Lcom/miui/gallery/editor/photo/app/DraftManager;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method private createFile(Lcom/miui/gallery/editor/photo/app/DraftManager;Ljava/lang/String;)Ljava/io/File;
    .locals 5

    const-string v0, "yyyyMMdd_HHmmss"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "IMG_%s.%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getExportFileSuffix()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aput-object p1, v3, v0

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCreativeDirectory()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v4}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/lang/String;Z)Z

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/util/DocumentProviderUtils;->needUseDocumentProvider(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/StorageUtils;->getPathInPrimaryStorage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v4}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/lang/String;Z)Z

    :cond_1
    :goto_0
    invoke-static {p2, p1, v4}, Lcom/miui/gallery/util/FileUtils;->forceCreate(Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method public static from(Landroid/app/Activity;)Lcom/miui/gallery/editor/photo/app/ExportTask;
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/miui/gallery/editor/photo/app/ExportTask;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/app/ExportTask;-><init>()V

    iput-object p0, v1, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    const-string p0, "android.intent.action.EDIT"

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    iput-boolean p0, v1, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    const-string p0, "ExportTask"

    const-string v0, "editting %s"

    iget-object v2, v1, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-static {p0, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public closeExportDialog()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->dismissAllowingStateLoss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    :cond_0
    return-void
.end method

.method public getExportUri()Landroid/net/Uri;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call prepareToExport first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSecretId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSecretId:J

    return-wide v0
.end method

.method public getSource()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    return-object v0
.end method

.method public isExternalCall()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    return v0
.end method

.method public onCancelled(Z)V
    .locals 0

    return-void
.end method

.method public onExport(Lcom/miui/gallery/editor/photo/app/DraftManager;Z)Z
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_2

    iget-boolean v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    if-nez v2, :cond_2

    const-string v2, "ExportTask"

    const-string v3, "internal call, scan to db :%s"

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSecret()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    new-instance v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    new-instance v3, Ljava/io/File;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-wide/16 v4, -0x3e8

    const/16 v6, 0x8

    const/4 v7, 0x1

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JIZ)V

    invoke-static {p1, v8}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSecretId:J

    iget-wide v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSecretId:J

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-gtz p1, :cond_1

    new-instance p1, Ljava/io/File;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    return v1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/lang/String;I)Landroid/net/Uri;

    :cond_1
    const-string p1, "ExportTask"

    const-string v2, "internal call, scan to db done secretId:%d"

    iget-wide v3, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSecretId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    if-eqz p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {p1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    if-eqz p1, :cond_3

    const-string p1, "content"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "media"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/miui/gallery/util/MediaStoreUtils;->update(Landroid/net/Uri;)V

    const-string p1, "ExportTask"

    const-string v2, "external call, update media store:%s"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    if-ne p1, v2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MediaStoreUtils;->getMediaFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    const/16 v3, 0x37

    new-array v0, v0, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/provider/CloudUtils;->deleteCloudByPath(Landroid/content/Context;I[Ljava/lang/String;)[J

    move-result-object v0

    const-string v2, "ExportTask"

    const-string v3, "deleteCloudByPath path:%s,result:%s"

    if-eqz v0, :cond_4

    array-length v4, v0

    if-lez v4, :cond_4

    aget-wide v4, v0, v1

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    invoke-static {v2, v3, p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5
    return p2
.end method

.method public onPostExport(Z)V
    .locals 5

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "file"

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    const v1, 0x7f10056b

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeTextLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;)V
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExternalCall:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;ZLandroid/net/Uri;)V

    const-string p1, "ExportTask"

    const-string v0, "export to a new file %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    const-string v0, "file"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    const-string v0, "content"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "media"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v0, v3, v6}, Landroid/app/Activity;->checkUriPermission(Landroid/net/Uri;III)I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, p1, v1, v2}, Lcom/miui/gallery/editor/photo/app/ExportTask;->prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;ZLandroid/net/Uri;)V

    const-string p1, "ExportTask"

    const-string v0, "export to origin uri %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/editor/photo/app/ExportTask;->createFile(Lcom/miui/gallery/editor/photo/app/DraftManager;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    const-string p1, "ExportTask"

    const-string v0, "export to a specified dir %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    :goto_0
    invoke-virtual {p0, p1, v1, v2}, Lcom/miui/gallery/editor/photo/app/ExportTask;->prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;ZLandroid/net/Uri;)V

    const-string p1, "ExportTask"

    const-string v0, "export to origin file or media uri %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;ZLandroid/net/Uri;)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/editor/photo/app/ExportTask;->createExportFile(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mSource:Landroid/net/Uri;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportUri:Landroid/net/Uri;

    :goto_0
    return-void
.end method

.method public showExportDialog()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/app/ExportFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->setCancelable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mExportFragment:Lcom/miui/gallery/editor/photo/app/ExportFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/ExportTask;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->show(Landroid/app/FragmentTransaction;Ljava/lang/String;)I

    return-void
.end method

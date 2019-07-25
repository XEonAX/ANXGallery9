.class public Lcom/miui/gallery/util/DeleteDataUtil;
.super Ljava/lang/Object;
.source "DeleteDataUtil.java"


# direct methods
.method public static delete(Landroid/content/Context;I)Z
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->stopSync(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancelAll()V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteFile(Landroid/content/Context;I)Z

    move-result v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteDB(Landroid/content/Context;I)Z

    move-result p0

    and-int/2addr p0, v0

    invoke-static {}, Lcom/miui/gallery/util/DeleteDataUtil;->deletePreferences()Z

    move-result p1

    and-int/2addr p0, p1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanAllAlbumDirectories(Landroid/content/Context;IZ)V

    return p0
.end method

.method private static deleteDB(Landroid/content/Context;I)Z
    .locals 1

    const/4 p0, 0x1

    invoke-static {p0}, Lcom/miui/gallery/util/deprecated/Preference;->setSyncShouldClearDataBase(Z)V

    invoke-static {}, Lcom/miui/gallery/util/DeleteDataUtil;->resetCloudDataBase()Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p1, "DeleteDataUtil"

    const-string v0, "delete cloud success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/miui/gallery/util/deprecated/Preference;->setSyncShouldClearDataBase(Z)V

    goto :goto_0

    :cond_0
    const-string p1, "DeleteDataUtil"

    const-string v0, "delete cloud failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/util/DeleteDataUtil;->resetMediaRemarkInfo()Z

    move-result p1

    and-int/2addr p0, p1

    if-eqz p0, :cond_1

    const-string p1, "DeleteDataUtil"

    const-string v0, "delete MediaRemarkInfo end."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const-string p1, "DeleteDataUtil"

    const-string v0, "delete MediaRemarkInfo DB failed!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-static {}, Lcom/miui/gallery/util/DeleteDataUtil;->resetCloudControlData()Z

    move-result p1

    and-int/2addr p0, p1

    if-eqz p0, :cond_2

    const-string p1, "DeleteDataUtil"

    const-string v0, "delete CloudControl DB end."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    const-string p1, "DeleteDataUtil"

    const-string v0, "delete CloudControl DB failed!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    invoke-static {}, Lcom/miui/gallery/util/DeleteDataUtil;->resetFavoritesData()Z

    move-result p1

    and-int/2addr p0, p1

    if-eqz p0, :cond_3

    const-string p1, "DeleteDataUtil"

    const-string v0, "delete Favorites DB end."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_3
    const-string p1, "DeleteDataUtil"

    const-string v0, "delete Favorites DB failed!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/card/CardManager;->onAccountDelete()V

    invoke-static {}, Lcom/miui/gallery/util/PersistentResponseHelper;->clearData()V

    invoke-static {}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->getInstance()Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->onAccountDelete()V

    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->getInstance()Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->deleteAll()I

    return p0
.end method

.method private static deleteFile(Landroid/content/Context;I)Z
    .locals 2

    packed-switch p1, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unsupported policy: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    invoke-static {p0}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteSyncedFile(Landroid/content/Context;)Z

    move-result p0

    return p0

    :pswitch_1
    invoke-static {p0}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteHiddenFiles(Landroid/content/Context;)Z

    move-result p0

    return p0

    :pswitch_2
    const/4 p0, 0x1

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static deleteFileUnderSecretAlbum(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ExtraTextUtils;->endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/File;

    const/4 v1, 0x0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFile([Ljava/io/File;)I

    const-string v0, "DeleteDataUtil"

    const-string v1, "Delete secret album file [%s]"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private static deleteHiddenFiles(Landroid/content/Context;)Z
    .locals 12

    const-string v0, "MIUI/Gallery/cloud"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/StorageUtils;->getPathsInExternalStorage(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_3

    array-length v2, p0

    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_0
    if-ge v3, v2, :cond_4

    aget-object v5, p0, v3

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_2

    array-length v6, v5

    move v7, v4

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v6, :cond_1

    aget-object v8, v5, v4

    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, ".secretAlbum"

    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v8}, Ljava/io/File;->isHidden()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-static {v8}, Lcom/miui/gallery/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    move-result v9

    and-int/2addr v7, v9

    const-string v10, "DeleteDataUtil"

    const-string v11, "delete %s result %s"

    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-static {v10, v11, v8, v9}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    move v4, v7

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v4, 0x1

    :cond_4
    sget-object v5, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const-string p0, "localFlag"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    filled-new-array {p0, v2, v3}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "localGroupId = -1000 AND (localFlag != ?) AND (localFlag != ?)"

    const/4 p0, 0x2

    new-array v8, p0, [Ljava/lang/String;

    const/4 p0, 0x7

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v8, v0

    const/16 p0, 0x8

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v8, v1

    const/4 v9, 0x0

    sget-object v10, Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;->INSTANCE:Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    return v4
.end method

.method private static deletePreferences()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/IntentUtil;->removeAllShortCutForBabyAlbums(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sRemoveCloudSettings()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences;->sRemoveCloudSettings()V

    invoke-static {}, Lcom/miui/gallery/preference/ThumbnailPreference;->clear()Z

    const-string v0, "DeleteDataUtil"

    const-string v1, "removed cloud settings."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/cloud/CloudAlbumSortUtil;->sRemoveCloudAlbumSortByFactor()V

    const/4 v0, 0x1

    return v0
.end method

.method private static deleteSyncedFile(Landroid/content/Context;)Z
    .locals 11

    const/4 p0, 0x4

    new-array p0, p0, [Landroid/net/Uri;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const/4 v1, 0x0

    aput-object v0, p0, v1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    aput-object v0, p0, v2

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    const/4 v3, 0x2

    aput-object v0, p0, v3

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    const/4 v3, 0x3

    aput-object v0, p0, v3

    new-instance v0, Ljava/util/ArrayList;

    const/16 v3, 0x64

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-array v3, v3, [Ljava/io/File;

    :goto_0
    array-length v4, p0

    if-ge v1, v4, :cond_0

    aget-object v5, p0, v1

    const-string v4, "microthumbfile"

    const-string v6, "thumbnailFile"

    const-string v7, "localFile"

    filled-new-array {v4, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "serverStatus = \'custom\' AND ("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/miui/gallery/cloud/CloudTableUtils;->sItemIsNotGroup:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ")"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    new-instance v10, Lcom/miui/gallery/util/DeleteDataUtil$2;

    invoke-direct {v10, v0, v3}, Lcom/miui/gallery/util/DeleteDataUtil$2;-><init>(Ljava/util/ArrayList;[Ljava/io/File;)V

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v2
.end method

.method static synthetic lambda$deleteHiddenFiles$43(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 3

    if-eqz p0, :cond_2

    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteFileUnderSecretAlbum(Ljava/lang/String;)V

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/DeleteDataUtil;->deleteFileUnderSecretAlbum(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static resetCloudControlData()Z
    .locals 10

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->clearCloudCache()V

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCloudControlTables()[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    aget-object v5, v0, v3

    sget-object v6, Lcom/miui/gallery/cloud/GalleryCloudUtils;->BASE_URI:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v5, v6, v6}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    const-string v7, "DeleteDataUtil"

    const-string v8, "clean %s finished, deleted rows=%d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v5, v9, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v4

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, -0x1

    if-ne v6, v4, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v4
.end method

.method private static resetCloudDataBase()Z
    .locals 11

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCloudTables()[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    aget-object v5, v0, v3

    sget-object v6, Lcom/miui/gallery/cloud/GalleryCloudUtils;->BASE_URI:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v5, v6, v6}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    const-string v7, "DeleteDataUtil"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "clean %s finished, deleted rows=%d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v5, v10, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v10, v4

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, -0x1

    if-ne v6, v4, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/gallery/util/DeleteDataUtil$1;

    invoke-direct {v0}, Lcom/miui/gallery/util/DeleteDataUtil$1;-><init>()V

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->addRecordsForCameraAndScreenshots(Lcom/miui/gallery/cloud/CloudUtils$Insertable;)V

    return v4
.end method

.method private static resetFavoritesData()Z
    .locals 8

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Favorites;->URI:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    const-string v1, "DeleteDataUtil"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "clean favorites finished, deleted rows=%d"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v2, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4
.end method

.method private static resetMediaRemarkInfo()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkManager;->onAccountDelete()Z

    move-result v0

    return v0
.end method

.class public Lcom/miui/gallery/cloud/DeleteCloudItem;
.super Lcom/miui/gallery/cloud/RequestOperationBase;
.source "DeleteCloudItem.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/RequestOperationBase;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private static deleteDownloadAndTempFiles(Lcom/miui/gallery/util/MediaFileUtils$FileType;Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->isFileInCloudDB(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    sget-object p0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, v0, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".temp"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v2

    invoke-static {p0, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    return-void
.end method

.method private static deleteOriginalFileAndThumbnail(Lcom/miui/gallery/data/DBImage;)V
    .locals 10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_0

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-nez v3, :cond_0

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v6, v5, [Ljava/lang/String;

    aput-object v1, v6, v4

    invoke-static {v3, v6}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    new-instance v3, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v6, "DeleteCloudItem"

    invoke-direct {v3, v5, v1, v6}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v3, v5, [Ljava/lang/String;

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    new-instance v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v3, "DeleteCloudItem"

    invoke-direct {v1, v5, v2, v3}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0, v1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFileNameNotSecret(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFolderRelativePath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/miui/gallery/util/StorageUtils;->getPathsInExternalStorage(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getAllFilePathForRead([Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v6, v5, [Ljava/lang/String;

    aput-object v2, v6, v4

    invoke-static {v3, v6}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    new-instance v3, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v6, "DeleteCloudItem"

    invoke-direct {v3, v5, v2, v6}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_6

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;)V

    :cond_6
    return-void
.end method

.method private static tryDeleteDirtyItem(Lcom/miui/gallery/data/DBImage;)Z
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "_id = ? AND serverId IS NULL "

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v0, v1, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    invoke-static {p0}, Lcom/miui/gallery/util/UbiFocusUtils;->safeDeleteSubUbi(Lcom/miui/gallery/data/DBImage;)V

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public static updateForDeleteOrPurgedGroupOnLocal(Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForUploadDeletePurged(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p0

    const-string p2, "serverStatus"

    invoke-virtual {p0, p2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "serverStatus"

    const-string v0, "deleted"

    invoke-virtual {p0, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget-object p2, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p2, p0, p1, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static updateForDeleteOrPurgedOnLocal(Landroid/net/Uri;Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p0

    if-nez p0, :cond_5

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/cloud/CloudUtils;->hasCreateCopyMoveImageByGroupId(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/CreateGroupItem;->recreateGroup(Ljava/lang/String;)V

    goto :goto_3

    :cond_1
    invoke-static {p1, p2, p3}, Lcom/miui/gallery/cloud/DeleteCloudItem;->updateForDeleteOrPurgedGroupOnLocal(Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V

    goto :goto_3

    :cond_2
    :goto_0
    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/DeleteCloudItem;->updateForDeleteOrPurgedOnLocalNotDeleteFile(Landroid/net/Uri;Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object p0

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->onImageDelete(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getMicroThumbnailDirectories(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p1, :cond_3

    aget-object v1, p0, v0

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->MICRO_THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1FileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/miui/gallery/cloud/DeleteCloudItem;->deleteDownloadAndTempFiles(Lcom/miui/gallery/util/MediaFileUtils$FileType;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudThumbnailFilePath()[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    :goto_2
    if-ge p3, p1, :cond_4

    aget-object v0, p0, p3

    sget-object v1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1FileName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/DeleteCloudItem;->deleteDownloadAndTempFiles(Lcom/miui/gallery/util/MediaFileUtils$FileType;Ljava/lang/String;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    :cond_4
    invoke-static {p2}, Lcom/miui/gallery/cloud/DeleteCloudItem;->deleteOriginalFileAndThumbnail(Lcom/miui/gallery/data/DBImage;)V

    :cond_5
    :goto_3
    return-void
.end method

.method public static updateForDeleteOrPurgedOnLocalNotDeleteFile(Landroid/net/Uri;Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p3}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForUploadDeletePurged(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p1

    const-string p3, "thumbnailFile"

    invoke-virtual {p1, p3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p3, "microthumbfile"

    invoke-virtual {p1, p3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "_id = \'"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    invoke-static {p0, p1, p3, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-static {p2}, Lcom/miui/gallery/util/UbiFocusUtils;->safeDeleteSubUbi(Lcom/miui/gallery/data/DBImage;)V

    return-void
.end method


# virtual methods
.method protected buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    new-instance v1, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;-><init>()V

    iget-object v2, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-eqz v2, :cond_2

    iget-object v2, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    return-object v5

    :cond_0
    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v5

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v7

    invoke-static {v5, v7}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getUrlProvider(ZZ)Lcom/miui/gallery/cloud/CloudUrlProvider;

    move-result-object v5

    iget-object p1, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v5, p1, v6}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getDeleteUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "sharedGalleryId"

    invoke-direct {v2, v7, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setUrl(Ljava/lang/String;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setMethod(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v5}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setParams(Ljava/util/List;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "content"

    iget-object v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setPostData(Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    iget p2, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setRetryTimes(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setNeedReRequest(Z)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    goto :goto_0

    :cond_2
    iget-object p1, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    return-object v5

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/cloud/HostManager$OwnerAlbum;->getDeleteAlbumUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "tag"

    invoke-direct {v5, v6, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setUrl(Ljava/lang/String;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setMethod(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setParams(Ljava/util/List;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    iget p2, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setRetryTimes(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setNeedReRequest(Z)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    :goto_0
    invoke-virtual {v1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->build()Lcom/miui/gallery/cloud/RequestOperationBase$Request;

    move-result-object p1

    return-object p1
.end method

.method protected onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 2

    instance-of v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/DeleteCloudItem;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string v0, "item is not instanceof RequestCloudItem."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1

    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object v1, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {v1}, Lcom/miui/gallery/cloud/DeleteCloudItem;->tryDeleteDirtyItem(Lcom/miui/gallery/data/DBImage;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/DeleteCloudItem;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string v1, "serverId is null means item is deleted by user, delete this dirty record: %s"

    iget-object v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1

    :cond_1
    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/RequestOperationBase;->onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;

    move-result-object p1

    return-object p1
.end method

.method protected onRequestError(Lcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq p1, p3, :cond_0

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EXIST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq p1, p3, :cond_0

    iget p1, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    :cond_0
    return-void
.end method

.method protected onRequestSuccess(Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetCloudGalleryRecyclebinFull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/util/deprecated/Preference;->sSetCloudGalleryRecyclebinFull(Z)V

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/DeleteCloudItem;->mContext:Landroid/content/Context;

    iget-object v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0, v1, v2, p2}, Lcom/miui/gallery/cloud/DeleteCloudItem;->updateForDeleteOrPurgedOnLocal(Landroid/net/Uri;Landroid/content/Context;Lcom/miui/gallery/data/DBImage;Lorg/json/JSONObject;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/DeleteCloudItem;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v0, "Delete item success: %s, type: %s"

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v1

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2, v0, v1, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

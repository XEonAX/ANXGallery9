.class public Lcom/miui/gallery/provider/cloudmanager/MediaRemarkManager;
.super Ljava/lang/Object;
.source "MediaRemarkManager.java"


# direct methods
.method public static varargs addFileHandleMediaIds([J)I
    .locals 7

    invoke-static {p0}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    array-length v0, p0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    invoke-direct {v2}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->setOperationType(I)V

    array-length v3, p0

    const/4 v4, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-wide v5, p0, v1

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->setCloudId(J)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/dao/base/EntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v5

    add-int/2addr v4, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string v0, "CloudManager.MediaRemarkManager"

    const-string v1, "Done insert %d ids, result %d"

    array-length p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, p0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v1, v4

    :cond_1
    return v1
.end method

.method public static varargs doneHandleFileForMediaIds([J)Z
    .locals 6

    invoke-static {p0}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    array-length v0, p0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v2, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    const-string v3, "%s = %s AND %s IN (%s)"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "operationType"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "mediaId"

    aput-object v5, v4, v1

    const/4 v1, 0x3

    const-string v5, ","

    invoke-static {v5, p0}, Lcom/miui/gallery/util/StringUtils;->join(Ljava/lang/String;[J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    const-string v1, "CloudManager.MediaRemarkManager"

    const-string v2, "Delete %d ids, result %s"

    array-length p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, p0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v0

    :cond_0
    return v1
.end method

.method public static loadFileHandleMediaIds()[J
    .locals 8

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    const-string v2, "operationType = ?"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    aput-object v3, v4, v6

    const-string v5, "_id ASC"

    const/4 v7, 0x0

    move-object v3, v4

    move-object v4, v5

    move-object v5, v7

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [J

    :goto_0
    array-length v2, v1

    if-ge v6, v2, :cond_0

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    invoke-virtual {v2}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->getCloudId()J

    move-result-wide v2

    aput-wide v2, v1, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static onAccountDelete()Z
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "CloudManager.MediaRemarkManager"

    const-string v2, "onAccountDelete occur error. %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    return v0
.end method

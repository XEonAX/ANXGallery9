.class public Lcom/miui/gallery/util/UbiFocusUtils;
.super Ljava/lang/Object;
.source "UbiFocusUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;,
        Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;,
        Lcom/miui/gallery/util/UbiFocusUtils$UbiQuery;
    }
.end annotation


# direct methods
.method public static getMainDBImage(ZLjava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;
    .locals 7

    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->isValid()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    if-eqz p0, :cond_1

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    :goto_0
    move-object v1, p1

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    goto :goto_0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryString:Ljava/lang/String;

    iget-object v4, v0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryArgs:[Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/util/UbiFocusUtils$4;

    invoke-direct {v6, p0}, Lcom/miui/gallery/util/UbiFocusUtils$4;-><init>(Z)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/data/DBImage;

    return-object p0
.end method

.method public static getSubUbiCount(ZLjava/lang/String;Ljava/lang/String;)I
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/UbiFocusUtils;->getMainDBImage(ZLjava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSubUbiImageCount()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static getSubUbiImage(ZLjava/lang/String;)Lcom/miui/gallery/data/DBImage;
    .locals 8

    if-eqz p0, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    move-object v1, v0

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s=?"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "fileName"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v0, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v7

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/util/UbiFocusUtils$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/util/UbiFocusUtils$1;-><init>(Z)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/data/DBImage;

    return-object p0
.end method

.method public static getSubUbiImage(ZLjava/lang/String;Ljava/lang/String;I)Lcom/miui/gallery/data/DBImage;
    .locals 7

    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p1, p2, p3}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->isValid()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p0, "UbiFocusUtils"

    const-string p1, "getSubUbiImage, subUbiQuery.isValid."

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    if-eqz p0, :cond_1

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    move-object v1, p1

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    iget-object v4, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/util/UbiFocusUtils$2;

    invoke-direct {v6, p0}, Lcom/miui/gallery/util/UbiFocusUtils$2;-><init>(Z)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/data/DBImage;

    return-object p0
.end method

.method public static getSubUbiImages(ZLjava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/data/DBImage;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/UbiFocusUtils$3;-><init>(Z)V

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/UbiFocusUtils;->queryForSubUbiImages(ZLjava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public static getUbiServerIdByUbiLocalId(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    :goto_0
    if-eqz p1, :cond_1

    const-string p1, "shareId"

    goto :goto_1

    :cond_1
    const-string p1, "serverId"

    :goto_1
    const-string v1, "_id"

    invoke-static {v0, p1, v1, p0}, Lcom/miui/gallery/cloud/CloudUtils;->getStringColumnValue(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static handleSubUbiImage(Lorg/json/JSONObject;ZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p1, :cond_0

    const-string v0, "shareId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "id"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {p0, p1, v0, p2}, Lcom/miui/gallery/util/UbiFocusUtils;->handleSubUbiImage(Lorg/json/JSONObject;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static handleSubUbiImage(Lorg/json/JSONObject;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "isUbiImage"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "ubiSubImageContentMap"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "ubiSubImageCount"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "ubiDefaultIndex"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-eqz v0, :cond_8

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-gt v4, v1, :cond_8

    if-ne v4, v2, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-static {v5}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForAllAndThumbNull(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object v5

    const-string v6, "ubiServerId"

    invoke-virtual {v5, v6, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "ubiSubIndex"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "ubiLocalId"

    invoke-virtual {v5, v6, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v6, "groupId"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v6, "groupId"

    const-string v7, "groupId"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz p1, :cond_3

    const-string v6, "shareId"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v6, "shareId"

    const-string v7, "shareId"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    if-eqz p1, :cond_4

    sget-object v6, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_1

    :cond_4
    sget-object v6, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_1
    monitor-enter v6

    :try_start_0
    invoke-static {p1, p2, p3, v4}, Lcom/miui/gallery/util/UbiFocusUtils;->getSubUbiImage(ZLjava/lang/String;Ljava/lang/String;I)Lcom/miui/gallery/data/DBImage;

    move-result-object v7

    if-nez v7, :cond_6

    const-string v7, "fileName"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v7}, Lcom/miui/gallery/util/UbiFocusUtils;->getSubUbiImage(ZLjava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-static {v7, v3}, Lcom/miui/gallery/cloud/CloudUtils;->renameAnItemInLocal(Lcom/miui/gallery/data/DBImage;Z)V

    :cond_5
    invoke-static {p1, v5}, Lcom/miui/gallery/util/UbiFocusUtils;->safeInsertSubUbiImage(ZLandroid/content/ContentValues;)V

    goto :goto_2

    :cond_6
    invoke-static {p1, v5, p2, p3, v4}, Lcom/miui/gallery/util/UbiFocusUtils;->safeUpdateSubUbiImage(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-static {v7, v5, v3}, Lcom/miui/gallery/cloud/CloudUtils;->renameItemIfNeeded(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;Z)V

    :goto_2
    monitor-exit v6

    goto :goto_3

    :catchall_0
    move-exception p0

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_7
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_8
    return-void
.end method

.method public static queryForSubUbiImages(ZLjava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/util/GalleryUtils$QueryHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->isValid()Z

    move-result p1

    if-nez p1, :cond_0

    return-object v1

    :cond_0
    if-eqz p0, :cond_1

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    move-object v1, p0

    goto :goto_1

    :cond_1
    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    iget-object v4, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    const/4 v5, 0x0

    move-object v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static safeDeleteSubUbi(Lcom/miui/gallery/data/DBImage;)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->isValid()Z

    move-result v1

    if-nez v1, :cond_1

    const-string p0, "UbiFocusUtils"

    const-string v0, "safeDeleteSubUbiImage, subUbiQuery.isValid."

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    iget-object v1, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    iget-object v0, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private static safeInsertSubUbiImage(ZLandroid/content/ContentValues;)V
    .locals 0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    invoke-static {p0, p1}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void
.end method

.method private static safeUpdateSubUbiImage(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p4

    invoke-direct {v0, p2, p3, p4}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->isValid()Z

    move-result p2

    if-nez p2, :cond_0

    const-string p0, "UbiFocusUtils"

    const-string p1, "safeUpdateSubUbiImage, subUbiQuery.isValid."

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    if-eqz p0, :cond_1

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    :goto_0
    iget-object p2, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    iget-object p3, v0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

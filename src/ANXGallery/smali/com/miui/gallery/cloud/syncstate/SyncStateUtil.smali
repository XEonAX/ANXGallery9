.class public Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;
.super Ljava/lang/Object;
.source "SyncStateUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;
    }
.end annotation


# direct methods
.method public static getCloudSpaceInfo(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static getDirtyCount(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;
    .locals 14

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) GROUP BY %s, %s"

    const/16 v2, 0xb

    new-array v2, v2, [Ljava/lang/Object;

    sget-object v3, Lcom/miui/gallery/cloud/CloudUtils;->SELECTION_OWNER_NEED_SYNC:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "serverType"

    const/4 v7, 0x3

    aput-object v3, v2, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v8, 0x4

    aput-object v3, v2, v8

    const-string v3, "localFlag"

    const/4 v9, 0x5

    aput-object v3, v2, v9

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x6

    aput-object v10, v2, v11

    const-string v10, "localFlag"

    aput-object v10, v2, v3

    const/16 v10, 0x8

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v2, v10

    const-string v12, "serverType"

    const/16 v13, 0x9

    aput-object v12, v2, v13

    const-string v12, "oversized"

    const/16 v13, 0xa

    aput-object v12, v2, v13

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s = %d OR %s = %d)  GROUP BY %s, %s"

    new-array v11, v11, [Ljava/lang/Object;

    const-string v12, "localFlag"

    aput-object v12, v11, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v11, v5

    const-string v3, "localFlag"

    aput-object v3, v11, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v11, v7

    const-string v3, "serverType"

    aput-object v3, v11, v8

    const-string v3, "oversized"

    aput-object v3, v11, v9

    invoke-static {v1, v2, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "count(*)"

    aput-object v3, v2, v4

    const-string v3, "serverType"

    aput-object v3, v2, v5

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, " CASE WHEN ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s)) THEN 0 ELSE 1 END AS oversized"

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxImageSizeLimit()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxVideoSizeLimit()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v8, v5

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    sget-object v3, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, v3, v2, v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->queryDirtyCount(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    move-result-object v0

    sget-object v3, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    invoke-static {p0, v3, v2, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->queryDirtyCount(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->plus(Lcom/miui/gallery/cloud/syncstate/DirtyCount;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    move-result-object p0

    return-object p0
.end method

.method public static getDirtySize(Landroid/content/Context;)[J
    .locals 13

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) GROUP BY %s"

    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/Object;

    sget-object v3, Lcom/miui/gallery/cloud/CloudUtils;->SELECTION_OWNER_NEED_SYNC:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "serverType"

    const/4 v7, 0x3

    aput-object v3, v2, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v8, 0x4

    aput-object v3, v2, v8

    const-string v3, "localFlag"

    const/4 v9, 0x5

    aput-object v3, v2, v9

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x6

    aput-object v10, v2, v11

    const-string v10, "localFlag"

    aput-object v10, v2, v3

    const/16 v10, 0x8

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v10

    const-string v11, "serverType"

    const/16 v12, 0x9

    aput-object v11, v2, v12

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s = %d OR %s = %d) GROUP BY %s"

    new-array v9, v9, [Ljava/lang/Object;

    const-string v11, "localFlag"

    aput-object v11, v9, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v9, v5

    const-string v3, "localFlag"

    aput-object v3, v9, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v9, v7

    const-string v3, "serverType"

    aput-object v3, v9, v8

    invoke-static {v1, v2, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, v2, v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->querySize(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[J

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    invoke-static {p0, v2, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->querySize(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[J

    move-result-object p0

    new-array v1, v6, [J

    aget-wide v2, v0, v4

    aget-wide v6, p0, v4

    add-long/2addr v2, v6

    aput-wide v2, v1, v4

    aget-wide v2, v0, v5

    aget-wide v6, p0, v5

    add-long/2addr v2, v6

    aput-wide v2, v1, v5

    return-object v1
.end method

.method public static getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;
    .locals 0

    invoke-static {p1, p2}, Lmiui/cloud/MiCloudCompat;->getQuantityStringWithUnit(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSyncedCount(Landroid/content/Context;)[I
    .locals 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s AND (%s = %s OR %s = %s) GROUP BY %s"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "(localFlag = 0 AND serverStatus = \'custom\')"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v5, 0x3

    aput-object v3, v2, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v4, 0x5

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->querySyncedCount(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[I

    move-result-object p0

    return-object p0
.end method

.method public static getSyncedSize(Landroid/content/Context;)[J
    .locals 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s AND (%s = %s OR %s = %s) GROUP BY %s"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "(localFlag = 0 AND serverStatus = \'custom\')"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v5, 0x3

    aput-object v3, v2, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    const-string v3, "serverType"

    const/4 v4, 0x5

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->querySize(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[J

    move-result-object p0

    return-object p0
.end method

.method public static hasSyncedData(Landroid/content/Context;)Z
    .locals 13

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s AND %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "(localFlag = 0 AND serverStatus = \'custom\')"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "serverType IN (1,2)"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    sget-object v7, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v0, "count(*)"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v8

    new-instance v12, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$4;

    invoke-direct {v12}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$4;-><init>()V

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, p0

    invoke-static/range {v6 .. v12}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-lez p0, :cond_0

    const/4 v4, 0x1

    :cond_0
    return v4
.end method

.method public static isSyncing(Landroid/content/Context;)Z
    .locals 2

    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-static {p0, v1}, Landroid/content/ContentResolver;->isSyncActive(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->isUploading()Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method private static queryDirtyCount(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;
    .locals 7

    new-instance v6, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$2;

    invoke-direct {v6}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$2;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    return-object p0
.end method

.method private static querySize(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[J
    .locals 9

    const-string v0, "sum(size)"

    const-string v1, "serverType"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v4

    new-instance v8, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$1;

    invoke-direct {v8}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$1;-><init>()V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    return-object p0
.end method

.method private static querySyncedCount(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)[I
    .locals 9

    const-string v0, "count(*)"

    const-string v1, "serverType"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v4

    new-instance v8, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$3;

    invoke-direct {v8}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$3;-><init>()V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0
.end method

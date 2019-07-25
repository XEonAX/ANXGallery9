.class public Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;
.super Ljava/lang/Object;
.source "GalleryCloudSyncTagUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;,
        Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;
    }
.end annotation


# static fields
.field private static sColumnNameToPushNameMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static sSyncTagConstantsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSyncTagLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "syncTag"

    const-string v2, "micloud.gallery.sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "shareSyncTagAlbumList"

    const-string v2, "micloud.gallery.albumlist.sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "shareSyncTagAlbumInfo"

    const-string v2, "micloud.gallery.albuminfo.sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "ownerSyncTagUserList"

    const-string v2, "micloud.gallery.sharerlist.sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "shareSyncTagImageList"

    const-string v2, "micloud.gallery.imagelist.sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    const-string v1, "faceWatermark"

    const-string v2, "gallery-facerecognition"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "syncTag"

    const-string v4, "syncTag"

    const-string v5, "syncTag"

    const-string v6, "micloud.gallery.sync"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const-string v11, "syncInfo"

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "ownerSyncTagUserList"

    const-string v4, "mySharerListsTag"

    const-string v5, "sharerlist"

    const-string v6, "micloud.gallery.sharerlist.sync"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const-string v11, "shareSyncInfo"

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "shareSyncTagAlbumList"

    const-string v4, "albumListTag"

    const-string v5, "albumlist"

    const-string v6, "micloud.gallery.albumlist.sync"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const-string v11, "shareSyncInfo"

    const/4 v9, 0x1

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "shareSyncTagAlbumInfo"

    const-string v4, "albumInfoTag"

    const-string v5, "albuminfo"

    const-string v6, "micloud.gallery.albuminfo.sync"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const-string v11, "shareSyncInfo"

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "shareSyncTagImageList"

    const-string v4, "imageListTag"

    const-string v5, "imagelist"

    const-string v6, "micloud.gallery.imagelist.sync"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const-string v11, "shareSyncInfo"

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "albumImageTag"

    const-string v4, "syncTag"

    const-string v5, "syncTag"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const-string v11, "syncInfo"

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "albumUserTag"

    const-string v4, "updateTag"

    const-string v5, "syncTag"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const/4 v11, 0x0

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "albumUserTag"

    const-string v4, "updateTag"

    const-string v5, "syncTag"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v12, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    const-string v3, "faceWatermark"

    const-string v6, "gallery-facerecognition"

    sget-object v10, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, v12

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLandroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "accountName = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "accountType"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCardSyncInfo(Landroid/accounts/Account;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getCardSyncInfo(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCardSyncTag(Landroid/accounts/Account;)J
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getCardSyncTag(Landroid/accounts/Account;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getColumnName(I)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->columnName:Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFaceSyncToken(Landroid/accounts/Account;)Ljava/lang/String;
    .locals 8

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getLimitUri(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2

    const-string v0, "faceSyncToken"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v4

    new-instance v7, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$2;

    invoke-direct {v7}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$2;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static getInitSyncTagValue(I)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->initValue:I

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getJsonTagInput(I)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->jsonTagInput:Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getJsonTagOutput(I)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->jsonTagOutput:Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getSyncInfoColumnName(I)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->syncInfoColumnName:Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getSyncTag(Landroid/content/Context;Landroid/accounts/Account;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getSyncTagCursorByAccount(Landroid/content/Context;Landroid/accounts/Account;Ljava/util/ArrayList;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p0, :cond_0

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    sget-object v4, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v5, v5, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    iget v4, v4, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->initValue:I

    int-to-long v4, v4

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception p1

    move-object v1, p0

    goto :goto_2

    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    iget v3, v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    iget v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->initValue:I

    int-to-long v2, v2

    iput-wide v2, v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_1
    if-eqz p0, :cond_2

    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_3

    :catchall_1
    move-exception p1

    move-object p0, v1

    goto :goto_4

    :catch_1
    move-exception p1

    :goto_2
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_2

    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_3
    monitor-exit v0

    return-object p2

    :goto_4
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_2
    move-exception p0

    goto :goto_6

    :cond_3
    :goto_5
    throw p1

    :goto_6
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p0
.end method

.method private static getSyncTagCursorByAccount(Landroid/content/Context;Landroid/accounts/Account;Ljava/util/ArrayList;)Landroid/database/Cursor;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)",
            "Landroid/database/Cursor;"
        }
    .end annotation

    if-nez p1, :cond_0

    const-string p0, "GalleryCloudSyncTagUtils"

    const-string p1, "account is null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    invoke-static {p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getSyncTagSelection(Ljava/util/ArrayList;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method public static getSyncTagSelection(Ljava/util/ArrayList;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v3, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    iget-object v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->columnName:Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    const-string p0, " * "

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUri(I)Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->uri:Landroid/net/Uri;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static hasSyncInfo(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->hasSyncInfo()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static insertAccountToDB(Landroid/content/Context;Landroid/accounts/Account;)V
    .locals 5

    iget-object v0, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    iget-boolean v4, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->shouldInsertCloudSetting:Z

    if-eqz v4, :cond_0

    iget-object v4, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->columnName:Ljava/lang/String;

    iget v3, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->initValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->internalUpdateAccount(Landroid/content/Context;Landroid/accounts/Account;Landroid/content/ContentValues;Ljava/util/ArrayList;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/card/SyncTagUtil;->ensureAccount(Landroid/accounts/Account;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_2
    :goto_1
    return-void
.end method

.method private static internalUpdateAccount(Landroid/content/Context;Landroid/accounts/Account;Landroid/content/ContentValues;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Landroid/content/ContentValues;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, p1, p3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getSyncTagCursorByAccount(Landroid/content/Context;Landroid/accounts/Account;Ljava/util/ArrayList;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_4

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    invoke-static {p1, p2, v0, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    return-void

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_4
    :goto_1
    :try_start_2
    const-string p3, "accountName"

    iget-object v0, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {p2, p3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "accountType"

    iget-object p1, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p2, p3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    :goto_2
    invoke-static {p0, p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->postUpdateSyncTag(Landroid/content/Context;Landroid/content/ContentValues;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_5

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_5
    return-void

    :catchall_1
    move-exception p0

    move-object v1, v0

    :goto_3
    if-eqz v1, :cond_6

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_6
    throw p0
.end method

.method public static postUpdateSyncTag(Landroid/content/Context;Landroid/content/ContentValues;)V
    .locals 4

    invoke-virtual {p1}, Landroid/content/ContentValues;->valueSet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sColumnNameToPushNameMap:Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "GalleryCloudSyncTagUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pushName:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", pushData:"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static setCardSyncInfo(Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/card/SyncTagUtil;->setCardSyncInfo(Landroid/accounts/Account;Ljava/lang/String;)V

    return-void
.end method

.method public static setCardSyncTag(Landroid/accounts/Account;J)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/card/SyncTagUtil;->setCardSyncTag(Landroid/accounts/Account;J)V

    return-void
.end method

.method public static setFaceSyncToken(Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "faceSyncToken"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    invoke-static {p0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {p1, v0, p0, v1}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static setFaceSyncWatermark(Landroid/accounts/Account;J)V
    .locals 2

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "faceWatermark"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_SETTING_URI:Landroid/net/Uri;

    invoke-static {p0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-static {p1, v0, p0, p2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static shouldSyncTagValue(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    if-eqz p0, :cond_0

    iget-boolean p0, p0, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->shouldCheckInit:Z

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

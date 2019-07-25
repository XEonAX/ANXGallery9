.class public Lcom/miui/gallery/share/CloudSharerMediaSet;
.super Ljava/lang/Object;
.source "CloudSharerMediaSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;
    }
.end annotation


# static fields
.field private static final BASE_OTHER_SET_URI:Landroid/net/Uri;

.field private static final BASE_OWNER_SET_URI:Landroid/net/Uri;


# instance fields
.field private mItem:Lcom/miui/gallery/data/DBItem;

.field private mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

.field private mPath:Lcom/miui/gallery/share/Path;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    sput-object v0, Lcom/miui/gallery/share/CloudSharerMediaSet;->BASE_OTHER_SET_URI:Landroid/net/Uri;

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    sput-object v0, Lcom/miui/gallery/share/CloudSharerMediaSet;->BASE_OWNER_SET_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/share/Path;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->reloadItem(Lcom/miui/gallery/share/Path;)V

    return-void
.end method

.method public static buildPathById(J)Lcom/miui/gallery/share/Path;
    .locals 2

    new-instance v0, Lcom/miui/gallery/share/Path;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/miui/gallery/share/Path;-><init>(JZ)V

    return-object v0
.end method

.method private reloadItem(Lcom/miui/gallery/share/Path;)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumByLocalId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/share/CloudSharerMediaSet;->BASE_OWNER_SET_URI:Landroid/net/Uri;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "_id"

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-direct {p1, p0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;-><init>(Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    iput-object p1, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    :cond_1
    return-void
.end method


# virtual methods
.method public getAlbumId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareAlbumId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getAlbumShareState(Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumStatus()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->hasShareDetailInfo()Z

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/share/AlbumShareState;->getState(Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getAlbumStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getAlbumStatus()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getAlbumStatus()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method protected getBabyInfo()Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getBabyInfo()Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getBabyInfoJson()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getBabyInfoJson()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    return-object v0
.end method

.method public getCreatorId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getCreatorId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getCreatorId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getCreatorId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getId()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    invoke-interface {v0}, Lcom/miui/gallery/data/DBItem;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected getPath()Lcom/miui/gallery/share/Path;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    return-object v0
.end method

.method public getPublicUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getPublicUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getPublicUri()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getPublicUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShareAlbumId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getShareAlbumId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getServerId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShareUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getShareUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getShareUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getShareUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShareUrlLong()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getShareUrlLong()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getShareUrlLong()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public getSharerInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->getSharerInfo()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getSharerInfo()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public declared-synchronized hasShareDetailInfo()Z
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrlLong()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    monitor-exit p0

    return v2

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getSharerInfo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    monitor-exit p0

    return v3

    :cond_1
    :try_start_2
    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareOperations;->parseInvitation(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->hasSharerInfo()Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_2

    monitor-exit p0

    return v2

    :cond_2
    monitor-exit p0

    return v3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isNormalStatus()Z
    .locals 2

    const-string v0, "normal"

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isPublic()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mNullItem:Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet$InnerNullItemImp;->isPublic()Z

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBShareAlbum;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getIsPublic()Z

    move-result v0

    return v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mItem:Lcom/miui/gallery/data/DBItem;

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->isPublic()Z

    move-result v0

    return v0
.end method

.method public isSharerAlbum()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-virtual {v0}, Lcom/miui/gallery/share/Path;->isOtherShared()Z

    move-result v0

    return v0
.end method

.method public rereloadItem()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/CloudSharerMediaSet;->mPath:Lcom/miui/gallery/share/Path;

    invoke-direct {p0, v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->reloadItem(Lcom/miui/gallery/share/Path;)V

    return-void
.end method

.method public setLongUrl(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setSharerInfo(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

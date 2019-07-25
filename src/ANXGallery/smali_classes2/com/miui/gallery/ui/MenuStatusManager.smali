.class Lcom/miui/gallery/ui/MenuStatusManager;
.super Ljava/lang/Object;
.source "AlbumDetailFragment.java"


# instance fields
.field private mAlbumServerId:Ljava/lang/String;

.field private mAlbumUnwriteable:Z

.field private mAutoUpload:Z

.field private mContext:Landroid/content/Context;

.field private mIsManualRenameRestricted:Z

.field private mIsOtherShareAlbum:Z

.field private mShowInOtherAlbums:Z

.field private mShowInPhotosTab:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;JZZLjava/lang/String;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    const-wide/16 v0, 0x1

    and-long/2addr v0, p3

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAutoUpload:Z

    const-wide/16 v4, 0x4

    and-long/2addr v4, p3

    cmp-long p1, v4, v2

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInPhotosTab:Z

    const-wide/16 v4, 0x40

    and-long/2addr p3, v4

    cmp-long p1, p3, v2

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    const/4 p1, 0x0

    :goto_2
    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInOtherAlbums:Z

    iput-boolean p5, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    iput-boolean p6, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbum(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    if-nez p6, :cond_3

    if-nez p5, :cond_3

    invoke-direct {p0, p7}, Lcom/miui/gallery/ui/MenuStatusManager;->isManualRenameRestricted(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    const/4 v0, 0x1

    :cond_4
    iput-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsManualRenameRestricted:Z

    return-void
.end method

.method private isManualRenameRestricted(Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->ensureCommonRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isManualRenameRestricted()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private isSystemAlbum(Ljava/lang/String;)Z
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z
    .locals 2

    const-wide/32 v0, -0x7ffffffe

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7fffffff

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffd

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffb

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffa

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffc

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isVirtualAlbum(Ljava/lang/String;)Z
    .locals 2

    const-wide/32 v0, -0x7ffffffe

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7fffffff

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffd

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffb

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide/32 v0, -0x7ffffffa

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method canAddPhotos()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isVirtualAlbum(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method canDisableAutoUpload()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAutoUpload:Z

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method canDisableShowInOtherAlbums()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbum(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInOtherAlbums:Z

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method canDisableShowInPhotosTab()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInPhotosTab:Z

    return v0
.end method

.method canEnableAutoUpload()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAutoUpload:Z

    xor-int/2addr v0, v1

    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method canEnableShowInOtherAlbums()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbum(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInOtherAlbums:Z

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method canEnableShowInPhotosTab()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbumButNotScreenshots(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInPhotosTab:Z

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method canRename()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbum(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mIsManualRenameRestricted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method canShare()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MenuStatusManager;->isSystemAlbum(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method canShowInPhotosTab()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInPhotosTab:Z

    return v0
.end method

.method protected isUnWriteable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAlbumUnwriteable:Z

    return v0
.end method

.method onAutoUploadStatusChanged(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mAutoUpload:Z

    return-void
.end method

.method onShowInOtherAlbumsStatusChanged(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInOtherAlbums:Z

    return-void
.end method

.method onShowInPhotosTabStatusChanged(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/MenuStatusManager;->mShowInPhotosTab:Z

    return-void
.end method

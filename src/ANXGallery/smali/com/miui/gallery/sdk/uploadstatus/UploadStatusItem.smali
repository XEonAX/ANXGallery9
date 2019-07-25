.class public Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;
.super Lcom/miui/gallery/sdk/uploadstatus/SyncItem;
.source "UploadStatusItem.java"


# instance fields
.field private final mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

.field private final mLocalId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/RequestCloudItem;->getStatus()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/sdk/SyncStatus;->toSyncStatus(I)Lcom/miui/gallery/sdk/SyncStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncItem;-><init>(Lcom/miui/gallery/sdk/SyncStatus;)V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUriAdapter()Lcom/miui/gallery/sdk/uploadstatus/UriAdapter;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/uploadstatus/UriAdapter;->getItemTypeBySdkBaseUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/sdk/uploadstatus/ItemType;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncItem;-><init>(Lcom/miui/gallery/sdk/SyncStatus;)V

    iput-object p1, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    iput-object p2, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    iget-object v1, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    iget-object v3, p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getItemType()Lcom/miui/gallery/sdk/uploadstatus/ItemType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    return-object v0
.end method

.method public getUserUri()Landroid/net/Uri;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUriAdapter()Lcom/miui/gallery/sdk/uploadstatus/UriAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    iget-object v2, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/sdk/uploadstatus/UriAdapter;->getUserUri(Lcom/miui/gallery/sdk/uploadstatus/ItemType;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "[mItemType: %s, mLocalId: %s, mStatus: %s]"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mItemType:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/uploadstatus/ItemType;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mLocalId:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mStatus:Lcom/miui/gallery/sdk/SyncStatus;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/SyncStatus;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

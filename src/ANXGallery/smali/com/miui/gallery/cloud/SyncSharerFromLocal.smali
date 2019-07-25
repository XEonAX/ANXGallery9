.class public Lcom/miui/gallery/cloud/SyncSharerFromLocal;
.super Lcom/miui/gallery/cloud/SyncFromLocalBase;
.source "SyncSharerFromLocal.java"


# instance fields
.field private mCopyImageToSharerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDeleteShareImageItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLargestElapsedTime:J

.field private mManualCreateSharerImageItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mManualCreateSharerVideoItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mMoveImageToSharerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mPhotosToBeSynced:I

.field private mVideosToBeSynced:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncFromLocalBase;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    return-void
.end method


# virtual methods
.method protected generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBImage;
    .locals 1

    new-instance v0, Lcom/miui/gallery/data/DBShareImage;

    invoke-direct {v0, p1}, Lcom/miui/gallery/data/DBShareImage;-><init>(Landroid/database/Cursor;)V

    return-object v0
.end method

.method protected bridge synthetic generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBItem;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    return-object p1
.end method

.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected getSelectionClause()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s))"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxImageSizeLimit()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxVideoSizeLimit()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->getSelectionClause()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected handleRequestCloudItemList()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerVideoItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, "SyncSharerFromLocal"

    const-string v1, "start upload manual create videos"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerVideoItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->dispatchList(Ljava/util/List;)I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerImageItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "SyncSharerFromLocal"

    const-string v1, "start upload manual create images"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerImageItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->dispatchList(Ljava/util/List;)I

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mCopyImageToSharerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    const-string v0, "SyncSharerFromLocal"

    const-string v1, "start copy image items"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/cloud/CopyImageToSharerAlbum;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/CopyImageToSharerAlbum;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mAccount:Landroid/accounts/Account;

    iget-object v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mCopyImageToSharerItems:Ljava/util/ArrayList;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/miui/gallery/cloud/RetryOperation;->doOperation(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne v0, v1, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mMoveImageToSharerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    const-string v0, "SyncSharerFromLocal"

    const-string v1, "start move image items"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/cloud/MoveItemToSharerAlbum;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/MoveItemToSharerAlbum;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mAccount:Landroid/accounts/Account;

    iget-object v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mMoveImageToSharerItems:Ljava/util/ArrayList;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/miui/gallery/cloud/RetryOperation;->doOperation(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne v0, v1, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mDeleteShareImageItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    const-string v0, "SyncSharerFromLocal"

    const-string v1, "start delete image items"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/cloud/DeleteCloudItem;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/DeleteCloudItem;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mAccount:Landroid/accounts/Account;

    iget-object v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mDeleteShareImageItems:Ljava/util/ArrayList;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/miui/gallery/cloud/RetryOperation;->doOperation(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne v0, v1, :cond_4

    return-void

    :cond_4
    return-void
.end method

.method protected initRequestCloudItemList()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerImageItems:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mCopyImageToSharerItems:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mDeleteShareImageItems:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerVideoItems:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mMoveImageToSharerItems:Ljava/util/ArrayList;

    return-void
.end method

.method protected putToRequestCloudItemList(Lcom/miui/gallery/data/DBItem;)V
    .locals 6

    check-cast p1, Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    const-string v0, "SyncSharerFromLocal"

    const-string v1, "unsupport local flag %d"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :pswitch_1
    const-string p1, "SyncSharerFromLocal"

    const-string v0, "don\'t handle move from flag."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerVideoItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    iget-wide v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    const/4 v1, 0x5

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mManualCreateSharerImageItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    iget-wide v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    goto :goto_0

    :pswitch_5
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mCopyImageToSharerItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :pswitch_6
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mMoveImageToSharerItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :pswitch_7
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mDeleteShareImageItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_5
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public sync()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    iput v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    const-wide/16 v0, 0x0

    :try_start_0
    invoke-super {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->sync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    if-lez v2, :cond_0

    const-string v2, "items_to_be_synced"

    const-string v3, "sharer_photos_to_be_synced"

    iget v4, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    int-to-long v4, v4

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_0
    iget v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    if-lez v2, :cond_1

    const-string v2, "items_to_be_synced"

    const-string v3, "sharer_videos_to_be_synced"

    iget v4, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    int-to-long v4, v4

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    iget-wide v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    cmp-long v4, v2, v0

    if-lez v4, :cond_2

    const-string v0, "items_to_be_synced"

    const-string v1, "sharer_largest_elapsed_time"

    iget-wide v2, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_2
    return-void

    :catchall_0
    move-exception v2

    iget v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    if-lez v3, :cond_3

    const-string v3, "items_to_be_synced"

    const-string v4, "sharer_photos_to_be_synced"

    iget v5, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mPhotosToBeSynced:I

    int-to-long v5, v5

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_3
    iget v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    if-lez v3, :cond_4

    const-string v3, "items_to_be_synced"

    const-string v4, "sharer_videos_to_be_synced"

    iget v5, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mVideosToBeSynced:I

    int-to-long v5, v5

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    iget-wide v3, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    cmp-long v5, v3, v0

    if-lez v5, :cond_5

    iget-wide v0, p0, Lcom/miui/gallery/cloud/SyncSharerFromLocal;->mLargestElapsedTime:J

    const-string v3, "items_to_be_synced"

    const-string v4, "sharer_largest_elapsed_time"

    invoke-static {v3, v4, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_5
    throw v2
.end method

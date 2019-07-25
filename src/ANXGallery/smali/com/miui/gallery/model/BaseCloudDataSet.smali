.class public abstract Lcom/miui/gallery/model/BaseCloudDataSet;
.super Lcom/miui/gallery/model/CursorDataSet;
.source "BaseCloudDataSet.java"


# instance fields
.field protected mAlbumId:J

.field protected mAlbumName:Ljava/lang/String;

.field protected mOpDupType:I


# direct methods
.method public constructor <init>(Landroid/database/Cursor;IIJLjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/model/CursorDataSet;-><init>(Landroid/database/Cursor;I)V

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    iput p3, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mOpDupType:I

    iput-wide p4, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    iput-object p6, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public addToAlbum(Landroid/app/Activity;IZZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)Z
    .locals 20

    move-object/from16 v0, p0

    const/4 v1, 0x0

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/BaseCloudDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    iget v6, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mOpDupType:I

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/model/BaseCloudDataSet;->isAlbumRemovable()Z

    move-result v7

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v10

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstKeys()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v11

    move-object/from16 v4, p1

    move-object/from16 v5, p5

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-static/range {v4 .. v11}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZZ[J)V

    goto :goto_0

    :cond_0
    iget v14, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mOpDupType:I

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/model/BaseCloudDataSet;->isAlbumRemovable()Z

    move-result v15

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v18

    new-array v3, v2, [J

    const/4 v4, 0x0

    check-cast v1, Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v5

    aput-wide v5, v3, v4

    move-object/from16 v12, p1

    move-object/from16 v13, p5

    move/from16 v16, p3

    move/from16 v17, p4

    move-object/from16 v19, v3

    invoke-static/range {v12 .. v19}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZZ[J)V

    :cond_1
    :goto_0
    return v2
.end method

.method public addToFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/model/BaseCloudDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/model/CloudItem;

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->isBurstItem()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p2, p3}, Lcom/miui/gallery/model/CloudItem;->wrapAddToFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    move-result-object p3

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getBurstKeys()Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object p2

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p3}, Lcom/miui/gallery/model/CloudItem;->wrapAddToFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    move-result-object p3

    new-array v1, v0, [J

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v3

    aput-wide v3, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    :cond_1
    :goto_0
    return v0
.end method

.method public delete(Landroid/app/Activity;ILcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V
    .locals 22

    move-object/from16 v0, p0

    const/4 v1, 0x0

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/BaseCloudDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    const-string v4, "DeleteMediaDialogFragment"

    iget-wide v6, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    iget-object v8, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumName:Ljava/lang/String;

    iget v9, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mOpDupType:I

    const/16 v10, 0x19

    const/4 v11, 0x1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstKeys()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v12

    move-object/from16 v3, p1

    move-object/from16 v5, p3

    invoke-static/range {v3 .. v12}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;IIZ[J)V

    goto :goto_0

    :cond_0
    const-string v14, "DeleteMediaDialogFragment"

    iget-wide v2, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    iget-object v4, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumName:Ljava/lang/String;

    iget v5, v0, Lcom/miui/gallery/model/BaseCloudDataSet;->mOpDupType:I

    const/16 v20, 0x19

    const/4 v6, 0x1

    new-array v6, v6, [J

    const/4 v7, 0x0

    check-cast v1, Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v8

    aput-wide v8, v6, v7

    move-object/from16 v13, p1

    move-object/from16 v15, p3

    move-wide/from16 v16, v2

    move-object/from16 v18, v4

    move/from16 v19, v5

    move-object/from16 v21, v6

    invoke-static/range {v13 .. v21}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected doDelete(Lcom/miui/gallery/model/BaseDataItem;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected isAlbumRemovable()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    const-wide/32 v2, 0x7ffffffd

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseCloudDataSet;->mAlbumId:J

    const-wide/32 v2, 0x7ffffffa

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeFromFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/model/BaseCloudDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/model/CloudItem;

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->isBurstItem()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p2, p3}, Lcom/miui/gallery/model/CloudItem;->wrapRemoveFromFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    move-result-object p3

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getBurstKeys()Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object p2

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p3}, Lcom/miui/gallery/model/CloudItem;->wrapRemoveFromFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    move-result-object p3

    new-array v1, v0, [J

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v3

    aput-wide v3, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromFavoritesById(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    :cond_1
    :goto_0
    return v0
.end method

.method public removeFromSecret(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/model/BaseCloudDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstKeys()Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object p2

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    goto :goto_0

    :cond_0
    new-array v1, v0, [J

    const/4 v2, 0x0

    check-cast p2, Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v3

    aput-wide v3, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    :cond_1
    :goto_0
    return v0
.end method

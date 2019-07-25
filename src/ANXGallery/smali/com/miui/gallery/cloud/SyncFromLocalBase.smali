.class public abstract Lcom/miui/gallery/cloud/SyncFromLocalBase;
.super Ljava/lang/Object;
.source "SyncFromLocalBase.java"


# instance fields
.field protected mAccount:Landroid/accounts/Account;

.field protected mContext:Landroid/content/Context;

.field protected mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/SyncFromLocalBase;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/cloud/SyncFromLocalBase;->mAccount:Landroid/accounts/Account;

    iput-object p3, p0, Lcom/miui/gallery/cloud/SyncFromLocalBase;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    return-void
.end method

.method private syncOneBatch(Landroid/database/Cursor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    const-string p1, "SyncFromLocalBase"

    const-string v0, "there is no item in local DB to sync."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->initRequestCloudItemList()V

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->putToRequestCloudItemList(Lcom/miui/gallery/data/DBItem;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->handleRequestCloudItemList()V

    return-void
.end method


# virtual methods
.method protected abstract generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBItem;
.end method

.method protected abstract getBaseUri()Landroid/net/Uri;
.end method

.method protected getSelectionClause()Ljava/lang/String;
    .locals 4

    const-string v0, " (%s) "

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "localFlag != 0"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSortOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "dateModified DESC "

    return-object v0
.end method

.method protected abstract handleRequestCloudItemList()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected abstract initRequestCloudItemList()V
.end method

.method protected abstract putToRequestCloudItemList(Lcom/miui/gallery/data/DBItem;)V
.end method

.method public sync()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/RegularPagingProvider;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/RegularPagingProvider;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "SyncFromLocalBase"

    const-string v4, "sync from local start"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->getSelectionClause()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/RegularPagingProvider;->getQueryLimit()I

    move-result v5

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/RegularPagingProvider;->getOffset()I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/cloud/CloudUtils;->getLimitUri(Landroid/net/Uri;II)Landroid/net/Uri;

    move-result-object v5

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncFromLocalBase;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->getSortOrder()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    :try_start_1
    const-string v3, "SyncFromLocalBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "start one batch, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4}, Lcom/miui/gallery/cloud/SyncFromLocalBase;->syncOneBatch(Landroid/database/Cursor;)V

    const-string v3, "SyncFromLocalBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "end one batch, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/miui/gallery/cloud/RegularPagingProvider;->updateShouldContinue(Landroid/database/Cursor;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_2

    :goto_1
    if-eqz v4, :cond_1

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string v0, "SyncFromLocalBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sync from local finish:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    if-eqz v4, :cond_3

    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    move-object v3, v4

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v4, v3

    :goto_2
    if-eqz v4, :cond_4

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

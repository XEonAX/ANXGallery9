.class public Lcom/miui/gallery/cloud/RetryOperation;
.super Ljava/lang/Object;
.source "RetryOperation.java"


# direct methods
.method public static doOperation(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;",
            "Lcom/miui/gallery/cloud/Operation<",
            "TT;>;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;"
        }
    .end annotation

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_5

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/RequestItemBase;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_1

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v5

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cloud/RequestItemBase;

    invoke-virtual {v3, v4}, Lcom/miui/gallery/cloud/RequestItemBase;->isInSameAlbum(Lcom/miui/gallery/cloud/RequestItemBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    const-string v2, "RetryOperation"

    const-string v4, "requestItem in this group, try this group and add this item later."

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/RequestItemBase;->getRequestLimitAGroup()I

    move-result v6

    if-ge v4, v6, :cond_2

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v5

    if-ge v1, v4, :cond_2

    goto :goto_4

    :cond_2
    const/4 v5, 0x0

    :goto_2
    const-string v2, "RetryOperation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "do "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " a group items:"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/RequestItemBase;->supportMultiRequest()Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Lcom/miui/gallery/cloud/RequestMultiItem;

    iget v4, v3, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    invoke-direct {v2, p0, v4}, Lcom/miui/gallery/cloud/RequestMultiItem;-><init>(Ljava/util/ArrayList;I)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p1, p2, v4, p4}, Lcom/miui/gallery/cloud/RetryOperation;->tryAGroupItems(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/ArrayList;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    goto :goto_3

    :cond_3
    invoke-static {p1, p2, p0, p4}, Lcom/miui/gallery/cloud/RetryOperation;->tryAGroupItems(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/ArrayList;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    :goto_3
    const-string v4, "RetryOperation"

    const-string v6, "finish one loop for upload"

    invoke-static {v4, v6}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    if-eqz v5, :cond_4

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_5
    return-object v2
.end method

.method private static isInterruptedException(Ljava/lang/Exception;)Z
    .locals 1

    instance-of v0, p0, Ljava/lang/InterruptedException;

    if-nez v0, :cond_1

    instance-of p0, p0, Lcom/xiaomi/opensdk/exception/AuthenticationException;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static setAllStatus(Ljava/util/Iterator;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;I)V"
        }
    .end annotation

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/RequestItemBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static tryAGroupItems(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/ArrayList;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/ArrayList<",
            "+",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;",
            "Lcom/miui/gallery/cloud/Operation<",
            "TT;>;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->UNKNOWN:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/RequestItemBase;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/RequestItemBase;->getStatus()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    const-string v2, "RetryOperation"

    const-string v3, "The item of %s whose status of %s is invalid"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/RequestItemBase;->getStatus()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v1, v4}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->start(Lcom/miui/gallery/cloud/RequestItemBase;)V

    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    new-instance v8, Lcom/miui/gallery/cloud/RetryOperation$1;

    move-object v2, v8

    move-object v3, v0

    move-object v4, p3

    move-object v5, p0

    move-object v6, p1

    move-object v7, v1

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/cloud/RetryOperation$1;-><init>(Ljava/lang/String;Lcom/miui/gallery/cloud/Operation;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Lcom/miui/gallery/cloud/RequestItemBase;)V

    invoke-static {v8}, Lcom/miui/gallery/cloud/base/RetryRequestHelper;->retryTask(Lcom/miui/gallery/cloud/base/SyncTask;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    iget-object v3, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/4 v5, 0x0

    if-ne v3, v4, :cond_1

    const/4 v0, 0x2

    invoke-virtual {v1, v5, v0}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    goto :goto_2

    :cond_1
    const/4 v3, 0x1

    invoke-virtual {v1, v5, v3}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v6, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq v4, v6, :cond_4

    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v6, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CANCEL:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq v4, v6, :cond_4

    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v6, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne v4, v6, :cond_2

    goto :goto_3

    :cond_2
    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    if-eqz v4, :cond_3

    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    invoke-static {v4}, Lcom/miui/gallery/cloud/RetryOperation;->isInterruptedException(Ljava/lang/Exception;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p0, "RetryOperation"

    const-string p1, "cancel all items for operation %s because of %s"

    iget-object p3, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    invoke-static {p0, p1, v0, p3}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v5, v3}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    invoke-static {p2, v3}, Lcom/miui/gallery/cloud/RetryOperation;->setAllStatus(Ljava/util/Iterator;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->end(Lcom/miui/gallery/cloud/RequestItemBase;)V

    return-object v2

    :cond_3
    :goto_2
    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->end(Lcom/miui/gallery/cloud/RequestItemBase;)V

    move-object v0, v2

    goto/16 :goto_0

    :cond_4
    :goto_3
    :try_start_1
    const-string p0, "RetryOperation"

    const-string p1, "cancel all items for operation %s because of %s"

    iget-object p3, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-static {p0, p1, v0, p3}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-virtual {v1, v5, p0}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    invoke-static {p2, p0}, Lcom/miui/gallery/cloud/RetryOperation;->setAllStatus(Ljava/util/Iterator;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->end(Lcom/miui/gallery/cloud/RequestItemBase;)V

    throw p0

    :cond_5
    return-object v0
.end method

.class public Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;
.super Lcom/miui/gallery/discovery/BaseMessageOperator;
.source "RecentDiscoveryMessageOperator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;,
        Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/discovery/BaseMessageOperator<",
        "Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;",
        ">;"
    }
.end annotation


# static fields
.field private static sGson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/discovery/BaseMessageOperator;-><init>()V

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->sGson:Lcom/google/gson/Gson;

    return-void
.end method

.method static synthetic access$000()Lcom/google/gson/Gson;
    .locals 1

    sget-object v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->sGson:Lcom/google/gson/Gson;

    return-object v0
.end method


# virtual methods
.method protected doMarkMessageAsRead(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)Z
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/miui/gallery/model/DiscoveryMessage;->setConsumed(Z)V

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessageDetail()Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessageDetail()Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setThumbUrls([Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessageDetail()Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setUnviewMediaCount(I)V

    goto :goto_0

    :cond_0
    const-string v0, "RecentDiscoveryMessageOperator"

    const-string v1, "messageDetail should be instance of RecentMessageDetail"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->doUpdateMessage(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)Z

    move-result p1

    return p1
.end method

.method protected doSaveMessage(Landroid/content/Context;Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;)Z
    .locals 17

    move-object/from16 v0, p1

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;->getMediaCount()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;->getThumbUrls()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;->getThumbUrls()Ljava/util/List;

    move-result-object v2

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual/range {p0 .. p1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->queryMessageByType(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v6

    const/4 v7, 0x3

    if-eqz v6, :cond_7

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_7

    const-string v9, "_id"

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const-string v11, "extraData"

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->fromJson(Ljava/lang/String;)Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    move-result-object v11

    if-eqz v11, :cond_1

    invoke-virtual {v11}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->getUnviewMediaCount()I

    move-result v13

    add-int/2addr v1, v13

    invoke-virtual {v11}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->getThumbUrls()[Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    :cond_1
    new-instance v11, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    invoke-direct {v11}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;-><init>()V

    const/4 v13, 0x0

    :goto_1
    if-eqz v13, :cond_4

    array-length v14, v13

    move v15, v1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v14, :cond_5

    aget-object v12, v13, v1

    invoke-interface {v2, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    if-ge v8, v7, :cond_3

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_2
    add-int/lit8 v15, v15, -0x1

    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    move v15, v1

    :cond_5
    invoke-virtual {v11, v15}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setUnviewMediaCount(I)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v7, 0x0

    :goto_4
    array-length v8, v1

    if-ge v7, v8, :cond_6

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v1, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_6
    invoke-virtual {v11, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setThumbUrls([Ljava/lang/String;)V

    const-string v1, "_id"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "extraData"

    invoke-virtual {v11}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "isConsumed"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "updateTime"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "actionUri"

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$RecentAlbum;->VIEW_PAGE_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/discovery/BaseMessageOperator$UpdateTask;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/miui/gallery/discovery/BaseMessageOperator$UpdateTask;-><init>(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;Landroid/content/ContentValues;)V

    invoke-virtual {v1}, Lcom/miui/gallery/discovery/BaseMessageOperator$UpdateTask;->run()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v6}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :catchall_0
    move-exception v0

    goto/16 :goto_8

    :catch_0
    move-exception v0

    goto :goto_7

    :cond_7
    :try_start_1
    new-instance v8, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    invoke-direct {v8}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;-><init>()V

    invoke-virtual {v8, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setUnviewMediaCount(I)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-lt v1, v7, :cond_8

    new-array v1, v7, [Ljava/lang/String;

    goto :goto_5

    :cond_8
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    :goto_5
    const/4 v7, 0x0

    :goto_6
    array-length v9, v1

    if-ge v7, v9, :cond_9

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    aput-object v9, v1, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    :cond_9
    invoke-virtual {v8, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->setThumbUrls([Ljava/lang/String;)V

    const-string v1, "extraData"

    invoke-virtual {v8}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "type"

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->getMessageType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "receiveTime"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "updateTime"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "isConsumed"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "actionUri"

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$RecentAlbum;->VIEW_PAGE_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/discovery/BaseMessageOperator$InsertTask;

    invoke-direct {v1, v0, v3}, Lcom/miui/gallery/discovery/BaseMessageOperator$InsertTask;-><init>(Landroid/content/Context;Landroid/content/ContentValues;)V

    invoke-virtual {v1}, Lcom/miui/gallery/discovery/BaseMessageOperator$InsertTask;->run()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v6}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :goto_7
    :try_start_2
    const-string v1, "RecentDiscoveryMessageOperator"

    const-string v2, "Something wrong happened when save message: %s."

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v6}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    const/4 v1, 0x0

    return v1

    :goto_8
    invoke-static {v6}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method

.method protected bridge synthetic doSaveMessage(Landroid/content/Context;Ljava/lang/Object;)Z
    .locals 0

    check-cast p2, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->doSaveMessage(Landroid/content/Context;Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;)Z

    move-result p1

    return p1
.end method

.method public doWrapMessage(Lcom/miui/gallery/model/DiscoveryMessage;Ljava/lang/String;)V
    .locals 6

    invoke-static {p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->fromJson(Ljava/lang/String;)Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->getUnviewMediaCount()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e003f

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/DiscoveryMessage;->setMessage(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/DiscoveryMessage;->setMessageDetail(Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;)V

    return-void
.end method

.method public getMessageType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.class public Lcom/miui/gallery/discovery/DiscoveryMessageManager;
.super Ljava/lang/Object;
.source "DiscoveryMessageManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/discovery/DiscoveryMessageManager$MessageFilter;,
        Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;,
        Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadJob;,
        Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;,
        Lcom/miui/gallery/discovery/DiscoveryMessageManager$Holder;
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;

.field private static sContentObserverList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;",
            ">;"
        }
    .end annotation
.end field

.field private static sFactory:Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;

.field private static sMessageOperators:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/discovery/BaseMessageOperator;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSyncLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sSyncLock:Ljava/lang/Object;

    const-string v1, "_id"

    const-string v2, "type"

    const-string v3, "actionUri"

    const-string v4, "messageSource"

    const-string v5, "message"

    const-string v6, "title"

    const-string v7, "subTitle"

    const-string v8, "priority"

    const-string v9, "expireTime"

    const-string v10, "receiveTime"

    const-string v11, "updateTime"

    const-string v12, "triggerTime"

    const-string v13, "isConsumed"

    const-string v14, "extraData"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sMessageOperators:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager$1;)V

    sput-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sFactory:Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;

    new-instance v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;

    invoke-direct {v0}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;-><init>()V

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->registerMessageOperator(ILcom/miui/gallery/discovery/BaseMessageOperator;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;-><init>()V

    return-void
.end method

.method private createComparatorByType(I)Ljava/util/Comparator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/discovery/DiscoveryMessageManager$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$2;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;)V

    return-object p1
.end method

.method private createFilterByType(I)Lcom/miui/gallery/discovery/DiscoveryMessageManager$MessageFilter;
    .locals 0

    new-instance p1, Lcom/miui/gallery/discovery/DiscoveryMessageManager$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$3;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;)V

    return-object p1
.end method

.method private findMessageOperatorByType(I)Lcom/miui/gallery/discovery/BaseMessageOperator;
    .locals 1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sMessageOperators:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sMessageOperators:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/discovery/BaseMessageOperator;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public static getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$Holder;->INSTANCE:Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    return-object v0
.end method

.method private notifyChangeByMessageType(I)V
    .locals 5

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    invoke-virtual {v2}, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;->getMessageTypeMask()I

    move-result v3

    and-int/2addr v3, p1

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/discovery/DiscoveryMessageManager$1;

    invoke-direct {v4, p0, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$1;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V

    invoke-virtual {v3, v4}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private registerMessageOperator(ILcom/miui/gallery/discovery/BaseMessageOperator;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sMessageOperators:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method private wrapMessage(Lcom/miui/gallery/model/DiscoveryMessage;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getType()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->findMessageOperatorByType(I)Lcom/miui/gallery/discovery/BaseMessageOperator;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/discovery/BaseMessageOperator;->wrapMessage(Lcom/miui/gallery/model/DiscoveryMessage;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public createLoader(Landroid/content/Context;I)Lcom/miui/gallery/loader/DiscoveryMessageLoader;
    .locals 1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sFactory:Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$LoaderFactory;->createLoader(Landroid/content/Context;I)Lcom/miui/gallery/loader/DiscoveryMessageLoader;

    move-result-object p1

    return-object p1
.end method

.method public loadMessage(Landroid/content/Context;I)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(type & "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") != 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$DiscoveryMessage;->URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_5

    :try_start_0
    invoke-direct {p0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->createComparatorByType(I)Ljava/util/Comparator;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->createFilterByType(I)Lcom/miui/gallery/discovery/DiscoveryMessageManager$MessageFilter;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    invoke-direct {v2}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;-><init>()V

    const/16 v3, 0xc

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-lez v3, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->consumed(Z)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->type(I)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x2

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->actionUri(Ljava/lang/String;)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x4

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->message(Ljava/lang/String;)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/16 v5, 0x8

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->expireTime(J)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/16 v5, 0xb

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->triggerTime(J)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/16 v5, 0xa

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->updateTime(J)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x5

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->title(Ljava/lang/String;)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x6

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->subTitle(Ljava/lang/String;)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x7

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->priority(I)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/16 v5, 0x9

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->receiveTime(J)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    const/4 v5, 0x3

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->messageSource(Ljava/lang/String;)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    move-result-object v3

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->messageId(J)Lcom/miui/gallery/model/DiscoveryMessage$Builder;

    invoke-virtual {v2}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->build()Lcom/miui/gallery/model/DiscoveryMessage;

    move-result-object v2

    const/16 v3, 0xd

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->wrapMessage(Lcom/miui/gallery/model/DiscoveryMessage;Ljava/lang/String;)V

    if-eqz p2, :cond_1

    invoke-interface {p2, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MessageFilter;->accept(Lcom/miui/gallery/model/DiscoveryMessage;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_3
    if-eqz v1, :cond_4

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_4

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_0
    move-exception p2

    :try_start_1
    const-string v1, "DiscoveryMessageManager"

    const-string v2, "encounter error when load messages:\n%s"

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p2

    :cond_5
    :goto_4
    return-object v0
.end method

.method public markAsRead(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)V
    .locals 5

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getMessageId()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getType()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->findMessageOperatorByType(I)Lcom/miui/gallery/discovery/BaseMessageOperator;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/discovery/BaseMessageOperator;->markMessageAsRead(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getType()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->notifyChangeByMessageType(I)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public markAsReadAsync(Landroid/content/Context;Lcom/miui/gallery/model/DiscoveryMessage;)V
    .locals 4

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadJob;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/miui/gallery/model/DiscoveryMessage;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-direct {v1, p0, p1, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadJob;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;Landroid/content/Context;[Lcom/miui/gallery/model/DiscoveryMessage;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public markAsReadByTypeAsync(Landroid/content/Context;I)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public registerContentObserver(Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V
    .locals 3

    if-eqz p1, :cond_1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const-string v1, "DiscoveryMessageManager"

    const-string v2, "Observer [%s] is already registered."

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public saveMessage(Landroid/content/Context;ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "ITT;)V"
        }
    .end annotation

    if-eqz p1, :cond_3

    if-nez p3, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->findMessageOperatorByType(I)Lcom/miui/gallery/discovery/BaseMessageOperator;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    :try_start_0
    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/discovery/BaseMessageOperator;->saveMessage(Landroid/content/Context;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->notifyChangeByMessageType(I)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "DiscoveryMessageManager"

    const-string p3, "Generic type saveParams doesn\'t match the generic type defined in concrete implementation of BaseMessageOperator"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/ClassCastException;->printStackTrace()V

    :cond_2
    :goto_0
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public unregisterContentObserver(Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V
    .locals 3

    if-eqz p1, :cond_1

    sget-object v0, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const-string v1, "DiscoveryMessageManager"

    const-string v2, "Observer [%s] is already unregistered."

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->sContentObserverList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

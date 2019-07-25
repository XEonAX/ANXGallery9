.class public Lcom/xiaomi/mipush/sdk/OperatePushHelper;
.super Ljava/lang/Object;
.source "OperatePushHelper.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/mipush/sdk/OperatePushHelper;


# instance fields
.field private appContext:Landroid/content/Context;

.field private operateMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/mipush/sdk/MessageBean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->appContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->appContext:Landroid/content/Context;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->appContext:Landroid/content/Context;

    :cond_0
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;
    .locals 2

    sget-object v0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->sInstance:Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->sInstance:Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->sInstance:Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->sInstance:Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    return-object p0
.end method


# virtual methods
.method public getRetryCount(Ljava/lang/String;)I
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/MessageBean;-><init>()V

    iput-object p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->messageId:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-virtual {v2, v1}, Lcom/xiaomi/mipush/sdk/MessageBean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget p1, v2, Lcom/xiaomi/mipush/sdk/MessageBean;->count:I

    monitor-exit v0

    return p1

    :cond_1
    const/4 p1, 0x0

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public declared-synchronized getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->appContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/RetryType;->name()Ljava/lang/String;

    move-result-object p1

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public increaseRetryCount(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/MessageBean;-><init>()V

    iput-object p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->messageId:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/MessageBean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v1, v2

    :cond_1
    iget p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->count:I

    add-int/lit8 p1, p1, 0x1

    iput p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->count:I

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isMessageOperating(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/MessageBean;-><init>()V

    iput-object p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->messageId:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    monitor-exit v0

    return p1

    :cond_0
    const/4 p1, 0x0

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public declared-synchronized putSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->appContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/RetryType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public removeOperateMessage(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/MessageBean;-><init>()V

    iput-object p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->messageId:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resetOperateMessage(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/xiaomi/mipush/sdk/MessageBean;

    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/MessageBean;-><init>()V

    const/4 v2, 0x0

    iput v2, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->count:I

    iput-object p1, v1, Lcom/xiaomi/mipush/sdk/MessageBean;->messageId:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->operateMessages:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

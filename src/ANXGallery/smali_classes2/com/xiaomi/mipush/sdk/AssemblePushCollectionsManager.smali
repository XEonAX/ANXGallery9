.class public Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;
.super Ljava/lang/Object;
.source "AssemblePushCollectionsManager.java"

# interfaces
.implements Lcom/xiaomi/mipush/sdk/AbstractPushManager;


# static fields
.field private static volatile sInstance:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;


# instance fields
.field private mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

.field private mContext:Landroid/content/Context;

.field private mManagers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/mipush/sdk/AssemblePush;",
            "Lcom/xiaomi/mipush/sdk/AbstractPushManager;",
            ">;"
        }
    .end annotation
.end field

.field private oldOCValue:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->oldOCValue:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->oldOCValue:Z

    return p0
.end method

.method static synthetic access$102(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->oldOCValue:Z

    return p1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->sInstance:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->sInstance:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->sInstance:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

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
    sget-object p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->sInstance:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    return-object p0
.end method

.method private initAssemblePushManager()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenHmsPush()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " HW user switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenHmsPush()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " HW online switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " HW isSupport : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/xiaomi/mipush/sdk/PhoneBrand;->HUAWEI:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->getPhoneBrand(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PhoneBrand;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ASSEMBLE_PUSH : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenHmsPush()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/xiaomi/mipush/sdk/PhoneBrand;->HUAWEI:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->getPhoneBrand(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PhoneBrand;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/PushManagerFactory;->getManager(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->addManager(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AbstractPushManager;)V

    :cond_1
    const-string v0, "hw manager add to list"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v0

    if-eqz v0, :cond_3

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->removeManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)V

    invoke-interface {v0}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->unregister()V

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFCMPush()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " FCM user switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFCMPush()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " FCM online switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " FCM isSupport : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->isGoogleServiceSatisfied(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ASSEMBLE_PUSH : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_4
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFCMPush()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->isGoogleServiceSatisfied(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/PushManagerFactory;->getManager(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->addManager(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AbstractPushManager;)V

    :cond_5
    const-string v0, "fcm manager add to list"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v0

    if-eqz v0, :cond_7

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->removeManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)V

    invoke-interface {v0}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->unregister()V

    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenCOSPush()Z

    move-result v0

    if-eqz v0, :cond_8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " COS user switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenCOSPush()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " COS online switch : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " COS isSupport : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->isColorOSPushSupport(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ASSEMBLE_PUSH : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_8
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenCOSPush()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->isColorOSPushSupport(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/PushManagerFactory;->getManager(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->addManager(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AbstractPushManager;)V

    goto :goto_2

    :cond_9
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_a

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v0

    if-eqz v0, :cond_a

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->removeManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)V

    invoke-interface {v0}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->unregister()V

    :cond_a
    :goto_2
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFTOSPush()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->isOpenAssemblePushOnlineSwitch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushUtils;->isFunTouchOSPushSupport(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v1, v2}, Lcom/xiaomi/mipush/sdk/PushManagerFactory;->getManager(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->addManager(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AbstractPushManager;)V

    goto :goto_3

    :cond_b
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z

    move-result v0

    if-eqz v0, :cond_c

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object v0

    if-eqz v0, :cond_c

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->removeManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)V

    invoke-interface {v0}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->unregister()V

    :cond_c
    :goto_3
    return-void
.end method


# virtual methods
.method public addManager(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AbstractPushManager;)V
    .locals 1

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method public contain(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    return-object p1
.end method

.method public getUserSwitch(Lcom/xiaomi/mipush/sdk/AssemblePush;)Z
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$2;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenCOSPush()Z

    move-result p1

    move v0, p1

    :cond_0
    :pswitch_1
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFTOSPush()Z

    move-result v0

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFCMPush()Z

    move-result v0

    goto :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenHmsPush()Z

    move-result v0

    :cond_1
    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public register()V
    .locals 2

    const-string v0, "ASSEMBLE_PUSH : assemble push register"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->initAssemblePushManager()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->register()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->checkAssemblePushStatus(Landroid/content/Context;)V

    :cond_3
    return-void
.end method

.method public removeManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setConfiguration(Lcom/xiaomi/mipush/sdk/PushConfiguration;)V
    .locals 3

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object p1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ConfigKey;->AggregatePushSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->oldOCValue:Z

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenHmsPush()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenFCMPush()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mConfiguration:Lcom/xiaomi/mipush/sdk/PushConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushConfiguration;->getOpenCOSPush()Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object p1

    new-instance v0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;

    const/16 v1, 0x65

    const-string v2, "assemblePush"

    invoke-direct {v0, p0, v1, v2}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;-><init>(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;ILjava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/OnlineConfig;->addOCUpdateCallbacks(Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;)V

    :cond_1
    return-void
.end method

.method public unregister()V
    .locals 2

    const-string v0, "ASSEMBLE_PUSH : assemble push unregister"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->unregister()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->mManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

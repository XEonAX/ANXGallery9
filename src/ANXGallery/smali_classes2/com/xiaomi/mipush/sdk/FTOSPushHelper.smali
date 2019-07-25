.class public Lcom/xiaomi/mipush/sdk/FTOSPushHelper;
.super Ljava/lang/Object;
.source "FTOSPushHelper.java"


# static fields
.field private static mLastTime:J = 0x0L

.field private static volatile mNeedRegister:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static doInNetworkChange(Landroid/content/Context;)V
    .locals 7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {}, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->getNeedRegister()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-wide v2, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->mLastTime:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    sget-wide v2, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->mLastTime:J

    const-wide/32 v4, 0x493e0

    add-long/2addr v2, v4

    cmp-long v4, v2, v0

    if-gtz v4, :cond_1

    :cond_0
    sput-wide v0, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->mLastTime:J

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->registerFTOSAssemblePush(Landroid/content/Context;)V

    :cond_1
    return-void
.end method

.method public static getNeedRegister()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->mNeedRegister:Z

    return v0
.end method

.method private static registerFTOSAssemblePush(Landroid/content/Context;)V
    .locals 1

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    move-result-object p0

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->getManager(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AbstractPushManager;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "ASSEMBLE_PUSH :  register fun touch os when network change!"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-interface {p0}, Lcom/xiaomi/mipush/sdk/AbstractPushManager;->register()V

    :cond_0
    return-void
.end method

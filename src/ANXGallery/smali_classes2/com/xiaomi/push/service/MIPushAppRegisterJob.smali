.class public Lcom/xiaomi/push/service/MIPushAppRegisterJob;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "MIPushAppRegisterJob.java"


# instance fields
.field private appId:Ljava/lang/String;

.field private appToken:Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private payload:[B

.field private pushService:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 1

    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iput-object p2, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->packageName:Ljava/lang/String;

    iput-object p5, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->payload:[B

    iput-object p3, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->appId:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->appToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "register app"

    return-object v0
.end method

.method public process()V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v0

    if-nez v0, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v2, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->appId:Ljava/lang/String;

    iget-object v4, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->appToken:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lcom/xiaomi/push/service/MIPushAccountUtils;->register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    if-nez v0, :cond_1

    const-string v0, "no account for mipush"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    const v1, 0x42c1d82

    const-string v2, "no account."

    invoke-static {v0, v1, v2}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyRegisterError(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_2

    :cond_1
    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v1

    const-string v2, "5"

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClientLoginInfoByChid(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/MIPushAccount;->toClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v1, v0}, Lcom/xiaomi/push/service/MIPushHelper;->prepareClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/PushClientsManager;->addActiveClient(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    goto :goto_1

    :cond_2
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    :goto_1
    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {v1}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_4

    :try_start_1
    iget-object v1, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v2, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne v1, v2, :cond_3

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->packageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->payload:[B

    invoke-static {v0, v1, v2}, Lcom/xiaomi/push/service/MIPushHelper;->sendPacket(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;[B)V

    goto :goto_2

    :cond_3
    iget-object v1, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v2, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->unbind:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne v1, v2, :cond_5

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    new-instance v2, Lcom/xiaomi/push/service/XMPushService$BindJob;

    iget-object v3, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v2, v3, v0}, Lcom/xiaomi/push/service/XMPushService$BindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V
    :try_end_1
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v0}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    :cond_5
    :goto_2
    return-void
.end method

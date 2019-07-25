.class final Lcom/xiaomi/push/service/MIPushHelper$2;
.super Ljava/lang/Object;
.source "MIPushHelper.java"

# interfaces
.implements Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/MIPushHelper;->prepareClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$service:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/MIPushHelper$2;->val$service:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange(Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;I)V
    .locals 0

    sget-object p1, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p2, p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/push/service/MIPushHelper$2;->val$service:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {p1}, Lcom/xiaomi/push/service/MIPushClientManager;->processPendingRegistrationRequest(Lcom/xiaomi/push/service/XMPushService;)V

    iget-object p1, p0, Lcom/xiaomi/push/service/MIPushHelper$2;->val$service:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {p1}, Lcom/xiaomi/push/service/MIPushClientManager;->processPendingMessages(Lcom/xiaomi/push/service/XMPushService;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->unbind:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/push/service/MIPushHelper$2;->val$service:Lcom/xiaomi/push/service/XMPushService;

    const p2, 0x42c1d81

    const-string p3, " the push is not connected."

    invoke-static {p1, p2, p3}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyRegisterError(Landroid/content/Context;ILjava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

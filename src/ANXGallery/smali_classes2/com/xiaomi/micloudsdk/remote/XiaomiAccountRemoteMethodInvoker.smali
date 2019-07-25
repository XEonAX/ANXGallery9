.class public abstract Lcom/xiaomi/micloudsdk/remote/XiaomiAccountRemoteMethodInvoker;
.super Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;
.source "XiaomiAccountRemoteMethodInvoker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker<",
        "TR;>;"
    }
.end annotation


# static fields
.field private static final ACCOUNT_NEW_SERVICE_INSTALLED:Lcom/miui/app/ServiceInstalled;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/miui/app/ServiceInstalled;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.xiaomi.account.action.BIND_XIAOMI_ACCOUNT_SERVICE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.xiaomi.account"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/app/ServiceInstalled;-><init>(Landroid/content/Intent;)V

    sput-object v0, Lcom/xiaomi/micloudsdk/remote/XiaomiAccountRemoteMethodInvoker;->ACCOUNT_NEW_SERVICE_INSTALLED:Lcom/miui/app/ServiceInstalled;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private static bindAccountService(Landroid/content/Context;Ljava/lang/String;Landroid/content/ServiceConnection;)Z
    .locals 1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.xiaomi.account"

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {p0, v0, p2, p1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p0

    return p0
.end method


# virtual methods
.method protected bindService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z
    .locals 1

    sget-object v0, Lcom/xiaomi/micloudsdk/remote/XiaomiAccountRemoteMethodInvoker;->ACCOUNT_NEW_SERVICE_INSTALLED:Lcom/miui/app/ServiceInstalled;

    invoke-virtual {v0, p1}, Lcom/miui/app/ServiceInstalled;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.xiaomi.account.action.BIND_XIAOMI_ACCOUNT_SERVICE"

    invoke-static {p1, v0, p2}, Lcom/xiaomi/micloudsdk/remote/XiaomiAccountRemoteMethodInvoker;->bindAccountService(Landroid/content/Context;Ljava/lang/String;Landroid/content/ServiceConnection;)Z

    move-result p1

    goto :goto_0

    :cond_0
    const-string v0, "android.intent.action.BIND_XIAOMI_ACCOUNT_SERVICE"

    invoke-static {p1, v0, p2}, Lcom/xiaomi/micloudsdk/remote/XiaomiAccountRemoteMethodInvoker;->bindAccountService(Landroid/content/Context;Ljava/lang/String;Landroid/content/ServiceConnection;)Z

    move-result p1

    :goto_0
    return p1
.end method

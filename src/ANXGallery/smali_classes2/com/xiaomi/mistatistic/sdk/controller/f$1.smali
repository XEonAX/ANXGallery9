.class Lcom/xiaomi/mistatistic/sdk/controller/f$1;
.super Landroid/content/BroadcastReceiver;
.source "ConfigProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mistatistic/sdk/controller/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mistatistic/sdk/controller/f;


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/f;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/f$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    invoke-static {p2}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Lcom/xiaomi/mistatistic/sdk/controller/f;)I

    move-result p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    iget-object p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/f$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    invoke-static {p2}, Lcom/xiaomi/mistatistic/sdk/controller/f;->b(Lcom/xiaomi/mistatistic/sdk/controller/f;)Landroid/content/BroadcastReceiver;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :cond_0
    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/l;->a(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "CP"

    const-string v0, "mNetReceiver exception"

    invoke-static {p2, v0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

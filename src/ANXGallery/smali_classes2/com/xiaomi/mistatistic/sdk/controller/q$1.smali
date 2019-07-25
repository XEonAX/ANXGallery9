.class Lcom/xiaomi/mistatistic/sdk/controller/q$1;
.super Landroid/os/Handler;
.source "SessionManagerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mistatistic/sdk/controller/q;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mistatistic/sdk/controller/q;


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/q;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/q$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x64

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object p1

    const-string v1, "action_auto_end"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {p1, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/q$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/q;->a(Lcom/xiaomi/mistatistic/sdk/controller/q;)Landroid/os/Handler;

    move-result-object p1

    const-wide/16 v1, 0x3a98

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_0
    return-void
.end method

.class Lcom/xiaomi/mistatistic/sdk/controller/p$1;
.super Landroid/os/Handler;
.source "SessionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mistatistic/sdk/controller/p;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mistatistic/sdk/controller/p;


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/p;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/p$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/p;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x1df5e77

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object p1

    const-string v0, "session_begin"

    const-wide/16 v1, 0x0

    invoke-static {p1, v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v7

    const-string v0, "last_deactivate"

    invoke-static {p1, v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v5

    const-string v0, "pv_path"

    const-string v3, ""

    invoke-static {p1, v0, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    cmp-long v3, v7, v1

    if-lez v3, :cond_1

    cmp-long v1, v5, v7

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/p$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/p;

    move-object v2, p1

    move-wide v3, v7

    invoke-static/range {v1 .. v6}, Lcom/xiaomi/mistatistic/sdk/controller/p;->a(Lcom/xiaomi/mistatistic/sdk/controller/p;Landroid/content/Context;JJ)V

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/p$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/p;

    invoke-static {v1, p1, v0, v7, v8}, Lcom/xiaomi/mistatistic/sdk/controller/p;->a(Lcom/xiaomi/mistatistic/sdk/controller/p;Landroid/content/Context;Ljava/lang/String;J)V

    :cond_2
    :goto_0
    return-void
.end method

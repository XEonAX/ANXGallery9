.class Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;
.super Ljava/lang/Object;
.source "HttpEventController.java"

# interfaces
.implements Lcom/xiaomi/mistatistic/sdk/controller/l$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mistatistic/sdk/controller/i$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lcom/xiaomi/mistatistic/sdk/controller/i$2;


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/i$2;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->b:Lcom/xiaomi/mistatistic/sdk/controller/i$2;

    iput-object p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->a:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 3

    const-string v0, "HEC"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http data complete, result="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "ok"

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->b:Lcom/xiaomi/mistatistic/sdk/controller/i$2;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/controller/i$2;->a:Lcom/xiaomi/mistatistic/sdk/controller/i;

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a(Lcom/xiaomi/mistatistic/sdk/controller/i;Lorg/json/JSONObject;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->b:Lcom/xiaomi/mistatistic/sdk/controller/i$2;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/controller/i$2;->a:Lcom/xiaomi/mistatistic/sdk/controller/i;

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a(Lcom/xiaomi/mistatistic/sdk/controller/i;)Ljava/util/List;

    move-result-object p1

    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->b:Lcom/xiaomi/mistatistic/sdk/controller/i$2;

    iget-object v0, v0, Lcom/xiaomi/mistatistic/sdk/controller/i$2;->a:Lcom/xiaomi/mistatistic/sdk/controller/i;

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a(Lcom/xiaomi/mistatistic/sdk/controller/i;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/i$2$1;->a:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    monitor-exit p1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    const-string v0, "HEC"

    const-string v1, "upload events response exception:"

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void
.end method

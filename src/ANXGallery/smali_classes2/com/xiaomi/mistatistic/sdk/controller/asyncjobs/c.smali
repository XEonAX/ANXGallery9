.class public Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;
.super Ljava/lang/Object;
.source "RemoteDataUploadJob.java"

# interfaces
.implements Lcom/xiaomi/mistatistic/sdk/controller/e$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;
    }
.end annotation


# instance fields
.field private a:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;IZ)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->d:I

    iput-boolean v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    iput p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->d:I

    iput-object p3, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;

    iput-object p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b:Ljava/lang/String;

    iput p4, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->c:I

    iput-boolean p5, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b:Ljava/lang/String;

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "seed:%s-%s-%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const/4 p1, 0x2

    aput-object p3, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/t;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x10

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private a(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "configVersion"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "configVersion"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "configVersion"

    const-string v2, "0.0"

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Landroid/content/Context;)Lcom/xiaomi/mistatistic/sdk/controller/f;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Z)V

    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private a(Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "RDUJ"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upload complete, result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "status"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a(Lorg/json/JSONObject;)V

    invoke-direct {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b(Lorg/json/JSONObject;)V

    const-string v0, "ok"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const-string v0, "RDUJ"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "result status isn\'t ok, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "RDUJ"

    const-string v1, "parseUploadingResult exception "

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method private b(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "delay"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "delay"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iget p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->d:I

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/o;->a(J)V

    :cond_0
    return-void
.end method

.method static synthetic b(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    return p0
.end method

.method static synthetic c(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;)Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;

    return-object p0
.end method


# virtual methods
.method public execute()V
    .locals 12

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/s;->a()Lcom/xiaomi/mistatistic/sdk/controller/s;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/mistatistic/sdk/controller/s;->f()I

    move-result v1

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/s;->a()Lcom/xiaomi/mistatistic/sdk/controller/s;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/mistatistic/sdk/controller/s;->e()J

    move-result-wide v2

    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v5

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/BuildSetting;->isTestNetworkEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "http://test.data.mistat.xiaomi.srv/mistats/v2"

    goto :goto_0

    :cond_0
    const-string v6, "http://data.mistat.xiaomi.com/mistats/v2"

    :goto_0
    invoke-static {v5, v6, v4}, Lcom/xiaomi/mistatistic/sdk/controller/t;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    iget-boolean v7, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    if-eqz v7, :cond_1

    invoke-static {v5}, Lcom/xiaomi/mistatistic/sdk/controller/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_1
    invoke-static {v5}, Lcom/xiaomi/mistatistic/sdk/controller/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    iget-boolean v7, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-nez v7, :cond_4

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/BuildSetting;->isInternationalBuild()Z

    move-result v7

    if-nez v7, :cond_3

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/t;->c()Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_2

    :cond_2
    const/4 v7, 0x1

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v7, 0x2

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    :goto_3
    const-string v10, "channel"

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->d()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v10, "device_id"

    invoke-interface {v4, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v10, "id_type"

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "policy"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "interval"

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "RDUJ"

    const-string v10, "upload policy:%d, upload interval:%d, mistat upload version:%d, upload %d events."

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v11, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v11, v9

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v11, v8

    const/4 v2, 0x3

    iget v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->c:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v11, v2

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->e()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "version"

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    const-string v2, "RDUJ"

    const-string v3, "stat_value:%s"

    new-array v7, v9, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b:Ljava/lang/String;

    aput-object v8, v7, v0

    invoke-static {v3, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->b()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->c()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3, v5}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->c()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->b()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v5, v3, v7}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b:Ljava/lang/String;

    invoke-static {v5, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "stat_value"

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "mistatv"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size"

    iget v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->c:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;)V

    invoke-static {v6, v4, v1}, Lcom/xiaomi/mistatistic/sdk/controller/l;->a(Ljava/lang/String;Ljava/util/Map;Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v1

    const-string v2, "RDUJ"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RemoteDataUploadJob exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->a:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->b:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c;->e:Z

    invoke-interface {v1, v0, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;->a(ZLjava/lang/String;Z)V

    :goto_4
    return-void
.end method

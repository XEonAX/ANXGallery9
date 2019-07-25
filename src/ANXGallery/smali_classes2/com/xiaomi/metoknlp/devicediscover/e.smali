.class final Lcom/xiaomi/metoknlp/devicediscover/e;
.super Ljava/lang/Object;
.source "DeviceInfo.java"


# instance fields
.field private final A:J

.field private final B:Ljava/lang/String;

.field private final C:Ljava/lang/String;

.field private final D:Ljava/util/List;

.field private final r:Ljava/lang/String;

.field private final s:Ljava/lang/String;

.field private final t:Ljava/lang/String;

.field private final u:Ljava/lang/String;

.field private final v:D

.field private final w:D

.field private final x:Ljava/lang/String;

.field private final y:Ljava/lang/String;

.field private final z:J


# direct methods
.method private constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/c;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->a(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->r:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->b(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->s:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->c(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->t:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->d(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->u:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->e(Lcom/xiaomi/metoknlp/devicediscover/c;)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->v:D

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->f(Lcom/xiaomi/metoknlp/devicediscover/c;)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->w:D

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->g(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->x:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->h(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->y:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->i(Lcom/xiaomi/metoknlp/devicediscover/c;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->z:J

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->j(Lcom/xiaomi/metoknlp/devicediscover/c;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->A:J

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->k(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->B:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->l(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->C:Ljava/lang/String;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/c;->m(Lcom/xiaomi/metoknlp/devicediscover/c;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->D:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/c;Lcom/xiaomi/metoknlp/devicediscover/h;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/metoknlp/devicediscover/e;-><init>(Lcom/xiaomi/metoknlp/devicediscover/c;)V

    return-void
.end method

.method private a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    if-eqz p1, :cond_3

    if-nez p3, :cond_0

    goto :goto_1

    :cond_0
    instance-of v0, p3, Ljava/lang/String;

    if-eqz v0, :cond_1

    move-object v0, p3

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    :try_start_0
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    :goto_0
    return-void

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public y()Lorg/json/JSONObject;
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "m"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->r:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "i"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->s:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "a"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->t:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "o"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->u:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "lg"

    iget-wide v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->v:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "lt"

    iget-wide v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->w:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "am"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->x:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "as"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->y:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "ast"

    iget-wide v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->z:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "ad"

    iget-wide v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->A:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "ds"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->B:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "dm"

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->C:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iget-object v2, p0, Lcom/xiaomi/metoknlp/devicediscover/e;->D:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    const-string v2, "devices"

    invoke-direct {p0, v0, v2, v1}, Lcom/xiaomi/metoknlp/devicediscover/e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

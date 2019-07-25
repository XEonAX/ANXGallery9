.class public final Lcom/xiaomi/metoknlp/b;
.super Ljava/lang/Object;
.source "CloudClient.java"


# static fields
.field private static G:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    invoke-static {}, Lcom/xiaomi/metoknlp/a/f;->Z()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/metoknlp/b;->w()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v0, "/base/profile"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "/"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "metoknlpsdk"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "/"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, "/"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, "__"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lcom/xiaomi/metoknlp/b;->x()Ljava/util/Map;

    move-result-object p1

    :try_start_0
    invoke-static {p0, p1}, Lcom/xiaomi/metoknlp/a/b;->a(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object p0, v2

    :goto_0
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    return-object p0
.end method

.method private static w()Ljava/lang/String;
    .locals 8

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->getDeviceModel()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->V()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->X()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->getMcc()I

    move-result v3

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->getMnc()I

    move-result v4

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    if-ltz v3, :cond_1

    if-gez v4, :cond_2

    :cond_1
    const/16 v3, 0x3e7

    const/16 v4, 0x63

    :cond_2
    const-string v5, "%s__%s__%d__%d__%s"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v0

    const/4 v0, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v0

    const/4 v0, 0x4

    aput-object v2, v6, v0

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static x()Ljava/util/Map;
    .locals 5

    invoke-static {}, Lcom/xiaomi/metoknlp/b;->w()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Lcom/xiaomi/metoknlp/b;->G:Ljava/lang/String;

    if-nez v2, :cond_3

    invoke-static {}, Lcom/xiaomi/metoknlp/a/e;->getImei()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v2}, Lcom/xiaomi/metoknlp/a/e;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    sput-object v2, Lcom/xiaomi/metoknlp/b;->G:Ljava/lang/String;

    :cond_1
    sget-object v2, Lcom/xiaomi/metoknlp/b;->G:Ljava/lang/String;

    if-nez v2, :cond_3

    return-object v3

    :cond_2
    :goto_0
    return-object v3

    :cond_3
    const-string v2, "CCPVER"

    sget-object v3, Lcom/xiaomi/metoknlp/b;->G:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "CCPINF"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1
.end method

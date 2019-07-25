.class Lcom/xiaomi/mistatistic/sdk/URLStatsRecorder$a;
.super Ljava/net/URLStreamHandler;
.source "URLStatsRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mistatistic/sdk/URLStatsRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/net/URLStreamHandler;


# direct methods
.method public constructor <init>(Ljava/net/URLStreamHandler;)V
    .locals 0

    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/URLStatsRecorder$a;->a:Ljava/net/URLStreamHandler;

    return-void
.end method


# virtual methods
.method protected openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-class v2, Ljava/net/URLStreamHandler;

    const-string v3, "openConnection"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/net/URL;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/URLStatsRecorder$a;->a:Ljava/net/URLStreamHandler;

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v7

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URLConnection;

    instance-of v3, v2, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v3, :cond_0

    new-instance v3, Lcom/xiaomi/mistatistic/sdk/network/d;

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v3, v2}, Lcom/xiaomi/mistatistic/sdk/network/d;-><init>(Ljavax/net/ssl/HttpsURLConnection;)V

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/mistatistic/sdk/network/d;->a(J)V

    return-object v3

    :cond_0
    instance-of v3, v2, Ljava/net/HttpURLConnection;

    if-eqz v3, :cond_1

    new-instance v3, Lcom/xiaomi/mistatistic/sdk/network/c;

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-direct {v3, v2}, Lcom/xiaomi/mistatistic/sdk/network/c;-><init>(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/mistatistic/sdk/network/c;->a(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :cond_1
    return-object v2

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a()Lcom/xiaomi/mistatistic/sdk/controller/i;

    move-result-object v1

    new-instance v2, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p1, v0}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a(Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;)V

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
.end method

.method protected openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-class v2, Ljava/net/URLStreamHandler;

    const-string v3, "openConnection"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/net/URL;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-class v6, Ljava/net/Proxy;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/URLStatsRecorder$a;->a:Ljava/net/URLStreamHandler;

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v7

    aput-object p2, v4, v8

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/net/URLConnection;

    instance-of v2, p2, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_0

    new-instance v2, Lcom/xiaomi/mistatistic/sdk/network/d;

    check-cast p2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v2, p2}, Lcom/xiaomi/mistatistic/sdk/network/d;-><init>(Ljavax/net/ssl/HttpsURLConnection;)V

    invoke-virtual {v2, v0, v1}, Lcom/xiaomi/mistatistic/sdk/network/d;->a(J)V

    return-object v2

    :cond_0
    instance-of v2, p2, Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_1

    new-instance v2, Lcom/xiaomi/mistatistic/sdk/network/c;

    check-cast p2, Ljava/net/HttpURLConnection;

    invoke-direct {v2, p2}, Lcom/xiaomi/mistatistic/sdk/network/c;-><init>(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2, v0, v1}, Lcom/xiaomi/mistatistic/sdk/network/c;->a(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :cond_1
    return-object p2

    :catch_0
    move-exception p2

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a()Lcom/xiaomi/mistatistic/sdk/controller/i;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/i;->a(Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;)V

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
.end method

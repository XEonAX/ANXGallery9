.class Lcom/xiaomi/metoknlp/devicediscover/d;
.super Ljava/lang/Object;
.source "Scanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private E:Ljava/lang/String;

.field final synthetic F:Lcom/xiaomi/metoknlp/devicediscover/l;


# direct methods
.method public constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/l;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/d;->F:Lcom/xiaomi/metoknlp/devicediscover/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/xiaomi/metoknlp/devicediscover/d;->E:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/d;->E:Ljava/lang/String;

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Ljava/net/InetAddress;->isReachable(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.class public Lcom/xiaomi/smack/ConnectionConfiguration;
.super Ljava/lang/Object;
.source "ConnectionConfiguration.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final XMPP_SERVER_HOST_ONEBOX:Ljava/lang/String;

.field public static XMPP_SERVER_HOST_T:Ljava/lang/String; = "wcc-ml-test10.bj"

.field public static xmppHost:Ljava/lang/String;


# instance fields
.field private connectionPoint:Ljava/lang/String;

.field private debuggerEnabled:Z

.field private host:Ljava/lang/String;

.field private httpProxy:Lcom/xiaomi/smack/HttpRequestProxy;

.field private port:I

.field private reconnectionAllowed:Z

.field private serviceName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/DebugSwitch;->sOneboxServerHost:Ljava/lang/String;

    sput-object v0, Lcom/xiaomi/smack/ConnectionConfiguration;->XMPP_SERVER_HOST_ONEBOX:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/xiaomi/smack/ConnectionConfiguration;->xmppHost:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Lcom/xiaomi/smack/HttpRequestProxy;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-boolean v0, Lcom/xiaomi/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->debuggerEnabled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/smack/ConnectionConfiguration;->init(Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V

    return-void
.end method

.method public static final getXmppServerHost()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/smack/ConnectionConfiguration;->xmppHost:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/smack/ConnectionConfiguration;->xmppHost:Ljava/lang/String;

    return-object v0

    :cond_0
    invoke-static {}, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsSandBoxBuild()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "sandbox.xmpush.xiaomi.com"

    return-object v0

    :cond_1
    invoke-static {}, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsOneBoxBuild()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/xiaomi/smack/ConnectionConfiguration;->XMPP_SERVER_HOST_ONEBOX:Ljava/lang/String;

    return-object v0

    :cond_2
    const-string v0, "app.chat.xiaomi.net"

    return-object v0
.end method

.method private init(Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Lcom/xiaomi/smack/HttpRequestProxy;",
            ")V"
        }
    .end annotation

    iput p2, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->port:I

    iput-object p3, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->httpProxy:Lcom/xiaomi/smack/HttpRequestProxy;

    return-void
.end method

.method public static final setXmppServerHost(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/xiaomi/smack/ConnectionConfiguration;->xmppHost:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getConnectionBlob()[B
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getConnectionPoint()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->connectionPoint:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/xiaomi/smack/ConnectionConfiguration;->getXmppServerHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->port:I

    return v0
.end method

.method public isDebuggerEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->debuggerEnabled:Z

    return v0
.end method

.method public setConnectionPoint(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->connectionPoint:Ljava/lang/String;

    return-void
.end method

.method public setDebuggerEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->debuggerEnabled:Z

    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    return-void
.end method

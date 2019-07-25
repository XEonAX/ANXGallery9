.class Lcom/xiaomi/smack/SocketConnection$1;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "SocketConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/smack/SocketConnection;->ping(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/smack/SocketConnection;

.field final synthetic val$current:J


# direct methods
.method constructor <init>(Lcom/xiaomi/smack/SocketConnection;IJ)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/smack/SocketConnection$1;->this$0:Lcom/xiaomi/smack/SocketConnection;

    iput-wide p3, p0, Lcom/xiaomi/smack/SocketConnection$1;->val$current:J

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "check the ping-pong."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/smack/SocketConnection$1;->val$current:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public process()V
    .locals 3

    invoke-static {}, Ljava/lang/Thread;->yield()V

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection$1;->this$0:Lcom/xiaomi/smack/SocketConnection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/SocketConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection$1;->this$0:Lcom/xiaomi/smack/SocketConnection;

    iget-wide v1, p0, Lcom/xiaomi/smack/SocketConnection$1;->val$current:J

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/smack/SocketConnection;->isReadAlive(J)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection$1;->this$0:Lcom/xiaomi/smack/SocketConnection;

    iget-object v0, v0, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    const/16 v1, 0x16

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    :cond_0
    return-void
.end method

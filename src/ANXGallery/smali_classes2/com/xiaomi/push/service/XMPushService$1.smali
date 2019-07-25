.class Lcom/xiaomi/push/service/XMPushService$1;
.super Ljava/lang/Object;
.source "XMPushService.java"

# interfaces
.implements Lcom/xiaomi/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$1;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcom/xiaomi/slim/Blob;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$1;->this$0:Lcom/xiaomi/push/service/XMPushService;

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$BlobReceiveJob;

    iget-object v2, p0, Lcom/xiaomi/push/service/XMPushService$1;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {v1, v2, p1}, Lcom/xiaomi/push/service/XMPushService$BlobReceiveJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/slim/Blob;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    return-void
.end method

.method public processPacket(Lcom/xiaomi/smack/packet/Packet;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$1;->this$0:Lcom/xiaomi/push/service/XMPushService;

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$PacketReceiveJob;

    iget-object v2, p0, Lcom/xiaomi/push/service/XMPushService$1;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {v1, v2, p1}, Lcom/xiaomi/push/service/XMPushService$PacketReceiveJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/packet/Packet;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    return-void
.end method

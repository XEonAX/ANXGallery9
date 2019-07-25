.class public Lcom/xiaomi/push/service/PacketHelper;
.super Ljava/lang/Object;
.source "PacketHelper.java"


# static fields
.field private static prefix:Ljava/lang/String; = ""

.field private static sCurMsgId:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static generatePacketID()Ljava/lang/String;
    .locals 5

    sget-object v0, Lcom/xiaomi/push/service/PacketHelper;->prefix:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/string/XMStringUtils;->generateRandomString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/push/service/PacketHelper;->prefix:Ljava/lang/String;

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/xiaomi/push/service/PacketHelper;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v1, Lcom/xiaomi/push/service/PacketHelper;->sCurMsgId:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    sput-wide v3, Lcom/xiaomi/push/service/PacketHelper;->sCurMsgId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

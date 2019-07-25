.class public Lcom/xiaomi/measite/smack/AndroidDebugger;
.super Ljava/lang/Object;
.source "AndroidDebugger.java"

# interfaces
.implements Lcom/xiaomi/smack/debugger/SmackDebugger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;
    }
.end annotation


# static fields
.field public static printInterpreted:Z


# instance fields
.field private final TAG:Ljava/lang/String;

.field private connListener:Lcom/xiaomi/smack/ConnectionListener;

.field private connection:Lcom/xiaomi/smack/Connection;

.field private dateFormatter:Ljava/text/SimpleDateFormat;

.field private readListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

.field private writeListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/SystemUtils;->getMIUIType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    sput-boolean v1, Lcom/xiaomi/measite/smack/AndroidDebugger;->printInterpreted:Z

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/smack/Connection;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm:ss aaa"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connection:Lcom/xiaomi/smack/Connection;

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->readListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->writeListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connListener:Lcom/xiaomi/smack/ConnectionListener;

    const-string v0, "[Slim] "

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connection:Lcom/xiaomi/smack/Connection;

    invoke-direct {p0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->createDebug()V

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/measite/smack/AndroidDebugger;)Ljava/text/SimpleDateFormat;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/measite/smack/AndroidDebugger;)Lcom/xiaomi/smack/Connection;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connection:Lcom/xiaomi/smack/Connection;

    return-object p0
.end method

.method private createDebug()V
    .locals 3

    new-instance v0, Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;-><init>(Lcom/xiaomi/measite/smack/AndroidDebugger;Z)V

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->readListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    new-instance v0, Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;-><init>(Lcom/xiaomi/measite/smack/AndroidDebugger;Z)V

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->writeListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connection:Lcom/xiaomi/smack/Connection;

    iget-object v1, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->readListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    iget-object v2, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->readListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/smack/Connection;->addPacketListener(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connection:Lcom/xiaomi/smack/Connection;

    iget-object v1, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->writeListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    iget-object v2, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->writeListener:Lcom/xiaomi/measite/smack/AndroidDebugger$Listener;

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/smack/Connection;->addPacketSendingListener(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V

    new-instance v0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/measite/smack/AndroidDebugger$1;-><init>(Lcom/xiaomi/measite/smack/AndroidDebugger;)V

    iput-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger;->connListener:Lcom/xiaomi/smack/ConnectionListener;

    return-void
.end method

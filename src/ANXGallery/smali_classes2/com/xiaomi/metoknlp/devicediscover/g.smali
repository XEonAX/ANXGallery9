.class Lcom/xiaomi/metoknlp/devicediscover/g;
.super Ljava/lang/Object;
.source "DiscoverService.java"

# interfaces
.implements Lcom/xiaomi/metoknlp/devicediscover/o;


# instance fields
.field private M:Ljava/lang/String;

.field private N:J

.field final synthetic a:Lcom/xiaomi/metoknlp/devicediscover/m;

.field private mDuration:J


# direct methods
.method private constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/m;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->a:Lcom/xiaomi/metoknlp/devicediscover/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/m;Lcom/xiaomi/metoknlp/devicediscover/a;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/metoknlp/devicediscover/g;-><init>(Lcom/xiaomi/metoknlp/devicediscover/m;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;JJ)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->M:Ljava/lang/String;

    iput-wide p2, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->N:J

    iput-wide p4, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->mDuration:J

    iget-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->a:Lcom/xiaomi/metoknlp/devicediscover/m;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/m;->d(Lcom/xiaomi/metoknlp/devicediscover/m;)Landroid/os/Handler;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->mDuration:J

    return-wide v0
.end method

.method public getStart()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/g;->N:J

    return-wide v0
.end method

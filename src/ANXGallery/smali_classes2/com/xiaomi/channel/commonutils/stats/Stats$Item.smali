.class public Lcom/xiaomi/channel/commonutils/stats/Stats$Item;
.super Ljava/lang/Object;
.source "Stats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/channel/commonutils/stats/Stats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# static fields
.field private static final sStats:Lcom/xiaomi/channel/commonutils/stats/Stats;


# instance fields
.field public annotation:Ljava/lang/String;

.field public key:I

.field public obj:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/xiaomi/channel/commonutils/stats/Stats;

    invoke-direct {v0}, Lcom/xiaomi/channel/commonutils/stats/Stats;-><init>()V

    sput-object v0, Lcom/xiaomi/channel/commonutils/stats/Stats$Item;->sStats:Lcom/xiaomi/channel/commonutils/stats/Stats;

    return-void
.end method

.method constructor <init>(ILjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/xiaomi/channel/commonutils/stats/Stats$Item;->key:I

    iput-object p2, p0, Lcom/xiaomi/channel/commonutils/stats/Stats$Item;->obj:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000()Lcom/xiaomi/channel/commonutils/stats/Stats;
    .locals 1

    sget-object v0, Lcom/xiaomi/channel/commonutils/stats/Stats$Item;->sStats:Lcom/xiaomi/channel/commonutils/stats/Stats;

    return-object v0
.end method

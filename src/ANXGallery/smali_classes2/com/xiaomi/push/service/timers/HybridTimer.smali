.class Lcom/xiaomi/push/service/timers/HybridTimer;
.super Lcom/xiaomi/push/service/timers/AlarmManagerTimer;
.source "HybridTimer.java"


# static fields
.field private static pingInterval:I = 0x36ee80


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/timers/AlarmManagerTimer;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method getPingInteval()J
    .locals 2

    sget v0, Lcom/xiaomi/push/service/timers/HybridTimer;->pingInterval:I

    int-to-long v0, v0

    return-wide v0
.end method

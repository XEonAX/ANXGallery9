.class public Lcom/miui/gallery/cloud/control/BatteryMonitor$Holder;
.super Ljava/lang/Object;
.source "BatteryMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/control/BatteryMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Holder"
.end annotation


# static fields
.field private static final sInstance:Lcom/miui/gallery/cloud/control/BatteryMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloud/control/BatteryMonitor;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/control/BatteryMonitor$Holder;->sInstance:Lcom/miui/gallery/cloud/control/BatteryMonitor;

    return-void
.end method

.method static synthetic access$000()Lcom/miui/gallery/cloud/control/BatteryMonitor;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/control/BatteryMonitor$Holder;->sInstance:Lcom/miui/gallery/cloud/control/BatteryMonitor;

    return-object v0
.end method

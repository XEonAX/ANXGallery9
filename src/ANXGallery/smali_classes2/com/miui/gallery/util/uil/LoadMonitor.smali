.class public Lcom/miui/gallery/util/uil/LoadMonitor;
.super Ljava/lang/Object;
.source "LoadMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;
    }
.end annotation


# static fields
.field private static final RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    sput-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    sget-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    new-instance v7, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x4

    const v5, 0xc3500

    const v6, 0x16e360

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;-><init>(IZIII)V

    const/4 v1, 0x0

    aput-object v7, v0, v1

    sget-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    new-instance v7, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    const/4 v2, 0x1

    const/4 v4, 0x1

    const v5, 0x7a1200

    const v6, 0xf42400

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;-><init>(IZIII)V

    const/4 v1, 0x1

    aput-object v7, v0, v1

    return-void
.end method

.method public static isSyncLoadMicro()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->isSync()Z

    move-result v0

    return v0
.end method

.method public static isSyncLoadThumb()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->isSync()Z

    move-result v0

    return v0
.end method

.method public static record(IJ)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/uil/LoadMonitor;->RECORDERS:[Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;

    aget-object p0, v0, p0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->record(J)V

    return-void
.end method

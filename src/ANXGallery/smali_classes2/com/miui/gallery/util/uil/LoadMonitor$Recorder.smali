.class Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;
.super Ljava/lang/Object;
.source "LoadMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/LoadMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Recorder"
.end annotation


# static fields
.field private static final TIME_FORMAT:Ljava/text/DecimalFormat;


# instance fields
.field private final mAssertLine:I

.field private final mBadLine:I

.field private mCount:I

.field private final mFrequency:I

.field private final mGoodLine:I

.field private volatile mIsSync:Z

.field private mSum:J

.field private final mType:I

.field private mWarnCount:I

.field private final mWarnLine:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#.00"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->TIME_FORMAT:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(IZIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mType:I

    iput-boolean p2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mIsSync:Z

    iput p3, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mFrequency:I

    iput p4, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mGoodLine:I

    iput p5, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mBadLine:I

    iget p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mBadLine:I

    mul-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnLine:I

    iget p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mBadLine:I

    mul-int/lit8 p1, p1, 0x5

    iput p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mAssertLine:I

    return-void
.end method

.method private resetValues()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mCount:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mSum:J

    return-void
.end method

.method private setAsync(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mIsSync:Z

    iput v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnCount:I

    const-string v0, "LoadMonitor"

    const-string v1, "%s sync->async | %s"

    iget v2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private setSync()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mIsSync:Z

    const-string v0, "LoadMonitor"

    const-string v1, "%s async->sync"

    iget v2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public isSync()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mIsSync:Z

    return v0
.end method

.method public declared-synchronized record(J)V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mIsSync:Z

    if-eqz v0, :cond_2

    iget v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mAssertLine:I

    int-to-long v1, v1

    cmp-long v3, p1, v1

    if-lez v3, :cond_0

    const-string p1, "assert"

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->setAsync(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->resetValues()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnLine:I

    int-to-long v1, v1

    cmp-long v3, p1, v1

    if-lez v3, :cond_1

    iget v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnCount:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    const-string p1, "warnings"

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->setAsync(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->resetValues()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    const/4 v1, 0x0

    :try_start_2
    iput v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mWarnCount:I

    :cond_2
    if-eqz v0, :cond_3

    iget v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mBadLine:I

    goto :goto_0

    :cond_3
    iget v1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mGoodLine:I

    :goto_0
    iget-wide v2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mSum:J

    int-to-long v4, v1

    sub-long/2addr p1, v4

    add-long/2addr v2, p1

    iput-wide v2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mSum:J

    iget p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mCount:I

    iget p2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mFrequency:I

    if-ne p1, p2, :cond_6

    iget-wide p1, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mSum:J

    iget v2, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mFrequency:I

    int-to-long v2, v2

    div-long/2addr p1, v2

    const-string v2, "LoadMonitor"

    const-string v3, "%s average: %s+ %s nanos"

    iget v4, p0, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->mType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v2, v3, v4, v1, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_4

    cmp-long v0, p1, v1

    if-lez v0, :cond_5

    const-string p1, "avg"

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->setAsync(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    cmp-long v0, p1, v1

    if-gez v0, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->setSync()V

    :cond_5
    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/LoadMonitor$Recorder;->resetValues()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_6
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

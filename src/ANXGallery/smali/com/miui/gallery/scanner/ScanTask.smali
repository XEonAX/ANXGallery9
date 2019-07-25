.class public abstract Lcom/miui/gallery/scanner/ScanTask;
.super Ljava/lang/Object;
.source "ScanTask.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/scanner/ScanTask;",
        ">;"
    }
.end annotation


# instance fields
.field private final mForceScan:Z

.field private final mForeground:Z

.field private final mNewTime:J

.field private final mPriority:I


# direct methods
.method public constructor <init>(IZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mNewTime:J

    iput p1, p0, Lcom/miui/gallery/scanner/ScanTask;->mPriority:I

    iput-boolean p2, p0, Lcom/miui/gallery/scanner/ScanTask;->mForeground:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/scanner/ScanTask;->mForceScan:Z

    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mNewTime:J

    iput p1, p0, Lcom/miui/gallery/scanner/ScanTask;->mPriority:I

    iput-boolean p2, p0, Lcom/miui/gallery/scanner/ScanTask;->mForeground:Z

    iput-boolean p3, p0, Lcom/miui/gallery/scanner/ScanTask;->mForceScan:Z

    return-void
.end method


# virtual methods
.method protected canRunningInBackground()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public compareTo(Lcom/miui/gallery/scanner/ScanTask;)I
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    if-ne p0, p1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mPriority:I

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v1

    sub-int/2addr v0, v1

    if-nez v0, :cond_2

    iget-wide v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mNewTime:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/ScanTask;->getNewTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    :cond_2
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/ScanTask;->compareTo(Lcom/miui/gallery/scanner/ScanTask;)I

    move-result p1

    return p1
.end method

.method public getNewTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mNewTime:J

    return-wide v0
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mPriority:I

    return v0
.end method

.method public isForceScan()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mForceScan:Z

    return v0
.end method

.method public isForeground()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/scanner/ScanTask;->mForeground:Z

    return v0
.end method

.class public Lcom/nexstreaming/app/common/util/l;
.super Ljava/lang/Object;
.source "Stopwatch.java"


# instance fields
.field private a:J

.field private b:J

.field private c:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->a:J

    :cond_0
    return-void
.end method

.method public b()V
    .locals 6

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    iget-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->b:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/nexstreaming/app/common/util/l;->a:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->b:J

    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->b:J

    return-void
.end method

.method public d()J
    .locals 6

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/l;->c:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->b:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/nexstreaming/app/common/util/l;->a:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/nexstreaming/app/common/util/l;->b:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/util/l;->d()J

    move-result-wide v0

    const-string v2, "%1$,.3f"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    long-to-double v0, v0

    const-wide v4, 0x412e848000000000L    # 1000000.0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

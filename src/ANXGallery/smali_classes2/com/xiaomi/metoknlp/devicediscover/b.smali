.class public Lcom/xiaomi/metoknlp/devicediscover/b;
.super Ljava/lang/Object;
.source "WifiCampStatistics.java"


# instance fields
.field private b:Ljava/lang/String;

.field private c:J

.field private d:J

.field private e:J

.field private mContext:Landroid/content/Context;

.field private mDuration:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->reset()V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    return-object v0
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->save()V

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->reset()V

    invoke-virtual {p0, p1}, Lcom/xiaomi/metoknlp/devicediscover/b;->b(Ljava/lang/String;)V

    return-void
.end method

.method public b()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    return-wide v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mContext:Landroid/content/Context;

    const-string v1, "none"

    invoke-static {v0, p1, v1}, Lcom/xiaomi/metoknlp/devicediscover/i;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "none"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    const/4 p1, 0x1

    aget-object p1, v0, p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    const/4 p1, 0x2

    aget-object p1, v0, p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    const/4 p1, 0x3

    aget-object p1, v0, p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->d:J

    const/4 p1, 0x4

    aget-object p1, v0, p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->reset()V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->d:J

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    return-void
.end method

.method public c()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J

    return-wide v0
.end method

.method public d()V
    .locals 6

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    return-void
.end method

.method public e()V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J

    return-void
.end method

.method public f()V
    .locals 0

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->d()V

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->save()V

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->reset()V

    return-void
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    return-wide v0
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->d:J

    iput-wide v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J

    return-void
.end method

.method public save()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/devicediscover/b;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/xiaomi/metoknlp/devicediscover/i;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->c:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->mDuration:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->d:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/metoknlp/devicediscover/b;->e:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

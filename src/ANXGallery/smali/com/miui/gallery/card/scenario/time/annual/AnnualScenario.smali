.class public abstract Lcom/miui/gallery/card/scenario/time/annual/AnnualScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "AnnualScenario.java"


# direct methods
.method public constructor <init>(I)V
    .locals 2

    const/16 v0, 0x8

    const/4 v1, 0x7

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    return-void
.end method


# virtual methods
.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;)Z"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getEndDayOfYearTime(J)J

    move-result-wide v2

    const-wide/32 v4, 0xa4cb800

    sub-long v4, v2, v4

    cmp-long v6, v0, v4

    if-lez v6, :cond_0

    const-wide/32 v4, 0x5265c00

    add-long/2addr v2, v4

    cmp-long v6, v0, v2

    if-gez v6, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getFirstDayOfYearTime(J)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/annual/AnnualScenario;->setStartTime(J)V

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getEndDayOfYearTime(J)J

    move-result-wide p1

    add-long/2addr p1, v4

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/annual/AnnualScenario;->setEndTime(J)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

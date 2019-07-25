.class public abstract Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "YesterdayScenario.java"


# instance fields
.field private final mTags:[Ljava/lang/Integer;


# direct methods
.method public constructor <init>(I[Ljava/lang/Integer;)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x6

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->mTags:[Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/card/scenario/Record;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public loadMediaItem()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->mTags:[Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getStartTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getEndTime()J

    move-result-wide v4

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getCameraMediaIdsByStartEndTimeTags([Ljava/lang/Integer;JJ)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getEventStartEndTime(Ljava/util/List;)[J

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-wide v1, v0, v1

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->setStartTime(J)V

    const/4 v1, 0x1

    aget-wide v1, v0, v1

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->setEndTime(J)V

    invoke-super {p0}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->getRecordTargetTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const-wide/32 v2, 0x5265c00

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->setTargetTime(J)V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->setStartTime(J)V

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;->setEndTime(J)V

    const/4 p1, 0x1

    return p1
.end method

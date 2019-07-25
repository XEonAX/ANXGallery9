.class public abstract Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "DayOfLastYearScenario.java"


# instance fields
.field private final mMaxYear:I

.field private final mTags:[Ljava/lang/Integer;

.field private mYear:I


# direct methods
.method public constructor <init>(II[Ljava/lang/Integer;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x7

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mYear:I

    if-lez p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    iput p2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mMaxYear:I

    iput-object p3, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mTags:[Ljava/lang/Integer;

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

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

.method protected getPrimaryKey()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mYear:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
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

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mTags:[Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getStartTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getEndTime()J

    move-result-wide v4

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getCameraMediaIdsByStartEndTimeTags([Ljava/lang/Integer;JJ)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getEventStartEndTime(Ljava/util/List;)[J

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-wide v1, v0, v1

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->setStartTime(J)V

    const/4 v1, 0x1

    aget-wide v1, v0, v1

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->setEndTime(J)V

    invoke-super {p0}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 8
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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getRecordTargetTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v0

    const/4 p2, 0x1

    const/4 v2, 0x1

    :goto_0
    iget v3, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mMaxYear:I

    if-gt v2, v3, :cond_2

    iput v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mYear:I

    iget v3, p0, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->mYear:I

    invoke-static {v3, v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastNYearDateTime(IJ)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->setTargetTime(J)V

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->setStartTime(J)V

    const-wide/32 v5, 0x5265c00

    add-long/2addr v3, v5

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->setEndTime(J)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;->getMinImageCount()I

    move-result v4

    if-lt v3, v4, :cond_1

    return p2

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

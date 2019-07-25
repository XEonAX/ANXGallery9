.class public Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "LastWeekendScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    const/16 v0, 0x6e

    const/4 v1, 0x2

    const/4 v2, 0x6

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    return-void
.end method


# virtual methods
.method public generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 4
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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-lez p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 0
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

    const p1, 0x7f02000b

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->getRandomArrayString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 5
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

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v3, 0x7

    invoke-virtual {p2, v3}, Ljava/util/Calendar;->get(I)I

    move-result p2

    const/4 v4, 0x2

    if-ne p2, v4, :cond_1

    invoke-static {v3, v1, v2}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastWeekDayTime(IJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->setStartTime(J)V

    const-wide/32 p1, 0xa4cb800

    add-long/2addr v1, p1

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;->setEndTime(J)V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method

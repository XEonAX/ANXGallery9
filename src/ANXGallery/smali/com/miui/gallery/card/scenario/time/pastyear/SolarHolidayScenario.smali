.class public Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;
.super Lcom/miui/gallery/card/scenario/time/HolidayScenario;
.source "SolarHolidayScenario.java"


# instance fields
.field private final mHolidayConfig:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/time/HolidayConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 7

    const/4 v0, 0x7

    const/4 v1, 0x1

    const/16 v2, 0x66

    invoke-direct {p0, v2, v1, v0}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;-><init>(III)V

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const v4, 0x7fffffff

    const/16 v5, 0xc8

    invoke-direct {v3, v5, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v5, 0xc9

    invoke-direct {v3, v5, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v5, 0xca

    const/4 v6, 0x3

    invoke-direct {v3, v5, v4, v6}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v5, 0xcb

    invoke-direct {v3, v5, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v5, 0xcc

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v0}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v3, 0xcd

    invoke-direct {v2, v3, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 1
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

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getHolidayFromRecord(Lcom/miui/gallery/card/scenario/Record;Z)I

    move-result p2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getYearFromRecord(Lcom/miui/gallery/card/scenario/Record;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getHolidayNameForStory(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method protected getPrimaryKey()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getTargetTime()J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getHolidayFromTargetTime(JZ)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 10
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

    new-instance v2, Lmiui/date/Calendar;

    invoke-direct {v2}, Lmiui/date/Calendar;-><init>()V

    invoke-virtual {v2, v0, v1}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getRecordTargetTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v3, 0x1

    :goto_0
    const/16 v4, 0x8

    const/4 v5, 0x0

    if-gt v3, v4, :cond_3

    iput v3, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mYear:I

    invoke-static {v2}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getHoliday(Lmiui/date/Calendar;)I

    move-result v4

    const/4 v6, -0x1

    if-ne v4, v6, :cond_0

    return v5

    :cond_0
    iget v4, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mYear:I

    invoke-static {v4, v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastNYearDateTime(IJ)J

    move-result-wide v6

    iget-object v4, p0, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->mHolidayConfig:Ljava/util/List;

    invoke-virtual {p0, v6, v7, v4, v5}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getStartEndTime(JLjava/util/List;Z)[J

    move-result-object v4

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {p1, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    goto :goto_1

    :cond_1
    aget-wide v8, v4, v5

    invoke-virtual {p0, v8, v9}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->setStartTime(J)V

    aget-wide v8, v4, p2

    invoke-virtual {p0, v8, v9}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->setEndTime(J)V

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->setTargetTime(J)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;->getMinImageCount()I

    move-result v5

    if-lt v4, v5, :cond_2

    return p2

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return v5
.end method

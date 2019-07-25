.class public Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;
.super Lcom/miui/gallery/card/scenario/time/HolidayScenario;
.source "ChineseHolidayScenario.java"


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
    .locals 6

    const/16 v0, 0x65

    const/4 v1, 0x1

    const/4 v2, 0x7

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;-><init>(III)V

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const v4, 0x7fffffff

    const/16 v5, 0x64

    invoke-direct {v3, v5, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    invoke-direct {v3, v0, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v3, 0x66

    invoke-direct {v2, v3, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/4 v3, 0x3

    const/16 v5, 0x67

    invoke-direct {v2, v5, v4, v3}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v5, 0x68

    invoke-direct {v2, v5, v4, v1}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    const/16 v2, 0x69

    invoke-direct {v1, v2, v4, v3}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;-><init>(III)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getHolidayFromRecord(Lcom/miui/gallery/card/scenario/Record;Z)I

    move-result p2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getYearFromRecord(Lcom/miui/gallery/card/scenario/Record;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHolidayNameForStory(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method protected getPrimaryKey()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getTargetTime()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getHolidayFromTargetTime(JZ)I

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getRecordTargetTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x1

    :goto_0
    const/16 v1, 0x8

    const/4 v3, 0x0

    if-gt v0, v1, :cond_4

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mYear:I

    iget v1, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mYear:I

    invoke-static {v2, v1}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHolidayDatetimeOfPastYear(Lmiui/date/Calendar;I)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-gtz v1, :cond_0

    invoke-virtual {v2}, Lmiui/date/Calendar;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/date/Calendar;

    invoke-virtual {v2}, Lmiui/date/Calendar;->getTimeInMillis()J

    move-result-wide v4

    const-wide/32 v8, 0x5265c00

    add-long/2addr v4, v8

    invoke-virtual {v1, v4, v5}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    iget v4, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mYear:I

    invoke-static {v1, v4}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHolidayDatetimeOfPastYear(Lmiui/date/Calendar;I)J

    move-result-wide v4

    :cond_0
    cmp-long v1, v4, v6

    if-gtz v1, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->mHolidayConfig:Ljava/util/List;

    invoke-virtual {p0, v4, v5, v1, p2}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getStartEndTime(JLjava/util/List;Z)[J

    move-result-object v1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_1

    :cond_2
    aget-wide v6, v1, v3

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->setStartTime(J)V

    aget-wide v6, v1, p2

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->setEndTime(J)V

    invoke-virtual {p0, v4, v5}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->setTargetTime(J)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;->getMinImageCount()I

    move-result v3

    if-lt v1, v3, :cond_3

    return p2

    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return v3
.end method

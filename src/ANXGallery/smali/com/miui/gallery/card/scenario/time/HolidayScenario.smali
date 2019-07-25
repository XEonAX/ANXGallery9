.class public abstract Lcom/miui/gallery/card/scenario/time/HolidayScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "HolidayScenario.java"


# instance fields
.field protected mYear:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->mYear:I

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getRecordTargetTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-lez p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method protected getHolidayFromRecord(Lcom/miui/gallery/card/scenario/Record;Z)I
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getRecordTargetTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getHolidayFromTargetTime(JZ)I

    move-result p1

    return p1
.end method

.method protected getHolidayFromTargetTime(JZ)I
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    new-instance v0, Lmiui/date/Calendar;

    invoke-direct {v0}, Lmiui/date/Calendar;-><init>()V

    invoke-virtual {v0, p1, p2}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    if-eqz p3, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHoliday(Lmiui/date/Calendar;)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getHoliday(Lmiui/date/Calendar;)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method protected getPrimaryKey()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->mYear:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getStartEndTime(JLjava/util/List;Z)[J
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/time/HolidayConfig;",
            ">;Z)[J"
        }
    .end annotation

    move-object/from16 v0, p0

    const/4 v1, 0x2

    new-array v1, v1, [J

    invoke-static/range {p1 .. p2}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v2

    const/4 v4, 0x0

    aput-wide v2, v1, v4

    aget-wide v2, v1, v4

    const-wide/32 v5, 0x5265c00

    add-long/2addr v2, v5

    const/4 v7, 0x1

    aput-wide v2, v1, v7

    if-eqz p4, :cond_0

    invoke-static/range {p1 .. p2}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHoliday(J)I

    move-result v2

    goto :goto_0

    :cond_0
    invoke-static/range {p1 .. p2}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getHoliday(J)I

    move-result v2

    :goto_0
    const v3, 0x7fffffff

    invoke-static/range {p3 .. p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/card/scenario/time/HolidayConfig;

    invoke-virtual {v9}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->getHoliday()I

    move-result v10

    if-ne v10, v2, :cond_1

    invoke-virtual {v9}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->getMaxContinuousDay()I

    move-result v2

    invoke-virtual {v9}, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->getPreviousMaxDay()I

    move-result v3

    goto :goto_1

    :cond_2
    const/4 v2, 0x1

    :goto_1
    if-le v2, v7, :cond_d

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    :cond_3
    :goto_2
    add-int v12, v8, v9

    add-int/lit8 v13, v2, -0x1

    if-ge v12, v13, :cond_c

    if-eqz v10, :cond_4

    if-eqz v11, :cond_4

    if-le v8, v9, :cond_5

    :cond_4
    if-eqz v10, :cond_8

    if-nez v11, :cond_8

    :cond_5
    add-int/lit8 v8, v8, 0x1

    aget-wide v12, v1, v4

    int-to-long v14, v8

    mul-long v14, v14, v5

    sub-long/2addr v12, v14

    aget-wide v16, v1, v7

    sub-long v14, v16, v14

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getMediaIdsByStartEndTime(JJ)Ljava/util/List;

    move-result-object v12

    if-eqz v12, :cond_6

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getMinImageCount()I

    move-result v13

    if-ge v12, v13, :cond_7

    :cond_6
    add-int/lit8 v8, v8, -0x1

    const/4 v10, 0x0

    :cond_7
    if-lt v8, v3, :cond_3

    move v8, v3

    const/4 v10, 0x0

    goto :goto_2

    :cond_8
    if-eqz v10, :cond_9

    if-eqz v11, :cond_9

    if-gt v8, v9, :cond_a

    :cond_9
    if-nez v10, :cond_c

    if-eqz v11, :cond_c

    :cond_a
    add-int/lit8 v9, v9, 0x1

    aget-wide v12, v1, v4

    int-to-long v14, v9

    mul-long v14, v14, v5

    add-long/2addr v12, v14

    aget-wide v16, v1, v7

    add-long v14, v16, v14

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getMediaIdsByStartEndTime(JJ)Ljava/util/List;

    move-result-object v12

    if-eqz v12, :cond_b

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->getMinImageCount()I

    move-result v13

    if-ge v12, v13, :cond_3

    :cond_b
    add-int/lit8 v9, v9, -0x1

    const/4 v11, 0x0

    goto :goto_2

    :cond_c
    aget-wide v2, v1, v4

    int-to-long v10, v8

    mul-long v10, v10, v5

    sub-long/2addr v2, v10

    aput-wide v2, v1, v4

    aget-wide v2, v1, v7

    int-to-long v8, v9

    mul-long v8, v8, v5

    add-long/2addr v2, v8

    aput-wide v2, v1, v7

    :cond_d
    return-object v1
.end method

.method protected getYearFromRecord(Lcom/miui/gallery/card/scenario/Record;)I
    .locals 3

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Record;->getPrimaryKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/HolidayScenario;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get year of record error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

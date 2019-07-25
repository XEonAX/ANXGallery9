.class public Lcom/miui/gallery/card/scenario/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# direct methods
.method public static getCurrentTimeMillis()J
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getDateFormat(J)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDatePeriodGraceful(JJ)Ljava/lang/String;
    .locals 9

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->isSameDay(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_8

    cmp-long v0, p2, p0

    if-lez v0, :cond_8

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->isSameYear(JJ)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->isSameMonth(JJ)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    new-instance v5, Ljava/util/Locale;

    const-string v6, "zh"

    invoke-direct {v5, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x2

    const v7, 0x7f1000e4

    if-eqz v5, :cond_4

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    if-eqz v4, :cond_2

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDayLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    if-eqz v1, :cond_3

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthDayLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_4
    new-instance v5, Ljava/util/Locale;

    const-string v8, "en"

    invoke-direct {v5, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    if-eqz v4, :cond_5

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDayLocale(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearLocale(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_5
    if-eqz v1, :cond_6

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_6
    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p1

    :goto_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    new-array p3, v6, [Ljava/lang/Object;

    aput-object p0, p3, v3

    aput-object p1, p3, v2

    invoke-virtual {p2, v7, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_7
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v3

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthDayLocale(J)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v2

    invoke-virtual {v0, v7, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8
    const-string p0, ""

    return-object p0
.end method

.method public static getDateTime(J)J
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x0

    const/16 p1, 0xb

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getDayLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x80

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getEndDayOfYearTime(J)J
    .locals 2

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 p0, 0xb

    const/4 p1, 0x2

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x5

    const/16 v1, 0x1f

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getFirstDayOfMonthTime(J)J
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x5

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p0, 0x0

    const/16 p1, 0xb

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getFirstDayOfYearTime(J)J
    .locals 2

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x0

    const/4 p1, 0x2

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x5

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xb

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getLastDayEndOfMonthTime(J)J
    .locals 5

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    const/4 v1, 0x5

    const/16 v2, 0xb

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p1, v2, :cond_0

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/2addr p1, v4

    invoke-virtual {v0, v4, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, p0, v3}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v1, v4}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    :cond_0
    add-int/2addr p1, v4

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v1, v4}, Ljava/util/Calendar;->set(II)V

    :goto_0
    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, v3}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, v3}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, v3}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getLastNYearDateTime(IJ)J
    .locals 3

    const/4 v0, 0x1

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x5

    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p2

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    sub-int/2addr v2, p0

    invoke-virtual {v1, v0, v2}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xb

    const/4 v0, 0x0

    invoke-virtual {v1, p0, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v1, p0, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v1, p0, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v1, p0, v0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p0

    if-eq p2, p0, :cond_1

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_1
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method private static getLastNYearMonthTime(IIZ)J
    .locals 5

    const/4 v0, 0x0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    :cond_1
    const/16 v1, 0xb

    if-le p1, v1, :cond_2

    const/16 p1, 0xb

    :cond_2
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int/2addr v4, p0

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/4 p0, 0x5

    const/4 v4, 0x2

    if-eqz p2, :cond_3

    invoke-virtual {v2, v4, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2, p0, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    :cond_3
    if-ne p1, v1, :cond_4

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/2addr p1, v3

    invoke-virtual {v2, v3, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2, v4, v0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2, p0, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    :cond_4
    add-int/2addr p1, v3

    invoke-virtual {v2, v4, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2, p0, v3}, Ljava/util/Calendar;->set(II)V

    :goto_0
    invoke-virtual {v2, v1, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v2, p0, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v2, p0, v0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v2, p0, v0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getLastNYearMonthTime(IJZ)J
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x2

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    :try_start_0
    invoke-static {p0, p1, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastNYearMonthTime(IIZ)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    move-exception p0

    const-string p1, "DateUtils"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "getLastNYearMonthTime fail:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public static getLastWeekDayTime(IJ)J
    .locals 3

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const-wide/32 v1, 0x240c8400

    sub-long/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x7

    const/4 p2, 0x1

    if-lt p0, p2, :cond_0

    if-le p0, p1, :cond_1

    :cond_0
    const/4 p0, 0x7

    :cond_1
    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xb

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getMonth(J)I
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    return p0
.end method

.method public static getMonthDayLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x180

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMonthLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x100

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMonthPeriodGraceful(JJ)Ljava/lang/String;
    .locals 8

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->isSameMonth(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_5

    cmp-long v0, p2, p0

    if-lez v0, :cond_5

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->isSameYear(JJ)Z

    move-result v1

    new-instance v2, Ljava/util/Locale;

    const-string v3, "zh"

    invoke-direct {v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    const v6, 0x7f1000e4

    if-eqz v2, :cond_2

    if-eqz v1, :cond_1

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/util/Locale;

    const-string v7, "en"

    invoke-direct {v2, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz v1, :cond_3

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_3
    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    new-array p3, v5, [Ljava/lang/Object;

    aput-object p0, p3, v4

    aput-object p1, p3, v3

    invoke-virtual {p2, v6, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v4

    invoke-static {p2, p3}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v3

    invoke-virtual {v0, v6, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    const-string p0, ""

    return-object p0
.end method

.method public static getNextMonthTime(J)J
    .locals 3

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    const/4 v1, 0x1

    const/16 v2, 0xb

    if-ge p1, v2, :cond_0

    add-int/2addr p1, v1

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/2addr p1, v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    :goto_0
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static getSeason(J)I
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    packed-switch p1, :pswitch_data_0

    const/4 p0, 0x3

    return p0

    :pswitch_0
    return p0

    :pswitch_1
    const/4 p0, 0x1

    return p0

    :pswitch_2
    const/4 p0, 0x0

    return p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getSeasonEndTime(J)J
    .locals 3

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :pswitch_1
    const/16 p1, 0xa

    goto :goto_1

    :pswitch_2
    const/4 p1, 0x7

    goto :goto_1

    :pswitch_3
    const/4 p1, 0x4

    goto :goto_1

    :goto_0
    const/4 p1, 0x1

    :goto_1
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    add-int/2addr p1, v1

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p0, 0x5

    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xb

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getSeasonStartTime(J)J
    .locals 5

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x5

    const/16 v4, 0xb

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 p1, 0x8

    goto :goto_1

    :pswitch_1
    const/4 p1, 0x5

    goto :goto_1

    :pswitch_2
    const/4 p1, 0x2

    goto :goto_1

    :pswitch_3
    add-int/lit8 v2, v2, -0x1

    :goto_0
    const/16 p1, 0xb

    :goto_1
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    const/4 p0, 0x0

    invoke-virtual {v0, v4, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getYearLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x200

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getYearMonthDayLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x380

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getYearMonthLocale(J)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x300

    invoke-static {p0, p1, v0}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static isSameDay(JJ)Z
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p2

    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p3

    if-ne p2, p3, :cond_0

    const/4 p2, 0x2

    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p3

    invoke-virtual {p0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    if-ne p3, p2, :cond_0

    const/4 p2, 0x5

    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p3

    invoke-virtual {p0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p0

    if-ne p3, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static isSameMonth(JJ)Z
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p2

    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p3

    if-ne p2, p3, :cond_0

    const/4 p2, 0x2

    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p3

    invoke-virtual {p0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p0

    if-ne p3, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static isSameYear(JJ)Z
    .locals 1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p2

    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p0

    if-ne p2, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static withinTime(JJJ)Z
    .locals 0

    sub-long/2addr p0, p2

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    move-result-wide p0

    cmp-long p2, p0, p4

    if-gtz p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

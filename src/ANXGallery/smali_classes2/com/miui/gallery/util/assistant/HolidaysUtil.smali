.class public Lcom/miui/gallery/util/assistant/HolidaysUtil;
.super Ljava/lang/Object;
.source "HolidaysUtil.java"


# static fields
.field private static final CHINESE_CALENDAR_HOLIDAYS:[[I

.field private static final HOLIDAYS:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v0, 0x6

    new-array v1, v0, [[I

    const/4 v2, 0x2

    new-array v3, v2, [I

    fill-array-data v3, :array_0

    const/4 v4, 0x0

    aput-object v3, v1, v4

    new-array v3, v2, [I

    fill-array-data v3, :array_1

    const/4 v5, 0x1

    aput-object v3, v1, v5

    new-array v3, v2, [I

    fill-array-data v3, :array_2

    aput-object v3, v1, v2

    new-array v3, v2, [I

    fill-array-data v3, :array_3

    const/4 v6, 0x3

    aput-object v3, v1, v6

    new-array v3, v2, [I

    fill-array-data v3, :array_4

    const/4 v7, 0x4

    aput-object v3, v1, v7

    new-array v3, v2, [I

    fill-array-data v3, :array_5

    const/4 v8, 0x5

    aput-object v3, v1, v8

    sput-object v1, Lcom/miui/gallery/util/assistant/HolidaysUtil;->CHINESE_CALENDAR_HOLIDAYS:[[I

    new-array v0, v0, [[I

    new-array v1, v2, [I

    fill-array-data v1, :array_6

    aput-object v1, v0, v4

    new-array v1, v2, [I

    fill-array-data v1, :array_7

    aput-object v1, v0, v5

    new-array v1, v2, [I

    fill-array-data v1, :array_8

    aput-object v1, v0, v2

    new-array v1, v2, [I

    fill-array-data v1, :array_9

    aput-object v1, v0, v6

    new-array v1, v2, [I

    fill-array-data v1, :array_a

    aput-object v1, v0, v7

    new-array v1, v2, [I

    fill-array-data v1, :array_b

    aput-object v1, v0, v8

    sput-object v0, Lcom/miui/gallery/util/assistant/HolidaysUtil;->HOLIDAYS:[[I

    return-void

    :array_0
    .array-data 4
        -0x1
        0x64
    .end array-data

    :array_1
    .array-data 4
        0x65
        0x65
    .end array-data

    :array_2
    .array-data 4
        0x73
        0x66
    .end array-data

    :array_3
    .array-data 4
        0x1f9
        0x67
    .end array-data

    :array_4
    .array-data 4
        0x2c3
        0x68
    .end array-data

    :array_5
    .array-data 4
        0x32f
        0x69
    .end array-data

    :array_6
    .array-data 4
        0x65
        0xc8
    .end array-data

    :array_7
    .array-data 4
        0xd6
        0xc9
    .end array-data

    :array_8
    .array-data 4
        0x1f5
        0xca
    .end array-data

    :array_9
    .array-data 4
        0x259
        0xcb
    .end array-data

    :array_a
    .array-data 4
        0x3e9
        0xcc
    .end array-data

    :array_b
    .array-data 4
        0x4c9
        0xcd
    .end array-data
.end method

.method private static daysInChineseYear(Lmiui/date/Calendar;)I
    .locals 5

    invoke-virtual {p0}, Lmiui/date/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/date/Calendar;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lmiui/date/Calendar;->get(I)I

    move-result p0

    const/4 v2, 0x1

    add-int/2addr p0, v2

    invoke-virtual {v0, v1, p0}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    const/4 p0, 0x6

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    const/16 p0, 0xa

    invoke-virtual {v0, p0, v2}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    invoke-virtual {v0}, Lmiui/date/Calendar;->getTimeInMillis()J

    move-result-wide v1

    const-wide/32 v3, 0x5265c00

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    const/16 p0, 0xd

    invoke-virtual {v0, p0}, Lmiui/date/Calendar;->get(I)I

    move-result p0

    return p0
.end method

.method public static getChineseHoliday(J)I
    .locals 1

    new-instance v0, Lmiui/date/Calendar;

    invoke-direct {v0}, Lmiui/date/Calendar;-><init>()V

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    invoke-static {v0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHoliday(Lmiui/date/Calendar;)I

    move-result p0

    return p0
.end method

.method public static getChineseHoliday(Lmiui/date/Calendar;)I
    .locals 10

    invoke-virtual {p0}, Lmiui/date/Calendar;->outOfChineseCalendarRange()Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_2

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lmiui/date/Calendar;->get(I)I

    move-result v0

    const/4 v2, 0x1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x64

    const/16 v3, 0xa

    invoke-virtual {p0, v3}, Lmiui/date/Calendar;->get(I)I

    move-result v3

    add-int/2addr v0, v3

    sget-object v3, Lcom/miui/gallery/util/assistant/HolidaysUtil;->CHINESE_CALENDAR_HOLIDAYS:[[I

    array-length v4, v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_2

    aget-object v7, v3, v6

    aget v8, v7, v5

    if-eq v8, v1, :cond_0

    invoke-virtual {p0}, Lmiui/date/Calendar;->isChineseLeapMonth()Z

    move-result v8

    if-nez v8, :cond_1

    aget v8, v7, v5

    if-ne v0, v8, :cond_1

    aget p0, v7, v2

    return p0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->daysInChineseYear(Lmiui/date/Calendar;)I

    move-result v8

    const/16 v9, 0xd

    invoke-virtual {p0, v9}, Lmiui/date/Calendar;->get(I)I

    move-result v9

    if-ne v8, v9, :cond_1

    aget p0, v7, v2

    return p0

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static getChineseHolidayDatetimeOfPastYear(Lmiui/date/Calendar;I)J
    .locals 3

    invoke-static {p0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getChineseHoliday(Lmiui/date/Calendar;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lmiui/date/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/date/Calendar;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lmiui/date/Calendar;->get(I)I

    move-result v2

    sub-int/2addr v2, p1

    invoke-virtual {v0, v1, v2}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    invoke-static {v0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->daysInChineseYear(Lmiui/date/Calendar;)I

    move-result p1

    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Lmiui/date/Calendar;->get(I)I

    move-result p0

    if-ne p1, p0, :cond_0

    invoke-virtual {v0, v1, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    :cond_0
    const/16 p0, 0x12

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    const/16 p0, 0x14

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    const/16 p0, 0x15

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    const/16 p0, 0x16

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    invoke-virtual {v0}, Lmiui/date/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0

    :cond_1
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public static getChineseHolidayNameForStory(II)Ljava/lang/String;
    .locals 1

    add-int/lit8 p1, p1, -0x64

    const/4 v0, 0x1

    if-le p0, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f020007

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_1

    array-length v0, p0

    if-le v0, p1, :cond_1

    aget-object p0, p0, p1

    return-object p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f020006

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_1

    array-length v0, p0

    if-le v0, p1, :cond_1

    aget-object p0, p0, p1

    return-object p0

    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static getHoliday(J)I
    .locals 1

    new-instance v0, Lmiui/date/Calendar;

    invoke-direct {v0}, Lmiui/date/Calendar;-><init>()V

    invoke-virtual {v0, p0, p1}, Lmiui/date/Calendar;->setTimeInMillis(J)Lmiui/date/Calendar;

    invoke-static {v0}, Lcom/miui/gallery/util/assistant/HolidaysUtil;->getHoliday(Lmiui/date/Calendar;)I

    move-result p0

    return p0
.end method

.method public static getHoliday(Lmiui/date/Calendar;)I
    .locals 7

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lmiui/date/Calendar;->get(I)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x64

    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Lmiui/date/Calendar;->get(I)I

    move-result p0

    add-int/2addr v0, p0

    sget-object p0, Lcom/miui/gallery/util/assistant/HolidaysUtil;->HOLIDAYS:[[I

    array-length v2, p0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, p0, v4

    aget v6, v5, v3

    if-ne v6, v0, :cond_0

    aget p0, v5, v1

    return p0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static getHolidayNameForStory(II)Ljava/lang/String;
    .locals 1

    add-int/lit16 p1, p1, -0xc8

    const/4 v0, 0x1

    if-le p0, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f020009

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_1

    array-length v0, p0

    if-le v0, p1, :cond_1

    aget-object p0, p0, p1

    return-object p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f020008

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_1

    array-length v0, p0

    if-le v0, p1, :cond_1

    aget-object p0, p0, p1

    return-object p0

    :cond_1
    const-string p0, ""

    return-object p0
.end method

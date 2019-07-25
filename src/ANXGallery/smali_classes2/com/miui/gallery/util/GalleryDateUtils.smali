.class public Lcom/miui/gallery/util/GalleryDateUtils;
.super Ljava/lang/Object;
.source "GalleryDateUtils.java"


# static fields
.field private static final CALENDAR_POOL:Lmiui/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$Pool<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation
.end field

.field private static sDateCache:Lmiui/util/cache/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/cache/LruCache<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sLocalLanguage:Ljava/lang/String;

.field private static sToday:Ljava/lang/String;

.field private static sYesterday:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/util/GalleryDateUtils$1;

    invoke-direct {v0}, Lcom/miui/gallery/util/GalleryDateUtils$1;-><init>()V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/Pools;->createSoftReferencePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SoftReferencePool;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    new-instance v0, Lmiui/util/cache/LruCache;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lmiui/util/cache/LruCache;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sDateCache:Lmiui/util/cache/LruCache;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sLocalLanguage:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->clearCache()V

    return-void
.end method

.method public static acquire()Ljava/util/Calendar;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {v0}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method private static clearCache()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sToday:Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sYesterday:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sDateCache:Lmiui/util/cache/LruCache;

    invoke-virtual {v0}, Lmiui/util/cache/LruCache;->clear()V

    return-void
.end method

.method public static daysBeforeToday(J)J
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    cmp-long v2, p0, v0

    const-wide/16 v3, 0x0

    if-ltz v2, :cond_0

    return-wide v3

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->acquire()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 v0, 0xb

    const/4 v1, 0x0

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xc

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xd

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xe

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    cmp-long v5, v0, p0

    if-gtz v5, :cond_1

    return-wide v3

    :cond_1
    invoke-static {p0, p1, v0, v1}, Lcom/miui/gallery/util/GalleryDateUtils;->daysBetween(JJ)J

    move-result-wide p0

    const-wide/16 v0, 0x1

    add-long/2addr p0, v0

    invoke-static {v2}, Lcom/miui/gallery/util/GalleryDateUtils;->release(Ljava/util/Calendar;)V

    return-wide p0
.end method

.method public static daysBetween(JJ)J
    .locals 1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sub-long/2addr p2, p0

    invoke-static {p2, p3}, Ljava/lang/Math;->abs(J)J

    move-result-wide p0

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static format(J)I
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->acquire()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    shl-int/lit8 p1, p1, 0x4

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v1, p0

    or-int p0, p1, v1

    const/4 p1, 0x5

    shl-int/2addr p0, p1

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    or-int/2addr p0, p1

    invoke-static {v0}, Lcom/miui/gallery/util/GalleryDateUtils;->release(Ljava/util/Calendar;)V

    return p0
.end method

.method public static format(I)J
    .locals 4

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->acquire()Ljava/util/Calendar;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x5

    shl-int/lit8 v2, v1, 0x5

    sub-int/2addr p0, v2

    const/4 v2, 0x5

    invoke-virtual {v0, v2, p0}, Ljava/util/Calendar;->set(II)V

    shr-int/lit8 p0, v1, 0x4

    shl-int/lit8 v2, p0, 0x4

    sub-int/2addr v1, v2

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v2, p0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-static {v0}, Lcom/miui/gallery/util/GalleryDateUtils;->release(Ljava/util/Calendar;)V

    return-wide v1
.end method

.method public static formatRelativeDate(J)Ljava/lang/String;
    .locals 9

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/util/GalleryDateUtils;->sLocalLanguage:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sDateCache:Lmiui/util/cache/LruCache;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/util/cache/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->clearCache()V

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sLocalLanguage:Ljava/lang/String;

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v0

    invoke-interface {v0}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {v1}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v5

    const/4 v6, 0x6

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v5, v8, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    if-eqz v5, :cond_3

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->getTodayTip()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_3
    if-eqz v5, :cond_4

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    sub-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    const/4 v7, 0x2

    if-ge v6, v7, :cond_4

    cmp-long v6, p0, v2

    if-gez v6, :cond_4

    invoke-static {}, Lcom/miui/gallery/util/GalleryDateUtils;->getYesterdayTip()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_4
    if-eqz v5, :cond_5

    const/16 v2, 0x1180

    invoke-static {v0, p0, p1, v2}, Lmiui/date/DateUtils;->formatDateTime(Ljava/lang/StringBuilder;JI)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_5
    const/16 v2, 0x1380

    invoke-static {v0, p0, p1, v2}, Lmiui/date/DateUtils;->formatDateTime(Ljava/lang/StringBuilder;JI)Ljava/lang/StringBuilder;

    :goto_2
    sget-object v2, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {v2, v1}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v2

    invoke-interface {v2, v0}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sDateCache:Lmiui/util/cache/LruCache;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0, v1, v4}, Lmiui/util/cache/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;I)V

    return-object v1
.end method

.method public static formatRelativeMonth(J)Ljava/lang/String;
    .locals 5

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v0

    invoke-interface {v0}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {v1}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    const/16 v2, 0x1100

    invoke-static {v0, p0, p1, v2}, Lmiui/date/DateUtils;->formatDateTime(Ljava/lang/StringBuilder;JI)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    const/16 v2, 0x1300

    invoke-static {v0, p0, p1, v2}, Lmiui/date/DateUtils;->formatDateTime(Ljava/lang/StringBuilder;JI)Ljava/lang/StringBuilder;

    :goto_1
    sget-object p0, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {p0, v1}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object p1

    invoke-interface {p1, v0}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    return-object p0
.end method

.method private static getTodayTip()Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sToday:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/base/R$string;->today:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sToday:Ljava/lang/String;

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sToday:Ljava/lang/String;

    return-object v0
.end method

.method private static getYesterdayTip()Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sYesterday:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/base/R$string;->yesterday:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sYesterday:Ljava/lang/String;

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->sYesterday:Ljava/lang/String;

    return-object v0
.end method

.method public static invalidateCache()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/GalleryDateUtils$2;

    invoke-direct {v0}, Lcom/miui/gallery/util/GalleryDateUtils$2;-><init>()V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static isSameDate(Ljava/util/Date;Ljava/util/Date;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_3

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/32 v4, 0x5265c00

    cmp-long v6, v2, v4

    if-gtz v6, :cond_2

    invoke-virtual {p0}, Ljava/util/Date;->getDate()I

    move-result p0

    invoke-virtual {p1}, Ljava/util/Date;->getDate()I

    move-result p1

    if-ne p0, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public static isSameDay(II)Z
    .locals 0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isSameMonth(II)Z
    .locals 0

    and-int/lit8 p0, p0, -0x20

    and-int/lit8 p1, p1, -0x20

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static release(Ljava/util/Calendar;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/GalleryDateUtils;->CALENDAR_POOL:Lmiui/util/Pools$Pool;

    invoke-interface {v0, p0}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    return-void
.end method

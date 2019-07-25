.class public Lcn/kuaipan/android/utils/OAuthTimeUtils;
.super Ljava/lang/Object;
.source "OAuthTimeUtils.java"


# static fields
.field private static final sFormat:Ljava/text/SimpleDateFormat;

.field private static final sFormatBuffer:Ljava/lang/StringBuffer;

.field private static final sFormatFieldPos:Ljava/text/FieldPosition;

.field private static final sFormatPosition:Ljava/text/ParsePosition;

.field private static sTimeDiff:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sFormat:Ljava/text/SimpleDateFormat;

    new-instance v0, Ljava/text/ParsePosition;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/text/ParsePosition;-><init>(I)V

    sput-object v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sFormatPosition:Ljava/text/ParsePosition;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    sput-object v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sFormatBuffer:Ljava/lang/StringBuffer;

    new-instance v0, Ljava/text/FieldPosition;

    invoke-direct {v0, v1}, Ljava/text/FieldPosition;-><init>(I)V

    sput-object v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sFormatFieldPos:Ljava/text/FieldPosition;

    sget-object v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sFormat:Ljava/text/SimpleDateFormat;

    const-string v1, "GMT+0800"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method

.method public static currentTime()J
    .locals 5

    sget-wide v0, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sTimeDiff:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Lcn/kuaipan/android/utils/OAuthTimeUtils;->sTimeDiff:J

    add-long/2addr v0, v2

    return-wide v0
.end method

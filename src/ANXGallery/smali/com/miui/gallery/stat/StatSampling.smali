.class public Lcom/miui/gallery/stat/StatSampling;
.super Ljava/lang/Object;
.source "StatSampling.java"


# static fields
.field public static final FILTERED:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$SampleStatistic;->getUniqId()J

    move-result-wide v0

    const-wide/16 v2, 0x9

    rem-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/miui/gallery/stat/StatSampling;->FILTERED:Z

    return-void
.end method

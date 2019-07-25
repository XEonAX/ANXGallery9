.class public Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "PastYearMonthScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    const/16 v0, 0x67

    const/4 v1, 0x1

    const/4 v2, 0x7

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    return-void
.end method


# virtual methods
.method public generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/card/scenario/DateUtils;->getYearMonthLocale(J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonth(J)I

    move-result p1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f02000e

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p2

    array-length v0, p2

    if-lez v0, :cond_0

    array-length v0, p2

    if-le v0, p1, :cond_0

    aget-object p1, p2, p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public loadMediaItem()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_PARTY:[Ljava/lang/Integer;

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_FOODS:[Ljava/lang/Integer;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/CardUtil;->concat([Ljava/lang/Integer;[Ljava/lang/Integer;)[Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_ACTIVITY:[Ljava/lang/Integer;

    sget-object v2, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_SPORTS:[Ljava/lang/Integer;

    invoke-static {v1, v2}, Lcom/miui/gallery/card/CardUtil;->concat([Ljava/lang/Integer;[Ljava/lang/Integer;)[Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/card/CardUtil;->concat([Ljava/lang/Integer;[Ljava/lang/Integer;)[Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getStartTime()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getEndTime()J

    move-result-wide v6

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getCameraMediaIdsByStartEndTimeTags([Ljava/lang/Integer;JJ)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getImageIdsFromImageFeatures(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

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

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/card/scenario/DateUtils;->getFirstDayOfMonthTime(J)J

    move-result-wide v3

    cmp-long p2, v1, v3

    if-lez p2, :cond_2

    sub-long v3, v1, v3

    const-wide/32 v5, 0xa4cb800

    cmp-long p2, v3, v5

    if-gez p2, :cond_2

    const/4 p2, 0x1

    invoke-static {p2, v1, v2, p2}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastNYearMonthTime(IJZ)J

    move-result-wide v3

    invoke-static {p2, v1, v2, v0}, Lcom/miui/gallery/card/scenario/DateUtils;->getLastNYearMonthTime(IJZ)J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_1

    cmp-long v7, v1, v5

    if-ltz v7, :cond_1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->setStartTime(J)V

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;->setEndTime(J)V

    return p2

    :cond_1
    :goto_0
    return v0

    :cond_2
    return v0
.end method

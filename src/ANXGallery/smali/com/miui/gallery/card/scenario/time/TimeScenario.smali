.class public abstract Lcom/miui/gallery/card/scenario/time/TimeScenario;
.super Lcom/miui/gallery/card/scenario/Scenario;
.source "TimeScenario.java"


# static fields
.field protected static final NON_CAMERA_SELECTION:Ljava/lang/String;

.field protected static final TIME_SELECTION:Ljava/lang/String;


# instance fields
.field private mEndTime:J

.field private mStartTime:J

.field private mTargetTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->CAMERA_BASE_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mixedDateTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " > %s AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mixedDateTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " < %s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->TIME_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->NON_CAMERA_BASE_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN (%s)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->NON_CAMERA_SELECTION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/Scenario;-><init>(III)V

    return-void
.end method


# virtual methods
.method protected getCameraMediaIdsByStartEndTimeTags([Ljava/lang/Integer;JJ)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Integer;",
            "JJ)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/ImageFeature;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-string v2, ","

    move-object/from16 v3, p1

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/assistant/model/ImageFeature;

    sget-object v4, Lcom/miui/gallery/assistant/model/ImageFeature;->SCENE_TAG_SELECTION:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v5, v7

    const/4 v8, 0x1

    aput-object v2, v5, v8

    const/4 v6, 0x2

    aput-object v2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/String;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v7

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v8

    const-string v6, "imageDatetime asc"

    const/4 v9, 0x0

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v9

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getImageIdsFromImageFeatures(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v9

    sget-object v10, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v11, Lcom/miui/gallery/card/scenario/time/TimeScenario;->PROJECTION:[Ljava/lang/String;

    sget-object v3, Lcom/miui/gallery/card/scenario/time/TimeScenario;->NON_CAMERA_SELECTION:Ljava/lang/String;

    new-array v4, v8, [Ljava/lang/Object;

    const-string v5, ","

    invoke-static {v5, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    new-instance v15, Lcom/miui/gallery/card/scenario/time/TimeScenario$2;

    invoke-direct {v15, v0}, Lcom/miui/gallery/card/scenario/time/TimeScenario$2;-><init>(Lcom/miui/gallery/card/scenario/time/TimeScenario;)V

    invoke-static/range {v9 .. v15}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;
    .locals 6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordEndTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v2

    const-wide/32 v4, 0x36ee80

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDatePeriodGraceful(JJ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getEndTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mEndTime:J

    return-wide v0
.end method

.method protected getEventStartEndTime(Ljava/util/List;)[J
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/ImageFeature;",
            ">;)[J"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageDateTime()J

    move-result-wide v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageDateTime()J

    move-result-wide v5

    invoke-static {v1, v2}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v7

    const-wide/32 v9, 0x5265c00

    add-long/2addr v9, v7

    const/4 p1, 0x2

    new-array p1, p1, [J

    const-wide/32 v11, 0xa4cb80

    sub-long/2addr v1, v11

    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    aput-wide v1, p1, v0

    add-long/2addr v5, v11

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    aput-wide v0, p1, v4

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getImageIdsFromImageFeatures(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/ImageFeature;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method protected getLocation()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMediaIdsByStartEndTime(JJ)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/card/scenario/time/TimeScenario;->PROJECTION:[Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v4, Lcom/miui/gallery/card/scenario/time/TimeScenario;->TIME_SELECTION:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v5, p2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v5, p2

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Lcom/miui/gallery/card/scenario/time/TimeScenario$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/card/scenario/time/TimeScenario$1;-><init>(Lcom/miui/gallery/card/scenario/time/TimeScenario;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method

.method protected getMonthPeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;
    .locals 6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordEndTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v2

    const-wide/32 v4, 0x36ee80

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getMonthPeriodGraceful(JJ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getPeopleId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getPrimaryKey()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getRandomArrayString(I)Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    if-lez v0, :cond_0

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    array-length v1, p1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    aget-object p1, p1, v0

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method protected getRecordEndTime(Lcom/miui/gallery/card/scenario/Record;)J
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Record;->getEndTime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method protected getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Record;->getStartTime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method protected getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;Z)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/scenario/Record;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/card/Card;

    invoke-virtual {p2}, Lcom/miui/gallery/card/Card;->getRecordStartTime()J

    move-result-wide v1

    if-eqz p3, :cond_2

    invoke-static {v1, v2}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v1

    :cond_2
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method protected getRecordTargetTime(Lcom/miui/gallery/card/scenario/Record;)J
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Record;->getTargetTime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method protected getRecordTargetTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/scenario/Record;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getRecordTargetTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/card/Card;

    invoke-virtual {p2}, Lcom/miui/gallery/card/Card;->getRecordTargetTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method protected getSecondary()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getStartTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mStartTime:J

    return-wide v0
.end method

.method protected getTargetTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mTargetTime:J

    return-wide v0
.end method

.method protected getTertiaryKey()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public loadMediaItem()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mStartTime:J

    iget-wide v2, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mEndTime:J

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->getMediaIdsByStartEndTime(JJ)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getPriority()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mPriority:I

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getMinImageCount()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mMinImageCount:I

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getMaxImageCount()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mMaxImageCount:I

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getMinSelectedImageCount()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mMinSelectedImageCount:I

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getMaxSelectedImageCount()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mMaxSelectedImageCount:I

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getTriggerInterval()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mTriggerInterval:I

    :cond_0
    return-void
.end method

.method protected setEndTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mEndTime:J

    return-void
.end method

.method protected setStartTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mStartTime:J

    return-void
.end method

.method public setTargetTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/scenario/time/TimeScenario;->mTargetTime:J

    return-void
.end method

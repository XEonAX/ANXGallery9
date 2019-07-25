.class public Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "PastWeekendScenario.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;
    }
.end annotation


# static fields
.field protected static final SELECTION:Ljava/lang/String;


# instance fields
.field protected final PROJECTION:[Ljava/lang/String;


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

    const-string v1, " > %s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mixedDateTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " < %s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->SELECTION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x4

    const/16 v1, 0x194

    invoke-direct {p0, v1, v0, v0}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    const-string v0, "DISTINCT sha1"

    const-string v1, "mixedDateTime"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;Landroid/database/Cursor;)Ljava/util/List;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getMediaItemsFromCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private getMediaItemsFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;-><init>(Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$1;)V

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;->mSha1:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;->mDateTime:J

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_1
    :goto_1
    return-object v0
.end method

.method private getWeekendStart(Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;)J
    .locals 5

    if-eqz p1, :cond_1

    iget-wide v0, p1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;->mDateTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-wide v1, p1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;->mDateTime:J

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, 0x7

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eq v1, p1, :cond_0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    :cond_0
    invoke-virtual {v0, p1, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xb

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-lez p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
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

    const p1, 0x7f020019

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getRandomArrayString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 17
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

    move-object/from16 v0, p0

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v1

    const/4 v3, 0x0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    invoke-virtual {v0, v4, v5, v3}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const-wide/16 v6, 0x0

    move-wide v8, v6

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    cmp-long v13, v11, v8

    if-lez v13, :cond_0

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    iget-object v12, v0, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->PROJECTION:[Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v13, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->SELECTION:Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v14, v3

    const-wide v8, 0x39ef8b000L

    sub-long/2addr v1, v8

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v14, v2

    invoke-static {v5, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const-string v15, "mixedDateTime ASC"

    new-instance v1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$1;

    invoke-direct {v1, v0}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$1;-><init>(Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;)V

    move-object/from16 v16, v1

    invoke-static/range {v10 .. v16}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-wide v8, v6

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;

    iget-wide v10, v5, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;->mDateTime:J

    cmp-long v12, v10, v8

    if-gez v12, :cond_3

    goto :goto_1

    :cond_3
    invoke-direct {v0, v5}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getWeekendStart(Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario$MediaItem;)J

    move-result-wide v10

    cmp-long v5, v10, v6

    if-lez v5, :cond_2

    const-wide/32 v8, 0xa4cb800

    add-long/2addr v8, v10

    invoke-virtual {v0, v10, v11, v8, v9}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getMediaIdsByStartEndTime(JJ)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->getMinImageCount()I

    move-result v12

    if-le v5, v12, :cond_4

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    invoke-virtual {v0, v10, v11}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->setStartTime(J)V

    invoke-virtual {v0, v8, v9}, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;->setEndTime(J)V

    return v2

    :cond_4
    const-wide/32 v8, 0x240c8400

    add-long/2addr v10, v8

    move-wide v8, v10

    goto :goto_1

    :cond_5
    return v3
.end method

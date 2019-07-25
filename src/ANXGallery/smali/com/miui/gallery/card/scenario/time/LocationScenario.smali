.class public abstract Lcom/miui/gallery/card/scenario/time/LocationScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "LocationScenario.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;
    }
.end annotation


# static fields
.field protected static final ALL_IMAGE_SELECTION:Ljava/lang/String;

.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field protected mTargetCity:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->CAMERA_BASE_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " is not null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/time/LocationScenario;->ALL_IMAGE_SELECTION:Ljava/lang/String;

    const-string v0, "DISTINCT sha1"

    const-string v1, "location"

    const-string v2, "mixedDateTime"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/time/LocationScenario;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(III)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    return-void
.end method

.method public static getCityNameFromLoaction(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/data/LocationManager;->segmentLocation(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_4

    const/4 v0, 0x2

    aget-object v1, p0, v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    aget-object p0, p0, v0

    return-object p0

    :cond_1
    const/4 v0, 0x3

    aget-object v1, p0, v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    aget-object p0, p0, v0

    return-object p0

    :cond_2
    const/4 v0, 0x1

    aget-object v1, p0, v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    aget-object p0, p0, v0

    return-object p0

    :cond_3
    const/4 v0, 0x0

    aget-object v1, p0, v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    aget-object p0, p0, v0

    return-object p0

    :cond_4
    const-string p0, ""

    return-object p0

    :cond_5
    :goto_0
    const-string p0, ""

    return-object p0
.end method

.method public static getMediaItemsFromCursor(Landroid/database/Cursor;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_3

    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    invoke-direct {v1}, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;-><init>()V

    const/4 v2, 0x0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mSha1:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mLocation:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    iget-object v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mLocation:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/card/scenario/time/LocationScenario;->getCityNameFromLoaction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    if-eqz p1, :cond_1

    iget-object v2, v1, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_3
    :goto_1
    return-object v0
.end method


# virtual methods
.method public findRecords()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/time/LocationScenario;->mTargetCity:Ljava/lang/String;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Integer;

    const/16 v2, 0x72

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/16 v2, 0xc9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v5

    const-string v2, "%s IN (%s) AND %s > %s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "scenarioId"

    aput-object v7, v6, v3

    const-string v3, ","

    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v4

    const-string v1, "time"

    aput-object v1, v6, v0

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v0

    const-wide v3, 0x39ef8b000L

    sub-long/2addr v0, v3

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, v6, v1

    invoke-static {v2, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "time ASC"

    const-class v6, Lcom/miui/gallery/card/scenario/Record;

    const/4 v8, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/LocationScenario;->getRecordStartTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/LocationScenario;->getRecordEndTime(Lcom/miui/gallery/card/scenario/Record;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDatePeriodGraceful(JJ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getLocation()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/time/LocationScenario;->mTargetCity:Ljava/lang/String;

    return-object v0
.end method

.method protected getPeopleId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public loadMediaItem()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->loadMediaItem()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.class public abstract Lcom/miui/gallery/card/scenario/Scenario;
.super Ljava/lang/Object;
.source "Scenario.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/card/scenario/Scenario;",
        ">;"
    }
.end annotation


# static fields
.field protected static final PROJECTION:[Ljava/lang/String;

.field protected static sDefaultMaxImageCount:I = 0x1f4

.field protected static sDefaultMinImageCount:I = 0x14

.field protected static sDefaultSelectedMaxImageCount:I = 0x50

.field protected static sDefaultSelectedMinImageCount:I = 0x6

.field protected static sDuplicateRemovalInterval:I = 0xb4


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private final mFlag:I

.field private final mFlagDisableMask:I

.field protected mMaxImageCount:I

.field protected mMaxSelectedImageCount:I

.field protected mMinImageCount:I

.field protected mMinSelectedImageCount:I

.field protected mPriority:I

.field private final mScenarioId:I

.field protected mTriggerInterval:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "cloud._id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/scenario/Scenario;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->TAG:Ljava/lang/String;

    iput p1, p0, Lcom/miui/gallery/card/scenario/Scenario;->mScenarioId:I

    iput p2, p0, Lcom/miui/gallery/card/scenario/Scenario;->mFlag:I

    iput p3, p0, Lcom/miui/gallery/card/scenario/Scenario;->mFlagDisableMask:I

    return-void
.end method

.method public static setDefaultMaxImageCount(I)V
    .locals 0

    sput p0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultMaxImageCount:I

    return-void
.end method

.method public static setDefaultMinImageCount(I)V
    .locals 0

    sput p0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultMinImageCount:I

    return-void
.end method

.method public static setDefaultSelectedMaxImageCount(I)V
    .locals 0

    sput p0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultSelectedMaxImageCount:I

    return-void
.end method

.method public static setDefaultSelectedMinImageCount(I)V
    .locals 0

    sput p0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultSelectedMinImageCount:I

    return-void
.end method

.method public static setDuplicateRemovalInterval(I)V
    .locals 0

    sput p0, Lcom/miui/gallery/card/scenario/Scenario;->sDuplicateRemovalInterval:I

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/card/scenario/Scenario;)I
    .locals 2

    iget v0, p1, Lcom/miui/gallery/card/scenario/Scenario;->mPriority:I

    iget v1, p0, Lcom/miui/gallery/card/scenario/Scenario;->mPriority:I

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    if-nez v0, :cond_0

    iget p1, p1, Lcom/miui/gallery/card/scenario/Scenario;->mScenarioId:I

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mScenarioId:I

    invoke-static {p1, v0}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    :cond_0
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/card/scenario/Scenario;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/Scenario;->compareTo(Lcom/miui/gallery/card/scenario/Scenario;)I

    move-result p1

    return p1
.end method

.method protected cursorToImageIdList(Landroid/database/Cursor;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    return-object v0
.end method

.method public findCards()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ignored = 0 AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "%s = %s AND %s > %s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "scenarioId"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "createTime"

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v4

    const-wide v6, 0x39ef8b000L

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "createTime ASC"

    const-class v1, Lcom/miui/gallery/card/Card;

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findRecords()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-string v1, "%s = %s AND %s > %s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "scenarioId"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string v3, "time"

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v3

    const-wide v5, 0x39ef8b000L

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "time ASC"

    const-class v1, Lcom/miui/gallery/card/scenario/Record;

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
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
.end method

.method public abstract generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
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
.end method

.method protected abstract getEndTime()J
.end method

.method public getFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mFlag:I

    return v0
.end method

.method public getFlagDisableMask()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mFlagDisableMask:I

    return v0
.end method

.method protected abstract getLocation()Ljava/lang/String;
.end method

.method public getMaxImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMaxImageCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMaxImageCount:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultMaxImageCount:I

    :goto_0
    return v0
.end method

.method public getMaxSelectedImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMaxSelectedImageCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMaxSelectedImageCount:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultSelectedMaxImageCount:I

    :goto_0
    return v0
.end method

.method public getMediaIdsFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getMaxImageCount()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-gt v2, v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/Scenario;->cursorToImageIdList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    float-to-double v5, v2

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpg-double v7, v3, v5

    if-gez v7, :cond_1

    const/4 v3, 0x0

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v0, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v0

    :goto_1
    add-int/lit8 v0, p1, -0x1

    if-lez p1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    int-to-double v2, p1

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v4

    double-to-int p1, v2

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move p1, v0

    goto :goto_1

    :cond_3
    return-object v1
.end method

.method public getMinImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMinImageCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMinImageCount:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultMinImageCount:I

    :goto_0
    return v0
.end method

.method public getMinSelectedImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMinSelectedImageCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mMinSelectedImageCount:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/miui/gallery/card/scenario/Scenario;->sDefaultSelectedMinImageCount:I

    :goto_0
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getPeopleId()Ljava/lang/String;
.end method

.method protected abstract getPrimaryKey()Ljava/lang/String;
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

.method public getScenarioId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mScenarioId:I

    return v0
.end method

.method protected abstract getSecondary()Ljava/lang/String;
.end method

.method protected abstract getStartTime()J
.end method

.method protected abstract getTargetTime()J
.end method

.method protected abstract getTertiaryKey()Ljava/lang/String;
.end method

.method public getTriggerInterval()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Scenario;->mTriggerInterval:I

    return v0
.end method

.method protected isCardRecentlyCreated(Ljava/util/List;J)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;J)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/Card;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCreateTime()J

    move-result-wide v2

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, p2

    cmp-long p1, v4, v2

    if-gez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public isDeletable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected isRecentlyTriggerd(Ljava/util/List;J)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;J)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/scenario/Record;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Record;->getTime()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Record;->getTime()J

    move-result-wide v4

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    :cond_1
    move-object v1, v0

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p2

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Record;->getTime()J

    move-result-wide p1

    cmp-long p3, v2, p1

    if-gez p3, :cond_3

    const/4 p1, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method public abstract loadMediaItem()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V
.end method

.method public abstract onPrepare(Ljava/util/List;Ljava/util/List;)Z
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
.end method

.method public prepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
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

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getTriggerInterval()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getTriggerInterval()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x5265c00

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/card/scenario/Scenario;->isRecentlyTriggerd(Ljava/util/List;J)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Scenario;->getTriggerInterval()I

    move-result v0

    int-to-long v0, v0

    mul-long v0, v0, v2

    invoke-virtual {p0, p2, v0, v1}, Lcom/miui/gallery/card/scenario/Scenario;->isCardRecentlyCreated(Ljava/util/List;J)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/Scenario;->onPrepare(Ljava/util/List;Ljava/util/List;)Z

    move-result p1

    return p1
.end method

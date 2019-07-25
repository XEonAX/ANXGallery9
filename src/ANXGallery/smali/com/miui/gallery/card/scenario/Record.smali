.class public Lcom/miui/gallery/card/scenario/Record;
.super Lcom/miui/gallery/dao/base/Entity;
.source "Record.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/scenario/Record$UniqueKey;
    }
.end annotation


# instance fields
.field private mEndTime:J

.field private mLocation:Ljava/lang/String;

.field private mMediaIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mPeopleId:Ljava/lang/String;

.field private mPrimaryKey:Ljava/lang/String;

.field private mScenarioId:I

.field private mSecondaryKey:Ljava/lang/String;

.field private mStartTime:J

.field private mState:I

.field private mTargetTime:J

.field private mTertiaryKey:Ljava/lang/String;

.field private mTime:J


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/card/scenario/Scenario;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTime:J

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/Record;->mMediaIds:Ljava/util/List;

    const/4 p2, 0x1

    iput p2, p0, Lcom/miui/gallery/card/scenario/Record;->mState:I

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/card/scenario/Record;->mScenarioId:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getStartTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getEndTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mEndTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getTargetTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-gtz p2, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getTargetTime()J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getPeopleId()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/Record;->mPeopleId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getLocation()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/Record;->mLocation:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getPrimaryKey()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/Record;->mPrimaryKey:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getSecondary()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/card/scenario/Record;->mSecondaryKey:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Scenario;->getTertiaryKey()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/scenario/Record;->mTertiaryKey:Ljava/lang/String;

    :cond_1
    return-void
.end method


# virtual methods
.method public getEndTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mEndTime:J

    return-wide v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mMediaIds:Ljava/util/List;

    return-object v0
.end method

.method public getPeopleId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mPeopleId:Ljava/lang/String;

    return-object v0
.end method

.method public getPrimaryKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mPrimaryKey:Ljava/lang/String;

    return-object v0
.end method

.method public getScenarioId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Record;->mScenarioId:I

    return v0
.end method

.method public getSecondaryKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mSecondaryKey:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    return-wide v0
.end method

.method public getState()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/Record;->mState:I

    return v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "scenarioId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioStartTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioEndTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioPeopleId"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioLocation"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioPrimaryKey"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioSecondaryKey"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioTertiaryKey"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "time"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "state"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "medias"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioTargetTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Record;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getTargetTime()J
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    :goto_0
    return-wide v0
.end method

.method public getTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTime:J

    return-wide v0
.end method

.method protected getUniqueConstraints()[Ljava/lang/String;
    .locals 1

    const-string v0, "scenarioId"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;
    .locals 14

    new-instance v13, Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getScenarioId()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getStartTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getEndTime()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getTargetTime()J

    move-result-wide v6

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getPeopleId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getLocation()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getPrimaryKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getSecondaryKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/Record;->getPrimaryKey()Ljava/lang/String;

    move-result-object v12

    move-object v0, v13

    invoke-direct/range {v0 .. v12}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;-><init>(IJJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v13
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "scenarioId"

    iget v1, p0, Lcom/miui/gallery/card/scenario/Record;->mScenarioId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "scenarioStartTime"

    iget-wide v1, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "scenarioEndTime"

    iget-wide v1, p0, Lcom/miui/gallery/card/scenario/Record;->mEndTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "scenarioPeopleId"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mPeopleId:Ljava/lang/String;

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mPeopleId:Ljava/lang/String;

    :goto_0
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioLocation"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mLocation:Ljava/lang/String;

    if-nez v1, :cond_1

    const-string v1, ""

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mLocation:Ljava/lang/String;

    :goto_1
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioPrimaryKey"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mPrimaryKey:Ljava/lang/String;

    if-nez v1, :cond_2

    const-string v1, ""

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mPrimaryKey:Ljava/lang/String;

    :goto_2
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioSecondaryKey"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mSecondaryKey:Ljava/lang/String;

    if-nez v1, :cond_3

    const-string v1, ""

    goto :goto_3

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mSecondaryKey:Ljava/lang/String;

    :goto_3
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioTertiaryKey"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mTertiaryKey:Ljava/lang/String;

    if-nez v1, :cond_4

    const-string v1, ""

    goto :goto_4

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mTertiaryKey:Ljava/lang/String;

    :goto_4
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "time"

    iget-wide v1, p0, Lcom/miui/gallery/card/scenario/Record;->mTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "state"

    iget v1, p0, Lcom/miui/gallery/card/scenario/Record;->mState:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "medias"

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/Record;->mMediaIds:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioTargetTime"

    iget-wide v1, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 4

    const-string v0, "scenarioId"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/Record;->mScenarioId:I

    const-string v0, "scenarioStartTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    const-string v0, "scenarioEndTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mEndTime:J

    const-string v0, "scenarioPeopleId"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mPeopleId:Ljava/lang/String;

    const-string v0, "scenarioLocation"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mLocation:Ljava/lang/String;

    const-string v0, "scenarioPrimaryKey"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mPrimaryKey:Ljava/lang/String;

    const-string v0, "scenarioSecondaryKey"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mSecondaryKey:Ljava/lang/String;

    const-string v0, "scenarioTertiaryKey"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTertiaryKey:Ljava/lang/String;

    const-string v0, "time"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTime:J

    const-string v0, "state"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/scenario/Record;->mState:I

    :try_start_0
    const-string v0, "medias"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v1, Ljava/lang/Long;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GsonUtils;->getArray(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/Record;->mMediaIds:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "Record"

    const-string v1, "Get media array of scenario %d from cursor error"

    iget v2, p0, Lcom/miui/gallery/card/scenario/Record;->mScenarioId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    const-string v0, "scenarioTargetTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/scenario/Record;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-gtz p1, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mStartTime:J

    goto :goto_1

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    :goto_1
    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/Record;->mTargetTime:J

    return-void
.end method

.method public setState(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/scenario/Record;->mState:I

    return-void
.end method

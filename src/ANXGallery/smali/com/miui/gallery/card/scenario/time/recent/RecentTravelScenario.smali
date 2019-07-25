.class public Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;
.super Lcom/miui/gallery/card/scenario/time/LocationScenario;
.source "RecentTravelScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    const/16 v0, 0x72

    const/4 v1, 0x2

    const/4 v2, 0x6

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/card/scenario/time/LocationScenario;-><init>(III)V

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 2
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

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/card/scenario/Record;->getLocation()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const p1, 0x7f1000f1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 16
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

    const/4 v1, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v5

    const-wide v7, 0x9a7ec800L

    sub-long v7, v5, v7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v9

    sget-object v10, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v11, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->PROJECTION:[Ljava/lang/String;

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v13, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->TIME_SELECTION:Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v14, v8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v14, v1

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const-string v14, "mixedDateTime DESC"

    new-instance v15, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario$1;

    invoke-direct {v15, v0}, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario$1;-><init>(Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;)V

    const/4 v13, 0x0

    invoke-static/range {v9 .. v15}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-static {v5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_0

    return v8

    :cond_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    move-object v7, v6

    move-object v9, v7

    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    if-nez v6, :cond_2

    iget-object v6, v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    goto :goto_0

    :cond_2
    if-eqz v7, :cond_3

    iget-object v11, v9, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    iget-object v12, v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    invoke-static {v11, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    iget-object v11, v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1

    iget-object v11, v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    invoke-static {v11, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1

    iget-wide v11, v10, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    sub-long v11, v3, v11

    const-wide/32 v13, 0xf731400

    cmp-long v7, v11, v13

    if-gez v7, :cond_4

    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v9, v10

    goto :goto_0

    :cond_4
    return v8

    :cond_5
    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    iget-wide v5, v4, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    iget-wide v10, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    sub-long/2addr v5, v10

    const-wide/32 v10, 0x337f9800

    cmp-long v7, v5, v10

    if-gtz v7, :cond_6

    iget-wide v5, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-static {v5, v6}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, v9, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    iput-object v2, v0, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->mTargetCity:Ljava/lang/String;

    iget-wide v2, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->setStartTime(J)V

    iget-wide v2, v4, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;->setEndTime(J)V

    return v1

    :cond_6
    return v8
.end method

.class public Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;
.super Lcom/miui/gallery/card/scenario/time/LocationScenario;
.source "PastTravelScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x4

    const/16 v1, 0xc9

    invoke-direct {p0, v1, v0, v0}, Lcom/miui/gallery/card/scenario/time/LocationScenario;-><init>(III)V

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->getDatePeriodFromRecord(Lcom/miui/gallery/card/scenario/Record;)Ljava/lang/String;

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
    .locals 12
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

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->getRecordStartTimesFromRecordAndCards(Ljava/util/List;Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->PROJECTION:[Ljava/lang/String;

    sget-object v4, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->ALL_IMAGE_SELECTION:Ljava/lang/String;

    const-string v6, "mixedDateTime ASC"

    new-instance v7, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario$1;

    invoke-direct {v7, p0}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario$1;-><init>(Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;)V

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    move-object v3, v1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    iget-object v5, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    iget-object v6, v4, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    add-int/lit8 v5, v1, -0x1

    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;

    iget-wide v6, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    iget-wide v8, v5, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-virtual {p0, v6, v7, v8, v9}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->getMediaIdsByStartEndTime(JJ)Ljava/util/List;

    move-result-object v6

    iget-wide v7, v5, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    iget-wide v9, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    sub-long/2addr v7, v9

    const-wide/32 v9, 0x337f9800

    cmp-long v11, v7, v9

    if-gtz v11, :cond_1

    if-eqz v6, :cond_1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {p0}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->getMinImageCount()I

    move-result v7

    if-le v6, v7, :cond_1

    iget-wide v6, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-static {v6, v7}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    iget-object p1, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mCity:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->mTargetCity:Ljava/lang/String;

    iget-wide p1, v3, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->setStartTime(J)V

    iget-wide p1, v5, Lcom/miui/gallery/card/scenario/time/LocationScenario$MediaItem;->mDateTime:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;->setEndTime(J)V

    return v0

    :cond_1
    :goto_1
    move-object v3, v4

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v2
.end method

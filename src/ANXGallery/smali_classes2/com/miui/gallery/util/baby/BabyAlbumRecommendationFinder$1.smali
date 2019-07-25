.class Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;
.super Ljava/lang/Object;
.source "BabyAlbumRecommendationFinder.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->findRecommendation(Landroid/util/SparseArray;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

.field final synthetic val$babyAlbum:Landroid/util/SparseArray;

.field final synthetic val$babyAlbumLocalId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;Landroid/util/SparseArray;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    iput-object p2, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->val$babyAlbum:Landroid/util/SparseArray;

    iput-object p3, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->val$babyAlbumLocalId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;
    .locals 10

    new-instance p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    invoke-direct {p1}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-static {v0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$000(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->peopleServerId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->this$0:Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;

    invoke-static {v0}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;->access$000(Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/FaceManager;->getPeopleLocalIdByServerId(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->peopleLocalId:Ljava/lang/String;

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    const-string v1, "_id"

    const-string v4, "title"

    const-string v5, "mixedDateTime"

    filled-new-array {v1, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x2

    new-array v6, v1, [Ljava/lang/String;

    iget-object v7, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->peopleServerId:Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    iget-object v7, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->peopleLocalId:Ljava/lang/String;

    const/4 v9, 0x1

    aput-object v7, v6, v9

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_0
    :goto_0
    if-eqz v2, :cond_2

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->val$babyAlbum:Landroid/util/SparseArray;

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->val$babyAlbumLocalId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getLastClickBabyPhotosRecommandationTime(Ljava/lang/String;)J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-lez v0, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    :cond_1
    iget-object v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_4

    goto :goto_2

    :catchall_1
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    :goto_1
    if-eqz v2, :cond_3

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    iput v1, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->totalFaceCountInFaceAlbum:I

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    :catch_0
    move-object v2, v0

    :catch_1
    if-eqz v2, :cond_4

    :goto_2
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    iput v0, p1, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->totalFaceCountInFaceAlbum:I

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object p1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;

    move-result-object p1

    return-object p1
.end method

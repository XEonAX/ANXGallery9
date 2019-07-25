.class Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;
.super Lcom/miui/gallery/search/resultpage/SearchResultHelper$DataListResultProcessor;
.source "SearchImageResultHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageResultProcessor"
.end annotation


# instance fields
.field private mCachedGroupExpandState:Landroid/util/SparseBooleanArray;

.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;Lcom/miui/gallery/search/core/suggestion/RankInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchResultHelper$DataListResultProcessor;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultHelper;Lcom/miui/gallery/search/core/suggestion/RankInfo;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->mCachedGroupExpandState:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method private appendNotInSecretSelection(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "(%s) AND (%s != %s)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "localGroupId"

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const-wide/16 v2, -0x3e8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private doExpandableFirstStepQuery(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v3}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getQueryUri(Z)Landroid/net/Uri;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$100()[Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->appendNotInSecretSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const-string v9, "alias_create_time DESC "

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v3, :cond_2

    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    invoke-interface {v3}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v4, "extra_timeline_group_start_locations"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v3}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v2, "extra_timeline_group_start_pos"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x0

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    :cond_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-interface {v3, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    const/4 p3, 0x2

    invoke-interface {v3, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_1

    :cond_2
    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_3
    const-string p2, "ImageResultProcessor"

    const-string p3, "[%d]ms: first step query time for [%s]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_1
    move-exception p2

    move-object v3, v2

    :goto_1
    if-eqz v3, :cond_4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    const-string p4, "ImageResultProcessor"

    const-string v0, "[%d]ms: first step query time for [%s]"

    invoke-static {p4, v0, p3, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    throw p2
.end method

.method private doExpandableSecondStepQuery(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;"
        }
    .end annotation

    move-object/from16 v11, p0

    move-object/from16 v0, p2

    move-object/from16 v12, p4

    move-object/from16 v13, p5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-string v1, "%s IN (%s)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "alias_create_date"

    const/4 v10, 0x0

    aput-object v3, v2, v10

    const-string v3, ","

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v9, 0x1

    aput-object v3, v2, v9

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    const/16 v16, 0x0

    :try_start_0
    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-direct {v11, v9}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getQueryUri(Z)Landroid/net/Uri;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$100()[Ljava/lang/String;

    move-result-object v4

    invoke-direct {v11, v8}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->appendNotInSecretSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const-string v7, "alias_create_time DESC "

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v7, :cond_c

    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_c

    invoke-interface {v7}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_group_start_locations"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-interface {v7}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_group_start_pos"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Landroid/database/MatrixCursor;

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v10

    if-ge v1, v10, :cond_7

    invoke-interface {v7, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    const/4 v10, 0x0

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v13, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v13, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v10, "visible"

    goto :goto_1

    :cond_1
    const-string v10, "invisible"

    :goto_1
    invoke-direct {v11, v7, v10}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toRow(Landroid/database/Cursor;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    add-int/lit8 v10, v1, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v10, v1, :cond_2

    goto :goto_2

    :cond_2
    move v1, v10

    goto :goto_0

    :cond_3
    :goto_2
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v10, v1, :cond_4

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v17, 0x1

    :goto_3
    add-int/lit8 v1, v1, -0x1

    move-object/from16 v21, v2

    goto :goto_4

    :cond_4
    const/16 v17, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    goto :goto_3

    :goto_4
    const/4 v2, 0x3

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v2, p3

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Integer;

    if-eqz v12, :cond_5

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    goto :goto_5

    :cond_5
    move-object/from16 v22, v16

    :goto_5
    if-eqz v6, :cond_6

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object/from16 v23, v1

    goto :goto_6

    :cond_6
    move-object/from16 v23, v16

    :goto_6
    const/16 v24, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v25, v3

    move-object v3, v9

    move-object v9, v4

    move-object/from16 v4, v18

    move-object/from16 v18, v5

    move-object/from16 v5, v19

    move-object/from16 v19, v6

    move-object/from16 v6, v22

    move-object/from16 v22, v7

    move-object/from16 v7, v23

    move-object v12, v8

    move-object/from16 v8, v24

    move-object/from16 v26, v9

    move-object/from16 v9, v25

    move/from16 v20, v10

    const/16 v23, 0x0

    move-object/from16 v10, v21

    :try_start_2
    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toSection(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    move-result-object v1

    move-object/from16 v2, v26

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v9, Landroid/database/MatrixCursor;

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->clear()V

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->clear()V

    move-object v4, v2

    move-object v8, v12

    move-object/from16 v5, v18

    move-object/from16 v6, v19

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v7, v22

    move-object/from16 v3, v25

    move-object/from16 v12, p4

    goto/16 :goto_0

    :cond_7
    move-object v2, v4

    move-object/from16 v22, v7

    move-object v12, v8

    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->getResult()Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v1

    if-eqz v1, :cond_8

    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->getResult()Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v1

    goto :goto_7

    :cond_8
    move-object/from16 v1, v16

    :goto_7
    if-eqz v1, :cond_9

    check-cast v1, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandStateArray()Landroid/util/SparseBooleanArray;

    move-result-object v16

    :cond_9
    if-nez v16, :cond_a

    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->mCachedGroupExpandState:Landroid/util/SparseBooleanArray;

    goto :goto_8

    :cond_a
    move-object/from16 v1, v16

    :goto_8
    iput-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->mCachedGroupExpandState:Landroid/util/SparseBooleanArray;

    new-instance v1, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    iget-object v3, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v3}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$500(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Z

    move-result v3

    iget-object v4, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->mCachedGroupExpandState:Landroid/util/SparseBooleanArray;

    move-object/from16 v5, p1

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;ZLandroid/util/SparseBooleanArray;)V

    iget-object v2, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v2}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    if-eqz v0, :cond_b

    invoke-virtual {v11, v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->createRankInfoBundle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->setExtras(Landroid/os/Bundle;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_b
    move-object/from16 v16, v1

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_a

    :catchall_1
    move-exception v0

    move-object/from16 v22, v7

    move-object v12, v8

    goto :goto_a

    :cond_c
    move-object/from16 v22, v7

    move-object v12, v8

    :goto_9
    if-eqz v22, :cond_d

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    :cond_d
    const-string v0, "ImageResultProcessor"

    const-string v1, "[%d]ms: second step query time for [%s]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v14

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2, v12}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v16

    :catchall_2
    move-exception v0

    move-object v12, v8

    move-object/from16 v22, v16

    :goto_a
    if-eqz v22, :cond_e

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v1, v14

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "ImageResultProcessor"

    const-string v3, "[%d]ms: second step query time for [%s]"

    invoke-static {v2, v3, v1, v12}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v0
.end method

.method private getQueryUri(Z)Landroid/net/Uri;
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "generate_headers"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private getSuggestionsServerIdSelection(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    const-string v2, "serverId"

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getSuggestionExtra(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\',"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    const/4 p1, 0x0

    const-string v1, "serverId IN ("

    invoke-virtual {v0, p1, v1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ")"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private toRow(Landroid/database/Cursor;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 4

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x8

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x9

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xa

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xb

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xc

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xd

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xe

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xf

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/16 v1, 0xf

    aput-object p1, v0, v1

    const/16 p1, 0x10

    aput-object p2, v0, p1

    return-object v0
.end method

.method private toSection(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Landroid/database/Cursor;",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_IMAGE_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    invoke-virtual {v1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;

    invoke-direct {v2, p1, p2}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "all_ids"

    const-string v1, ","

    invoke-static {v1, p9}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p9

    invoke-interface {p1, p2, p9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p4, :cond_0

    const-string p2, "create_date"

    invoke-virtual {p4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    const-string p2, "create_time"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-eqz p5, :cond_2

    const-string p2, "title"

    invoke-interface {p1, p2, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eqz p7, :cond_3

    const-string p2, "rank_value"

    invoke-interface {p1, p2, p7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    if-eqz p8, :cond_4

    const-string p2, "collapse_visible_ids"

    const-string p3, ","

    invoke-static {p3, p8}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    if-eqz p6, :cond_5

    const-string p2, "expand_title"

    invoke-interface {p1, p2, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    new-instance p2, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;

    invoke-direct {p2, p1}, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->setSectionExtras(Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;)V

    return-object v0
.end method


# virtual methods
.method protected createSuggestionResult(Ljava/util/List;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Lcom/miui/gallery/search/core/result/ErrorInfo;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            ">;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            "Lcom/miui/gallery/search/core/result/ErrorInfo;",
            ")",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getSuggestionsServerIdSelection(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->supportExpand(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->doSimpleQuery(Ljava/util/List;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v2, v6, v7, v5}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->doExpandableFirstStepQuery(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;)V

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->doExpandableSecondStepQuery(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    const-string p3, "ImageResultProcessor"

    const-string v2, "[%d]ms: query time for [%s]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p3, v2, v0, p2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p3, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;

    invoke-direct {p3, p2, p1, p4}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p3
.end method

.method protected doSimpleQuery(Ljava/util/List;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            ">;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;"
        }
    .end annotation

    if-eqz p3, :cond_0

    const-string v0, "date"

    invoke-virtual {p3}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p3, p2, p4}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->doSimpleQueryWithRankValue(Ljava/util/List;Lcom/miui/gallery/search/core/suggestion/RankInfo;Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->doSimpleQueryWithDate(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->createRankInfoBundle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->setExtras(Landroid/os/Bundle;)V

    :cond_1
    return-object p1
.end method

.method protected doSimpleQueryWithDate(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
    .locals 21

    move-object/from16 v11, p0

    const/4 v1, 0x0

    :try_start_0
    const-string v0, "%s %s"

    const/4 v12, 0x2

    new-array v2, v12, [Ljava/lang/Object;

    const-string v3, "alias_create_time"

    const/4 v13, 0x0

    aput-object v3, v2, v13

    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getOrder()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getOrder()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    const-string v3, "date"

    invoke-static {v3}, Lcom/miui/gallery/search/SearchConstants;->getDefaultOrder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_0
    const/4 v14, 0x1

    aput-object v3, v2, v14

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iget-object v0, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-direct {v11, v14}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getQueryUri(Z)Landroid/net/Uri;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$100()[Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p3

    invoke-direct {v11, v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->appendNotInSecretSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v15, :cond_6

    :try_start_1
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_6

    invoke-interface {v15}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra_timeline_group_start_locations"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {v15}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_group_start_pos"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v9, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Landroid/database/MatrixCursor;

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v1

    const/4 v1, 0x0

    :goto_1
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-interface {v15, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {v15, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v2, "visible"

    invoke-direct {v11, v15, v2}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toRow(Landroid/database/Cursor;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    add-int/lit8 v6, v1, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v6, v1, :cond_1

    goto :goto_2

    :cond_1
    move v1, v6

    goto :goto_1

    :cond_2
    :goto_2
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v6, v1, :cond_3

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_3
    sub-int/2addr v1, v14

    goto :goto_4

    :cond_3
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    goto :goto_3

    :goto_4
    const/4 v2, 0x3

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v15, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Ljava/lang/String;

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v7

    move/from16 v20, v6

    move-object/from16 v6, v16

    move-object/from16 v16, v7

    move-object/from16 v7, v17

    move-object/from16 v17, v8

    move-object/from16 v8, v18

    move-object v12, v9

    move-object/from16 v9, v19

    move-object/from16 v18, v10

    move-object/from16 v10, v17

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toSection(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static/range {v16 .. v16}, Lmiui/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    new-instance v7, Landroid/database/MatrixCursor;

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->clear()V

    move-object v9, v12

    move-object/from16 v8, v17

    move-object/from16 v10, v18

    move/from16 v1, v20

    const/4 v12, 0x2

    goto/16 :goto_1

    :cond_4
    move-object/from16 v16, v7

    move-object v12, v9

    invoke-static/range {v16 .. v16}, Lmiui/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    new-instance v0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v12, v13}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Z)V

    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-interface {v15}, Landroid/database/Cursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v15, :cond_5

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_5
    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_5

    :cond_6
    if-eqz v15, :cond_7

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_7
    return-object v1

    :catchall_1
    move-exception v0

    move-object v15, v1

    :goto_5
    if-eqz v15, :cond_8

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_8
    throw v0
.end method

.method protected doSimpleQueryWithRankValue(Ljava/util/List;Lcom/miui/gallery/search/core/suggestion/RankInfo;Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;)Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            ">;",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;"
        }
    .end annotation

    move-object/from16 v11, p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    const-string v5, "rankValue"

    invoke-virtual {v11, v4, v5}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getSuggestionExtra(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v5, "#"

    :cond_1
    const-string v6, "serverId"

    invoke-virtual {v11, v4, v6}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getSuggestionExtra(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-interface {v1, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-interface {v2, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v4}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v12, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    const-string v3, "#"

    invoke-interface {v0, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const-string v3, "DESC"

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getOrder()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v13, 0x0

    if-eqz v3, :cond_5

    const-string v3, "#"

    invoke-interface {v0, v13, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_5
    const-string v3, "#"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v4}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-direct {v11, v13}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->getQueryUri(Z)Landroid/net/Uri;

    move-result-object v6

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$100()[Ljava/lang/String;

    move-result-object v7

    move-object/from16 v4, p4

    invoke-direct {v11, v4}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->appendNotInSecretSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v10, 0xc

    if-eqz v15, :cond_8

    :try_start_1
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_8

    const/4 v4, 0x0

    :goto_2
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-ge v4, v5, :cond_8

    invoke-interface {v15, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {v15, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    invoke-interface {v14, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_6

    new-instance v7, Landroid/util/SparseIntArray;

    invoke-direct {v7}, Landroid/util/SparseIntArray;-><init>()V

    invoke-interface {v14, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    invoke-interface {v14, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/SparseIntArray;

    invoke-interface {v1, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    invoke-virtual {v6, v5, v4}, Landroid/util/SparseIntArray;->put(II)V

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_6

    :cond_8
    invoke-interface {v14}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_e

    new-instance v9, Ljava/util/ArrayList;

    invoke-interface {v14}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v9, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    invoke-interface {v14, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/SparseIntArray;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    if-lez v2, :cond_b

    new-instance v3, Landroid/database/MatrixCursor;

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$300()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_4
    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v4

    if-ge v2, v4, :cond_a

    invoke-virtual {v1, v2}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    invoke-interface {v15, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {v15, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v15, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v12, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_9

    invoke-interface {v7, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    const-string v4, "visible"

    invoke-direct {v11, v15, v4}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toRow(Landroid/database/Cursor;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    const-string v4, "ImageResultProcessor"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "On add image "

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v15, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    const/4 v13, 0x0

    goto :goto_4

    :cond_a
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$400()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v13

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v18, v6

    move-object v6, v13

    move-object v13, v7

    move-object/from16 v7, v16

    move-object/from16 v16, v8

    move-object/from16 v8, v18

    move-object/from16 v19, v9

    move-object/from16 v9, v17

    const/16 v17, 0xc

    move-object/from16 v10, v16

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->toSection(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    move-result-object v1

    move-object/from16 v2, v19

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->clear()V

    invoke-interface {v13}, Ljava/util/List;->clear()V

    goto :goto_5

    :cond_b
    move-object v13, v7

    move-object/from16 v16, v8

    move-object v2, v9

    const/16 v17, 0xc

    :goto_5
    move-object v9, v2

    move-object v7, v13

    move-object/from16 v8, v16

    const/16 v10, 0xc

    const/4 v13, 0x0

    goto/16 :goto_3

    :cond_c
    move-object v2, v9

    new-instance v0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-object/from16 v1, p3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Z)V

    iget-object v1, v11, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-interface {v15}, Landroid/database/Cursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v15, :cond_d

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_d
    return-object v0

    :cond_e
    if-eqz v15, :cond_f

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_f
    return-object v3

    :catchall_1
    move-exception v0

    move-object v15, v3

    :goto_6
    if-eqz v15, :cond_10

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    :cond_10
    throw v0
.end method

.method protected getSuggestionExtra(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected supportExpand(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$ImageResultProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;->access$500(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const-string v0, "date"

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected toSuggestion(Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;
    .locals 5

    invoke-super {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchResultHelper$DataListResultProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "serverId"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;

    const-string v3, "serverId"

    invoke-direct {v2, v3, v1}, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtraColumnNames()Ljava/util/Collection;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtraColumnNames()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v4

    invoke-interface {v4, v3}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->setSuggestionExtras(Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;)V

    :cond_1
    return-object v0
.end method

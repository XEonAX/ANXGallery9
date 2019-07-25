.class public Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;
.super Ljava/lang/Object;
.source "RemoteDataPackingJob.java"

# interfaces
.implements Lcom/xiaomi/mistatistic/sdk/controller/e$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;,
        Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;
    }
.end annotation


# static fields
.field private static a:I


# instance fields
.field private b:J

.field private c:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;

.field private d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private g:Lorg/json/JSONObject;

.field private h:J

.field private i:I

.field private j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(IJZLcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->e:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->i:I

    iput-boolean v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    iput p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->i:I

    iput-wide p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->b:J

    iput-object p5, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;

    iput-boolean p4, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    return-void
.end method

.method private a()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method private a(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 2

    iget-wide v0, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J

    invoke-direct {p0, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->b(J)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a()V

    iput-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h:J

    :cond_0
    return-void
.end method

.method private b(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_pa"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "category"

    const-string v3, "mistat_pa"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_pa"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-object v0, v1

    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v3, v2, v3

    const/4 v4, 0x1

    aget-object v4, v2, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const/4 v6, 0x2

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    const/4 v8, 0x3

    aget-object v2, v2, v8

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v8, "name"

    invoke-virtual {v1, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "start"

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "end"

    invoke-virtual {v1, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "auto_end"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v2, "env"

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method private b(J)Z
    .locals 5

    iget-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h:J

    sub-long/2addr v0, p1

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->b:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a(J)Z

    move-result p1

    if-nez p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private c(J)Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object/from16 v9, p0

    move-wide/from16 v0, p1

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    new-instance v3, Lcom/xiaomi/mistatistic/sdk/controller/h;

    invoke-direct {v3}, Lcom/xiaomi/mistatistic/sdk/controller/h;-><init>()V

    invoke-direct/range {p0 .. p0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a()V

    iget-boolean v4, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/h;->a(Ljava/lang/Boolean;)V

    iget v4, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->i:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-ne v4, v7, :cond_0

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/h;->c(J)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget v4, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->i:I

    if-ne v4, v6, :cond_1

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/h;->a(J)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v5

    :goto_0
    const/4 v1, 0x0

    const-wide/16 v3, 0x0

    if-eqz v0, :cond_b

    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_b

    const-string v5, "Packing, get %d events from local DB"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-wide v5, v3

    move-wide v10, v5

    const/4 v7, 0x0

    :goto_1
    :try_start_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    if-ge v1, v8, :cond_a

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;

    cmp-long v12, v5, v3

    if-nez v12, :cond_2

    iget-wide v12, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    :try_start_2
    iput-wide v12, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-wide v5, v12

    goto :goto_2

    :catch_0
    move-exception v0

    move-wide v5, v12

    goto/16 :goto_4

    :cond_2
    :goto_2
    :try_start_3
    iget-wide v12, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :try_start_4
    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    iget-object v10, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    if-nez v10, :cond_3

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    iput-object v10, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    iget-object v10, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v11, "endTS"

    iget-wide v14, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J

    invoke-virtual {v10, v11, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    iget-object v11, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v14, "content"

    invoke-virtual {v11, v14, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v10, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_3
    const-string v10, "mistat_session"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_4
    const-string v10, "mistat_pv"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_5
    const-string v10, "mistat_pt"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_6
    const-string v10, "mistat_session_extra"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->e(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_7
    const-string v10, "mistat_pa"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->b(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_8
    const-string v10, "mistat_monitor"

    iget-object v11, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    goto :goto_3

    :cond_9
    invoke-direct {v9, v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V

    :goto_3
    iget-object v10, v9, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v11, "startTS"

    iget-wide v14, v8, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J

    invoke-virtual {v10, v11, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v1, v1, 0x1

    move-wide v10, v12

    goto/16 :goto_1

    :catch_1
    move-exception v0

    goto :goto_6

    :cond_a
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Packing complete, total "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " records were packed and to be uploaded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-wide v3, v5

    move v1, v7

    goto :goto_5

    :catch_2
    move-exception v0

    :goto_4
    move-wide v12, v10

    goto :goto_6

    :catch_3
    move-exception v0

    move-wide v5, v3

    move-wide v12, v5

    const/4 v7, 0x0

    goto :goto_6

    :cond_b
    :try_start_6
    const-string v0, "No data available to be packed"

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    move-wide v10, v3

    move-object v2, v5

    :goto_5
    move v8, v1

    move-wide v6, v3

    move-wide v4, v10

    move-object v3, v2

    goto :goto_7

    :goto_6
    const-string v1, "doPacking exception"

    invoke-static {v1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v3, v2

    move v8, v7

    move-wide v6, v5

    move-wide v4, v12

    :goto_7
    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;

    move-object v1, v0

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;Lorg/json/JSONArray;JJI)V

    return-object v0
.end method

.method private c(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_monitor"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "category"

    const-string v3, "mistat_monitor"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_monitor"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-object v0, v1

    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v4, "start"

    invoke-virtual {v1, v4, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "end"

    iget-wide v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mTimeStamp:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "value"

    new-instance v3, Lorg/json/JSONObject;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method private d(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_session"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "category"

    const-string v3, "mistat_session"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_session"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-object v0, v1

    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    const/4 v5, 0x1

    aget-object v2, v2, v5

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    const-string v2, "start"

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "end"

    invoke-virtual {v1, v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "env"

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method private e(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_session_extra"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "category"

    const-string v3, "mistat_session_extra"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_session_extra"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-object v0, v1

    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-string p1, "start"

    invoke-virtual {v1, p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "auto_end"

    invoke-virtual {v1, p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method private f(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_pv"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const-string v3, "category"

    const-string v4, "mistat_pv"

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "values"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "source"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_pv"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    iget-object v1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    new-array v2, v2, [Ljava/lang/String;

    if-eqz v1, :cond_2

    array-length v3, v1

    if-lez v3, :cond_2

    const/4 v3, 0x0

    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    aget-object v5, v1, v3

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    if-ltz v4, :cond_1

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    iget-object v4, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    aget-object v5, v1, v3

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const-string v1, ","

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "values"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v1, ","

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->f:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "index"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p1, "source"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    :cond_3
    const-string v1, "source"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_2
    return-void
.end method

.method private g(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v1, "mistat_pt"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const-string v2, "category"

    const-string v3, "mistat_pt"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    const-string v2, "mistat_pt"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    const-string v1, "values"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "key"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "value"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "value"

    invoke-virtual {v3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "key"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "value"

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method private h(Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const-string v2, "category"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->d:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->g:Lorg/json/JSONObject;

    const-string v2, "content"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "event"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->e:Ljava/util/HashMap;

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    const-string v0, "value"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-string v3, "value"

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v0, v4

    invoke-virtual {v2, v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto/16 :goto_3

    :cond_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "key"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "type"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "value"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "values"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->e:Ljava/util/HashMap;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_2
    const-string v1, "mistat_extra"

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mCategory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "values"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3

    :cond_3
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "key"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "type"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "count"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "numeric"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    const-string v2, "value"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_5
    :goto_1
    const-string v2, "value"

    iget-object v3, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mValue:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :goto_2
    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    const-string v2, "params"

    new-instance v3, Lorg/json/JSONObject;

    iget-object p1, p1, Lcom/xiaomi/mistatistic/sdk/data/StatEventPojo;->mExtra:Ljava/lang/String;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6
    const-string p1, "values"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_3
    return-void
.end method


# virtual methods
.method a(J)Z
    .locals 6

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-wide v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->h:J

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const-string v1, "GMT + 8"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 v1, 0x0

    const/16 v2, 0xb

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xc

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x5265c00

    add-long/2addr v4, v2

    cmp-long v0, p1, v2

    if-ltz v0, :cond_0

    cmp-long v0, p1, v4

    if-gez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public execute()V
    .locals 10

    const-wide v0, 0x7fffffffffffffffL

    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c(J)Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->b(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)J

    move-result-wide v4

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->c(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)J

    move-result-wide v6

    iget v8, v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a:I

    iget-boolean v9, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    invoke-interface/range {v2 .. v9}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;->a(Ljava/lang/String;JJIZ)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;

    const-string v2, ""

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->b(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)J

    move-result-wide v3

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->c(Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;)J

    move-result-wide v5

    iget v7, v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a:I

    iget-boolean v8, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    invoke-interface/range {v1 .. v8}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;->a(Ljava/lang/String;JJIZ)V

    :goto_0
    iget v1, v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a:I

    const/4 v2, 0x0

    const/16 v3, 0x1f4

    if-lt v1, v3, :cond_2

    const-string v1, "Packing %d events >= MAX_PACKING_EVENT %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget v0, v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$b;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v4, v2

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;)V

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/o;

    iget v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->i:I

    invoke-direct {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/o;-><init>(I)V

    invoke-virtual {v0}, Lcom/xiaomi/mistatistic/sdk/controller/o;->a()V

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a:I

    add-int/2addr v0, v2

    sput v0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a:I

    goto :goto_1

    :cond_1
    const-string v0, "Packing, exceeded MAX_UPLOAD_TIMES 10"

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->c(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    sput v2, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->a:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "remote data packing job execute exception:"

    invoke-static {v1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->c:Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;

    const-string v3, ""

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    iget-boolean v9, p0, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b;->j:Z

    invoke-interface/range {v2 .. v9}, Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/b$a;->a(Ljava/lang/String;JJIZ)V

    :goto_1
    return-void
.end method

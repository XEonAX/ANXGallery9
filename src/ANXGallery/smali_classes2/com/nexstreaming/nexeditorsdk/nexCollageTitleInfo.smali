.class Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;
.super Ljava/lang/Object;
.source "nexCollageTitleInfo.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexCollageInfo;
.implements Lcom/nexstreaming/nexeditorsdk/nexCollageInfoTitle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;
    }
.end annotation


# static fields
.field private static b:Ljava/lang/String; = "nexCollageTitleInfo"


# instance fields
.field protected a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

.field private c:F

.field private d:F

.field private e:Landroid/graphics/RectF;

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/lang/String;

.field private h:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

.field private i:Ljava/lang/String;

.field private j:I

.field private k:I

.field private l:I

.field private m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private n:Ljava/lang/String;

.field private o:Ljava/lang/String;

.field private p:Ljava/lang/String;

.field private q:Ljava/lang/String;

.field private r:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    const/16 v0, 0x14

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->j:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->k:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->l:I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F
    .locals 3

    iget v0, p2, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    iget v1, p3, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    mul-float v0, v0, v1

    iget p3, p3, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr p3, v1

    iget p2, p2, Landroid/graphics/PointF;->y:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr p2, p1

    mul-float p3, p3, p2

    sub-float/2addr v0, p3

    return v0
.end method

.method a(Landroid/graphics/PointF;Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/PointF;",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_2

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v3, p1, Landroid/graphics/PointF;->y:F

    cmpg-float v2, v2, v3

    const/4 v3, 0x0

    if-gtz v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    iget v5, p1, Landroid/graphics/PointF;->y:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    invoke-virtual {p0, v4, v2, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    iget v5, p1, Landroid/graphics/PointF;->y:F

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    invoke-virtual {p0, v4, v2, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    move-result v2

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    add-int/lit8 v1, v1, -0x1

    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method a(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 9

    :try_start_0
    const-string v0, "start"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->c:F

    const-string v0, "end"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->d:F

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, " "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "Wrong position data of titleinfo"

    return-object p1

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    array-length v1, v0

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    const/4 v3, 0x2

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    const/4 v4, 0x3

    aget-object v0, v0, v4

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v5, Landroid/graphics/PointF;

    invoke-direct {v5, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v1, v2, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->e:Landroid/graphics/RectF;

    goto :goto_1

    :cond_1
    const/4 v1, 0x1

    const v2, 0x7f7fffff    # Float.MAX_VALUE

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_0
    array-length v6, v0

    if-ge v3, v6, :cond_6

    aget-object v6, v0, v3

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    add-int/lit8 v7, v3, 0x1

    aget-object v7, v0, v7

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    cmpl-float v8, v2, v6

    if-lez v8, :cond_2

    move v2, v6

    :cond_2
    cmpg-float v8, v4, v6

    if-gez v8, :cond_3

    move v4, v6

    :cond_3
    cmpl-float v8, v1, v7

    if-lez v8, :cond_4

    move v1, v7

    :cond_4
    cmpg-float v8, v5, v7

    if-gez v8, :cond_5

    move v5, v7

    :cond_5
    new-instance v8, Landroid/graphics/PointF;

    invoke-direct {v8, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    :cond_6
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v2, v1, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->e:Landroid/graphics/RectF;

    :cond_7
    :goto_1
    const-string v0, "title_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->g:Ljava/lang/String;

    const-string v0, "title_type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_8

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;->User:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

    goto :goto_2

    :cond_8
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;->System:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

    :goto_2
    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->h:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

    const-string v0, "draw_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "draw_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->i:Ljava/lang/String;

    :cond_9
    const-string v0, "title_default"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_a
    const-string v0, "max_length"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "max_length"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->j:I

    :cond_b
    const-string v0, "recommend_length"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "recommend_length"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->k:I

    :cond_c
    const-string v0, "title_max_lines"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "title_max_lines"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->l:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_d
    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parse Collage failed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected a(Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    return-void
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;)V
    .locals 1

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userDropShadowColor:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userFillColor:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userFont:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userStrokeColor:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    iget-object p1, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userText:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    return-void
.end method

.method public a()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->h:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;->User:Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo$Type;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public a(FF)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a(Landroid/graphics/PointF;Ljava/util/List;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->e:Landroid/graphics/RectF;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->e:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public b()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_font"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fontid:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_fill_color"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_stroke_color"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_dropshadow_color"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->getId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    if-nez v1, :cond_9

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    const-string v2, "en"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_0
    const-string v2, "@content="

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz v2, :cond_5

    const-string v2, "@content="

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->i:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->TitleInfoContentTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_5
    const-string v1, ""

    goto :goto_1

    :cond_6
    const-string v2, "@collage="

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz v2, :cond_7

    const-string v2, "@collage="

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->CollageTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_7
    const-string v1, ""

    :cond_8
    :goto_1
    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_9
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_a

    const-string v1, " "

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_a
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->i:Ljava/lang/String;

    return-object v0
.end method

.method d()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userDropShadowColor:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userFillColor:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userFont:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userStrokeColor:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCollageTitleInfoOf;->userText:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->g:Ljava/lang/String;

    return-object v0
.end method

.method public getPositions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->f:Ljava/util/List;

    return-object v0
.end method

.method public getRectangle()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->e:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    return-object p1

    :cond_0
    const-string v0, ""

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    const-string v1, "en"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->m:Ljava/util/Map;

    const-string v0, "en"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    :cond_3
    :goto_0
    const-string p1, "@content="

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_5

    const-string p1, "@content="

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->i:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->TitleInfoContentTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const-string p1, "@collage="

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_5

    const-string p1, "@collage="

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->CollageTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_5
    :goto_1
    return-object v0
.end method

.method public getTitleDropShadowColor()I
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getTitleFillColor()I
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getTitleFont()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleMaxLength()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->j:I

    return v0
.end method

.method public getTitleMaxLines()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->l:I

    return v0
.end method

.method public getTitleRecommendLength()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->k:I

    return v0
.end method

.method public getTitleStrokeColor()I
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setTitle(Ljava/lang/String;)Z
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->n:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->a:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->TitleInfoChanged()V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public setTitleDropShadowColor(I)Z
    .locals 7

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    const/4 v4, 0x1

    if-nez p1, :cond_0

    const-string p1, ""

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, "#%8X"

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {p1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->r:Ljava/lang/String;

    :goto_0
    return v4
.end method

.method public setTitleFillColor(I)Z
    .locals 7

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    const/4 v4, 0x1

    if-nez p1, :cond_0

    const-string p1, ""

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, "#%8X"

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {p1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->p:Ljava/lang/String;

    :goto_0
    return v4
.end method

.method public setTitleFont(Ljava/lang/String;)Z
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->o:Ljava/lang/String;

    const/4 p1, 0x1

    return p1
.end method

.method public setTitleStrokeColor(I)Z
    .locals 7

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    const/4 v4, 0x1

    if-nez p1, :cond_0

    const-string p1, ""

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, "#%8X"

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {p1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCollageTitleInfo;->q:Ljava/lang/String;

    :goto_0
    return v4
.end method

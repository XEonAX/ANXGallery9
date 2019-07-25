.class final Lcom/nexstreaming/nexeditorsdk/e;
.super Ljava/lang/Object;
.source "nexTemplateEffect.java"


# static fields
.field private static L:Ljava/lang/String; = "nexTemplateEffect"


# instance fields
.field A:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field B:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field C:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field D:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field E:Z

.field F:Ljava/lang/String;

.field G:I

.field H:Ljava/lang/String;

.field I:I

.field J:I

.field K:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/d;",
            ">;"
        }
    .end annotation
.end field

.field a:I

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:I

.field g:I

.field h:I

.field i:I

.field j:Ljava/lang/String;

.field k:I

.field l:I

.field m:I

.field n:I

.field o:I

.field p:I

.field q:Ljava/lang/String;

.field r:I

.field s:Ljava/lang/String;

.field t:Ljava/lang/String;

.field u:Ljava/lang/String;

.field v:Ljava/lang/String;

.field w:Ljava/lang/String;

.field x:Ljava/lang/String;

.field y:Ljava/lang/String;

.field z:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->k:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->l:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->m:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->n:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->o:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->p:I

    const-string v0, "default"

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->q:Ljava/lang/String;

    const/16 v0, 0x65

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->r:I

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->s:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->t:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->D:Ljava/util/Map;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->E:Z

    const-string v1, "none"

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    const-string v1, "none"

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->J:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    return-void
.end method

.method public static a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;
    .locals 7

    const-string v0, "type"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "scene"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-direct {v1}, Lcom/nexstreaming/nexeditorsdk/e;-><init>()V

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->b:Ljava/lang/String;

    const-string v0, "identifier"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    const-string v0, "alternative_id"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "alternative_id"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    :cond_1
    const-string v0, "source_type"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v2, "res_default"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "res_path"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->e:Ljava/lang/String;

    :cond_2
    const-string v0, "duration"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    const-string v0, "duration_max"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->h:I

    const-string v0, "duration_min"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->g:I

    const-string v0, "volume"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->i:I

    const-string v0, "effect"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "effect"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const-string v0, "effects"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    :goto_0
    const-string v0, "draw_infos"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_6

    :try_start_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    const-string v3, "Effect : %s"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, v1, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    aput-object v6, v5, v2

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "draw_infos"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_5

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    shl-int/lit8 v6, p1, 0x10

    or-int/2addr v6, v4

    invoke-static {v5, v6}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/d;

    move-result-object v5

    if-eqz v5, :cond_4

    iget-object v6, v1, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/d;->a()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_5
    const-string p1, "apply_effect_on_res"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    iput-boolean v2, v1, Lcom/nexstreaming/nexeditorsdk/e;->E:Z

    :cond_6
    const-string p1, "speed_control"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->o:I

    :cond_7
    const-string p1, "brightness"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->k:I

    :cond_8
    const-string p1, "contrast"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->l:I

    :cond_9
    const-string p1, "saturation"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->m:I

    :cond_a
    const-string p1, "color_filter"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->n:I

    :cond_b
    const-string p1, "vignette"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->y:Ljava/lang/String;

    const-string p1, "lut"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->u:Ljava/lang/String;

    const-string p1, "external_video_path"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->v:Ljava/lang/String;

    const-string p1, "external_image_path"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->w:Ljava/lang/String;

    const-string p1, "solid_color"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->x:Ljava/lang/String;

    const-string p1, "apply_effect_on_res"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_c

    const-string p1, "apply_effect_on_res"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    iput-boolean v2, v1, Lcom/nexstreaming/nexeditorsdk/e;->E:Z

    :cond_c
    const-string p1, "audio_res"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    const-string p1, "audio_res"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "none"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "audio_res_pos"

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->G:I

    :cond_d
    const-string p1, "crop_mode"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->q:Ljava/lang/String;

    const-string p1, "video_crop_mode"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_e

    const-string p1, "video_crop_mode"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->s:Ljava/lang/String;

    :cond_e
    const-string p1, "image_crop_mode"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_f

    const-string p1, "image_crop_mode"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->t:Ljava/lang/String;

    :cond_f
    const-string p1, "image_crop_speed"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_10

    const-string p1, "image_crop_speed"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->r:I

    :cond_10
    const-string p1, "freeze_duration"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_11

    const-string p1, "freeze_duration"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->p:I

    :cond_11
    const-string p1, "transition_name"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    if-eqz p1, :cond_13

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    const-string v0, "none"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_12

    goto :goto_2

    :cond_12
    const-string p1, "transition_duration"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    goto :goto_3

    :cond_13
    :goto_2
    iput v2, v1, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    :goto_3
    const-string p1, "use_particle_video"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_14

    const-string p1, "use_particle_video"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->J:I

    :cond_14
    const-string p1, "alternative_effect"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_15

    :try_start_1
    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_effect"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_15
    const-string p1, "alternative_transition"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_16

    :try_start_2
    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_transition"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_16
    const-string p1, "alternative_lut"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_17

    :try_start_3
    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_lut"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_6

    :catch_3
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_17
    const-string p1, "alternative_audio"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_18

    :try_start_4
    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_audio"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_7

    :catch_4
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_18
    const-string p1, "alternative_audio_pos"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_19

    :try_start_5
    iget-object p1, v1, Lcom/nexstreaming/nexeditorsdk/e;->D:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_audio_pos"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/e;->D:Ljava/util/Map;

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_8

    :catch_5
    move-exception p0

    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p0, v1, Lcom/nexstreaming/nexeditorsdk/e;->D:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->clear()V

    :cond_19
    return-object v1
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, "effects"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "none"

    return-object p0

    :cond_0
    const-string p0, "id"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    const-string p0, "transition_duration"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    const-string p0, "audio_res_pos"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto/16 :goto_3

    :cond_1
    const-string p0, "volume"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    const-string p0, "speed_control"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    goto/16 :goto_2

    :cond_2
    const-string p0, "duration"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "3000"

    return-object p0

    :cond_3
    const-string p0, "duration_max"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "5000"

    return-object p0

    :cond_4
    const-string p0, "duration_min"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "2000"

    return-object p0

    :cond_5
    const-string p0, "brightness"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    const-string p0, "contrast"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    const-string p0, "saturation"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    const-string p0, "color_filter"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    goto/16 :goto_1

    :cond_6
    const-string p0, "source_type"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    const-string p0, "ALL"

    return-object p0

    :cond_7
    const-string p0, "external_video_path"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    const-string p0, "external_image_path"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    const-string p0, "solid_color"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    const-string p0, "lut"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    goto :goto_0

    :cond_8
    const-string p0, "vignette"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9

    const-string p0, "clip,no"

    return-object p0

    :cond_9
    const-string p0, "crop_mode"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    const-string p0, "default"

    return-object p0

    :cond_a
    const-string p0, "transition_name"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    const-string p0, "none"

    return-object p0

    :cond_b
    const-string p0, "identifier"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const-string p0, ""

    return-object p0

    :cond_c
    const-string p0, "freeze_duration"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const-string p0, "0"

    return-object p0

    :cond_d
    const-string p0, "use_particle_video"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e

    const-string p0, "1"

    return-object p0

    :cond_e
    const-string p0, "default"

    return-object p0

    :cond_f
    :goto_0
    const/4 p0, 0x0

    return-object p0

    :cond_10
    :goto_1
    const-string p0, "-1"

    return-object p0

    :cond_11
    :goto_2
    const-string p0, "100"

    return-object p0

    :cond_12
    :goto_3
    const-string p0, "0"

    return-object p0
.end method


# virtual methods
.method public a(Z)I
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/d;

    if-eqz p1, :cond_2

    iget-object v3, v2, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v4, "res_default"

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_1

    iget-object v2, v2, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v3, "user"

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    return v1
.end method

.method a(I)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;
    .locals 1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    return-object p1
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->k:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->k:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setBrightness(I)Z

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->l:I

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->l:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setContrast(I)Z

    :cond_1
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->m:I

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->m:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setSaturation(I)Z

    :cond_2
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->n:I

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->n:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/e;->a(I)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexClip;F)Ljava/lang/String;
    .locals 13

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->q:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->t:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->t:Ljava/lang/String;

    :cond_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    const/4 v4, 0x4

    if-ne v1, v4, :cond_2

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->s:Ljava/lang/String;

    :cond_2
    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v5

    const v6, 0x18c11

    const/4 v7, 0x2

    const/4 v8, 0x3

    const/4 v9, 0x0

    if-eq v5, v6, :cond_6

    const v6, 0x2ff583

    if-eq v5, v6, :cond_5

    const v6, 0x3edfb8bf

    if-eq v5, v6, :cond_4

    const v6, 0x3ee52e87

    if-eq v5, v6, :cond_3

    goto :goto_0

    :cond_3
    const-string v5, "pan_rand"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x1

    goto :goto_0

    :cond_4
    const-string v5, "pan_face"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x2

    goto :goto_0

    :cond_5
    const-string v5, "fill"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x0

    goto :goto_0

    :cond_6
    const-string v5, "fit"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x3

    :cond_7
    :goto_0
    packed-switch v1, :pswitch_data_0

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_10

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v5, 0x3f800000    # 1.0f

    mul-float v1, v1, v5

    div-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v6

    const/16 v10, 0x10e

    const/16 v11, 0x5a

    if-ne v6, v4, :cond_9

    if-eq v1, v11, :cond_8

    if-ne v1, v10, :cond_e

    goto :goto_1

    :pswitch_0
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto/16 :goto_6

    :pswitch_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_FACE:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto/16 :goto_6

    :pswitch_2
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto/16 :goto_6

    :pswitch_3
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto/16 :goto_6

    :cond_8
    :goto_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v5

    div-float/2addr v0, v4

    goto :goto_4

    :cond_9
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v4

    if-ne v4, v3, :cond_e

    :try_start_0
    new-instance v4, Landroid/media/ExifInterface;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v4

    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    move-object v4, v2

    :goto_2
    if-eqz v4, :cond_e

    const-string v6, "Orientation"

    invoke-virtual {v4, v6}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_a

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_3

    :cond_a
    const/4 v4, 0x1

    :goto_3
    const/16 v6, 0x8

    const/4 v12, 0x6

    if-eq v4, v12, :cond_b

    if-ne v4, v6, :cond_e

    :cond_b
    if-ne v4, v12, :cond_c

    const/16 v1, 0x5a

    :cond_c
    if-ne v4, v6, :cond_d

    const/16 v1, 0x10e

    :cond_d
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v5

    div-float/2addr v0, v4

    :cond_e
    :goto_4
    sub-float v4, p2, v0

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-double v4, v4

    const-wide v10, 0x3fa999999999999aL    # 0.05

    cmpl-double v6, v4, v10

    if-lez v6, :cond_f

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto :goto_5

    :cond_f
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    :goto_5
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    const-string v4, "Apply default crop mode(%f %f) (%d)"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v5, v9

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v5, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :cond_10
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v9, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    :goto_6
    return-object v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->F:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateEffectID(I)V

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->G:I

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateAudioPos(I)V

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result v2

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result p2

    add-int/2addr p2, v1

    invoke-virtual {p1, v0, v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addAudio(Lcom/nexstreaming/nexeditorsdk/nexClip;II)I

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;
    .locals 7

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    const-string v1, "Template applyEffect %s  clip(%d %d) effect(%s) apply_transition(%b) transition(%s, %d)"

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v4, 0x1

    aput-object p1, v2, v4

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v5, 0x2

    aput-object p1, v2, v5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    const/4 v5, 0x3

    aput-object p1, v2, v5

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 v5, 0x4

    aput-object p1, v2, v5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    const/4 v6, 0x5

    aput-object p1, v2, v6

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v6, 0x6

    aput-object p1, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    if-eqz p3, :cond_0

    const/high16 v0, 0x1000000

    or-int/2addr p1, v0

    :cond_0
    invoke-virtual {p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateEffectID(I)V

    :try_start_0
    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result p1

    if-ne p1, v5, :cond_4

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->i:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->i:I

    if-nez p1, :cond_1

    invoke-virtual {p2, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->i:I

    invoke-virtual {p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    :cond_2
    :goto_0
    if-nez p5, :cond_3

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->o:I

    if-eq p1, v0, :cond_3

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p1

    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/e;->o:I

    invoke-virtual {p1, p5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    :cond_3
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    const-string p5, "freeze_duration(%d)"

    new-array v0, v4, [Ljava/lang/Object;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->p:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {p5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p1, p5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->p:I

    if-eqz p1, :cond_4

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p1

    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/e;->p:I

    invoke-virtual {p1, p5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setFreezeDuration(I)V

    :cond_4
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    const-string p5, "none"

    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffectNone()V

    goto :goto_1

    :cond_5
    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p1

    iget-object p5, p0, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    invoke-virtual {p1, p5}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p1

    invoke-virtual {p1, v3, v3}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffectShowTime(II)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    invoke-virtual {p0, p2, p4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;F)Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/e;->b(Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    const/4 p1, 0x0

    if-eqz p3, :cond_8

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    const-string p4, "none"

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_8

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    if-gtz p3, :cond_6

    goto :goto_2

    :cond_6
    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result p3

    iget p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    if-gt p3, p4, :cond_7

    sget-object p3, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    const-string p4, "Template Apply transition was ignored on short clip"

    new-array p5, v3, [Ljava/lang/Object;

    invoke-static {p4, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p3

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setEffectNone()V

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p2

    invoke-virtual {p2, v3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    return-object p1

    :cond_7
    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p3

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    invoke-virtual {p3, p4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setTransitionEffect(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p2

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    invoke-virtual {p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    return-object p1

    :cond_8
    :goto_2
    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p3

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setEffectNone()V

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p2

    invoke-virtual {p2, v3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V
    :try_end_0
    .catch Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(IILjava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-nez p2, :cond_0

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    :cond_0
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-direct {v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;-><init>()V

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setID(I)V

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    shl-int/lit8 v2, v2, 0x10

    const/4 v3, 0x1

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setSubEffectID(I)V

    if-eqz p3, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEffectID(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/e;->j:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEffectID(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartTime(I)V

    add-int/2addr p1, p2

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndTime(I)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setSubTemplateDrawInfos(Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    const-string p2, "none"

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    if-lez p1, :cond_3

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;-><init>()V

    if-eqz p3, :cond_2

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {p2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEffectID(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->H:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEffectID(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setIsTransition(I)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result p2

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    sub-int/2addr p2, p3

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartTime(I)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndTime(I)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0

    :cond_3
    return-object v0
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V
    .locals 5

    if-nez p4, :cond_0

    return-void

    :cond_0
    if-eqz p3, :cond_7

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p4

    if-lez p4, :cond_7

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    const/4 v0, 0x1

    if-eqz p4, :cond_1

    invoke-virtual {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p4

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->z:Ljava/util/Map;

    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p4, v1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    :cond_1
    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_2

    invoke-virtual {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->A:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p4, v0}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setTransitionEffect(Ljava/lang/String;)V

    :cond_2
    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    const-string v0, "null"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_3

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->B:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p4}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p4

    if-eqz p4, :cond_3

    invoke-virtual {p2, p4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_3
    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_7

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/e;->C:Ljava/util/Map;

    invoke-interface {p4, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    if-eqz p4, :cond_7

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_7

    const-string v0, "none"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p4}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p4

    if-eqz p4, :cond_7

    invoke-virtual {p4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->D:Ljava/util/Map;

    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {p4, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateEffectID(I)V

    invoke-virtual {p4, p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateAudioPos(I)V

    const/4 p3, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-ge v1, v2, :cond_6

    invoke-virtual {p1, p3, p3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    if-nez v2, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTemplateEffectID()I

    move-result v3

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    if-ne v3, v4, :cond_5

    invoke-virtual {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result p3

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result p2

    add-int/2addr p2, v0

    invoke-virtual {p1, p4, p3, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addAudio(Lcom/nexstreaming/nexeditorsdk/nexClip;II)I

    :cond_7
    return-void
.end method

.method public a()Z
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v1, "res_video"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v2, "res_image"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v2, "res_solid"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;F)Z
    .locals 10

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v1, "res_video"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->e:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Template applyResource2Project file : "

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v3, :cond_1

    invoke-virtual {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    const-string v5, "res : "

    const/4 v7, 0x1

    const/4 v9, 0x0

    move-object v4, p0

    move-object v6, v3

    move v8, p3

    invoke-virtual/range {v4 .. v9}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {p0, p1, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    :cond_1
    return v2

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v4, "res_image"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->e:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    :cond_3
    if-eqz v3, :cond_4

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    add-int/2addr p2, v0

    invoke-virtual {v3, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    const-string v5, "res : "

    const/4 v7, 0x1

    const/4 v9, 0x0

    move-object v4, p0

    move-object v6, v3

    move v8, p3

    invoke-virtual/range {v4 .. v9}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {p0, p1, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    :cond_4
    return v2

    :cond_5
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    const-string v0, "res_solid"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/e;->e:Ljava/lang/String;

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSolidClip(I)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p2

    if-eqz p2, :cond_6

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    add-int/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {p2, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    const-string v4, "res : "

    const/4 v6, 0x1

    const/4 v8, 0x0

    move-object v3, p0

    move-object v5, p2

    move v7, p3

    invoke-virtual/range {v3 .. v8}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    :cond_6
    return v2

    :cond_7
    return v1
.end method

.method public b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->d:Ljava/lang/String;

    return-object v0
.end method

.method b(Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->u:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->u:Ljava/lang/String;

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->u:Ljava/lang/String;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/e;->L:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Template applyLUT2Clip effect set =xte"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public c()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    return v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->g:I

    return v0
.end method

.method public e()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->h:I

    return v0
.end method

.method public f()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->E:Z

    return v0
.end method

.method public g()Z
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->J:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public h()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->I:I

    return v0
.end method

.method public i()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->f:I

    return v0
.end method

.method public j()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/d;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/e;->K:Ljava/util/List;

    return-object v0
.end method

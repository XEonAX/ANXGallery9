.class final Lcom/nexstreaming/nexeditorsdk/d;
.super Ljava/lang/Object;
.source "nexTemplateDrawInfo.java"


# static fields
.field private static r:Ljava/lang/String; = "nexTemplateDrawInfo"


# instance fields
.field a:I

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:F

.field e:F

.field f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

.field g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field h:Ljava/lang/String;

.field i:Ljava/lang/String;

.field j:Ljava/lang/String;

.field k:F

.field l:F

.field m:I

.field n:I

.field o:I

.field p:Ljava/lang/String;

.field q:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->a:I

    const-string v1, ""

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->c:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    const-string v1, "default"

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->h:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->i:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->j:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->m:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->n:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->o:I

    const-string v0, "none"

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    return-void
.end method

.method public static a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/d;
    .locals 5

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/d;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/d;-><init>()V

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->a:I

    const-string p1, "source_type"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    iget-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v1, "user"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "source_path"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->c:Ljava/lang/String;

    const-string p1, "system_source_width"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "system_source_width"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->m:I

    :cond_0
    const-string p1, "system_source_height"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "system_source_height"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->n:I

    :cond_1
    const-string p1, "start"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->d:F

    const-string p1, "end"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->e:F

    const-string p1, "lut"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "none"

    invoke-virtual {p1, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    :cond_2
    const-string p1, "alternative_lut"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    :try_start_0
    iget-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const-string p1, "alternative_lut"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_3
    const-string p1, "crop_mode"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->h:Ljava/lang/String;

    const-string p1, "video_crop_mode"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->i:Ljava/lang/String;

    const-string p1, "image_crop_speed"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->j:Ljava/lang/String;

    const-string p1, "draw_width"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->k:F

    const-string p1, "draw_height"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->l:F

    const-string p1, "volume"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->o:I

    const-string p1, "audio_res"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "audio_res"

    invoke-static {p0, p1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "none"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "audio_res_pos"

    invoke-static {p0, v1}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p1, v0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    iput p0, v0, Lcom/nexstreaming/nexeditorsdk/d;->q:F

    :cond_4
    return-object v0
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
    const-string p0, "source_type"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "ALL"

    return-object p0

    :cond_0
    const-string p0, "source_path"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "default"

    return-object p0

    :cond_1
    const-string p0, "start"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "0"

    return-object p0

    :cond_2
    const-string p0, "end"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "1"

    return-object p0

    :cond_3
    const-string p0, "crop_mode"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    const-string p0, "video_crop_mode"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_2

    :cond_4
    const-string p0, "image_crop_speed"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "default"

    return-object p0

    :cond_5
    const-string p0, "lut"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    const-string p0, "null"

    return-object p0

    :cond_6
    const-string p0, "draw_width"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    const-string p0, "draw_height"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    goto :goto_1

    :cond_7
    const-string p0, "volume"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    const-string p0, "0"

    return-object p0

    :cond_8
    const-string p0, "system_source_width"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    const-string p0, "system_source_height"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9

    goto :goto_0

    :cond_9
    const-string p0, "audio_res"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    const-string p0, "none"

    return-object p0

    :cond_a
    const-string p0, "audio_res_pos"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    const-string p0, "0"

    return-object p0

    :cond_b
    const-string p0, "default"

    return-object p0

    :cond_c
    :goto_0
    const-string p0, "0"

    return-object p0

    :cond_d
    :goto_1
    const-string p0, "0"

    return-object p0

    :cond_e
    :goto_2
    const-string p0, "default"

    return-object p0
.end method


# virtual methods
.method a(Lcom/nexstreaming/nexeditorsdk/nexClip;F)Ljava/lang/String;
    .locals 13

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->h:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->i:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->i:Ljava/lang/String;

    :cond_0
    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v4, 0x18c11

    const/4 v5, 0x2

    const/4 v6, 0x3

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eq v3, v4, :cond_4

    const v4, 0x2ff583

    if-eq v3, v4, :cond_3

    const v4, 0x3edfb8bf

    if-eq v3, v4, :cond_2

    const v4, 0x3ee52e87

    if-eq v3, v4, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "pan_rand"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const-string v3, "pan_face"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v1, 0x2

    goto :goto_0

    :cond_3
    const-string v3, "fill"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v1, 0x0

    goto :goto_0

    :cond_4
    const-string v3, "fit"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v1, 0x3

    :cond_5
    :goto_0
    const/4 v0, 0x0

    packed-switch v1, :pswitch_data_0

    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-eqz v1, :cond_e

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float v3, v3, v4

    div-float/2addr v1, v3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v9

    const/16 v10, 0x10e

    const/16 v11, 0x5a

    if-ne v9, v2, :cond_7

    if-eq v3, v11, :cond_6

    if-ne v3, v10, :cond_c

    goto :goto_1

    :pswitch_0
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    goto/16 :goto_6

    :pswitch_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_FACE:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    goto/16 :goto_6

    :pswitch_2
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    goto/16 :goto_6

    :pswitch_3
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    goto/16 :goto_6

    :cond_6
    :goto_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v4

    div-float/2addr v1, v2

    goto :goto_4

    :cond_7
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v2

    if-ne v2, v7, :cond_c

    :try_start_0
    new-instance v2, Landroid/media/ExifInterface;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v2, v9}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v0

    :goto_2
    if-eqz v2, :cond_c

    const-string v9, "Orientation"

    invoke-virtual {v2, v9}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_3

    :cond_8
    const/4 v2, 0x1

    :goto_3
    const/16 v9, 0x8

    const/4 v12, 0x6

    if-eq v2, v12, :cond_9

    if-ne v2, v9, :cond_c

    :cond_9
    if-ne v2, v12, :cond_a

    const/16 v3, 0x5a

    :cond_a
    if-ne v2, v9, :cond_b

    const/16 v3, 0x10e

    :cond_b
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v4

    div-float/2addr v1, v2

    :cond_c
    :goto_4
    sub-float v2, p2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v9, v2

    const-wide v11, 0x3fa999999999999aL    # 0.05

    cmpl-double v2, v9, v11

    if-lez v2, :cond_d

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    goto :goto_5

    :cond_d
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    :goto_5
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v2, "Apply default crop mode(%f %f) (%d)"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v4, v8

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v4, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :cond_e
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v8, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V

    :goto_6
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected a(Lcom/nexstreaming/nexeditorsdk/nexProject;II)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->p:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v1

    int-to-float p3, p3

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/d;->q:F

    mul-float p3, p3, v2

    float-to-int p3, p3

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    add-int/2addr p2, p3

    add-int/2addr v1, p2

    invoke-virtual {p1, v0, p2, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addAudio(Lcom/nexstreaming/nexeditorsdk/nexClip;II)I

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method a()V
    .locals 6

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "subId : %d"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "start : %f"

    new-array v3, v2, [Ljava/lang/Object;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->d:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "end : %f"

    new-array v3, v2, [Ljava/lang/Object;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->e:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "lut : %d"

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result v4

    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "cropMode : %s"

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->h:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "videoCropMode : %s"

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->i:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "draw size : %f %f"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->k:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v5

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/d;->l:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "volume : %d"

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/d;->o:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v1, "---------------------------------------------------"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V
    .locals 8

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;-><init>()V

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setTopEffectID(I)V

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->a:I

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setID(I)V

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->a:I

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setSubEffectID(I)V

    int-to-float p2, p3

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->d:F

    mul-float v1, v1, p2

    float-to-int v1, v1

    add-int/2addr v1, p4

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/d;->e:F

    mul-float v2, v2, p2

    float-to-int v2, v2

    add-int/2addr v2, p4

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/d;->r:Ljava/lang/String;

    const-string v4, "Template setDrawInfo2Clip(dur:%d start:%d %d %d)"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v6, 0x0

    aput-object p3, v5, v6

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 p4, 0x1

    aput-object p3, v5, p4

    const/4 p3, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, p3

    const/4 p3, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, p3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {v3, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result p3

    if-ne p3, p4, :cond_3

    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    if-ge v1, p2, :cond_1

    move p2, v1

    goto :goto_0

    :cond_1
    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    :goto_0
    iput p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    if-le v2, p2, :cond_2

    move p2, v2

    goto :goto_1

    :cond_2
    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    :goto_1
    iput p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iget p2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iget p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    sub-int/2addr p2, p3

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    goto :goto_5

    :cond_3
    iget p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    if-ge v1, p3, :cond_4

    move p3, v1

    goto :goto_2

    :cond_4
    iget p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    :goto_2
    iput p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    if-le v2, p3, :cond_5

    move p3, v2

    goto :goto_3

    :cond_5
    iget p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    :goto_3
    iput p3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    if-eqz p7, :cond_7

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/d;->e:F

    iget p4, p0, Lcom/nexstreaming/nexeditorsdk/d;->d:F

    sub-float/2addr p3, p4

    mul-float p2, p2, p3

    float-to-int p2, p2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoDuration()I

    move-result p3

    if-ge p2, p3, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoDuration()I

    move-result p2

    :goto_4
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p3

    invoke-virtual {p3, v6, p2}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    :cond_7
    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->o:I

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    :goto_5
    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartTime(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndTime(I)V

    if-eqz p6, :cond_9

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    invoke-interface {p2, p6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->g:Ljava/util/Map;

    invoke-interface {p2, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p2

    if-nez p2, :cond_8

    goto :goto_6

    :cond_8
    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result v6

    :goto_6
    invoke-virtual {v0, v6}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    goto :goto_8

    :cond_9
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez p2, :cond_a

    goto :goto_7

    :cond_a
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->f:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result v6

    :goto_7
    invoke-virtual {v0, v6}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    :goto_8
    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->k:F

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_b

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->l:F

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_b

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/d;->k:F

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/d;->l:F

    div-float p5, p2, p3

    :cond_b
    invoke-virtual {v0, p5}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRatio(F)V

    invoke-virtual {p0, p1, p5}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;F)Ljava/lang/String;

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p4

    invoke-virtual {p4, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result p4

    invoke-virtual {v0, p4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRotateState(I)V

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->addDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    return-void
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/e;IF)Z
    .locals 9

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v1, "system"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v1, "system_mt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->c:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/d;->c:Ljava/lang/String;

    invoke-static {p2, v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    :cond_1
    move-object v2, v0

    const/4 p2, 0x1

    if-eqz v2, :cond_3

    invoke-virtual {v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/d;->b:Ljava/lang/String;

    const-string v1, "system_mt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setMotionTrackedVideo(Z)V

    :cond_2
    invoke-virtual {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    iput p4, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result p1

    add-int/2addr p1, p4

    iput p1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iget v3, p3, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v8}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V

    :cond_3
    return p2

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

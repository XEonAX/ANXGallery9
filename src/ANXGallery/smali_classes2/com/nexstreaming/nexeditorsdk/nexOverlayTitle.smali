.class final Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;
.super Ljava/lang/Object;
.source "nexOverlayTitle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String; = "nexOverlayTitle"


# instance fields
.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

.field private g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private h:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->h:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    return-void
.end method

.method private a(Lorg/json/JSONObject;)Z
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :try_start_0
    const-string v0, "overlay_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->b:Ljava/lang/String;

    const-string v0, "overlay_version"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->c:Ljava/lang/String;

    const-string v0, "overlay_desc"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->d:Ljava/lang/String;

    const-string v0, "overlay_priority"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->e:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pasrse Overlay info failed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method private b(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    .locals 4

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->overlay:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne v2, v3, :cond_1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v0

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->overlay:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    if-ne v0, v2, :cond_1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;-><init>(Ljava/lang/String;Z)V

    return-object v0

    :cond_1
    return-object v1
.end method

.method private b(Lorg/json/JSONObject;Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;)Ljava/lang/String;
    .locals 13

    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pasrse Overlay : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "id"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->h:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const-string v2, "type"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "text"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "text"

    const-string v2, "text"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v1, "text_desc"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "text_desc"

    const-string v2, "text_desc"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v1, "text_max_len"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "text_max_len"

    const-string v2, "text_max_len"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const-string v1, "position"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "position"

    const-string v2, "position"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    const-string v1, "start_time"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "start_time"

    const-string v2, "start_time"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    const-string v1, "duration"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "duration"

    const-string v2, "duration"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    const-string v1, "font"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "font"

    const-string v2, "font"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    const-string v1, "font_size"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "font_size"

    const-string v2, "font_size"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const-string v1, "text_color"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v1, "text_color"

    const-string v2, "text_color"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    const-string v1, "shadow_color"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "shadow_color"

    const-string v2, "shadow_color"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    const-string v1, "shadow_visible"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "shadow_visible"

    const-string v2, "shadow_visible"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    const-string v1, "glow_color"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    const-string v1, "glow_color"

    const-string v2, "glow_color"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    const-string v1, "glow_visible"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    const-string v1, "glow_visible"

    const-string v2, "glow_visible"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    const-string v1, "outline_color"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v1, "outline_color"

    const-string v2, "outline_color"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    const-string v1, "outline_visible"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    const-string v1, "outline_visible"

    const-string v2, "outline_visible"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    const-string v1, "align"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    const-string v1, "align"

    const-string v2, "align"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    const-string v1, "animation"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    const-string v1, "animation"

    const-string v2, "animation"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    const-string v1, "adjust_animation_non_sub"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    const-string v1, "adjust_animation_non_sub"

    const-string v2, "adjust_animation_non_sub"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    const-string v1, "rotate"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    const-string v1, "rotate"

    const-string v2, "rotate"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    const-string v1, "scale"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    const-string v1, "scale"

    const-string v2, "scale"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    const-string v1, "group"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    const-string v1, "group"

    const-string v2, "group"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    const-string v1, "adjust_pos_non_sub"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    const-string v1, "adjust_pos_non_sub"

    const-string v2, "adjust_pos_non_sub"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_15
    const-string v1, "adjust_align_non_sub"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    const-string v1, "adjust_align_non_sub"

    const-string v2, "adjust_align_non_sub"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    const-string v1, "image_res"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    const-string v1, "image_res"

    const-string v2, "image_res"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    const-string v1, "start_time"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START_END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v1, v2, :cond_18

    goto :goto_0

    :cond_18
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v1, v2, :cond_19

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START_END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    goto :goto_0

    :cond_19
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    goto :goto_0

    :cond_1a
    const-string v1, "start_time"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "-1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START_END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v1, v2, :cond_1b

    goto :goto_0

    :cond_1b
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v1, v2, :cond_1c

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START_END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    goto :goto_0

    :cond_1c
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->f:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    :cond_1d
    :goto_0
    const/4 v1, 0x1

    if-eqz p2, :cond_20

    const-string v2, "text"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    const-string v2, "font"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "text"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "text_desc"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "group"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    const-string v2, "group"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_1e
    const-string v2, ""

    :goto_1
    move-object v10, v2

    const-string v2, "text_max_len"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const-string v2, "font_size"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const-string v2, "position"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    const/4 v2, 0x0

    if-eqz p1, :cond_1f

    const-string p1, "position"

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v3, " "

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v3, ","

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1f

    aget-object v2, p1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    aget-object v3, p1, v1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x2

    aget-object v4, p1, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v11, 0x3

    aget-object p1, p1, v11

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    sub-int/2addr v4, v2

    sub-int/2addr p1, v3

    move v12, p1

    move v11, v4

    goto :goto_2

    :cond_1f
    move v12, v6

    const/4 v11, 0x0

    :goto_2
    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->h:I

    move-object v3, p2

    invoke-interface/range {v3 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;->OnTitleInfoListener(ILjava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;II)V

    :cond_20
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->h:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->h:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method a(ILjava/util/List;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;I)I"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getId()I

    move-result v1

    if-ne v1, p1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getFontSize()I

    move-result p2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getFontSize() id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", FontSize="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gtz p2, :cond_1

    return p3

    :cond_1
    return p2

    :cond_2
    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getFontSize() id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", defaultFontSize="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p3
.end method

.method a(Ljava/lang/String;Ljava/util/List;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;I)I"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getGroup()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getFontSize()I

    move-result p1

    return p1

    :cond_2
    return p3
.end method

.method a(Z)I
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string v3, "start_time"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "duration"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-eqz p1, :cond_2

    if-gez v3, :cond_1

    goto :goto_0

    :cond_1
    if-ge v1, v2, :cond_0

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_2
    if-ltz v3, :cond_3

    goto :goto_0

    :cond_3
    if-ge v1, v2, :cond_0

    goto :goto_1

    :cond_4
    return v1
.end method

.method a(Ljava/lang/String;)Landroid/animation/TimeInterpolator;
    .locals 1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "CycleInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_1

    :sswitch_1
    const-string v0, "BounceInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "LinearInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x6

    goto :goto_1

    :sswitch_3
    const-string v0, "AccelerateInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :sswitch_4
    const-string v0, "AnticipateOvershootInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_1

    :sswitch_5
    const-string v0, "OvershootInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    goto :goto_1

    :sswitch_6
    const-string v0, "AnticipateInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :sswitch_7
    const-string v0, "DecelerateInterpolator"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    packed-switch p1, :pswitch_data_0

    new-instance p1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    goto :goto_2

    :pswitch_0
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    goto :goto_2

    :pswitch_1
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    goto :goto_2

    :pswitch_2
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    goto :goto_2

    :pswitch_3
    new-instance p1, Landroid/view/animation/CycleInterpolator;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p1, v0}, Landroid/view/animation/CycleInterpolator;-><init>(F)V

    goto :goto_2

    :pswitch_4
    new-instance p1, Landroid/view/animation/BounceInterpolator;

    invoke-direct {p1}, Landroid/view/animation/BounceInterpolator;-><init>()V

    goto :goto_2

    :pswitch_5
    new-instance p1, Landroid/view/animation/AnticipateOvershootInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AnticipateOvershootInterpolator;-><init>()V

    goto :goto_2

    :pswitch_6
    new-instance p1, Landroid/view/animation/AnticipateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    goto :goto_2

    :pswitch_7
    new-instance p1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    :goto_2
    return-object p1

    :sswitch_data_0
    .sparse-switch
        -0x5bbc84bd -> :sswitch_7
        -0x4f21868f -> :sswitch_6
        -0x4c093fee -> :sswitch_5
        -0x455ba138 -> :sswitch_4
        -0x87f9f9c -> :sswitch_3
        0x235958ac -> :sswitch_2
        0x5469c38f -> :sswitch_1
        0x64414cad -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method a(ILjava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getId()I

    move-result v1

    if-ne v1, p1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getFontID()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p3
.end method

.method public a(Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)Ljava/lang/String;
    .locals 52
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/nexstreaming/nexeditorsdk/nexProject;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v0, p2

    move-object/from16 v8, p3

    invoke-virtual {v7, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;)Ljava/lang/String;

    invoke-virtual {v7, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    move-result-object v9

    iget-object v1, v7, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/4 v12, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "type"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v13, "title"

    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    const/4 v14, 0x1

    if-eqz v13, :cond_2

    const-string v13, "group"

    invoke-virtual {v5, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "group"

    invoke-virtual {v5, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    const-string v15, "_1"

    invoke-virtual {v13, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    if-nez v1, :cond_0

    const-string v1, "group"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v7, v8, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/util/List;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v13, "adjust_pos_non_sub"

    invoke-virtual {v5, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v3, "adjust_pos_non_sub"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, " "

    const-string v13, ""

    invoke-virtual {v3, v4, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v4, v3, v12

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v3, v3, v14

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :goto_1
    move-object v15, v1

    move v13, v2

    move/from16 v17, v3

    move/from16 v16, v4

    goto :goto_2

    :cond_0
    const-string v13, "group"

    invoke-virtual {v5, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    const-string v1, "group"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v7, v8, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/util/List;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v3, "adjust_pos_non_sub"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "adjust_pos_non_sub"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, " "

    const-string v13, ""

    invoke-virtual {v3, v4, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v4, v3, v12

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v3, v3, v14

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_1

    :cond_1
    move-object v15, v1

    move v13, v2

    const/16 v16, 0x0

    const/16 v17, 0x0

    goto :goto_2

    :cond_2
    move-object v15, v1

    move v13, v2

    move/from16 v16, v3

    move/from16 v17, v4

    :goto_2
    if-eqz v13, :cond_3

    const-string v1, "group"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "group"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "_2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_3
    move-object v1, v0

    move-object/from16 v45, v9

    move-object/from16 v46, v10

    goto/16 :goto_1e

    :cond_3
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0x5faa95b

    const/16 v18, -0x1

    if-eq v1, v2, :cond_5

    const v2, 0x6942258

    if-eq v1, v2, :cond_4

    goto :goto_4

    :cond_4
    const-string v1, "title"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x0

    goto :goto_5

    :cond_5
    const-string v1, "image"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x1

    goto :goto_5

    :cond_6
    :goto_4
    const/4 v1, -0x1

    :goto_5
    const/16 v19, 0x3

    const/4 v6, 0x2

    packed-switch v1, :pswitch_data_0

    move-object/from16 v49, v5

    move-object/from16 v45, v9

    move-object/from16 v46, v10

    const/4 v0, 0x0

    goto/16 :goto_12

    :pswitch_0
    const-string v1, "id"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    const-string v1, "position"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, " "

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7

    const-string v0, "Wrong position data of title"

    return-object v0

    :cond_7
    aget-object v2, v1, v12

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    aget-object v3, v1, v14

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aget-object v4, v1, v6

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v1, v1, v19

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v2, v4

    div-int/lit8 v22, v2, 0x2

    add-int/2addr v3, v1

    div-int/lit8 v23, v3, 0x2

    const-string v1, "start_time"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "duration"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v9, v3, :cond_8

    if-ltz v1, :cond_9

    :cond_8
    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v9, v3, :cond_a

    if-ltz v1, :cond_a

    :cond_9
    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    const-string v3, "Apply image res skip(%s %d)"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v14

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    :cond_a
    if-gez v1, :cond_c

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v1

    if-ge v1, v2, :cond_b

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v2

    const/16 v24, 0x0

    goto :goto_6

    :cond_b
    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v1

    sub-int/2addr v1, v2

    :cond_c
    move/from16 v24, v1

    :goto_6
    const-string v1, "image_res"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v7, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->b(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v21

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    add-int v25, v24, v2

    move-object/from16 v20, v1

    invoke-direct/range {v20 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IIII)V

    move-object v0, v1

    move-object/from16 v49, v5

    move-object/from16 v45, v9

    move-object/from16 v46, v10

    goto/16 :goto_12

    :pswitch_1
    const-string v1, "id"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "text"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "text_max_len"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    const-string v3, "position"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, " "

    const-string v11, ""

    invoke-virtual {v3, v4, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_d

    const-string v0, "Wrong position data of title"

    return-object v0

    :cond_d
    aget-object v4, v3, v12

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v11, v3, v14

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    aget-object v20, v3, v6

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    aget-object v3, v3, v19

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int v21, v4, v20

    div-int/lit8 v21, v21, 0x2

    add-int v22, v11, v3

    div-int/lit8 v22, v22, 0x2

    sub-int v29, v20, v4

    sub-int/2addr v3, v11

    const-string v4, "start_time"

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const-string v11, "duration"

    invoke-virtual {v5, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    sget-object v14, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v9, v14, :cond_e

    if-ltz v4, :cond_f

    :cond_e
    sget-object v14, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    if-ne v9, v14, :cond_10

    if-ltz v4, :cond_10

    :cond_f
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    const-string v2, "Apply title skip(%s %d)"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    :cond_10
    const-string v14, "font"

    invoke-virtual {v5, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v7, v1, v8, v14}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(ILjava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    const-string v14, "font_size"

    invoke-virtual {v5, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v7, v1, v8, v14}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(ILjava/util/List;I)I

    move-result v14

    const-string v6, "text_color"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v34

    if-le v14, v3, :cond_11

    add-int/lit8 v14, v3, -0x4

    :cond_11
    const-string v6, "shadow_visible"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const/4 v12, 0x1

    if-ne v6, v12, :cond_12

    const/4 v6, 0x1

    goto :goto_7

    :cond_12
    const/4 v6, 0x0

    :goto_7
    const-string v12, "shadow_color"

    invoke-virtual {v5, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v41

    const-string v12, "glow_visible"

    invoke-virtual {v5, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    move-object/from16 v45, v9

    const/4 v9, 0x1

    if-ne v12, v9, :cond_13

    const/4 v12, 0x1

    goto :goto_8

    :cond_13
    const/4 v12, 0x0

    :goto_8
    const-string v9, "glow_color"

    invoke-virtual {v5, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    move-object/from16 v46, v10

    const-string v10, "outline_visible"

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v0, 0x1

    if-ne v10, v0, :cond_14

    const/4 v0, 0x1

    goto :goto_9

    :cond_14
    const/4 v0, 0x0

    :goto_9
    const-string v10, "outline_color"

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    move/from16 v47, v10

    const-string v10, "align"

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    if-eqz v13, :cond_15

    move-object/from16 v48, v10

    const-string v10, "adjust_align_non_sub"

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_16

    const-string v10, "adjust_align_non_sub"

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    goto :goto_a

    :cond_15
    move-object/from16 v48, v10

    :cond_16
    move-object/from16 v10, v48

    :goto_a
    sget-object v20, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    move-object/from16 v49, v5

    const-string v5, "LEFT"

    invoke-virtual {v10, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_17

    sget-object v5, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    :goto_b
    move-object/from16 v35, v5

    goto :goto_c

    :cond_17
    const-string v5, "RIGHT"

    invoke-virtual {v10, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_18

    sget-object v5, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    goto :goto_b

    :cond_18
    move-object/from16 v35, v20

    :goto_c
    const-string v5, "MIDDLE"

    invoke-virtual {v10, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_19

    const/16 v37, 0x2

    goto :goto_d

    :cond_19
    const-string v5, "BOTTOM"

    invoke-virtual {v10, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1a

    const/16 v37, 0x3

    goto :goto_d

    :cond_1a
    const/16 v37, 0x1

    :goto_d
    if-eqz v13, :cond_1b

    invoke-virtual {v7, v15, v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v15, v8, v14}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;Ljava/util/List;I)I

    move-result v14

    add-int v21, v21, v16

    add-int v22, v22, v17

    :goto_e
    move-object/from16 v28, v2

    move/from16 v23, v22

    move/from16 v22, v21

    goto :goto_f

    :cond_1b
    invoke-virtual {v7, v1, v8, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->b(ILjava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    :goto_f
    if-eqz v28, :cond_22

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_1c

    goto/16 :goto_13

    :cond_1c
    if-gez v4, :cond_1e

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v2

    if-ge v2, v11, :cond_1d

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v11

    const/16 v24, 0x0

    goto :goto_10

    :cond_1d
    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v2

    sub-int/2addr v2, v11

    move/from16 v24, v2

    goto :goto_10

    :cond_1e
    move/from16 v24, v4

    :goto_10
    new-instance v2, Lcom/nexstreaming/app/common/util/q;

    const/high16 v31, 0x3f800000    # 1.0f

    move-object/from16 v26, v2

    move-object/from16 v27, p1

    move/from16 v30, v3

    invoke-direct/range {v26 .. v31}, Lcom/nexstreaming/app/common/util/q;-><init>(Landroid/content/Context;Ljava/lang/String;IIF)V

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    new-instance v4, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;-><init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;)V

    add-int v25, v24, v11

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    invoke-direct/range {v20 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IIII)V

    int-to-float v1, v14

    move-object/from16 v32, v2

    move/from16 v33, v1

    invoke-virtual/range {v32 .. v37}, Lcom/nexstreaming/app/common/util/q;->a(FILandroid/graphics/Paint$Align;Ljava/lang/String;I)V

    if-eqz v6, :cond_1f

    const/high16 v42, 0x40a00000    # 5.0f

    const/high16 v43, 0x40400000    # 3.0f

    const/high16 v44, 0x40400000    # 3.0f

    const/16 v40, 0x1

    move-object/from16 v39, v2

    invoke-virtual/range {v39 .. v44}, Lcom/nexstreaming/app/common/util/q;->a(ZIFFF)V

    :cond_1f
    if-eqz v12, :cond_20

    const/high16 v1, 0x41000000    # 8.0f

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v9, v1}, Lcom/nexstreaming/app/common/util/q;->b(ZIF)V

    goto :goto_11

    :cond_20
    const/4 v4, 0x1

    :goto_11
    if-eqz v0, :cond_21

    const/high16 v0, 0x3f800000    # 1.0f

    move/from16 v1, v47

    invoke-virtual {v2, v4, v1, v0}, Lcom/nexstreaming/app/common/util/q;->a(ZIF)V

    :cond_21
    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/nexstreaming/app/common/util/q;->a(I)V

    move-object v0, v3

    :goto_12
    if-nez v0, :cond_23

    :cond_22
    :goto_13
    move-object/from16 v1, p2

    goto/16 :goto_1e

    :cond_23
    const-string v1, "rotate"

    move-object/from16 v5, v49

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    const-string v1, "rotate"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setRotate(F)V

    :cond_24
    const-string v1, "scale"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    const-string v1, "scale"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, " "

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_25

    const/4 v12, 0x0

    aget-object v2, v1, v12

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    const/4 v3, 0x1

    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    const/16 v38, 0x2

    aget-object v1, v1, v38

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    invoke-virtual {v0, v2, v3, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setScale(FFF)V

    goto :goto_14

    :cond_25
    const/4 v12, 0x0

    const/16 v38, 0x2

    :goto_14
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->clearAnimate()V

    const-string v1, "animation"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v13, :cond_26

    const-string v2, "adjust_animation_non_sub"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    const-string v1, "adjust_animation_non_sub"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_26
    :try_start_0
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v10, 0x0

    :goto_15
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v10, v1, :cond_2e

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "values"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v3, -0x372522a5

    if-eq v1, v3, :cond_2a

    const v3, 0x333bd1

    if-eq v1, v3, :cond_29

    const v3, 0x589b15e

    if-eq v1, v3, :cond_28

    const v3, 0x683094a

    if-eq v1, v3, :cond_27

    goto :goto_16

    :cond_27
    const-string v1, "scale"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v1, 0x2

    goto :goto_17

    :cond_28
    const-string v1, "alpha"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v1, 0x1

    goto :goto_17

    :cond_29
    const-string v1, "move"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v1, 0x0

    goto :goto_17

    :cond_2a
    const-string v1, "rotate"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v1, 0x3

    goto :goto_17

    :cond_2b
    :goto_16
    const/4 v1, -0x1

    :goto_17
    packed-switch v1, :pswitch_data_1

    :cond_2c
    const/16 v20, 0x2

    goto/16 :goto_1d

    :pswitch_2
    const/4 v1, 0x0

    :goto_18
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2c

    invoke-virtual {v11, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "motion_type"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    move-result-object v3

    const-string v4, "start_time"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "end_time"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, "clockwise"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const/4 v14, 0x1

    if-ne v6, v14, :cond_2d

    const/4 v6, 0x1

    goto :goto_19

    :cond_2d
    const/4 v6, 0x0

    :goto_19
    const-string v14, "rotatedegree"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    sub-int/2addr v5, v4

    const/4 v14, 0x0

    invoke-static {v4, v5, v6, v2, v14}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getRotate(IIZFLcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->setInterpolator(Landroid/animation/TimeInterpolator;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :pswitch_3
    const/4 v1, 0x0

    :goto_1a
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2c

    invoke-virtual {v11, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "motion_type"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    move-result-object v3

    const-string v4, "start_time"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    const-string v4, "end_time"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "start_x"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v22

    const-string v5, "end_x"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v24

    const-string v5, "start_y"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v23

    const-string v5, "end_y"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v25

    sub-int v21, v4, v20

    invoke-static/range {v20 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScale(IIFFFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->setInterpolator(Landroid/animation/TimeInterpolator;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :pswitch_4
    const/4 v1, 0x0

    :goto_1b
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2c

    invoke-virtual {v11, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "motion_type"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    move-result-object v3

    const-string v4, "start_time"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "end_time"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, "start"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    const-string v14, "end"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    sub-int/2addr v5, v4

    invoke-static {v4, v5, v6, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->setInterpolator(Landroid/animation/TimeInterpolator;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    :pswitch_5
    const/4 v14, 0x0

    :goto_1c
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v14, v1, :cond_2c

    invoke-virtual {v11, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "motion_type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    move-result-object v6

    const-string v2, "start_time"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const-string v2, "end_time"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "start_x"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    const-string v4, "end_x"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    const-string v12, "start_y"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    move-object/from16 v50, v6

    const-string v6, "end_y"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    sub-int/2addr v2, v5

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;

    move-object/from16 v51, v1

    move-object/from16 v1, v51

    move v7, v2

    move-object/from16 v2, p0

    move v8, v5

    move v5, v12

    move-object/from16 v12, v50

    const/16 v20, 0x2

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;FFFF)V

    invoke-static {v8, v7, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getMove(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->setInterpolator(Landroid/animation/TimeInterpolator;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v7, p0

    move-object/from16 v8, p3

    const/4 v12, 0x0

    const/16 v38, 0x2

    goto :goto_1c

    :goto_1d
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v7, p0

    move-object/from16 v8, p3

    const/4 v12, 0x0

    const/16 v38, 0x2

    goto/16 :goto_15

    :cond_2e
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setOverlayTitle(Z)V

    move-object/from16 v1, p2

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addOverlay(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Z

    :goto_1e
    move-object v0, v1

    move v2, v13

    move-object v1, v15

    move/from16 v3, v16

    move/from16 v4, v17

    move-object/from16 v9, v45

    move-object/from16 v10, v46

    move-object/from16 v7, p0

    move-object/from16 v8, p3

    const/4 v12, 0x0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyOverlayAsset failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2f
    const/4 v0, 0x0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexProject;)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_0

    const-string p1, "Null project"

    return-object p1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOverlayItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayTitle()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->removeOverlay(I)Z

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method a(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getGroup()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Lorg/json/JSONObject;Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;)Ljava/lang/String;
    .locals 2

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "parseOverlayAssetInfo parse error"

    return-object p1

    :cond_0
    :try_start_0
    const-string v0, "overlay"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->b(Lorg/json/JSONObject;Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Overlay parse error : "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    const-string p2, "parseOverlayAsset end"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->g:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parseOverlayAsset failed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method a(Ljava/util/List;Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getGroup()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method b(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;
    .locals 2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result p1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Z)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Z)I

    move-result v1

    add-int/2addr v0, v1

    if-lt p1, v0, :cond_0

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START_END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->e:Ljava/lang/String;

    const-string v0, "start"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->START:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    return-object p1

    :cond_1
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;->END:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$Priority;

    return-object p1
.end method

.method b(ILjava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getId()I

    move-result v1

    if-ne v1, p1, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->getText()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p3
.end method

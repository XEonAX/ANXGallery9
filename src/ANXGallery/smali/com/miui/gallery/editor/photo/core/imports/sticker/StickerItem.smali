.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;
.super Lcom/miui/gallery/editor/photo/core/common/model/StickerData;
.source "StickerItem.java"


# instance fields
.field cateName:Ljava/lang/String;

.field content:Ljava/lang/String;

.field id:J


# direct methods
.method public constructor <init>(SLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p5}, Lcom/miui/gallery/editor/photo/core/common/model/StickerData;-><init>(SLjava/lang/String;Ljava/lang/String;)V

    iput-object p6, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->content:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    iput-object p7, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->cateName:Ljava/lang/String;

    return-void
.end method

.method static fromJson(Lorg/json/JSONObject;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "priority"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-short v2, v0

    const-string v0, "name"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "id"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-string v0, "icon"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "content"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "cateName"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    move-object v1, p0

    invoke-direct/range {v1 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;-><init>(SLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method static toJson(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)Lorg/json/JSONObject;
    .locals 4

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "priority"

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->priority:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "name"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "id"

    iget-wide v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "icon"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->icon:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "content"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->content:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "cateName"

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->cateName:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    const-string v0, "StickerItem"

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    iget-wide v3, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    iget-wide v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    cmp-long p1, v3, v5

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    iget-wide v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

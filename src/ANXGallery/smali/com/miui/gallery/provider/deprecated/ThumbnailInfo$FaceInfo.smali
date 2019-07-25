.class Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;
.super Ljava/lang/Object;
.source "ThumbnailInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FaceInfo"
.end annotation


# instance fields
.field private final eyeLeftXScale:D

.field private final eyeLeftYScale:D

.field private final eyeRightXScale:D

.field private final eyeRightYScale:D

.field private final faceHScale:D

.field private final faceRegionOrientation:I

.field private final faceWScale:D

.field private final faceXScale:D

.field private final faceYScale:D


# direct methods
.method private constructor <init>(DDDDDDDDI)V
    .locals 3

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-wide v1, p1

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftXScale:D

    move-wide v1, p3

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftYScale:D

    move-wide v1, p5

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightXScale:D

    move-wide v1, p7

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightYScale:D

    move-wide v1, p9

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    move-wide v1, p11

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    move-wide/from16 v1, p13

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceWScale:D

    move-wide/from16 v1, p15

    iput-wide v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceHScale:D

    move/from16 v1, p17

    iput v1, v0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceRegionOrientation:I

    return-void
.end method

.method static equals(Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;)Z
    .locals 0

    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static from(Ljava/lang/String;)Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static/range {p0 .. p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v19, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    move-object/from16 v1, v19

    const-string v2, "eyeLeftXScale"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    const-string v4, "eyeLeftYScale"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    const-string v6, "eyeRightXScale"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    const-string v8, "eyeRightYScale"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    const-string v10, "faceXScale"

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v10

    const-string v12, "faceYScale"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v12

    const-string v14, "faceWScale"

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v14

    move-object/from16 v20, v1

    const-string v1, "faceHScale"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v16

    const-string v1, "faceOrientation"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    move-object/from16 v1, v20

    invoke-direct/range {v1 .. v18}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;-><init>(DDDDDDDDI)V

    return-object v19
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftXScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftXScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftYScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftYScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightXScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightXScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightYScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightYScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceWScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceWScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceHScale:D

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceHScale:D

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Utils;->doubleEquals(DD)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceRegionOrientation:I

    iget p1, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceRegionOrientation:I

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method getFacePosition()Landroid/graphics/RectF;
    .locals 9

    new-instance v6, Lcom/miui/gallery/util/face/FaceRegionRectF;

    iget-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    double-to-float v1, v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    double-to-float v2, v2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    iget-wide v7, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceWScale:D

    add-double/2addr v3, v7

    double-to-float v3, v3

    iget-wide v4, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    iget-wide v7, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceHScale:D

    add-double/2addr v4, v7

    double-to-float v4, v4

    iget v5, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceRegionOrientation:I

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    return-object v6
.end method

.method toJSON()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "eyeLeftXScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftXScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "eyeLeftYScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeLeftYScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "eyeRightXScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightXScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "eyeRightYScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->eyeRightYScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "faceXScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceXScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "faceYScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceYScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "faceWScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceWScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "faceHScale"

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceHScale:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "faceOrientation"

    iget v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->faceRegionOrientation:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

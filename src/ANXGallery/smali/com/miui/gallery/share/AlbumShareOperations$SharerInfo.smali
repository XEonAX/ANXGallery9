.class public final Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareOperations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SharerInfo"
.end annotation


# instance fields
.field public final mAlbumNickName:Ljava/lang/String;

.field public final mFaceRelativePos:Landroid/graphics/RectF;

.field public final mOwnerRelationText:Ljava/lang/String;

.field public final mSharerRelationText:Ljava/lang/String;

.field public final mThumbnailUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "albumNickName"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mAlbumNickName:Ljava/lang/String;

    const-string p1, "ownerRelationText"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mOwnerRelationText:Ljava/lang/String;

    const-string p1, "sharerRelationText"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mSharerRelationText:Ljava/lang/String;

    const-string p1, "thumbnail"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    const-string p1, "thumbnailFaceInfo"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "faceXScale"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    double-to-float v0, v0

    const-string v1, "faceYScale"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-float v1, v1

    const-string v2, "faceWScale"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    double-to-float v2, v2

    const-string v3, "faceHScale"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float p1, v3

    new-instance v3, Landroid/graphics/RectF;

    add-float/2addr v2, v0

    add-float/2addr p1, v1

    invoke-direct {v3, v0, v1, v2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v3, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mFaceRelativePos:Landroid/graphics/RectF;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mFaceRelativePos:Landroid/graphics/RectF;

    :goto_0
    return-void
.end method

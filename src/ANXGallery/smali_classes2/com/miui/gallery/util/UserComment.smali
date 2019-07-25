.class Lcom/miui/gallery/util/UserComment;
.super Ljava/lang/Object;
.source "ExifUtil.java"


# instance fields
.field private mExif:Lcom/miui/gallery/util/ExifInterfaceWrapper;

.field private mIsOriginalUserCommentUsable:Z

.field private mJsonUserComment:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/ExifInterfaceWrapper;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/util/UserComment;->mIsOriginalUserCommentUsable:Z

    iput-object p1, p0, Lcom/miui/gallery/util/UserComment;->mExif:Lcom/miui/gallery/util/ExifInterfaceWrapper;

    invoke-virtual {p1}, Lcom/miui/gallery/util/ExifInterfaceWrapper;->getUserComment()Ljava/lang/String;

    move-result-object p1

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/util/UserComment;->mIsOriginalUserCommentUsable:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const-string v1, "UserComment"

    const-string v2, "userComment %s is not a json object"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "usercomment"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "exception"

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "exif_parser"

    const-string v0, "exif_invalid_usercomment"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :goto_0
    return-void
.end method


# virtual methods
.method getFileExt()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const-string v1, "ext"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getSha1()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const-string v1, "sha1"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method isOriginalUserCommentUsable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/UserComment;->mIsOriginalUserCommentUsable:Z

    return v0
.end method

.method setData(Lcom/miui/gallery/util/ExifUtil$UserCommentData;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const-string v1, "sha1"

    invoke-virtual {p1}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    const-string v1, "ext"

    invoke-virtual {p1}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getExt()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p1, p0, Lcom/miui/gallery/util/UserComment;->mExif:Lcom/miui/gallery/util/ExifInterfaceWrapper;

    invoke-virtual {p0}, Lcom/miui/gallery/util/UserComment;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/util/ExifInterfaceWrapper;->setUserComment(Ljava/lang/String;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/util/UserComment;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/util/UserComment;->getFileExt()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/UserComment;->mJsonUserComment:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

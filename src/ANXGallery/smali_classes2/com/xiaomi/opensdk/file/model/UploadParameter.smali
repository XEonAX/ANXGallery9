.class public Lcom/xiaomi/opensdk/file/model/UploadParameter;
.super Ljava/lang/Object;
.source "UploadParameter.java"


# instance fields
.field private mKssUploadString:Ljava/lang/String;

.field private mUploadId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getUploadId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadParameter;->mUploadId:Ljava/lang/String;

    return-object v0
.end method

.method public setKssUploadString(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadParameter;->mKssUploadString:Ljava/lang/String;

    return-void
.end method

.method public setUploadId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadParameter;->mUploadId:Ljava/lang/String;

    return-void
.end method

.method public toJsonObject()Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/xiaomi/opensdk/file/model/UploadParameter;->mKssUploadString:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

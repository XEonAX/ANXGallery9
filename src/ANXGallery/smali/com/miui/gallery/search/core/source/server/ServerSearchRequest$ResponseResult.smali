.class public Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;
.super Ljava/lang/Object;
.source "ServerSearchRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResponseResult"
.end annotation


# instance fields
.field private mData:Ljava/lang/Object;

.field private mDataType:Ljava/lang/reflect/Type;

.field private mRawData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Type;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mDataType:Ljava/lang/reflect/Type;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mData:Ljava/lang/Object;

    return-object v0
.end method

.method public getRawData()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mRawData:Ljava/lang/String;

    return-object v0
.end method

.method public setData(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mDataType:Ljava/lang/reflect/Type;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/core/source/server/HttpUtils;->createGson()Lcom/google/gson/Gson;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mDataType:Ljava/lang/reflect/Type;

    invoke-virtual {v0, p1, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mData:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mData:Ljava/lang/Object;

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->mRawData:Ljava/lang/String;

    return-void
.end method

.class public Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
.super Ljava/lang/Object;
.source "ServerSearchRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mMethod:I

.field private mQueryAppendPath:Ljava/lang/String;

.field private mQueryParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mQueryPathPrefix:Ljava/lang/String;

.field private mReportError:Z

.field private mResponseListener:Lcom/miui/gallery/net/base/ResponseListener;

.field private mResultDataType:Ljava/lang/reflect/Type;

.field private mUseCache:Z

.field private mUserId:Ljava/lang/String;

.field private mUserPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Search;->getSearchUrlHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    const-class v0, Lcom/google/gson/JsonObject;

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    const/16 v0, 0x3e9

    iput v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Lcom/miui/gallery/net/base/ResponseListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResponseListener:Lcom/miui/gallery/net/base/ResponseListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Ljava/lang/reflect/Type;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    return-object p0
.end method

.method public static getDefaultUserPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "user"

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object p0
.end method

.method public addQueryParams(Ljava/util/Map;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_1
    return-object p0
.end method

.method public build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;-><init>(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$1;)V

    return-object v0
.end method

.method public getMethod()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    return v0
.end method

.method public getQueryParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    return-object v0
.end method

.method public getQueryPath()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserId:Ljava/lang/String;

    return-object v0
.end method

.method public reportError()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    return v0
.end method

.method public setMethod(I)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    return-object p0
.end method

.method public setQueryAppendPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    return-object p0
.end method

.method public setQueryPathPrefix(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    return-object p0
.end method

.method public setReportError(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    return-object p0
.end method

.method public setResultDataType(Ljava/lang/reflect/Type;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    return-object p0
.end method

.method public setUseCache(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserId:Ljava/lang/String;

    return-object p0
.end method

.method public setUserPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    return-object p0
.end method

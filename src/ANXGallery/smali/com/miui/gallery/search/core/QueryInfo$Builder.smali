.class public Lcom/miui/gallery/search/core/QueryInfo$Builder;
.super Ljava/lang/Object;
.source "QueryInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/QueryInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAppendSerialInfo:Z

.field private mParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mAppendSerialInfo:Z

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/SearchConstants$SearchType;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mAppendSerialInfo:Z

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Empty search type!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/search/core/QueryInfo$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mAppendSerialInfo:Z

    return p0
.end method


# virtual methods
.method public addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public addParams(Ljava/util/Map;)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/search/core/QueryInfo$Builder;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method public build()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/core/QueryInfo;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/QueryInfo;-><init>(Lcom/miui/gallery/search/core/QueryInfo$Builder;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Empty search type!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public cloneFrom(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo;->access$000(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Ljava/util/HashMap;

    invoke-static {p1}, Lcom/miui/gallery/search/core/QueryInfo;->access$100(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    return-object p0
.end method

.method public removeParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public setAppendSerialInfo(Z)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mAppendSerialInfo:Z

    return-object p0
.end method

.method public setSearchType(Lcom/miui/gallery/search/SearchConstants$SearchType;)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/QueryInfo$Builder;->mSearchType:Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object p0
.end method
